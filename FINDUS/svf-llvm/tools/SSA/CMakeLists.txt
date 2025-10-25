add_llvm_executable(ssa ssa.cpp)
target_link_libraries(ssa PUBLIC ${llvm_libs} SvfLLVM)