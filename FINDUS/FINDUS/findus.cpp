

#include "../svf/include/MTA/FSMPTA.h"
#include "../svf/include/MTA/MTA.h"
#include "AE/Svfexe/SVFIR2AbsState.h"
#include "Graphs/SVFG.h"
#include "SVF-LLVM/LLVMUtil.h"
#include "SVF-LLVM/SVFIRBuilder.h"
#include "Util/CommandLine.h"
#include "Util/Options.h"
#include "WPA/Andersen.h"
#include "llvm/IR/DebugInfo.h"
#include "llvm/IR/Module.h"
#include "llvm/Support/raw_ostream.h"
#include "llvm/Transforms/Utils/Debugify.h"
#include <cstdlib>
#include <execinfo.h>
#include <iostream>
#include <set>
#include <chrono>   // put at top of file

using namespace llvm;
using namespace std;
using namespace SVF;

BasicBlock *sharedObjectNode;
BasicBlock *joinNodes;
BasicBlock *tcNode = NULL;
TCTNode *srrc;
TCTNode *tarrg;

typedef enum {
  UASBUG = 1,
  NOUASBUG = 0,
} UASBugStatus;
typedef enum {
  NOTAVAIL = 0,
  TOPOBJ = -1,
  AVAIL = 1,
} objAvailStatus;
typedef enum {
  NOJOINCOV = 0,
  TOPJOIN = -1,
  JOINCOV = 1,
} joinStatus;
class usaAnalysis {
public:
  objAvailStatus objAvailIn;
  objAvailStatus objAvailOut;
  joinStatus joinCoverIn;
  joinStatus joinCoverOut;
  usaAnalysis() {
    objAvailIn = TOPOBJ;
    objAvailOut = TOPOBJ;
    joinCoverIn = TOPJOIN;
    joinCoverOut = TOPJOIN;
  };
};
typedef map<BasicBlock *, usaAnalysis> cgfUasInfo;

objAvailStatus meetObjAvail(objAvailStatus curNodeObjAvailIn,objAvailStatus predObjAvailOut);
objAvailStatus isObjAllocation(BasicBlock *BB, Instruction *sharedObj);
void processCurBlockObjAvail(BasicBlock *BB, cgfUasInfo *cfgUas,Instruction *sharedObj);
void processCurBlockJoinCover(BasicBlock *BB, cgfUasInfo *cfgUas,const SVFInstruction *targetThreadInst,CallStrCxt ctx);
joinStatus meetJoin(joinStatus curNodeJoinIn, joinStatus predJoinOut);
void applyTransferFunction(BasicBlock *BB, cgfUasInfo *cfgUas,Instruction *sharedObj);
void applyTransferFunctionJoin(BasicBlock *BB, cgfUasInfo *cfgUas,const SVFInstruction *threadInst,CallStrCxt ctx);
void isThisThreadJoinBB(BasicBlock *BB, cgfUasInfo *cfgUas,const SVFInstruction *joinInstruction, CallStrCxt ctx);
void kildallforObj(Value *callsite, cgfUasInfo *cfgUas,Instruction *sharedObj);
BasicBlock * getTargetORParentThreadBB(TCTNode *targetThread,cgfUasInfo &cfgUas);
// std::vector<BasicBlock *> escapeSites(Value * Val ,cgfUasInfo &cfgUas);

Value * GsharedObj;
  //  std::vector<Instruction *> InitEscapeSites ;

// #define DEBUG
// const SVFInstruction *Curr_thread_globalInst;
PointerAnalysis *fsmpta;
MHP *mhp;
class TNode {
public:
  TCTNode *tctNode;
  Value *value;
};

std::set<std::pair<TNode *, TNode *>> ptsResults;

std::set<std::pair<std::pair<unsigned int, unsigned int>, Instruction *>>
    NewptsResults;

std::map<std::pair<std::pair<unsigned int, unsigned int>, Instruction *>,
         UASBugStatus>
    uasResults;
// SVF::CxtStmt *Global_Join_cts;
CallStrCxt join_cxt;            // used to get the join id
unsigned int Current_thread_id; // used to compare the join id of currently
                                // checking thread ;




void dumpTopLevelPtsTo(SVFIR *pag) {
  // std::cout<<" ^^^^^^^^111111^^^^^^^own^^^^^&&&&&&&&&&Dumping Top Level
  // Points-To Information\n";
  for (OrderedNodeSet::iterator nIter = fsmpta->getAllValidPtrs().begin();
       nIter != fsmpta->getAllValidPtrs().end(); ++nIter) {
    const PAGNode *node = fsmpta->getPAG()->getGNode(*nIter);
    if (node->hasValue()) {

      if (node->getNodeKind() == SVFVar::DummyValNode || node->getNodeKind() == SVFVar::DummyObjNode)
        {
            continue;

        }

      const Value *ptrValue = LLVMModuleSet::getLLVMModuleSet()->getLLVMValue(node->getValue());

      if (dyn_cast<llvm::StoreInst>(ptrValue) ||  dyn_cast<llvm::LoadInst>(ptrValue)) {


        //if (fsmpta->getPAG()->isValidTopLevelPtr(node)) {

          const PointsTo &pts = fsmpta->getPts(node->getId());

          const Value *ptrValue = LLVMModuleSet::getLLVMModuleSet()->getLLVMValue(pag->getGNode(node->getId())->getValue());

          auto v = LLVMModuleSet::getLLVMModuleSet()->getSVFValue(ptrValue);

          if (mhp->hasThreadStmtSet(SVFUtil::dyn_cast<SVFInstruction>(v))) {

            const MHP::CxtThreadStmtSet &tsSet = mhp->getThreadStmtSet(SVFUtil::dyn_cast<SVFInstruction>(v));  // set of threads that are executing this instruction
            // outs()<<" thread ids ----\n";
            for (const CxtThreadStmt &cts : tsSet) {   // set of all threads that are executing this instruction

              TNode *SrcNode = new TNode();

              SrcNode->tctNode = mhp->getTCT()->getTCTNode(cts.getTid());

              SrcNode->value = const_cast<Value *>(ptrValue);

              if (pts.empty()) {
              //  outs() << "\t\tPointsTo: {empty}\n\n";
              } else {
              //  outs() << "  PointsTo: { ";

                for (PointsTo::iterator it = pts.begin(), eit = pts.end();
                     it != eit; ++it) {

                  // const PAGNode* node =
                  // pag->getGNode(*it)->getValueName();

                  const SVFVar* tgtNode = pag->getGNode(*it);

                    //  Skip dummy nodes
                    if (tgtNode->getNodeKind() == SVFVar::DummyValNode || tgtNode->getNodeKind() == SVFVar::DummyObjNode)
                        continue;


                  const Value *ptsTOValue = LLVMModuleSet::getLLVMModuleSet()->getLLVMValue(pag->getGNode(*it)->getValue());

                  auto v = LLVMModuleSet::getLLVMModuleSet()->getSVFValue(ptsTOValue);

                  if (mhp->hasThreadStmtSet(SVFUtil::dyn_cast<SVFInstruction>(v))) {

                    const MHP::CxtThreadStmtSet &tsSet = mhp->getThreadStmtSet(SVFUtil::dyn_cast<SVFInstruction>(v));
                    // outs()<<" thread ids ----\n";
                    for (const CxtThreadStmt &dstcts : tsSet) {

                      TNode *DstNode = new TNode();

                      DstNode->tctNode = mhp->getTCT()->getTCTNode(dstcts.getTid());

                      DstNode->value = const_cast<Value *>(ptsTOValue);

                        // const CallStrCxt& curCxt =
                        // dstcts.getContext();

                        // outs()<<" the dest and source thread ids are "<<dstcts.getTid()<<" "<<cts.getTid()<<"\n";

                        CxtThreadStmt newCxt(cts.getTid(), cts.getContext(), SVFUtil::dyn_cast<SVFInstruction>(node->getValue()));

                        NodeBS list = mhp->getInterleavingThreads(newCxt);

                      if (dstcts.getTid() != cts.getTid() && list.test(dstcts.getTid())) {

                        ptsResults.insert(std::make_pair(SrcNode, DstNode));



                        NewptsResults.insert(std::make_pair(std::make_pair(dstcts.getTid(), cts.getTid()), dyn_cast<Instruction>(DstNode->value)));
                      }
                    }
                  }

                }

              }
            }
          }
        //}//
      }
    }
  }

  outs().flush();
}

std::vector<CallStrCxt> getSourceContext(Instruction *sharedObj, TCTNode *SoucreThread) {

std::vector<std::pair<PTACallGraphNode *, CallStrCxt>> Worklist_callGraphNodes;
std::vector<CallStrCxt> sourceContext;

Function *F = sharedObj->getParent()->getParent();

// outs()<<*F;
auto ctx = SoucreThread->getCxtThread().getContext(); // thread context of the source thread

const SVFFunction *routine = mhp->getTCT()->getStartRoutineOfCxtThread(SoucreThread->getCxtThread());

PTACallGraphNode *source = fsmpta->getPTACallGraph()->getCallGraphNode(routine); // get the call graph node of the source thread

const Value *LLVMroutine = LLVMModuleSet::getLLVMModuleSet()->getLLVMValue(SVFUtil::dyn_cast<const SVFValue>(routine));

if(LLVMroutine == sharedObj->getParent()->getParent())
{
sourceContext.push_back(ctx);
return sourceContext;
}

std::vector<SVF::CallSiteID > visited;

Worklist_callGraphNodes.push_back(std::make_pair(source, ctx));

while (!Worklist_callGraphNodes.empty()) {
auto curNode = Worklist_callGraphNodes.back();

Worklist_callGraphNodes.pop_back();

CallStrCxt cxt = curNode.second;
PTACallGraphNode *cgNode = curNode.first;




for (auto it = cgNode->OutEdgeBegin(), eit = cgNode->OutEdgeEnd();
it != eit; ++it) // get all the callSites of the source thread
{

const SVFFunction *objfun =fsmpta->getPTACallGraph()->getCalleeOfCallSite((*it)->getCallSiteID());



const Value *llvmobjfun = LLVMModuleSet::getLLVMModuleSet()->getLLVMValue(SVFUtil::dyn_cast<const SVFValue>(objfun)); // just to compare

if ((dyn_cast<Function>(llvmobjfun)->isDeclaration() || dyn_cast<Function>(llvmobjfun)->isIntrinsic())  ||dyn_cast<Function>(llvmobjfun)->isDeclarationForLinker()) {

          continue;

    }


const SVFInstruction *first = objfun->front()->front();

CxtThreadStmt cxtObj(SoucreThread->getId(), ctx, first);

const SVF::NodeBS &TIDs = mhp->getInterleavingThreads(cxtObj);

if (F == llvmobjfun || TIDs.test(SoucreThread->getId())) {    // TBD possily redundant check
cxt.push_back((*it)->getCallSiteID());

sourceContext.push_back(cxt);
} else if ((*it)->getEdgeKind() == PTACallGraphEdge::CEDGEK::TDForkEdge) {
//   outs() << "ignoring this thread \n";
}
else if (!(dyn_cast<Function>(llvmobjfun)->isDeclaration() || dyn_cast<Function>(llvmobjfun)->isIntrinsic()) ) {
    CallStrCxt newcxt = cxt;

    newcxt.push_back((*it)->getCallSiteID());
    const SVFFunction *objfun = fsmpta->getPTACallGraph()->getCalleeOfCallSite((*it)->getCallSiteID());

    auto itt = std::find(visited.begin(), visited.end(), (*it)->getCallSiteID());

    if(itt==visited.end())
    {
     // outs()<<" the function is not visited \n";
    Worklist_callGraphNodes.push_back(std::make_pair(
    fsmpta->getPTACallGraph()->getCallGraphNode(objfun), newcxt));
    visited.push_back((*it)->getCallSiteID());

    }

  }

  }

  }
return sourceContext;

}



std::vector<SVF::CxtStmt> cxtStmtList;

void handleIntra(const CxtStmt &cts) {
  const SVFInstruction *curInst = cts.getStmt();
  const CallStrCxt &curCxt = cts.getContext();

  const std::vector<const SVFInstruction *> &nextInsts =
      curInst->getSuccInstructions();
  for (const auto &ni : nextInsts) {

    CxtStmt newCts(curCxt, ni);
    cxtStmtList.push_back(newCts);

  }
}


int kildalforJoin(Value *Val, cgfUasInfo *cfgUas,
                  const SVFInstruction *targetThreadInst, CallStrCxt ctx) {
  // outs() << "\n\n-----------------------join killdall the function -------------------------\n";
Function *F;
CallInst *callsite;
BasicBlock *prev;


if((callsite = dyn_cast<CallInst>(Val)))
{
    if(callsite->getCalledFunction()->getName().str() == "pthread_create")
  {

      F = dyn_cast<Function>(callsite->getOperand(2));
      prev = callsite->getParent();


        outs() << F->getName().str() << "\n";

    }
    else{
      F = callsite->getCalledFunction();

      prev = callsite->getParent();

    }
  }
  else
  {

      F = dyn_cast<Function>(Val);
      // outs()<<*F<<"\n";
      prev = &(F->back());
  }





  std::vector<BasicBlock *> worklist;



  if(!F)
  return 0;
  BasicBlock &firstBasicBlock = F->front();


  BasicBlock &lastBasicBlock = F->back();

  (*cfgUas)[&(lastBasicBlock)].joinCoverOut = (*cfgUas)[prev].joinCoverOut;   // assigning the in of the basic

  worklist.push_back(&(lastBasicBlock));

  while (!worklist.empty()) {
    auto curBlock = worklist.back();
    worklist.pop_back();
    joinStatus prevJoinValue = (*cfgUas)[curBlock].joinCoverIn;

    processCurBlockJoinCover(curBlock, cfgUas, targetThreadInst, ctx);


    if ((*cfgUas)[curBlock].joinCoverIn != prevJoinValue) {
      for (auto pred : predecessors(curBlock)) {
        worklist.push_back(pred);
      }
      for (auto pred : successors(curBlock)) {
        worklist.push_back(pred);
      }
    } else {
    }
  }

 return (*cfgUas)[&firstBasicBlock].joinCoverIn;
  // return
}

unsigned int GLBsrc;
unsigned int GLBdest;
int main(int argc, char **argv) {
  std::ofstream globalOutFile("analysis_results.txt", std::ios::app); // Global file for all analyses

  std::vector<std::string> outputBuffer; // Buffer to store log messages

  std::vector<std::string> moduleNameVec;
  moduleNameVec =
      OptionBase::parseOptions(argc, argv, "Whole Program Points-to Analysis",
                               "[options] <input-bitcode...>");

  if (Options::WriteAnder() == "ir_annotator") {
    LLVMModuleSet::preProcessBCs(moduleNameVec);
  }

  SVFModule *svfModule = LLVMModuleSet::buildSVFModule(moduleNameVec);

  /// Build Program Assignment Graph (SVFIR)
  SVFIRBuilder builder(svfModule);
  SVFIR *pag = builder.build();



auto t0 = std::chrono::steady_clock::now();

  MTA mta;
  mta.runOnModule(pag);
  mhp = mta.getMHP();
  FSMPTA *fsmpta1 = FSMPTA::createFSMPTA(svfModule, mta.getMHP(), mta.getLockAnalysis());
  fsmpta1->initialize(pag->getModule());
  fsmpta1->analyze();
  // fsmpta1->finalize();
  fsmpta = fsmpta1;
  // dumpTopLevelPtsTo_orig(pag);
  dumpTopLevelPtsTo(pag);

auto t1 = std::chrono::steady_clock::now();
auto ms = std::chrono::duration_cast<std::chrono::milliseconds>(t1 - t0).count();
std::cout << "[TIMING] FSMPTA.analyze took " << ms << " ms\n";
globalOutFile << "[TIMING] FSMPTA.analyze took " << ms << " ms\n";
globalOutFile.flush(); // optional but good on servers

  //  return 0;


  // return 5;
  cout << "\n UAS analysis starts  \n";




auto loopStart = std::chrono::steady_clock::now();

int i = 0;

  for (auto item : NewptsResults) {
         i++;



    cgfUasInfo cfgUas;
    Instruction *sharedObj = item.second;

    outs()<<*sharedObj<<"\n";


    srrc = mhp->getTCT()->getTCTNode(item.first.first);
    tarrg = mhp->getTCT()->getTCTNode(item.first.second);





    if(!isa<AllocaInst>(sharedObj))
    {
      // outs() << " the shared object is not an alloca or global variable \n";
      continue;
    }
    srrc = mhp->getTCT()->getTCTNode(item.first.first);
    tarrg = mhp->getTCT()->getTCTNode(item.first.second);
    if(item.first.second==0)
    {
     // outs()<<" the target is  main so not checking \n";
      continue;
    }


    std::vector<CallStrCxt> objctx11 = getSourceContext(sharedObj, srrc);

    CallStrCxt Objcxt;
    for (auto yy : objctx11) {
      //  outs()<<"  ------------------------ the contexts of the source are -------------------------------- \n";
      Objcxt = yy;
    //    for(auto x : yy)
    //   {
    // // outs()<<" the context id is "<<x<<"\n";
    //   }
   //  outs()<<" ------------------------ done -------------------------------- \n";
    }

    Function *sharedObjFunc = sharedObj->getParent()->getParent();
    GsharedObj = sharedObj;
    TCTNode *targetThread = tarrg;

    CallStrCxt targetThreadCtx = targetThread->getCxtThread().getContext();


    BasicBlock *targetThreadBB ;


    const SVFInstruction *targetThreadInst =
        targetThread->getCxtThread().getThread();


    std::vector<BasicBlock *> worklist;
    BasicBlock &firstBasicBlock = sharedObjFunc->front();
    BasicBlock &lastBasicBlock = sharedObjFunc->back();
    worklist.push_back(&(firstBasicBlock));

    cfgUas[&(firstBasicBlock)].objAvailIn = NOTAVAIL;
    cfgUas[&(firstBasicBlock)].objAvailOut = TOPOBJ;
    cfgUas[&(firstBasicBlock)].joinCoverIn = TOPJOIN;
    cfgUas[&(firstBasicBlock)].joinCoverOut = TOPJOIN;
    cfgUas[&(lastBasicBlock)].joinCoverIn = TOPJOIN;
    cfgUas[&(lastBasicBlock)].joinCoverOut = TOPJOIN;



    if(Objcxt.empty())
    {

        kildallforObj(sharedObj->getParent()->getParent(),
        &cfgUas, sharedObj);

    }
    else{


        unsigned int lastElement = Objcxt.back();


        const CallICFGNode *icfg = fsmpta->getPTACallGraph()->getCallSite(lastElement);


        const SVFInstruction *call = icfg->getCallSite();


      // outs()<<call->toString()<<"\n";
        const Value *LLVMcall = LLVMModuleSet::getLLVMModuleSet()->getLLVMValue(
            SVFUtil::dyn_cast<SVFValue>(call));


        if(CallInst *call = const_cast<CallInst *>(dyn_cast<const CallInst>(LLVMcall)))
        {
          kildallforObj(call,&cfgUas, sharedObj);

        }
        else{



         kildallforObj(const_cast< Value *>(LLVMcall),&cfgUas, sharedObj);
        }

    }

    worklist.push_back(&(lastBasicBlock));

    while (!worklist.empty()) {

      auto curBlock = worklist.back();
      worklist.pop_back();

      joinStatus prevJoinValue = cfgUas[curBlock].joinCoverIn;

      processCurBlockJoinCover(curBlock, &cfgUas, targetThreadInst, Objcxt);

      if (cfgUas[curBlock].joinCoverIn != prevJoinValue) {

        for (auto pred : predecessors(curBlock)) {
          worklist.push_back(pred);
        }

      }
    }
    targetThreadBB = getTargetORParentThreadBB(targetThread,cfgUas);


    if (targetThreadBB == nullptr) {
      targetThreadBB = sharedObj->getParent();
    }
       if(cfgUas[sharedObjectNode].joinCoverIn == JOINCOV  ||(cfgUas[targetThreadBB].objAvailOut == AVAIL && cfgUas[targetThreadBB].joinCoverIn == JOINCOV)){
           uasResults[item] = NOUASBUG;
       }
       else{
          uasResults[item] = UASBUG;
       }

  }
    auto loopEnd = std::chrono::steady_clock::now();
    auto loopMs = std::chrono::duration_cast<std::chrono::milliseconds>(loopEnd - loopStart).count();

    std::cout << "[TIMING] UAS analysis loop (all iterations) took " << loopMs << " ms\n";
    globalOutFile << "[TIMING] UAS analysis loop (all iterations) took " << loopMs << " ms\n";
    globalOutFile.flush();

  for (auto &x : NewptsResults) {
    outs() << "Source Thread: " << x.first.first << "\t";
    outs() << "Target Thread: " << x.first.second << "\t";
    outs() << "Shared Object: " << *x.second << "\t";
    outs() << "UAS Bug Status: " << uasResults[x] << "\nn";
  }
  outputBuffer.push_back("UAS Bug Results: \n\n");
  for (auto &x : NewptsResults) {

      outputBuffer.push_back("Source Thread: " + std::to_string(x.first.first) + "\t");
      outputBuffer.push_back("Target Thread: " + std::to_string(x.first.second) + "\t");

      std::string instrStr;
      llvm::raw_string_ostream rso(instrStr);
      x.second->print(rso);
      rso.flush();
      outputBuffer.push_back("Shared Object: " + instrStr + "\t");

      outputBuffer.push_back("UAS Bug Status: " + std::to_string(uasResults[x]) + "\n");

  }

  for (const auto& line : outputBuffer) {
      globalOutFile << line;
      // localOutFile << line;
  }

  // outputBuffer.close();
  outputBuffer.clear();
  return 0;
  FSMPTA::releaseFSMPTA();

  pag->print();
}

void processCurBlockObjAvail(BasicBlock *BB, cgfUasInfo *cfgUas,
                             Instruction *sharedObj) {
  //  int objAvailCurnode = 1;
  int noOfPred = 0;
  objAvailStatus inVal = TOPOBJ;

  for (auto *pred : llvm::predecessors(BB)) {
    noOfPred++;
    objAvailStatus predOut = (*cfgUas)[pred].objAvailOut;
    inVal = meetObjAvail(inVal, predOut);
  }
  if (noOfPred == 0) {
        // outs()<<"\n No predecessors for the current block \n";
    inVal = (*cfgUas)[BB].objAvailIn;
  }
  (*cfgUas)[BB].objAvailIn = inVal;
  applyTransferFunction(BB, cfgUas, sharedObj);


    if( (*cfgUas)[BB].objAvailOut == TOPOBJ)
  {
    (*cfgUas)[BB].objAvailOut = NOTAVAIL;
    // outs()<<(*cfgUas)[BB].objAvailOut<<"\n";
  }

}


objAvailStatus meetObjAvail(objAvailStatus curNodeObjAvailIn,
                            objAvailStatus predObjAvailOut) {

  if (curNodeObjAvailIn == TOPOBJ) {
    curNodeObjAvailIn = predObjAvailOut;
  }
  else if (curNodeObjAvailIn == AVAIL) {
    if (predObjAvailOut == NOTAVAIL) {

      curNodeObjAvailIn = NOTAVAIL;
    } else {

      curNodeObjAvailIn = AVAIL;
    }
  } else
  {
    curNodeObjAvailIn = NOTAVAIL;
  }
  return curNodeObjAvailIn;
}

void applyTransferFunction(BasicBlock *BB, cgfUasInfo *cfgUas,
                           Instruction *sharedObj) {

  (*cfgUas)[BB].objAvailOut = (*cfgUas)[BB].objAvailIn;

  for (Instruction &II : *BB) {

    if(auto *LifetimeStartInst = dyn_cast< llvm::IntrinsicInst>(&II))
    {
     if(LifetimeStartInst->getIntrinsicID() == llvm::Intrinsic::lifetime_start)
     {

          Value * v = LifetimeStartInst->getOperand(1);
          if(isa<CastInst>(v))
            {
              v = dyn_cast<CastInst>(v)->getOperand(0);
            }
            if(v==sharedObj){
                    sharedObjectNode = BB;                                                                        // used in final uas decision
                    (*cfgUas)[BB].objAvailOut = AVAIL;
                }
     }
     else if(LifetimeStartInst->getIntrinsicID() == llvm::Intrinsic::lifetime_end)
     {
          Value * v = LifetimeStartInst->getOperand(1);
            if(isa<CastInst>(v))
            {

              v = dyn_cast<CastInst>(v)->getOperand(0);
            }
            if(v==sharedObj){
                    // outs()<<" lifetimeend found for the object "<<*v<<"\n"<<*LifetimeStartInst<<"\n";
                    (*cfgUas)[BB].objAvailOut = NOTAVAIL;
                }
                                    // outs()<<" GETTING OUT SAFELY "<<*v<<"\n"<<*LifetimeStartInst<<"\n";
     }


      else if (auto *DI = dyn_cast<DbgDeclareInst>(&II)) {

      if (DI->getAddress() == sharedObj) {

        if(DILocalVariable *Var = DI->getVariable())
        {
              if(Var->isParameter())
              {
                sharedObjectNode = BB;
                (*cfgUas)[BB].objAvailOut = AVAIL;
              }

        }
        }
      }


    }
   else if (auto *call = dyn_cast<CallInst>(&II)) {

      if(Function *F = call->getCalledFunction())
    {
      if (!F->isDeclaration() && !F->isIntrinsic()){

        if((*cfgUas)[&(F->front())].objAvailIn == TOPOBJ )
        {
          kildallforObj(call, cfgUas, sharedObj);
        }
        else if((*cfgUas)[&(F->front())].objAvailIn == NOTAVAIL  && (*cfgUas)[BB].objAvailOut == AVAIL )
        {
            kildallforObj(call, cfgUas, sharedObj);
        }

      }
    }
    }
  }

}
joinStatus  meetJoin(joinStatus curNodeJoinOut, joinStatus succJoinIn) {

  if(curNodeJoinOut == TOPJOIN) {
    return  succJoinIn;
  }
 else  if(succJoinIn == TOPJOIN) {
    return  curNodeJoinOut;
  }
  else{
    return  (joinStatus)(curNodeJoinOut && succJoinIn);
  }

}

void processCurBlockJoinCover(BasicBlock *BB, cgfUasInfo *cfgUas,
                              const SVFInstruction *targetThreadInst,
                              CallStrCxt cxt) {
  int noOfSucc = 0;
  joinStatus outVal = TOPJOIN;
  for (auto *succ : llvm::successors(BB)) {
    noOfSucc++;
    joinStatus succIn = (*cfgUas)[succ].joinCoverIn;
    outVal = meetJoin(outVal, succIn);
  }
  if (noOfSucc == 0) {

    outVal = (*cfgUas)[BB].joinCoverOut;
  }
  (*cfgUas)[BB].joinCoverOut = outVal;


    isThisThreadJoinBB(BB, cfgUas, targetThreadInst, cxt);

  if( (*cfgUas)[BB].joinCoverIn == TOPJOIN)
  {

        (*cfgUas)[BB].joinCoverIn = NOJOINCOV;

  }

}

void applyTransferFunctionJoin(BasicBlock *BB, cgfUasInfo *cfgUas,  const SVFInstruction *tgtThreadInst, CallStrCxt ctx) {

  isThisThreadJoinBB(BB, cfgUas, tgtThreadInst, ctx);

}

void isThisThreadJoinBB(BasicBlock *BB, cgfUasInfo *cfgUas,const SVFInstruction *ThreadInstruction,CallStrCxt ctx) {
joinStatus isJoin;
  if((*cfgUas)[BB].joinCoverOut == JOINCOV)
  {

       isJoin = JOINCOV;

  }
  else{
      isJoin = NOJOINCOV;
  }

 bool foundIntrinsic = false;
  for (Instruction &II : llvm::reverse(*BB)) {

    if(llvm::IntrinsicInst * intrinsic = dyn_cast< llvm::IntrinsicInst>(&II)){


      if(intrinsic->getIntrinsicID() == llvm::Intrinsic::lifetime_end){
            Value * v = intrinsic->getOperand(1);
            if(isa<CastInst>(v))
            {
              v = dyn_cast<CastInst>(v)->getOperand(0);
            }
              if(v==GsharedObj){
                      foundIntrinsic = true;
                  }
          }
    }
    if (CallInst *call = dyn_cast<CallInst>(&II)) {
      Function *F = call->getCalledFunction();
              if(!F)
              continue;

      if (call->getCalledFunction()->getName().str() == "pthread_join") {

              ForkJoinAnalysis *fja = mhp->getfja();
              const SVFInstruction *joinsite = SVFUtil::dyn_cast<SVFInstruction>(LLVMModuleSet::getLLVMModuleSet()->getSVFValue(call));
              CxtStmt cts(ctx, joinsite);
              const NodeBS &DirandIndirJoin = fja->getDirAndIndJoinedTid(cts);

        if (DirandIndirJoin.test(tarrg->getId())) {


          if((*cfgUas)[BB].objAvailOut == AVAIL){

                isJoin =  JOINCOV;
            }
          else if (((*cfgUas)[BB].objAvailOut == NOTAVAIL && foundIntrinsic)){    /// join preceeds the object lifetime::end becomes not available

                      isJoin =  JOINCOV;
          }
          else{                                                    // join after the object becomes not available
            // (*cfgUas)[BB].joinCoverIn = NOJOINCOV;
            //  isJoin =  false;
          }

        }
        else{
          // outs() << " \n\n  The  join is NOT found for "<< ThreadInstruction->toString() << "\n\n";
        }
      }
       else if (!F->isDeclaration() && !F->isIntrinsic() && F->getName().str() != "pthread_create") {

       // outs()<<" exploring the call inst inside join check "<<*call<<"\n";
        const auto currInst = SVFUtil::dyn_cast<SVFCallInst>(LLVMModuleSet::getLLVMModuleSet()->getSVFValue(call));
        if(SVFUtil::isExtCall(currInst))
        {
          continue;
        }
          const SVFValue *v = LLVMModuleSet::getLLVMModuleSet()->getSVFValue(call);

          const ICFGNode *icfgNode = fsmpta->getPAG()->getICFG()->getICFGNode(SVFUtil::dyn_cast<SVFInstruction>(v));

          ctx.push_back(fsmpta->getPTACallGraph()->getCallSiteID(SVFUtil::dyn_cast<SVF::CallICFGNode>(icfgNode),SVFUtil::dyn_cast<SVFCallInst>(v)->getCalledFunction()));

          isJoin = (joinStatus)( kildalforJoin(call, cfgUas, ThreadInstruction, ctx)  || isJoin );
          ctx.pop_back();
      }
    }
  }
  (*cfgUas)[BB].joinCoverIn = isJoin;

}
void kildallforObj(Value *Val, cgfUasInfo *cfgUas,
                   Instruction *sharedObj) {
                    Function *F = nullptr;
                    CallInst *callsite;
                    BasicBlock *prev;
                     InvokeInst *invokeInst;

                    if((callsite = dyn_cast<CallInst>(Val)))
                    {
                    if(callsite->getCalledFunction() && callsite->getCalledFunction()->getName().str() == "pthread_create")
                     {
                        F = dyn_cast<Function>(callsite->getOperand(2));
                        prev = callsite->getParent();

                      }
                      else{
                         if(callsite->getCalledFunction())
                        {
                           F = callsite->getCalledFunction();
                          prev = callsite->getParent();
                        }
                      }
                    }
                    else if((invokeInst= dyn_cast<InvokeInst>(Val))){

                        F = invokeInst->getCalledFunction();
                        prev = invokeInst->getParent();
                    }
        else if (isa<Function>(Val))
        {

            F = dyn_cast<Function>(Val);
            prev = &(F->front());
        }
        else{
              // outs()<<"  --------Getting an unexpected value in kildallforObj function -------------\n";
        }

  std::vector<BasicBlock *> worklist;
if(!F)
{
  return; // if the function is not found then return
}
  BasicBlock &firstBasicBlock = F->front();


  worklist.push_back(&(firstBasicBlock));


  (*cfgUas)[&(firstBasicBlock)].objAvailIn = (*cfgUas)[prev].objAvailOut;  // assigning the in of the basic
                                   // block of the call site
  (*cfgUas)[&(firstBasicBlock)].objAvailIn =(*cfgUas)[prev].objAvailOut; //
  // assigning the in of the basic block of the call site



  worklist.push_back(&(firstBasicBlock));

  while (!worklist.empty()) {

    auto curBlock = worklist.back();
    worklist.pop_back();
    objAvailStatus prevObjAvailValue = (*cfgUas)[curBlock].objAvailOut;

    processCurBlockObjAvail(curBlock, cfgUas, sharedObj);

    if ((*cfgUas)[curBlock].objAvailOut != prevObjAvailValue) {

      for (auto succ : successors(curBlock)) {
        worklist.push_back(succ);
      }
    } else {
    }
  }
}


BasicBlock * getTargetORParentThreadBB(TCTNode *targetThread,cgfUasInfo &cfgUas){

  BasicBlock * BB=nullptr;

 const NodeBS AnSt= mhp->getTCT()->getAncestorThread(targetThread->getId());
 auto *anst  = const_cast<NodeBS*>(&AnSt);
 auto x = targetThread->getId();
  anst->set(x);

 for (auto x : *anst)
 {
    TCTNode *ancestorThread = mhp->getTCT()->getTCTNode(x);

    if(const SVFInstruction * ancesTInst = ancestorThread->getCxtThread().getThread() )
    {
      const Value *LLVMcall = LLVMModuleSet::getLLVMModuleSet()->getLLVMValue(
          SVFUtil::dyn_cast<SVFValue>(ancesTInst));

      BB = const_cast<BasicBlock *>(
          dyn_cast<BasicBlock>(dyn_cast<Instruction>(LLVMcall)->getParent()));

          if(cfgUas.find(BB) != cfgUas.end())
          {
            // outs()<<" found checking the basic block t "<<*BB<<"\n";
            return BB;
          }
  }
 }
   return nullptr;
}