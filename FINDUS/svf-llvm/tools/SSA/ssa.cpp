//===- llvm2svf.cpp -- LLVM IR to SVF IR conversion  -------------------------//
//
//                     SVF: Static Value-Flow Analysis
//
// Copyright (C) <2013-2023>  <Yulei Sui>
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
//===-----------------------------------------------------------------------===//

/*
 * llvm2svf.cpp
 *
 *  Created on: 21 Apr 2023
 *     Authors: Xudong Wang
 */
#include "../../../svf/include/MTA/FSMPTA.h"
#include "../../../svf/include/MTA/MTA.h"
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
#include "SVF-LLVM/SVFIRBuilder.h"
#include "Util/CommandLine.h"
#include "Util/Options.h"
#include "SVFIR/SVFFileSystem.h"
// #include <llvm-10/llvm/Support/Casting.h>
// #include <llvm-10/llvm/IR/BasicBlock.h>
// #include <llvm-10/llvm/IR/DebugInfoMetadata.h>
// #include <llvm-10/llvm/IR/Instruction.h>
// #include <llvm-10/llvm/IR/Instructions.h>
using namespace std;
using namespace SVF;

#include <iostream>
#include <string>

std::string replaceExtension(const std::string& path)
{
    size_t pos = path.rfind('.');
    if (pos == std::string::npos ||
            (path.substr(pos) != ".bc" && path.substr(pos) != ".ll"))
    {
        SVFUtil::errs() << "Error: expect file with extension .bc or .ll\n";
        exit(EXIT_FAILURE);
    }
    return path.substr(0, pos) + ".svf.json";
}

int main(int argc, char** argv)
{
    auto moduleNameVec = OptionBase::parseOptions(
                             argc, argv, "ssa", "[options] <input-bitcode...>");

    if (Options::WriteAnder() == "ir_annotator")
    {
        LLVMModuleSet::preProcessBCs(moduleNameVec);
    }

// /
  SVFModule *svfModule = LLVMModuleSet::buildSVFModule(moduleNameVec);
  llvm::errs() << "SVFModule built successfully.\n"<<svfModule->getModuleIdentifier() << " modules loaded.\n";
    //  const SVFValue * val = SVFUtil::dyn_cast<SVFValue>(svfModule);
     llvm::Module &MOdLLVM = LLVMModuleSet::getLLVMModuleSet()->getModuleRef(1);


     llvm::errs()<<" the number of modules "<<LLVMModuleSet::getLLVMModuleSet()->getModuleNum()<<" \n";
        //   const Module *M = llvm::dyn_cast< llvm::Module>(const_cast<llvm::Value *>(MOdLLVM));

        //   llvm::errs() << "Module Name: " << &MOdLLVM << "\n";

          for(Function &F : MOdLLVM)
        {
            for(BasicBlock &BB : F)
            {

                for(Instruction &I : BB)
                {
                    llvm::errs() << "Instruction: " << I << "\n";

                    for(Value *uses : I.uses())
                    {
                        if(Instruction *inst = llvm::dyn_cast<Instruction>(uses))
                        {
                            llvm::errs() << "  Used by: " << *inst << "\n";
                        }
                        else if(Argument *arg = llvm::dyn_cast<Argument>(uses))
                        {
                            llvm::errs() << "  Used by Argument: " << *arg << "\n";
                        }
                        else
                        {
                            llvm::errs() << "  Used by Value: " << *uses << "\n";
                        }
                    }
                }
            }
          }
    return 0;


        LLVMModuleSet::releaseLLVMModuleSet();
    return 0;
}
