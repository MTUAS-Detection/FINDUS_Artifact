//===- mta.cpp --Program Analysis for Multithreaded Programs------------------//
//
//                     SVF: Static Value-Flow Analysis
//
// Copyright (C) <2013-2022>  <Yulei Sui>
//

// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Affero General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.

// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Affero General Public License for more details.

// You should have received a copy of the GNU Affero General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.
//
//===----------------------------------------------------------------------===//

#include "SVF-LLVM/LLVMUtil.h"
#include "SVF-LLVM/SVFIRBuilder.h"
#include "MTA/MTA.h"
#include "Util/CommandLine.h"
#include "Util/Options.h"
#include "MTAResultValidator.h"
#include "LockResultValidator.h"
#include "MTAAnnotator.h"
#include "MTA/FSMPTA.h"
using namespace llvm;
using namespace std;
using namespace SVF;


void PrintAliasPairs(PointerAnalysis* pta)
{
    SVFIR* pag = pta->getPAG();
    for (SVFIR::iterator lit = pag->begin(), elit = pag->end(); lit != elit; ++lit)
    {
        PAGNode* node1 = lit->second;
        PAGNode* node2 = node1;

    //     PointsTo pts = pta->getPts(node2->getId());
    // for(PointsTo::iterator pit = pts.begin(), epit = pts.end(); pit != epit; ++pit)
    //     {
    //         PAGNode* node = pag->getGNode(pit->first);
    //         const SVFFunction* fun = node->getFunction();
    //         SVFUtil::outs() << "var" << node1->getValue()->toString() << "[" << node1->getValueName()
    //                         << "@" << (fun == nullptr ? "" : fun->getName()) << "] --"
    //                         << " var" << node->getValue()->toString() << "[" << node->getValueName()
    //                         << "@" << (fun == nullptr ? "" : fun->getName()) << "]\n";
            
    //     }
        for (SVFIR::iterator rit = lit, erit = pag->end(); rit != erit; ++rit)
        {
            node2 = rit->second;
            if(node1==node2)
                continue;
            const SVFFunction* fun1 = node1->getFunction();
            const SVFFunction* fun2 = node2->getFunction();
            AliasResult result = pta->alias(node1->getId(), node2->getId());
        if(result == AliasResult::MayAlias)
           {
                        SVFUtil::outs()<<(result == AliasResult::NoAlias ? "NoAlias" : "MayAlias")
                            << " var" << node1->getValue()->toString()<< "[" << node1->getValueName()
                            << "@" << (fun1==nullptr?"":fun1->getName()) << "] --"
                            << " var" << node2->getValue()->toString()<< "[" << node2->getValueName()
                            << "@" << (fun2==nullptr?"":fun2->getName()) << "]\n";
                        
                        }
        }
    }
}

std::string printPts(PointerAnalysis* pta, const SVFValue* svfval)
{

    std::string str;
    raw_string_ostream rawstr(str);

    NodeID pNodeId = pta->getPAG()->getValueNode(svfval);
    const PointsTo& pts = pta->getPts(pNodeId);
    for (PointsTo::iterator ii = pts.begin(), ie = pts.end();
            ii != ie; ii++)
    {
        rawstr << " " << *ii << " ";
        PAGNode* targetObj = pta->getPAG()->getGNode(*ii);
        if(targetObj->hasValue())
        {
            rawstr << "(" << targetObj->getValue()->toString() << ")\t ";
        }
    }

    return rawstr.str();

}

int main(int argc, char ** argv)
{

    std::vector<std::string> moduleNameVec;
    moduleNameVec = OptionBase::parseOptions(
                        argc, argv, "MTA Analysis", "[options] <input-bitcode...>"
                    );

    if (Options::WriteAnder() == "ir_annotator")
    {
        LLVMModuleSet::preProcessBCs(moduleNameVec);
    }

    SVFModule* svfModule = LLVMModuleSet::buildSVFModule(moduleNameVec);
    SVFIRBuilder builder(svfModule);
    SVFIR* pag = builder.build();

  

    MTA mta;
    mta.runOnModule(pag);
    

    FSMPTA* fsmpta = FSMPTA::createFSMPTA(svfModule, mta.getMHP(), mta.getLockAnalysis());
    fsmpta->initialize(pag->getModule());
    fsmpta->runOnModule(svfModule);
    PrintAliasPairs(fsmpta);

    SVFGBuilder svfBuilder;
    SVFG* svfg = svfBuilder.buildFullSVFG(fsmpta);
    // auto svfg = fsmpta->getSVFG();
    // fsmpta->finalize();
    for (const auto& it : *svfg)
    {
        const SVFGNode* node = it.second;
        if (node->getValue())
        {
           std::cout<<"the pointer \n";
           std::cout << "Node: " << node->getValue()->toString() << "\n";
           std::cout<<"the points to results \n";

            // traverseOnVFG(svfg, node->getValue());
            // Print points-to information
            std::cout<< printPts(fsmpta, node->getValue())<<" \n";
           //  for (const SVFGEdge* edge : node->getOutEdges())
           //  {
           //      const SVFGNode* node2 = edge->getDstNode();
           //     //  if (node2->getValue())
           //         //  aliasQuery(ander, node->getValue(), node2->getValue());
           //  }
        }
    }


    MTAResultValidator MTAValidator(mta.getMHP());
    MTAValidator.analyze();

    // Initialize the validator and perform validation.
    LockResultValidator lockvalidator(mta.getLockAnalysis());
    lockvalidator.analyze();
    LLVMModuleSet::releaseLLVMModuleSet();


    return 0;
}
