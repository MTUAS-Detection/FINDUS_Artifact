; ModuleID = '/home/demo/android_packages_modules_NeuralNetworks/runtime/test/TestExecution_pthread_UAS_logic.cpp'
source_filename = "/home/demo/android_packages_modules_NeuralNetworks/runtime/test/TestExecution_pthread_UAS_logic.cpp"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%class.Return = type { i32 }
%class.Return.0 = type { i8 }
%struct.ExecuteThreadData = type { ptr, %"struct.V1_0::Request", %class.sp }
%"struct.V1_0::Request" = type { %"class.std::vector", %"class.std::vector", %"class.std::vector" }
%"class.std::vector" = type { %"struct.std::_Vector_base" }
%"struct.std::_Vector_base" = type { %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl" }
%"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl" = type { %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data" }
%"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data" = type { ptr, ptr, ptr }
%class.sp = type { ptr }
%class.ExecutionBurstController = type { ptr }
%"class.std::allocator" = type { i8 }
%"class.__gnu_cxx::__normal_iterator" = type { ptr }

$_ZN24ExecutionBurstController14dummyExecutionEv = comdat any

$_ZNK24ExecutionBurstController14getErrorStatusEv = comdat any

$_ZNK24ExecutionBurstController20getPreparedModelV1_0Ev = comdat any

$_ZN13PreparedModel7executeERKN4V1_07RequestERK2spINS0_18IExecutionCallbackEE = comdat any

$_ZNK2spIN4V1_018IExecutionCallbackEEptEv = comdat any

$_Z13convertToV1_011ErrorStatus = comdat any

$_ZN17ExecuteThreadDataD2Ev = comdat any

$_ZN4V1_07RequestC2ERKS0_ = comdat any

$_ZN2spIN4V1_018IExecutionCallbackEEC2ERKS2_ = comdat any

$_ZN4V1_07RequestD2Ev = comdat any

$_ZN6ReturnI11ErrorStatusEC2ES0_ = comdat any

$_ZNSt6vectorIiSaIiEEC2Ev = comdat any

$_ZN4V1_022DummyExecutionCallbackC2Ev = comdat any

$_ZN2spIN4V1_018IExecutionCallbackEEC2EPS1_ = comdat any

$_ZN24ExecutionBurstControllerC2Ev = comdat any

$_ZNSt6vectorIiSaIiEEC2ERKS1_ = comdat any

$_ZNSt6vectorIiSaIiEED2Ev = comdat any

$_ZNKSt6vectorIiSaIiEE4sizeEv = comdat any

$_ZN9__gnu_cxx14__alloc_traitsISaIiEiE17_S_select_on_copyERKS1_ = comdat any

$_ZNKSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv = comdat any

$_ZNSt12_Vector_baseIiSaIiEEC2EmRKS0_ = comdat any

$_ZSt22__uninitialized_copy_aIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEPiiET0_T_SA_S9_RSaIT1_E = comdat any

$_ZNKSt6vectorIiSaIiEE5beginEv = comdat any

$_ZNKSt6vectorIiSaIiEE3endEv = comdat any

$_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv = comdat any

$_ZNSt12_Vector_baseIiSaIiEED2Ev = comdat any

$_ZNSt16allocator_traitsISaIiEE37select_on_container_copy_constructionERKS0_ = comdat any

$_ZNSaIiEC2ERKS_ = comdat any

$_ZN9__gnu_cxx13new_allocatorIiEC2ERKS1_ = comdat any

$_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC2ERKS0_ = comdat any

$_ZNSt12_Vector_baseIiSaIiEE17_M_create_storageEm = comdat any

$_ZN9__gnu_cxx13new_allocatorIiED2Ev = comdat any

$_ZNSt12_Vector_baseIiSaIiEE17_Vector_impl_dataC2Ev = comdat any

$_ZNSt12_Vector_baseIiSaIiEE11_M_allocateEm = comdat any

$_ZNSt16allocator_traitsISaIiEE8allocateERS0_m = comdat any

$_ZN9__gnu_cxx13new_allocatorIiE8allocateEmPKv = comdat any

$_ZNK9__gnu_cxx13new_allocatorIiE11_M_max_sizeEv = comdat any

$_ZSt18uninitialized_copyIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEPiET0_T_SA_S9_ = comdat any

$_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEPiEET0_T_SC_SB_ = comdat any

$_ZSt4copyIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEPiET0_T_SA_S9_ = comdat any

$_ZSt13__copy_move_aILb0EN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEPiET1_T0_SA_S9_ = comdat any

$_ZSt12__miter_baseIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEET_S8_ = comdat any

$_ZSt12__niter_wrapIPiET_RKS1_S1_ = comdat any

$_ZSt14__copy_move_a1ILb0EPKiPiET1_T0_S4_S3_ = comdat any

$_ZSt12__niter_baseIPKiSt6vectorIiSaIiEEET_N9__gnu_cxx17__normal_iteratorIS5_T0_EE = comdat any

$_ZSt12__niter_baseIPiET_S1_ = comdat any

$_ZSt14__copy_move_a2ILb0EPKiPiET1_T0_S4_S3_ = comdat any

$_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIiEEPT_PKS3_S6_S4_ = comdat any

$_ZNK9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEE4baseEv = comdat any

$_ZN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEC2ERKS2_ = comdat any

$_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPim = comdat any

$__clang_call_terminate = comdat any

$_ZNSt16allocator_traitsISaIiEE10deallocateERS0_Pim = comdat any

$_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPim = comdat any

$_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E = comdat any

$_ZSt8_DestroyIPiEvT_S1_ = comdat any

$_ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_ = comdat any

$_ZNSt12_Vector_baseIiSaIiEEC2Ev = comdat any

$_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC2Ev = comdat any

$_ZNSaIiEC2Ev = comdat any

$_ZN9__gnu_cxx13new_allocatorIiEC2Ev = comdat any

$_ZN4V1_018IExecutionCallbackC2Ev = comdat any

$_ZN4V1_022DummyExecutionCallback6notifyE11ErrorStatus = comdat any

$_ZN4V1_018IExecutionCallbackD2Ev = comdat any

$_ZN4V1_022DummyExecutionCallbackD0Ev = comdat any

$_ZN4V1_018IExecutionCallbackD0Ev = comdat any

$_ZN6ReturnIvEC2Ev = comdat any

$_ZTVN4V1_022DummyExecutionCallbackE = comdat any

$_ZTSN4V1_022DummyExecutionCallbackE = comdat any

$_ZTSN4V1_018IExecutionCallbackE = comdat any

$_ZTIN4V1_018IExecutionCallbackE = comdat any

$_ZTIN4V1_022DummyExecutionCallbackE = comdat any

$_ZTVN4V1_018IExecutionCallbackE = comdat any

@.str = private unnamed_addr constant [30 x i8] c"mPreparedModelV1_0 != nullptr\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [100 x i8] c"/home/demo/android_packages_modules_NeuralNetworks/runtime/test/TestExecution_pthread_UAS_logic.cpp\00", align 1, !dbg !8
@__PRETTY_FUNCTION__._ZN24ExecutionBurstController7executeERKN4V1_07RequestERK2spINS0_18IExecutionCallbackEE = private unnamed_addr constant [115 x i8] c"Return<ErrorStatus> ExecutionBurstController::execute(const V1_0::Request &, const sp<V1_0::IExecutionCallback> &)\00", align 1, !dbg !13
@_ZTVN4V1_022DummyExecutionCallbackE = linkonce_odr dso_local unnamed_addr constant { [5 x ptr] } { [5 x ptr] [ptr null, ptr @_ZTIN4V1_022DummyExecutionCallbackE, ptr @_ZN4V1_022DummyExecutionCallback6notifyE11ErrorStatus, ptr @_ZN4V1_018IExecutionCallbackD2Ev, ptr @_ZN4V1_022DummyExecutionCallbackD0Ev] }, comdat, align 8
@_ZTVN10__cxxabiv120__si_class_type_infoE = external global ptr
@_ZTSN4V1_022DummyExecutionCallbackE = linkonce_odr dso_local constant [32 x i8] c"N4V1_022DummyExecutionCallbackE\00", comdat, align 1
@_ZTVN10__cxxabiv117__class_type_infoE = external global ptr
@_ZTSN4V1_018IExecutionCallbackE = linkonce_odr dso_local constant [28 x i8] c"N4V1_018IExecutionCallbackE\00", comdat, align 1
@_ZTIN4V1_018IExecutionCallbackE = linkonce_odr dso_local constant { ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv117__class_type_infoE, i64 2), ptr @_ZTSN4V1_018IExecutionCallbackE }, comdat, align 8
@_ZTIN4V1_022DummyExecutionCallbackE = linkonce_odr dso_local constant { ptr, ptr, ptr } { ptr getelementptr inbounds (ptr, ptr @_ZTVN10__cxxabiv120__si_class_type_infoE, i64 2), ptr @_ZTSN4V1_022DummyExecutionCallbackE, ptr @_ZTIN4V1_018IExecutionCallbackE }, comdat, align 8
@_ZTVN4V1_018IExecutionCallbackE = linkonce_odr dso_local unnamed_addr constant { [5 x ptr] } { [5 x ptr] [ptr null, ptr @_ZTIN4V1_018IExecutionCallbackE, ptr @__cxa_pure_virtual, ptr @_ZN4V1_018IExecutionCallbackD2Ev, ptr @_ZN4V1_018IExecutionCallbackD0Ev] }, comdat, align 8

; Function Attrs: mustprogress uwtable
define dso_local noundef ptr @_Z19execute_thread_funcPv(ptr noundef %0) #0 !dbg !987 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca %class.Return, align 4
  %5 = alloca %class.Return.0, align 1
  store ptr %0, ptr %2, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %2, metadata !992, metadata !DIExpression()), !dbg !998
  call void @llvm.lifetime.start.p0(i64 8, ptr %3) #20, !dbg !999
  call void @llvm.dbg.declare(metadata ptr %3, metadata !993, metadata !DIExpression()), !dbg !1000
  %6 = load ptr, ptr %2, align 8, !dbg !1001, !tbaa !994
  store ptr %6, ptr %3, align 8, !dbg !1000, !tbaa !994
  %7 = load ptr, ptr %3, align 8, !dbg !1002, !tbaa !994
  %8 = getelementptr inbounds %struct.ExecuteThreadData, ptr %7, i32 0, i32 0, !dbg !1003
  %9 = load ptr, ptr %8, align 8, !dbg !1003, !tbaa !1004
  call void @_ZN24ExecutionBurstController14dummyExecutionEv(ptr noundef nonnull align 8 dereferenceable(8) %9), !dbg !1012
  %10 = load ptr, ptr %3, align 8, !dbg !1013, !tbaa !994
  %11 = getelementptr inbounds %struct.ExecuteThreadData, ptr %10, i32 0, i32 0, !dbg !1015
  %12 = load ptr, ptr %11, align 8, !dbg !1015, !tbaa !1004
  %13 = call noundef i32 @_ZNK24ExecutionBurstController14getErrorStatusEv(ptr noundef nonnull align 8 dereferenceable(8) %12), !dbg !1016
  %14 = icmp eq i32 %13, 0, !dbg !1017
  br i1 %14, label %15, label %26, !dbg !1018

15:                                               ; preds = %1
  %16 = load ptr, ptr %3, align 8, !dbg !1019, !tbaa !994
  %17 = getelementptr inbounds %struct.ExecuteThreadData, ptr %16, i32 0, i32 0, !dbg !1021
  %18 = load ptr, ptr %17, align 8, !dbg !1021, !tbaa !1004
  %19 = call noundef ptr @_ZNK24ExecutionBurstController20getPreparedModelV1_0Ev(ptr noundef nonnull align 8 dereferenceable(8) %18), !dbg !1022
  %20 = load ptr, ptr %3, align 8, !dbg !1023, !tbaa !994
  %21 = getelementptr inbounds %struct.ExecuteThreadData, ptr %20, i32 0, i32 1, !dbg !1024
  %22 = load ptr, ptr %3, align 8, !dbg !1025, !tbaa !994
  %23 = getelementptr inbounds %struct.ExecuteThreadData, ptr %22, i32 0, i32 2, !dbg !1026
  %24 = call i32 @_ZN13PreparedModel7executeERKN4V1_07RequestERK2spINS0_18IExecutionCallbackEE(ptr noundef nonnull align 1 dereferenceable(1) %19, ptr noundef nonnull align 8 dereferenceable(72) %21, ptr noundef nonnull align 8 dereferenceable(8) %23), !dbg !1027
  %25 = getelementptr inbounds %class.Return, ptr %4, i32 0, i32 0, !dbg !1027
  store i32 %24, ptr %25, align 4, !dbg !1027
  br label %38, !dbg !1028

26:                                               ; preds = %1
  %27 = load ptr, ptr %3, align 8, !dbg !1029, !tbaa !994
  %28 = getelementptr inbounds %struct.ExecuteThreadData, ptr %27, i32 0, i32 2, !dbg !1031
  %29 = call noundef ptr @_ZNK2spIN4V1_018IExecutionCallbackEEptEv(ptr noundef nonnull align 8 dereferenceable(8) %28), !dbg !1029
  %30 = load ptr, ptr %3, align 8, !dbg !1032, !tbaa !994
  %31 = getelementptr inbounds %struct.ExecuteThreadData, ptr %30, i32 0, i32 0, !dbg !1033
  %32 = load ptr, ptr %31, align 8, !dbg !1033, !tbaa !1004
  %33 = call noundef i32 @_ZNK24ExecutionBurstController14getErrorStatusEv(ptr noundef nonnull align 8 dereferenceable(8) %32), !dbg !1034
  %34 = call noundef i32 @_Z13convertToV1_011ErrorStatus(i32 noundef %33), !dbg !1035
  %35 = load ptr, ptr %29, align 8, !dbg !1036, !tbaa !1037
  %36 = getelementptr inbounds ptr, ptr %35, i64 0, !dbg !1036
  %37 = load ptr, ptr %36, align 8, !dbg !1036
  call void %37(ptr noundef nonnull align 8 dereferenceable(8) %29, i32 noundef %34), !dbg !1036
  br label %38

38:                                               ; preds = %26, %15
  %39 = load ptr, ptr %3, align 8, !dbg !1039, !tbaa !994
  %40 = icmp eq ptr %39, null, !dbg !1040
  br i1 %40, label %42, label %41, !dbg !1040

41:                                               ; preds = %38
  call void @_ZN17ExecuteThreadDataD2Ev(ptr noundef nonnull align 8 dereferenceable(88) %39) #20, !dbg !1040
  call void @_ZdlPv(ptr noundef %39) #21, !dbg !1040
  br label %42, !dbg !1040

42:                                               ; preds = %41, %38
  call void @llvm.lifetime.end.p0(i64 8, ptr %3) #20, !dbg !1041
  ret ptr null, !dbg !1042
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: mustprogress nounwind uwtable
define linkonce_odr dso_local void @_ZN24ExecutionBurstController14dummyExecutionEv(ptr noundef nonnull align 8 dereferenceable(8) %0) #3 comdat align 2 !dbg !1043 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1045, metadata !DIExpression()), !dbg !1046
  %3 = load ptr, ptr %2, align 8
  ret void, !dbg !1047
}

; Function Attrs: mustprogress nounwind uwtable
define linkonce_odr dso_local noundef i32 @_ZNK24ExecutionBurstController14getErrorStatusEv(ptr noundef nonnull align 8 dereferenceable(8) %0) #3 comdat align 2 !dbg !1048 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1050, metadata !DIExpression()), !dbg !1052
  %3 = load ptr, ptr %2, align 8
  ret i32 0, !dbg !1053
}

; Function Attrs: mustprogress nounwind uwtable
define linkonce_odr dso_local noundef ptr @_ZNK24ExecutionBurstController20getPreparedModelV1_0Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) #3 comdat align 2 !dbg !1054 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1056, metadata !DIExpression()), !dbg !1057
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %class.ExecutionBurstController, ptr %3, i32 0, i32 0, !dbg !1058
  %5 = load ptr, ptr %4, align 8, !dbg !1058, !tbaa !1059
  ret ptr %5, !dbg !1061
}

; Function Attrs: mustprogress uwtable
define linkonce_odr dso_local i32 @_ZN13PreparedModel7executeERKN4V1_07RequestERK2spINS0_18IExecutionCallbackEE(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef nonnull align 8 dereferenceable(72) %1, ptr noundef nonnull align 8 dereferenceable(8) %2) #0 comdat align 2 !dbg !1062 {
  %4 = alloca %class.Return, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1064, metadata !DIExpression()), !dbg !1067
  store ptr %1, ptr %6, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1065, metadata !DIExpression()), !dbg !1068
  store ptr %2, ptr %7, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1066, metadata !DIExpression()), !dbg !1069
  %8 = load ptr, ptr %5, align 8
  call void @_ZN6ReturnI11ErrorStatusEC2ES0_(ptr noundef nonnull align 4 dereferenceable(4) %4, i32 noundef 0), !dbg !1070
  %9 = getelementptr inbounds %class.Return, ptr %4, i32 0, i32 0, !dbg !1071
  %10 = load i32, ptr %9, align 4, !dbg !1071
  ret i32 %10, !dbg !1071
}

; Function Attrs: mustprogress nounwind uwtable
define linkonce_odr dso_local noundef ptr @_ZNK2spIN4V1_018IExecutionCallbackEEptEv(ptr noundef nonnull align 8 dereferenceable(8) %0) #3 comdat align 2 !dbg !1072 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1074, metadata !DIExpression()), !dbg !1076
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %class.sp, ptr %3, i32 0, i32 0, !dbg !1077
  %5 = load ptr, ptr %4, align 8, !dbg !1077, !tbaa !1078
  ret ptr %5, !dbg !1079
}

; Function Attrs: inlinehint mustprogress nounwind uwtable
define linkonce_odr dso_local noundef i32 @_Z13convertToV1_011ErrorStatus(i32 noundef %0) #4 comdat !dbg !1080 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4, !tbaa !1085
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1084, metadata !DIExpression()), !dbg !1087
  %3 = load i32, ptr %2, align 4, !dbg !1088, !tbaa !1085
  ret i32 %3, !dbg !1089
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local void @_ZN17ExecuteThreadDataD2Ev(ptr noundef nonnull align 8 dereferenceable(88) %0) unnamed_addr #5 comdat align 2 !dbg !1090 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1096, metadata !DIExpression()), !dbg !1097
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %struct.ExecuteThreadData, ptr %3, i32 0, i32 1, !dbg !1098
  call void @_ZN4V1_07RequestD2Ev(ptr noundef nonnull align 8 dereferenceable(72) %4) #20, !dbg !1098
  ret void, !dbg !1100
}

; Function Attrs: nobuiltin nounwind
declare !dbg !1101 void @_ZdlPv(ptr noundef) #6

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: mustprogress uwtable
define dso_local i32 @_ZN24ExecutionBurstController7executeERKN4V1_07RequestERK2spINS0_18IExecutionCallbackEE(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(72) %1, ptr noundef nonnull align 8 dereferenceable(8) %2) #0 align 2 personality ptr @__gxx_personality_v0 !dbg !1105 {
  %4 = alloca %class.Return, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca i64, align 8
  store ptr %0, ptr %5, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1107, metadata !DIExpression()), !dbg !1114
  store ptr %1, ptr %6, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1108, metadata !DIExpression()), !dbg !1115
  store ptr %2, ptr %7, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1109, metadata !DIExpression()), !dbg !1116
  %12 = load ptr, ptr %5, align 8
  %13 = getelementptr inbounds %class.ExecutionBurstController, ptr %12, i32 0, i32 0, !dbg !1117
  %14 = load ptr, ptr %13, align 8, !dbg !1117, !tbaa !1059
  %15 = icmp ne ptr %14, null, !dbg !1117
  br i1 %15, label %16, label %17, !dbg !1117

16:                                               ; preds = %3
  br label %19, !dbg !1117

17:                                               ; preds = %3
  call void @__assert_fail(ptr noundef @.str, ptr noundef @.str.1, i32 noundef 96, ptr noundef @__PRETTY_FUNCTION__._ZN24ExecutionBurstController7executeERKN4V1_07RequestERK2spINS0_18IExecutionCallbackEE) #22, !dbg !1117
  unreachable, !dbg !1117

18:                                               ; No predecessors!
  br label %19, !dbg !1117

19:                                               ; preds = %18, %16
  call void @llvm.lifetime.start.p0(i64 8, ptr %8) #20, !dbg !1118
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1110, metadata !DIExpression()), !dbg !1119
  %20 = call noalias noundef nonnull ptr @_Znwm(i64 noundef 88) #23, !dbg !1120, !heapallocsite !37
  %21 = getelementptr inbounds %struct.ExecuteThreadData, ptr %20, i32 0, i32 0, !dbg !1121
  store ptr %12, ptr %21, align 16, !dbg !1121, !tbaa !1004
  %22 = getelementptr inbounds %struct.ExecuteThreadData, ptr %20, i32 0, i32 1, !dbg !1121
  %23 = load ptr, ptr %6, align 8, !dbg !1122, !tbaa !994
  invoke void @_ZN4V1_07RequestC2ERKS0_(ptr noundef nonnull align 8 dereferenceable(72) %22, ptr noundef nonnull align 8 dereferenceable(72) %23)
          to label %24 unwind label %34, !dbg !1122

24:                                               ; preds = %19
  %25 = getelementptr inbounds %struct.ExecuteThreadData, ptr %20, i32 0, i32 2, !dbg !1121
  %26 = load ptr, ptr %7, align 8, !dbg !1123, !tbaa !994
  invoke void @_ZN2spIN4V1_018IExecutionCallbackEEC2ERKS2_(ptr noundef nonnull align 8 dereferenceable(8) %25, ptr noundef nonnull align 8 dereferenceable(8) %26)
          to label %27 unwind label %38, !dbg !1123

27:                                               ; preds = %24
  store ptr %20, ptr %8, align 8, !dbg !1119, !tbaa !994
  call void @llvm.lifetime.start.p0(i64 8, ptr %11) #20, !dbg !1124
  call void @llvm.dbg.declare(metadata ptr %11, metadata !1111, metadata !DIExpression()), !dbg !1125
  %28 = load ptr, ptr %8, align 8, !dbg !1126, !tbaa !994
  %29 = call i32 @pthread_create(ptr noundef %11, ptr noundef null, ptr noundef @_Z19execute_thread_funcPv, ptr noundef %28) #20, !dbg !1127
  %30 = load i64, ptr %11, align 8, !dbg !1128, !tbaa !1129
  %31 = call i32 @pthread_detach(i64 noundef %30) #20, !dbg !1131
  call void @_ZN6ReturnI11ErrorStatusEC2ES0_(ptr noundef nonnull align 4 dereferenceable(4) %4, i32 noundef 0), !dbg !1132
  call void @llvm.lifetime.end.p0(i64 8, ptr %11) #20, !dbg !1133
  call void @llvm.lifetime.end.p0(i64 8, ptr %8) #20, !dbg !1133
  %32 = getelementptr inbounds %class.Return, ptr %4, i32 0, i32 0, !dbg !1133
  %33 = load i32, ptr %32, align 4, !dbg !1133
  ret i32 %33, !dbg !1133

34:                                               ; preds = %19
  %35 = landingpad { ptr, i32 }
          cleanup, !dbg !1133
  %36 = extractvalue { ptr, i32 } %35, 0, !dbg !1133
  store ptr %36, ptr %9, align 8, !dbg !1133
  %37 = extractvalue { ptr, i32 } %35, 1, !dbg !1133
  store i32 %37, ptr %10, align 4, !dbg !1133
  br label %42, !dbg !1133

38:                                               ; preds = %24
  %39 = landingpad { ptr, i32 }
          cleanup, !dbg !1133
  %40 = extractvalue { ptr, i32 } %39, 0, !dbg !1133
  store ptr %40, ptr %9, align 8, !dbg !1133
  %41 = extractvalue { ptr, i32 } %39, 1, !dbg !1133
  store i32 %41, ptr %10, align 4, !dbg !1133
  call void @_ZN4V1_07RequestD2Ev(ptr noundef nonnull align 8 dereferenceable(72) %22) #20, !dbg !1121
  br label %42, !dbg !1121

42:                                               ; preds = %38, %34
  call void @_ZdlPv(ptr noundef %20) #21, !dbg !1120
  call void @llvm.lifetime.end.p0(i64 8, ptr %8) #20, !dbg !1133
  br label %43, !dbg !1133

43:                                               ; preds = %42
  %44 = load ptr, ptr %9, align 8, !dbg !1133
  %45 = load i32, ptr %10, align 4, !dbg !1133
  %46 = insertvalue { ptr, i32 } poison, ptr %44, 0, !dbg !1133
  %47 = insertvalue { ptr, i32 } %46, i32 %45, 1, !dbg !1133
  resume { ptr, i32 } %47, !dbg !1133
}

; Function Attrs: noreturn nounwind
declare !dbg !1134 void @__assert_fail(ptr noundef, ptr noundef, i32 noundef, ptr noundef) #7

; Function Attrs: nobuiltin allocsize(0)
declare !dbg !1138 noundef nonnull ptr @_Znwm(i64 noundef) #8

; Function Attrs: inlinehint uwtable
define linkonce_odr dso_local void @_ZN4V1_07RequestC2ERKS0_(ptr noundef nonnull align 8 dereferenceable(72) %0, ptr noundef nonnull align 8 dereferenceable(72) %1) unnamed_addr #9 comdat align 2 personality ptr @__gxx_personality_v0 !dbg !1141 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  store ptr %0, ptr %3, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1147, metadata !DIExpression()), !dbg !1150
  store ptr %1, ptr %4, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1149, metadata !DIExpression()), !dbg !1150
  %7 = load ptr, ptr %3, align 8
  %8 = getelementptr inbounds %"struct.V1_0::Request", ptr %7, i32 0, i32 0, !dbg !1151
  %9 = load ptr, ptr %4, align 8, !dbg !1151, !tbaa !994
  %10 = getelementptr inbounds %"struct.V1_0::Request", ptr %9, i32 0, i32 0, !dbg !1151
  call void @_ZNSt6vectorIiSaIiEEC2ERKS1_(ptr noundef nonnull align 8 dereferenceable(24) %8, ptr noundef nonnull align 8 dereferenceable(24) %10), !dbg !1151
  %11 = getelementptr inbounds %"struct.V1_0::Request", ptr %7, i32 0, i32 1, !dbg !1151
  %12 = load ptr, ptr %4, align 8, !dbg !1151, !tbaa !994
  %13 = getelementptr inbounds %"struct.V1_0::Request", ptr %12, i32 0, i32 1, !dbg !1151
  invoke void @_ZNSt6vectorIiSaIiEEC2ERKS1_(ptr noundef nonnull align 8 dereferenceable(24) %11, ptr noundef nonnull align 8 dereferenceable(24) %13)
          to label %14 unwind label %19, !dbg !1151

14:                                               ; preds = %2
  %15 = getelementptr inbounds %"struct.V1_0::Request", ptr %7, i32 0, i32 2, !dbg !1151
  %16 = load ptr, ptr %4, align 8, !dbg !1151, !tbaa !994
  %17 = getelementptr inbounds %"struct.V1_0::Request", ptr %16, i32 0, i32 2, !dbg !1151
  invoke void @_ZNSt6vectorIiSaIiEEC2ERKS1_(ptr noundef nonnull align 8 dereferenceable(24) %15, ptr noundef nonnull align 8 dereferenceable(24) %17)
          to label %18 unwind label %23, !dbg !1151

18:                                               ; preds = %14
  ret void, !dbg !1151

19:                                               ; preds = %2
  %20 = landingpad { ptr, i32 }
          cleanup, !dbg !1151
  %21 = extractvalue { ptr, i32 } %20, 0, !dbg !1151
  store ptr %21, ptr %5, align 8, !dbg !1151
  %22 = extractvalue { ptr, i32 } %20, 1, !dbg !1151
  store i32 %22, ptr %6, align 4, !dbg !1151
  br label %27, !dbg !1151

23:                                               ; preds = %14
  %24 = landingpad { ptr, i32 }
          cleanup, !dbg !1151
  %25 = extractvalue { ptr, i32 } %24, 0, !dbg !1151
  store ptr %25, ptr %5, align 8, !dbg !1151
  %26 = extractvalue { ptr, i32 } %24, 1, !dbg !1151
  store i32 %26, ptr %6, align 4, !dbg !1151
  call void @_ZNSt6vectorIiSaIiEED2Ev(ptr noundef nonnull align 8 dereferenceable(24) %11) #20, !dbg !1152
  br label %27, !dbg !1152

27:                                               ; preds = %23, %19
  call void @_ZNSt6vectorIiSaIiEED2Ev(ptr noundef nonnull align 8 dereferenceable(24) %8) #20, !dbg !1152
  br label %28, !dbg !1152

28:                                               ; preds = %27
  %29 = load ptr, ptr %5, align 8, !dbg !1152
  %30 = load i32, ptr %6, align 4, !dbg !1152
  %31 = insertvalue { ptr, i32 } poison, ptr %29, 0, !dbg !1152
  %32 = insertvalue { ptr, i32 } %31, i32 %30, 1, !dbg !1152
  resume { ptr, i32 } %32, !dbg !1152
}

declare i32 @__gxx_personality_v0(...)

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @_ZN2spIN4V1_018IExecutionCallbackEEC2ERKS2_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) unnamed_addr #10 comdat align 2 !dbg !1154 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1156, metadata !DIExpression()), !dbg !1159
  store ptr %1, ptr %4, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1158, metadata !DIExpression()), !dbg !1160
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %class.sp, ptr %5, i32 0, i32 0, !dbg !1161
  %7 = load ptr, ptr %4, align 8, !dbg !1162, !tbaa !994
  %8 = getelementptr inbounds %class.sp, ptr %7, i32 0, i32 0, !dbg !1163
  %9 = load ptr, ptr %8, align 8, !dbg !1163, !tbaa !1078
  store ptr %9, ptr %6, align 8, !dbg !1161, !tbaa !1078
  ret void, !dbg !1164
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local void @_ZN4V1_07RequestD2Ev(ptr noundef nonnull align 8 dereferenceable(72) %0) unnamed_addr #5 comdat align 2 !dbg !1165 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1170, metadata !DIExpression()), !dbg !1171
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.V1_0::Request", ptr %3, i32 0, i32 2, !dbg !1172
  call void @_ZNSt6vectorIiSaIiEED2Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #20, !dbg !1172
  %5 = getelementptr inbounds %"struct.V1_0::Request", ptr %3, i32 0, i32 1, !dbg !1172
  call void @_ZNSt6vectorIiSaIiEED2Ev(ptr noundef nonnull align 8 dereferenceable(24) %5) #20, !dbg !1172
  %6 = getelementptr inbounds %"struct.V1_0::Request", ptr %3, i32 0, i32 0, !dbg !1172
  call void @_ZNSt6vectorIiSaIiEED2Ev(ptr noundef nonnull align 8 dereferenceable(24) %6) #20, !dbg !1172
  ret void, !dbg !1174
}

; Function Attrs: nounwind
declare !dbg !1175 i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #11

; Function Attrs: nounwind
declare !dbg !1188 i32 @pthread_detach(i64 noundef) #11

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @_ZN6ReturnI11ErrorStatusEC2ES0_(ptr noundef nonnull align 4 dereferenceable(4) %0, i32 noundef %1) unnamed_addr #10 comdat align 2 !dbg !1191 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1193, metadata !DIExpression()), !dbg !1196
  store i32 %1, ptr %4, align 4, !tbaa !1085
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1195, metadata !DIExpression()), !dbg !1197
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %class.Return, ptr %5, i32 0, i32 0, !dbg !1198
  %7 = load i32, ptr %4, align 4, !dbg !1199, !tbaa !1085
  store i32 %7, ptr %6, align 4, !dbg !1198, !tbaa !1200
  ret void, !dbg !1202
}

; Function Attrs: mustprogress uwtable
define dso_local void @_Z19testExecuteFunctionv() #0 personality ptr @__gxx_personality_v0 !dbg !1203 {
  %1 = alloca %"struct.V1_0::Request", align 8
  %2 = alloca %class.sp, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca %class.ExecutionBurstController, align 8
  %6 = alloca %class.Return, align 4
  call void @llvm.lifetime.start.p0(i64 72, ptr %1) #20, !dbg !1210
  call void @llvm.dbg.declare(metadata ptr %1, metadata !1207, metadata !DIExpression()), !dbg !1211
  %7 = getelementptr inbounds %"struct.V1_0::Request", ptr %1, i32 0, i32 0, !dbg !1212
  call void @llvm.memset.p0.i64(ptr align 8 %7, i8 0, i64 24, i1 false), !dbg !1213
  call void @_ZNSt6vectorIiSaIiEEC2Ev(ptr noundef nonnull align 8 dereferenceable(24) %7) #20, !dbg !1213
  %8 = getelementptr inbounds %"struct.V1_0::Request", ptr %1, i32 0, i32 1, !dbg !1212
  call void @llvm.memset.p0.i64(ptr align 8 %8, i8 0, i64 24, i1 false), !dbg !1214
  call void @_ZNSt6vectorIiSaIiEEC2Ev(ptr noundef nonnull align 8 dereferenceable(24) %8) #20, !dbg !1214
  %9 = getelementptr inbounds %"struct.V1_0::Request", ptr %1, i32 0, i32 2, !dbg !1212
  call void @llvm.memset.p0.i64(ptr align 8 %9, i8 0, i64 24, i1 false), !dbg !1215
  call void @_ZNSt6vectorIiSaIiEEC2Ev(ptr noundef nonnull align 8 dereferenceable(24) %9) #20, !dbg !1215
  call void @llvm.lifetime.start.p0(i64 8, ptr %2) #20, !dbg !1216
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1208, metadata !DIExpression()), !dbg !1217
  %10 = invoke noalias noundef nonnull ptr @_Znwm(i64 noundef 8) #23
          to label %11 unwind label %17, !dbg !1218, !heapallocsite !1219

11:                                               ; preds = %0
  call void @llvm.memset.p0.i64(ptr align 8 %10, i8 0, i64 8, i1 false), !dbg !1226
  call void @_ZN4V1_022DummyExecutionCallbackC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %10) #20, !dbg !1226
  invoke void @_ZN2spIN4V1_018IExecutionCallbackEEC2EPS1_(ptr noundef nonnull align 8 dereferenceable(8) %2, ptr noundef %10)
          to label %12 unwind label %17, !dbg !1218

12:                                               ; preds = %11
  call void @llvm.lifetime.start.p0(i64 8, ptr %5) #20, !dbg !1227
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1209, metadata !DIExpression()), !dbg !1228
  invoke void @_ZN24ExecutionBurstControllerC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %5)
          to label %13 unwind label %21, !dbg !1228

13:                                               ; preds = %12
  %14 = invoke i32 @_ZN24ExecutionBurstController7executeERKN4V1_07RequestERK2spINS0_18IExecutionCallbackEE(ptr noundef nonnull align 8 dereferenceable(8) %5, ptr noundef nonnull align 8 dereferenceable(72) %1, ptr noundef nonnull align 8 dereferenceable(8) %2)
          to label %15 unwind label %21, !dbg !1229

15:                                               ; preds = %13
  %16 = getelementptr inbounds %class.Return, ptr %6, i32 0, i32 0, !dbg !1229
  store i32 %14, ptr %16, align 4, !dbg !1229
  call void @llvm.lifetime.end.p0(i64 8, ptr %5) #20, !dbg !1230
  call void @llvm.lifetime.end.p0(i64 8, ptr %2) #20, !dbg !1230
  call void @_ZN4V1_07RequestD2Ev(ptr noundef nonnull align 8 dereferenceable(72) %1) #20, !dbg !1230
  call void @llvm.lifetime.end.p0(i64 72, ptr %1) #20, !dbg !1230
  ret void, !dbg !1230

17:                                               ; preds = %11, %0
  %18 = landingpad { ptr, i32 }
          cleanup, !dbg !1230
  %19 = extractvalue { ptr, i32 } %18, 0, !dbg !1230
  store ptr %19, ptr %3, align 8, !dbg !1230
  %20 = extractvalue { ptr, i32 } %18, 1, !dbg !1230
  store i32 %20, ptr %4, align 4, !dbg !1230
  br label %25, !dbg !1230

21:                                               ; preds = %13, %12
  %22 = landingpad { ptr, i32 }
          cleanup, !dbg !1230
  %23 = extractvalue { ptr, i32 } %22, 0, !dbg !1230
  store ptr %23, ptr %3, align 8, !dbg !1230
  %24 = extractvalue { ptr, i32 } %22, 1, !dbg !1230
  store i32 %24, ptr %4, align 4, !dbg !1230
  call void @llvm.lifetime.end.p0(i64 8, ptr %5) #20, !dbg !1230
  br label %25, !dbg !1230

25:                                               ; preds = %21, %17
  call void @llvm.lifetime.end.p0(i64 8, ptr %2) #20, !dbg !1230
  call void @_ZN4V1_07RequestD2Ev(ptr noundef nonnull align 8 dereferenceable(72) %1) #20, !dbg !1230
  call void @llvm.lifetime.end.p0(i64 72, ptr %1) #20, !dbg !1230
  br label %26, !dbg !1230

26:                                               ; preds = %25
  %27 = load ptr, ptr %3, align 8, !dbg !1230
  %28 = load i32, ptr %4, align 4, !dbg !1230
  %29 = insertvalue { ptr, i32 } poison, ptr %27, 0, !dbg !1230
  %30 = insertvalue { ptr, i32 } %29, i32 %28, 1, !dbg !1230
  resume { ptr, i32 } %30, !dbg !1230
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #12

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @_ZNSt6vectorIiSaIiEEC2Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) unnamed_addr #10 comdat align 2 !dbg !1231 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1233, metadata !DIExpression()), !dbg !1235
  %3 = load ptr, ptr %2, align 8
  call void @_ZNSt12_Vector_baseIiSaIiEEC2Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #20, !dbg !1236
  ret void, !dbg !1237
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local void @_ZN4V1_022DummyExecutionCallbackC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #5 comdat align 2 !dbg !1238 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1243, metadata !DIExpression()), !dbg !1245
  %3 = load ptr, ptr %2, align 8
  call void @_ZN4V1_018IExecutionCallbackC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #20, !dbg !1246
  store ptr getelementptr inbounds ({ [5 x ptr] }, ptr @_ZTVN4V1_022DummyExecutionCallbackE, i32 0, inrange i32 0, i32 2), ptr %3, align 8, !dbg !1246, !tbaa !1037
  ret void, !dbg !1246
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @_ZN2spIN4V1_018IExecutionCallbackEEC2EPS1_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef %1) unnamed_addr #10 comdat align 2 !dbg !1247 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1249, metadata !DIExpression()), !dbg !1251
  store ptr %1, ptr %4, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1250, metadata !DIExpression()), !dbg !1252
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %class.sp, ptr %5, i32 0, i32 0, !dbg !1253
  %7 = load ptr, ptr %4, align 8, !dbg !1254, !tbaa !994
  store ptr %7, ptr %6, align 8, !dbg !1253, !tbaa !1078
  ret void, !dbg !1255
}

; Function Attrs: inlinehint uwtable
define linkonce_odr dso_local void @_ZN24ExecutionBurstControllerC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #9 comdat align 2 !dbg !1256 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1259, metadata !DIExpression()), !dbg !1260
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %class.ExecutionBurstController, ptr %3, i32 0, i32 0, !dbg !1261
  %5 = call noalias noundef nonnull ptr @_Znwm(i64 noundef 1) #23, !dbg !1262, !heapallocsite !45
  store ptr %5, ptr %4, align 8, !dbg !1261, !tbaa !1059
  ret void, !dbg !1263
}

; Function Attrs: uwtable
define linkonce_odr dso_local void @_ZNSt6vectorIiSaIiEEC2ERKS1_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 8 dereferenceable(24) %1) unnamed_addr #13 comdat align 2 personality ptr @__gxx_personality_v0 !dbg !1264 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %"class.std::allocator", align 1
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %9 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  store ptr %0, ptr %3, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1266, metadata !DIExpression()), !dbg !1268
  store ptr %1, ptr %4, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1267, metadata !DIExpression()), !dbg !1269
  %10 = load ptr, ptr %3, align 8
  %11 = load ptr, ptr %4, align 8, !dbg !1270, !tbaa !994
  %12 = call noundef i64 @_ZNKSt6vectorIiSaIiEE4sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %11) #20, !dbg !1271
  call void @llvm.lifetime.start.p0(i64 1, ptr %5) #20, !dbg !1272
  %13 = load ptr, ptr %4, align 8, !dbg !1273, !tbaa !994
  %14 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNKSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv(ptr noundef nonnull align 8 dereferenceable(24) %13) #20, !dbg !1274
  call void @_ZN9__gnu_cxx14__alloc_traitsISaIiEiE17_S_select_on_copyERKS1_(ptr sret(%"class.std::allocator") align 1 %5, ptr noundef nonnull align 1 dereferenceable(1) %14), !dbg !1272
  invoke void @_ZNSt12_Vector_baseIiSaIiEEC2EmRKS0_(ptr noundef nonnull align 8 dereferenceable(24) %10, i64 noundef %12, ptr noundef nonnull align 1 dereferenceable(1) %5)
          to label %15 unwind label %34, !dbg !1275

15:                                               ; preds = %2
  call void @_ZN9__gnu_cxx13new_allocatorIiED2Ev(ptr noundef nonnull align 1 dereferenceable(1) %5) #20, !dbg !1275
  call void @llvm.lifetime.end.p0(i64 1, ptr %5) #20, !dbg !1275
  %16 = load ptr, ptr %4, align 8, !dbg !1276, !tbaa !994
  %17 = call ptr @_ZNKSt6vectorIiSaIiEE5beginEv(ptr noundef nonnull align 8 dereferenceable(24) %16) #20, !dbg !1278
  %18 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %8, i32 0, i32 0, !dbg !1278
  store ptr %17, ptr %18, align 8, !dbg !1278
  %19 = load ptr, ptr %4, align 8, !dbg !1279, !tbaa !994
  %20 = call ptr @_ZNKSt6vectorIiSaIiEE3endEv(ptr noundef nonnull align 8 dereferenceable(24) %19) #20, !dbg !1280
  %21 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %9, i32 0, i32 0, !dbg !1280
  store ptr %20, ptr %21, align 8, !dbg !1280
  %22 = getelementptr inbounds %"struct.std::_Vector_base", ptr %10, i32 0, i32 0, !dbg !1281
  %23 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %22, i32 0, i32 0, !dbg !1282
  %24 = load ptr, ptr %23, align 8, !dbg !1282, !tbaa !1283
  %25 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv(ptr noundef nonnull align 8 dereferenceable(24) %10) #20, !dbg !1284
  %26 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %8, i32 0, i32 0, !dbg !1285
  %27 = load ptr, ptr %26, align 8, !dbg !1285
  %28 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %9, i32 0, i32 0, !dbg !1285
  %29 = load ptr, ptr %28, align 8, !dbg !1285
  %30 = invoke noundef ptr @_ZSt22__uninitialized_copy_aIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEPiiET0_T_SA_S9_RSaIT1_E(ptr %27, ptr %29, ptr noundef %24, ptr noundef nonnull align 1 dereferenceable(1) %25)
          to label %31 unwind label %38, !dbg !1285

31:                                               ; preds = %15
  %32 = getelementptr inbounds %"struct.std::_Vector_base", ptr %10, i32 0, i32 0, !dbg !1286
  %33 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %32, i32 0, i32 1, !dbg !1287
  store ptr %30, ptr %33, align 8, !dbg !1288, !tbaa !1289
  ret void, !dbg !1290

34:                                               ; preds = %2
  %35 = landingpad { ptr, i32 }
          cleanup, !dbg !1290
  %36 = extractvalue { ptr, i32 } %35, 0, !dbg !1290
  store ptr %36, ptr %6, align 8, !dbg !1290
  %37 = extractvalue { ptr, i32 } %35, 1, !dbg !1290
  store i32 %37, ptr %7, align 4, !dbg !1290
  call void @_ZN9__gnu_cxx13new_allocatorIiED2Ev(ptr noundef nonnull align 1 dereferenceable(1) %5) #20, !dbg !1275
  call void @llvm.lifetime.end.p0(i64 1, ptr %5) #20, !dbg !1275
  br label %42, !dbg !1275

38:                                               ; preds = %15
  %39 = landingpad { ptr, i32 }
          cleanup, !dbg !1291
  %40 = extractvalue { ptr, i32 } %39, 0, !dbg !1291
  store ptr %40, ptr %6, align 8, !dbg !1291
  %41 = extractvalue { ptr, i32 } %39, 1, !dbg !1291
  store i32 %41, ptr %7, align 4, !dbg !1291
  call void @_ZNSt12_Vector_baseIiSaIiEED2Ev(ptr noundef nonnull align 8 dereferenceable(24) %10) #20, !dbg !1291
  br label %42, !dbg !1291

42:                                               ; preds = %38, %34
  %43 = load ptr, ptr %6, align 8, !dbg !1275
  %44 = load i32, ptr %7, align 4, !dbg !1275
  %45 = insertvalue { ptr, i32 } poison, ptr %43, 0, !dbg !1275
  %46 = insertvalue { ptr, i32 } %45, i32 %44, 1, !dbg !1275
  resume { ptr, i32 } %46, !dbg !1275
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @_ZNSt6vectorIiSaIiEED2Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) unnamed_addr #10 comdat align 2 personality ptr @__gxx_personality_v0 !dbg !1292 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1294, metadata !DIExpression()), !dbg !1295
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::_Vector_base", ptr %3, i32 0, i32 0, !dbg !1296
  %5 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %4, i32 0, i32 0, !dbg !1298
  %6 = load ptr, ptr %5, align 8, !dbg !1298, !tbaa !1283
  %7 = getelementptr inbounds %"struct.std::_Vector_base", ptr %3, i32 0, i32 0, !dbg !1299
  %8 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %7, i32 0, i32 1, !dbg !1300
  %9 = load ptr, ptr %8, align 8, !dbg !1300, !tbaa !1289
  %10 = call noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv(ptr noundef nonnull align 8 dereferenceable(24) %3) #20, !dbg !1301
  invoke void @_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E(ptr noundef %6, ptr noundef %9, ptr noundef nonnull align 1 dereferenceable(1) %10)
          to label %11 unwind label %12, !dbg !1302

11:                                               ; preds = %1
  call void @_ZNSt12_Vector_baseIiSaIiEED2Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #20, !dbg !1303
  ret void, !dbg !1304

12:                                               ; preds = %1
  %13 = landingpad { ptr, i32 }
          catch ptr null, !dbg !1302
  %14 = extractvalue { ptr, i32 } %13, 0, !dbg !1302
  call void @__clang_call_terminate(ptr %14) #22, !dbg !1302
  unreachable, !dbg !1302
}

; Function Attrs: mustprogress nounwind uwtable
define linkonce_odr dso_local noundef i64 @_ZNKSt6vectorIiSaIiEE4sizeEv(ptr noundef nonnull align 8 dereferenceable(24) %0) #3 comdat align 2 !dbg !1305 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1307, metadata !DIExpression()), !dbg !1309
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::_Vector_base", ptr %3, i32 0, i32 0, !dbg !1310
  %5 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %4, i32 0, i32 1, !dbg !1311
  %6 = load ptr, ptr %5, align 8, !dbg !1311, !tbaa !1289
  %7 = getelementptr inbounds %"struct.std::_Vector_base", ptr %3, i32 0, i32 0, !dbg !1312
  %8 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %7, i32 0, i32 0, !dbg !1313
  %9 = load ptr, ptr %8, align 8, !dbg !1313, !tbaa !1283
  %10 = ptrtoint ptr %6 to i64, !dbg !1314
  %11 = ptrtoint ptr %9 to i64, !dbg !1314
  %12 = sub i64 %10, %11, !dbg !1314
  %13 = sdiv exact i64 %12, 4, !dbg !1314
  ret i64 %13, !dbg !1315
}

; Function Attrs: mustprogress uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx14__alloc_traitsISaIiEiE17_S_select_on_copyERKS1_(ptr noalias sret(%"class.std::allocator") align 1 %0, ptr noundef nonnull align 1 dereferenceable(1) %1) #0 comdat align 2 !dbg !1316 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1318, metadata !DIExpression()), !dbg !1319
  %5 = load ptr, ptr %4, align 8, !dbg !1320, !tbaa !994
  call void @_ZNSt16allocator_traitsISaIiEE37select_on_container_copy_constructionERKS0_(ptr sret(%"class.std::allocator") align 1 %0, ptr noundef nonnull align 1 dereferenceable(1) %5), !dbg !1321
  ret void, !dbg !1322
}

; Function Attrs: mustprogress nounwind uwtable
define linkonce_odr dso_local noundef nonnull align 1 dereferenceable(1) ptr @_ZNKSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv(ptr noundef nonnull align 8 dereferenceable(24) %0) #3 comdat align 2 !dbg !1323 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1325, metadata !DIExpression()), !dbg !1327
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::_Vector_base", ptr %3, i32 0, i32 0, !dbg !1328
  ret ptr %4, !dbg !1329
}

; Function Attrs: uwtable
define linkonce_odr dso_local void @_ZNSt12_Vector_baseIiSaIiEEC2EmRKS0_(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1, ptr noundef nonnull align 1 dereferenceable(1) %2) unnamed_addr #13 comdat align 2 personality ptr @__gxx_personality_v0 !dbg !1330 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1332, metadata !DIExpression()), !dbg !1336
  store i64 %1, ptr %5, align 8, !tbaa !1129
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1334, metadata !DIExpression()), !dbg !1337
  store ptr %2, ptr %6, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1335, metadata !DIExpression()), !dbg !1338
  %9 = load ptr, ptr %4, align 8
  %10 = getelementptr inbounds %"struct.std::_Vector_base", ptr %9, i32 0, i32 0, !dbg !1339
  %11 = load ptr, ptr %6, align 8, !dbg !1340, !tbaa !994
  call void @_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC2ERKS0_(ptr noundef nonnull align 8 dereferenceable(24) %10, ptr noundef nonnull align 1 dereferenceable(1) %11) #20, !dbg !1339
  %12 = load i64, ptr %5, align 8, !dbg !1341, !tbaa !1129
  invoke void @_ZNSt12_Vector_baseIiSaIiEE17_M_create_storageEm(ptr noundef nonnull align 8 dereferenceable(24) %9, i64 noundef %12)
          to label %13 unwind label %14, !dbg !1343

13:                                               ; preds = %3
  ret void, !dbg !1344

14:                                               ; preds = %3
  %15 = landingpad { ptr, i32 }
          cleanup, !dbg !1345
  %16 = extractvalue { ptr, i32 } %15, 0, !dbg !1345
  store ptr %16, ptr %7, align 8, !dbg !1345
  %17 = extractvalue { ptr, i32 } %15, 1, !dbg !1345
  store i32 %17, ptr %8, align 4, !dbg !1345
  call void @_ZN9__gnu_cxx13new_allocatorIiED2Ev(ptr noundef nonnull align 8 dereferenceable(24) %10) #20, !dbg !1345
  br label %18, !dbg !1345

18:                                               ; preds = %14
  %19 = load ptr, ptr %7, align 8, !dbg !1345
  %20 = load i32, ptr %8, align 4, !dbg !1345
  %21 = insertvalue { ptr, i32 } poison, ptr %19, 0, !dbg !1345
  %22 = insertvalue { ptr, i32 } %21, i32 %20, 1, !dbg !1345
  resume { ptr, i32 } %22, !dbg !1345
}

; Function Attrs: inlinehint mustprogress uwtable
define linkonce_odr dso_local noundef ptr @_ZSt22__uninitialized_copy_aIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEPiiET0_T_SA_S9_RSaIT1_E(ptr %0, ptr %1, ptr noundef %2, ptr noundef nonnull align 1 dereferenceable(1) %3) #14 comdat !dbg !1346 {
  %5 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %6 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %10 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %11 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %5, i32 0, i32 0
  store ptr %0, ptr %11, align 8
  %12 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %6, i32 0, i32 0
  store ptr %1, ptr %12, align 8
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1351, metadata !DIExpression()), !dbg !1358
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1352, metadata !DIExpression()), !dbg !1359
  store ptr %2, ptr %7, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1353, metadata !DIExpression()), !dbg !1360
  store ptr %3, ptr %8, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1354, metadata !DIExpression()), !dbg !1361
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %9, ptr align 8 %5, i64 8, i1 false), !dbg !1362, !tbaa.struct !1363
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %10, ptr align 8 %6, i64 8, i1 false), !dbg !1364, !tbaa.struct !1363
  %13 = load ptr, ptr %7, align 8, !dbg !1365, !tbaa !994
  %14 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %9, i32 0, i32 0, !dbg !1366
  %15 = load ptr, ptr %14, align 8, !dbg !1366
  %16 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %10, i32 0, i32 0, !dbg !1366
  %17 = load ptr, ptr %16, align 8, !dbg !1366
  %18 = call noundef ptr @_ZSt18uninitialized_copyIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEPiET0_T_SA_S9_(ptr %15, ptr %17, ptr noundef %13), !dbg !1366
  ret ptr %18, !dbg !1367
}

; Function Attrs: mustprogress nounwind uwtable
define linkonce_odr dso_local ptr @_ZNKSt6vectorIiSaIiEE5beginEv(ptr noundef nonnull align 8 dereferenceable(24) %0) #3 comdat align 2 !dbg !1368 {
  %2 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1370, metadata !DIExpression()), !dbg !1371
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %"struct.std::_Vector_base", ptr %4, i32 0, i32 0, !dbg !1372
  %6 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %5, i32 0, i32 0, !dbg !1373
  call void @_ZN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEC2ERKS2_(ptr noundef nonnull align 8 dereferenceable(8) %2, ptr noundef nonnull align 8 dereferenceable(8) %6) #20, !dbg !1374
  %7 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %2, i32 0, i32 0, !dbg !1375
  %8 = load ptr, ptr %7, align 8, !dbg !1375
  ret ptr %8, !dbg !1375
}

; Function Attrs: mustprogress nounwind uwtable
define linkonce_odr dso_local ptr @_ZNKSt6vectorIiSaIiEE3endEv(ptr noundef nonnull align 8 dereferenceable(24) %0) #3 comdat align 2 !dbg !1376 {
  %2 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %3 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1378, metadata !DIExpression()), !dbg !1379
  %4 = load ptr, ptr %3, align 8
  %5 = getelementptr inbounds %"struct.std::_Vector_base", ptr %4, i32 0, i32 0, !dbg !1380
  %6 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %5, i32 0, i32 1, !dbg !1381
  call void @_ZN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEC2ERKS2_(ptr noundef nonnull align 8 dereferenceable(8) %2, ptr noundef nonnull align 8 dereferenceable(8) %6) #20, !dbg !1382
  %7 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %2, i32 0, i32 0, !dbg !1383
  %8 = load ptr, ptr %7, align 8, !dbg !1383
  ret ptr %8, !dbg !1383
}

; Function Attrs: mustprogress nounwind uwtable
define linkonce_odr dso_local noundef nonnull align 1 dereferenceable(1) ptr @_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv(ptr noundef nonnull align 8 dereferenceable(24) %0) #3 comdat align 2 !dbg !1384 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1386, metadata !DIExpression()), !dbg !1387
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::_Vector_base", ptr %3, i32 0, i32 0, !dbg !1388
  ret ptr %4, !dbg !1389
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @_ZNSt12_Vector_baseIiSaIiEED2Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) unnamed_addr #10 comdat align 2 personality ptr @__gxx_personality_v0 !dbg !1390 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1392, metadata !DIExpression()), !dbg !1393
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::_Vector_base", ptr %3, i32 0, i32 0, !dbg !1394
  %5 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %4, i32 0, i32 0, !dbg !1396
  %6 = load ptr, ptr %5, align 8, !dbg !1396, !tbaa !1283
  %7 = getelementptr inbounds %"struct.std::_Vector_base", ptr %3, i32 0, i32 0, !dbg !1397
  %8 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %7, i32 0, i32 2, !dbg !1398
  %9 = load ptr, ptr %8, align 8, !dbg !1398, !tbaa !1399
  %10 = getelementptr inbounds %"struct.std::_Vector_base", ptr %3, i32 0, i32 0, !dbg !1400
  %11 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %10, i32 0, i32 0, !dbg !1401
  %12 = load ptr, ptr %11, align 8, !dbg !1401, !tbaa !1283
  %13 = ptrtoint ptr %9 to i64, !dbg !1402
  %14 = ptrtoint ptr %12 to i64, !dbg !1402
  %15 = sub i64 %13, %14, !dbg !1402
  %16 = sdiv exact i64 %15, 4, !dbg !1402
  invoke void @_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPim(ptr noundef nonnull align 8 dereferenceable(24) %3, ptr noundef %6, i64 noundef %16)
          to label %17 unwind label %19, !dbg !1403

17:                                               ; preds = %1
  %18 = getelementptr inbounds %"struct.std::_Vector_base", ptr %3, i32 0, i32 0, !dbg !1404
  call void @_ZN9__gnu_cxx13new_allocatorIiED2Ev(ptr noundef nonnull align 8 dereferenceable(24) %18) #20, !dbg !1404
  ret void, !dbg !1405

19:                                               ; preds = %1
  %20 = landingpad { ptr, i32 }
          catch ptr null, !dbg !1403
  %21 = extractvalue { ptr, i32 } %20, 0, !dbg !1403
  call void @__clang_call_terminate(ptr %21) #22, !dbg !1403
  unreachable, !dbg !1403
}

; Function Attrs: mustprogress nounwind uwtable
define linkonce_odr dso_local void @_ZNSt16allocator_traitsISaIiEE37select_on_container_copy_constructionERKS0_(ptr noalias sret(%"class.std::allocator") align 1 %0, ptr noundef nonnull align 1 dereferenceable(1) %1) #3 comdat align 2 !dbg !1406 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8
  store ptr %1, ptr %4, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1408, metadata !DIExpression()), !dbg !1409
  %5 = load ptr, ptr %4, align 8, !dbg !1410, !tbaa !994
  call void @_ZNSaIiEC2ERKS_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef nonnull align 1 dereferenceable(1) %5) #20, !dbg !1410
  ret void, !dbg !1411
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @_ZNSaIiEC2ERKS_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef nonnull align 1 dereferenceable(1) %1) unnamed_addr #10 comdat align 2 !dbg !1412 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1414, metadata !DIExpression()), !dbg !1417
  store ptr %1, ptr %4, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1416, metadata !DIExpression()), !dbg !1418
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8, !dbg !1419, !tbaa !994
  call void @_ZN9__gnu_cxx13new_allocatorIiEC2ERKS1_(ptr noundef nonnull align 1 dereferenceable(1) %5, ptr noundef nonnull align 1 dereferenceable(1) %6) #20, !dbg !1420
  ret void, !dbg !1421
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorIiEC2ERKS1_(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef nonnull align 1 dereferenceable(1) %1) unnamed_addr #10 comdat align 2 !dbg !1422 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1424, metadata !DIExpression()), !dbg !1427
  store ptr %1, ptr %4, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1426, metadata !DIExpression()), !dbg !1428
  %5 = load ptr, ptr %3, align 8
  ret void, !dbg !1429
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC2ERKS0_(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef nonnull align 1 dereferenceable(1) %1) unnamed_addr #10 comdat align 2 !dbg !1430 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1432, metadata !DIExpression()), !dbg !1435
  store ptr %1, ptr %4, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1434, metadata !DIExpression()), !dbg !1436
  %5 = load ptr, ptr %3, align 8
  %6 = load ptr, ptr %4, align 8, !dbg !1437, !tbaa !994
  call void @_ZNSaIiEC2ERKS_(ptr noundef nonnull align 1 dereferenceable(1) %5, ptr noundef nonnull align 1 dereferenceable(1) %6) #20, !dbg !1438
  call void @_ZNSt12_Vector_baseIiSaIiEE17_Vector_impl_dataC2Ev(ptr noundef nonnull align 8 dereferenceable(24) %5) #20, !dbg !1439
  ret void, !dbg !1440
}

; Function Attrs: mustprogress uwtable
define linkonce_odr dso_local void @_ZNSt12_Vector_baseIiSaIiEE17_M_create_storageEm(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) #0 comdat align 2 !dbg !1441 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1443, metadata !DIExpression()), !dbg !1445
  store i64 %1, ptr %4, align 8, !tbaa !1129
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1444, metadata !DIExpression()), !dbg !1446
  %5 = load ptr, ptr %3, align 8
  %6 = load i64, ptr %4, align 8, !dbg !1447, !tbaa !1129
  %7 = call noundef ptr @_ZNSt12_Vector_baseIiSaIiEE11_M_allocateEm(ptr noundef nonnull align 8 dereferenceable(24) %5, i64 noundef %6), !dbg !1448
  %8 = getelementptr inbounds %"struct.std::_Vector_base", ptr %5, i32 0, i32 0, !dbg !1449
  %9 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %8, i32 0, i32 0, !dbg !1450
  store ptr %7, ptr %9, align 8, !dbg !1451, !tbaa !1283
  %10 = getelementptr inbounds %"struct.std::_Vector_base", ptr %5, i32 0, i32 0, !dbg !1452
  %11 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %10, i32 0, i32 0, !dbg !1453
  %12 = load ptr, ptr %11, align 8, !dbg !1453, !tbaa !1283
  %13 = getelementptr inbounds %"struct.std::_Vector_base", ptr %5, i32 0, i32 0, !dbg !1454
  %14 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %13, i32 0, i32 1, !dbg !1455
  store ptr %12, ptr %14, align 8, !dbg !1456, !tbaa !1289
  %15 = getelementptr inbounds %"struct.std::_Vector_base", ptr %5, i32 0, i32 0, !dbg !1457
  %16 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %15, i32 0, i32 0, !dbg !1458
  %17 = load ptr, ptr %16, align 8, !dbg !1458, !tbaa !1283
  %18 = load i64, ptr %4, align 8, !dbg !1459, !tbaa !1129
  %19 = getelementptr inbounds i32, ptr %17, i64 %18, !dbg !1460
  %20 = getelementptr inbounds %"struct.std::_Vector_base", ptr %5, i32 0, i32 0, !dbg !1461
  %21 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %20, i32 0, i32 2, !dbg !1462
  store ptr %19, ptr %21, align 8, !dbg !1463, !tbaa !1399
  ret void, !dbg !1464
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorIiED2Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) unnamed_addr #10 comdat align 2 !dbg !1465 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1467, metadata !DIExpression()), !dbg !1468
  %3 = load ptr, ptr %2, align 8
  ret void, !dbg !1469
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @_ZNSt12_Vector_baseIiSaIiEE17_Vector_impl_dataC2Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) unnamed_addr #10 comdat align 2 !dbg !1470 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1472, metadata !DIExpression()), !dbg !1474
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %3, i32 0, i32 0, !dbg !1475
  store ptr null, ptr %4, align 8, !dbg !1475, !tbaa !1283
  %5 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %3, i32 0, i32 1, !dbg !1476
  store ptr null, ptr %5, align 8, !dbg !1476, !tbaa !1289
  %6 = getelementptr inbounds %"struct.std::_Vector_base<int, std::allocator<int>>::_Vector_impl_data", ptr %3, i32 0, i32 2, !dbg !1477
  store ptr null, ptr %6, align 8, !dbg !1477, !tbaa !1399
  ret void, !dbg !1478
}

; Function Attrs: mustprogress uwtable
define linkonce_odr dso_local noundef ptr @_ZNSt12_Vector_baseIiSaIiEE11_M_allocateEm(ptr noundef nonnull align 8 dereferenceable(24) %0, i64 noundef %1) #0 comdat align 2 !dbg !1479 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1481, metadata !DIExpression()), !dbg !1483
  store i64 %1, ptr %4, align 8, !tbaa !1129
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1482, metadata !DIExpression()), !dbg !1484
  %5 = load ptr, ptr %3, align 8
  %6 = load i64, ptr %4, align 8, !dbg !1485, !tbaa !1129
  %7 = icmp ne i64 %6, 0, !dbg !1486
  br i1 %7, label %8, label %12, !dbg !1485

8:                                                ; preds = %2
  %9 = getelementptr inbounds %"struct.std::_Vector_base", ptr %5, i32 0, i32 0, !dbg !1487
  %10 = load i64, ptr %4, align 8, !dbg !1488, !tbaa !1129
  %11 = call noundef ptr @_ZNSt16allocator_traitsISaIiEE8allocateERS0_m(ptr noundef nonnull align 1 dereferenceable(1) %9, i64 noundef %10), !dbg !1489
  br label %13, !dbg !1485

12:                                               ; preds = %2
  br label %13, !dbg !1485

13:                                               ; preds = %12, %8
  %14 = phi ptr [ %11, %8 ], [ null, %12 ], !dbg !1485
  ret ptr %14, !dbg !1490
}

; Function Attrs: mustprogress uwtable
define linkonce_odr dso_local noundef ptr @_ZNSt16allocator_traitsISaIiEE8allocateERS0_m(ptr noundef nonnull align 1 dereferenceable(1) %0, i64 noundef %1) #0 comdat align 2 !dbg !1491 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %3, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1493, metadata !DIExpression()), !dbg !1495
  store i64 %1, ptr %4, align 8, !tbaa !1129
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1494, metadata !DIExpression()), !dbg !1496
  %5 = load ptr, ptr %3, align 8, !dbg !1497, !tbaa !994
  %6 = load i64, ptr %4, align 8, !dbg !1498, !tbaa !1129
  %7 = call noundef ptr @_ZN9__gnu_cxx13new_allocatorIiE8allocateEmPKv(ptr noundef nonnull align 1 dereferenceable(1) %5, i64 noundef %6, ptr noundef null), !dbg !1499
  ret ptr %7, !dbg !1500
}

; Function Attrs: mustprogress uwtable
define linkonce_odr dso_local noundef ptr @_ZN9__gnu_cxx13new_allocatorIiE8allocateEmPKv(ptr noundef nonnull align 1 dereferenceable(1) %0, i64 noundef %1, ptr noundef %2) #0 comdat align 2 !dbg !1501 {
  %4 = alloca ptr, align 8
  %5 = alloca i64, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1503, metadata !DIExpression()), !dbg !1506
  store i64 %1, ptr %5, align 8, !tbaa !1129
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1504, metadata !DIExpression()), !dbg !1507
  store ptr %2, ptr %6, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1505, metadata !DIExpression()), !dbg !1508
  %7 = load ptr, ptr %4, align 8
  %8 = load i64, ptr %5, align 8, !dbg !1509, !tbaa !1129
  %9 = call noundef i64 @_ZNK9__gnu_cxx13new_allocatorIiE11_M_max_sizeEv(ptr noundef nonnull align 1 dereferenceable(1) %7) #20, !dbg !1511
  %10 = icmp ugt i64 %8, %9, !dbg !1512
  %11 = zext i1 %10 to i64, !dbg !1509
  %12 = call i64 @llvm.expect.i64(i64 %11, i64 0), !dbg !1513
  %13 = icmp ne i64 %12, 0, !dbg !1513
  br i1 %13, label %14, label %19, !dbg !1514

14:                                               ; preds = %3
  %15 = load i64, ptr %5, align 8, !dbg !1515, !tbaa !1129
  %16 = icmp ugt i64 %15, 4611686018427387903, !dbg !1518
  br i1 %16, label %17, label %18, !dbg !1519

17:                                               ; preds = %14
  call void @_ZSt28__throw_bad_array_new_lengthv() #24, !dbg !1520
  unreachable, !dbg !1520

18:                                               ; preds = %14
  call void @_ZSt17__throw_bad_allocv() #24, !dbg !1521
  unreachable, !dbg !1521

19:                                               ; preds = %3
  %20 = load i64, ptr %5, align 8, !dbg !1522, !tbaa !1129
  %21 = mul i64 %20, 4, !dbg !1523
  %22 = call noalias noundef nonnull ptr @_Znwm(i64 noundef %21) #25, !dbg !1524
  ret ptr %22, !dbg !1525
}

; Function Attrs: mustprogress nounwind uwtable
define linkonce_odr dso_local noundef i64 @_ZNK9__gnu_cxx13new_allocatorIiE11_M_max_sizeEv(ptr noundef nonnull align 1 dereferenceable(1) %0) #3 comdat align 2 !dbg !1526 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1528, metadata !DIExpression()), !dbg !1530
  %3 = load ptr, ptr %2, align 8
  ret i64 2305843009213693951, !dbg !1531
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(none)
declare i64 @llvm.expect.i64(i64, i64) #15

; Function Attrs: noreturn
declare !dbg !1532 void @_ZSt28__throw_bad_array_new_lengthv() #16

; Function Attrs: noreturn
declare !dbg !1534 void @_ZSt17__throw_bad_allocv() #16

; Function Attrs: inlinehint mustprogress uwtable
define linkonce_odr dso_local noundef ptr @_ZSt18uninitialized_copyIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEPiET0_T_SA_S9_(ptr %0, ptr %1, ptr noundef %2) #14 comdat !dbg !1535 {
  %4 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %5 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %6 = alloca ptr, align 8
  %7 = alloca i8, align 1
  %8 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %9 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %10 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %4, i32 0, i32 0
  store ptr %0, ptr %10, align 8
  %11 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %5, i32 0, i32 0
  store ptr %1, ptr %11, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1539, metadata !DIExpression()), !dbg !1544
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1540, metadata !DIExpression()), !dbg !1545
  store ptr %2, ptr %6, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1541, metadata !DIExpression()), !dbg !1546
  call void @llvm.lifetime.start.p0(i64 1, ptr %7) #20, !dbg !1547
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1542, metadata !DIExpression()), !dbg !1548
  store i8 1, ptr %7, align 1, !dbg !1548, !tbaa !1549
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %8, ptr align 8 %4, i64 8, i1 false), !dbg !1551, !tbaa.struct !1363
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %9, ptr align 8 %5, i64 8, i1 false), !dbg !1552, !tbaa.struct !1363
  %12 = load ptr, ptr %6, align 8, !dbg !1553, !tbaa !994
  %13 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %8, i32 0, i32 0, !dbg !1554
  %14 = load ptr, ptr %13, align 8, !dbg !1554
  %15 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %9, i32 0, i32 0, !dbg !1554
  %16 = load ptr, ptr %15, align 8, !dbg !1554
  %17 = call noundef ptr @_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEPiEET0_T_SC_SB_(ptr %14, ptr %16, ptr noundef %12), !dbg !1554
  call void @llvm.lifetime.end.p0(i64 1, ptr %7) #20, !dbg !1555
  ret ptr %17, !dbg !1556
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #17

; Function Attrs: mustprogress uwtable
define linkonce_odr dso_local noundef ptr @_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEPiEET0_T_SC_SB_(ptr %0, ptr %1, ptr noundef %2) #0 comdat align 2 !dbg !1557 {
  %4 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %5 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %6 = alloca ptr, align 8
  %7 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %8 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %9 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %4, i32 0, i32 0
  store ptr %0, ptr %9, align 8
  %10 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %5, i32 0, i32 0
  store ptr %1, ptr %10, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1563, metadata !DIExpression()), !dbg !1566
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1564, metadata !DIExpression()), !dbg !1567
  store ptr %2, ptr %6, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1565, metadata !DIExpression()), !dbg !1568
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %7, ptr align 8 %4, i64 8, i1 false), !dbg !1569, !tbaa.struct !1363
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %8, ptr align 8 %5, i64 8, i1 false), !dbg !1570, !tbaa.struct !1363
  %11 = load ptr, ptr %6, align 8, !dbg !1571, !tbaa !994
  %12 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %7, i32 0, i32 0, !dbg !1572
  %13 = load ptr, ptr %12, align 8, !dbg !1572
  %14 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %8, i32 0, i32 0, !dbg !1572
  %15 = load ptr, ptr %14, align 8, !dbg !1572
  %16 = call noundef ptr @_ZSt4copyIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEPiET0_T_SA_S9_(ptr %13, ptr %15, ptr noundef %11), !dbg !1572
  ret ptr %16, !dbg !1573
}

; Function Attrs: inlinehint mustprogress uwtable
define linkonce_odr dso_local noundef ptr @_ZSt4copyIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEPiET0_T_SA_S9_(ptr %0, ptr %1, ptr noundef %2) #14 comdat !dbg !1574 {
  %4 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %5 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %6 = alloca ptr, align 8
  %7 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %8 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %9 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %10 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %11 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %4, i32 0, i32 0
  store ptr %0, ptr %11, align 8
  %12 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %5, i32 0, i32 0
  store ptr %1, ptr %12, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1577, metadata !DIExpression()), !dbg !1583
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1578, metadata !DIExpression()), !dbg !1584
  store ptr %2, ptr %6, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1579, metadata !DIExpression()), !dbg !1585
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %8, ptr align 8 %4, i64 8, i1 false), !dbg !1586, !tbaa.struct !1363
  %13 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %8, i32 0, i32 0, !dbg !1587
  %14 = load ptr, ptr %13, align 8, !dbg !1587
  %15 = call ptr @_ZSt12__miter_baseIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEET_S8_(ptr %14), !dbg !1587
  %16 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %7, i32 0, i32 0, !dbg !1587
  store ptr %15, ptr %16, align 8, !dbg !1587
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %10, ptr align 8 %5, i64 8, i1 false), !dbg !1588, !tbaa.struct !1363
  %17 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %10, i32 0, i32 0, !dbg !1589
  %18 = load ptr, ptr %17, align 8, !dbg !1589
  %19 = call ptr @_ZSt12__miter_baseIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEET_S8_(ptr %18), !dbg !1589
  %20 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %9, i32 0, i32 0, !dbg !1589
  store ptr %19, ptr %20, align 8, !dbg !1589
  %21 = load ptr, ptr %6, align 8, !dbg !1590, !tbaa !994
  %22 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %7, i32 0, i32 0, !dbg !1591
  %23 = load ptr, ptr %22, align 8, !dbg !1591
  %24 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %9, i32 0, i32 0, !dbg !1591
  %25 = load ptr, ptr %24, align 8, !dbg !1591
  %26 = call noundef ptr @_ZSt13__copy_move_aILb0EN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEPiET1_T0_SA_S9_(ptr %23, ptr %25, ptr noundef %21), !dbg !1591
  ret ptr %26, !dbg !1592
}

; Function Attrs: inlinehint mustprogress uwtable
define linkonce_odr dso_local noundef ptr @_ZSt13__copy_move_aILb0EN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEPiET1_T0_SA_S9_(ptr %0, ptr %1, ptr noundef %2) #14 comdat !dbg !1593 {
  %4 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %5 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %6 = alloca ptr, align 8
  %7 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %8 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %9 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %4, i32 0, i32 0
  store ptr %0, ptr %9, align 8
  %10 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %5, i32 0, i32 0
  store ptr %1, ptr %10, align 8
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1595, metadata !DIExpression()), !dbg !1600
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1596, metadata !DIExpression()), !dbg !1601
  store ptr %2, ptr %6, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1597, metadata !DIExpression()), !dbg !1602
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %7, ptr align 8 %4, i64 8, i1 false), !dbg !1603, !tbaa.struct !1363
  %11 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %7, i32 0, i32 0, !dbg !1604
  %12 = load ptr, ptr %11, align 8, !dbg !1604
  %13 = call noundef ptr @_ZSt12__niter_baseIPKiSt6vectorIiSaIiEEET_N9__gnu_cxx17__normal_iteratorIS5_T0_EE(ptr %12) #20, !dbg !1604
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %8, ptr align 8 %5, i64 8, i1 false), !dbg !1605, !tbaa.struct !1363
  %14 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %8, i32 0, i32 0, !dbg !1606
  %15 = load ptr, ptr %14, align 8, !dbg !1606
  %16 = call noundef ptr @_ZSt12__niter_baseIPKiSt6vectorIiSaIiEEET_N9__gnu_cxx17__normal_iteratorIS5_T0_EE(ptr %15) #20, !dbg !1606
  %17 = load ptr, ptr %6, align 8, !dbg !1607, !tbaa !994
  %18 = call noundef ptr @_ZSt12__niter_baseIPiET_S1_(ptr noundef %17) #20, !dbg !1608
  %19 = call noundef ptr @_ZSt14__copy_move_a1ILb0EPKiPiET1_T0_S4_S3_(ptr noundef %13, ptr noundef %16, ptr noundef %18), !dbg !1609
  %20 = call noundef ptr @_ZSt12__niter_wrapIPiET_RKS1_S1_(ptr noundef nonnull align 8 dereferenceable(8) %6, ptr noundef %19), !dbg !1610
  ret ptr %20, !dbg !1611
}

; Function Attrs: inlinehint mustprogress nounwind uwtable
define linkonce_odr dso_local ptr @_ZSt12__miter_baseIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEET_S8_(ptr %0) #4 comdat !dbg !1612 {
  %2 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %3 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %4 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %3, i32 0, i32 0
  store ptr %0, ptr %4, align 8
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1617, metadata !DIExpression()), !dbg !1620
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %2, ptr align 8 %3, i64 8, i1 false), !dbg !1621, !tbaa.struct !1363
  %5 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %2, i32 0, i32 0, !dbg !1622
  %6 = load ptr, ptr %5, align 8, !dbg !1622
  ret ptr %6, !dbg !1622
}

; Function Attrs: inlinehint mustprogress nounwind uwtable
define linkonce_odr dso_local noundef ptr @_ZSt12__niter_wrapIPiET_RKS1_S1_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef %1) #4 comdat !dbg !1623 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1629, metadata !DIExpression()), !dbg !1633
  store ptr %1, ptr %4, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1630, metadata !DIExpression()), !dbg !1634
  %5 = load ptr, ptr %4, align 8, !dbg !1635, !tbaa !994
  ret ptr %5, !dbg !1636
}

; Function Attrs: inlinehint mustprogress uwtable
define linkonce_odr dso_local noundef ptr @_ZSt14__copy_move_a1ILb0EPKiPiET1_T0_S4_S3_(ptr noundef %0, ptr noundef %1, ptr noundef %2) #14 comdat !dbg !1637 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1641, metadata !DIExpression()), !dbg !1646
  store ptr %1, ptr %5, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1642, metadata !DIExpression()), !dbg !1647
  store ptr %2, ptr %6, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1643, metadata !DIExpression()), !dbg !1648
  %7 = load ptr, ptr %4, align 8, !dbg !1649, !tbaa !994
  %8 = load ptr, ptr %5, align 8, !dbg !1650, !tbaa !994
  %9 = load ptr, ptr %6, align 8, !dbg !1651, !tbaa !994
  %10 = call noundef ptr @_ZSt14__copy_move_a2ILb0EPKiPiET1_T0_S4_S3_(ptr noundef %7, ptr noundef %8, ptr noundef %9), !dbg !1652
  ret ptr %10, !dbg !1653
}

; Function Attrs: mustprogress nounwind uwtable
define linkonce_odr dso_local noundef ptr @_ZSt12__niter_baseIPKiSt6vectorIiSaIiEEET_N9__gnu_cxx17__normal_iteratorIS5_T0_EE(ptr %0) #3 comdat !dbg !1654 {
  %2 = alloca %"class.__gnu_cxx::__normal_iterator", align 8
  %3 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %2, i32 0, i32 0
  store ptr %0, ptr %3, align 8
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1658, metadata !DIExpression()), !dbg !1659
  %4 = call noundef nonnull align 8 dereferenceable(8) ptr @_ZNK9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEE4baseEv(ptr noundef nonnull align 8 dereferenceable(8) %2) #20, !dbg !1660
  %5 = load ptr, ptr %4, align 8, !dbg !1660, !tbaa !994
  ret ptr %5, !dbg !1661
}

; Function Attrs: inlinehint mustprogress nounwind uwtable
define linkonce_odr dso_local noundef ptr @_ZSt12__niter_baseIPiET_S1_(ptr noundef %0) #4 comdat !dbg !1662 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1666, metadata !DIExpression()), !dbg !1667
  %3 = load ptr, ptr %2, align 8, !dbg !1668, !tbaa !994
  ret ptr %3, !dbg !1669
}

; Function Attrs: inlinehint mustprogress uwtable
define linkonce_odr dso_local noundef ptr @_ZSt14__copy_move_a2ILb0EPKiPiET1_T0_S4_S3_(ptr noundef %0, ptr noundef %1, ptr noundef %2) #14 comdat !dbg !1670 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1672, metadata !DIExpression()), !dbg !1675
  store ptr %1, ptr %5, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1673, metadata !DIExpression()), !dbg !1676
  store ptr %2, ptr %6, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1674, metadata !DIExpression()), !dbg !1677
  %7 = load ptr, ptr %4, align 8, !dbg !1678, !tbaa !994
  %8 = load ptr, ptr %5, align 8, !dbg !1679, !tbaa !994
  %9 = load ptr, ptr %6, align 8, !dbg !1680, !tbaa !994
  %10 = call noundef ptr @_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIiEEPT_PKS3_S6_S4_(ptr noundef %7, ptr noundef %8, ptr noundef %9), !dbg !1681
  ret ptr %10, !dbg !1682
}

; Function Attrs: mustprogress nounwind uwtable
define linkonce_odr dso_local noundef ptr @_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIiEEPT_PKS3_S6_S4_(ptr noundef %0, ptr noundef %1, ptr noundef %2) #3 comdat align 2 !dbg !1683 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  store ptr %0, ptr %4, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1700, metadata !DIExpression()), !dbg !1705
  store ptr %1, ptr %5, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1701, metadata !DIExpression()), !dbg !1706
  store ptr %2, ptr %6, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1702, metadata !DIExpression()), !dbg !1707
  call void @llvm.lifetime.start.p0(i64 8, ptr %7) #20, !dbg !1708
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1703, metadata !DIExpression()), !dbg !1709
  %8 = load ptr, ptr %5, align 8, !dbg !1710, !tbaa !994
  %9 = load ptr, ptr %4, align 8, !dbg !1711, !tbaa !994
  %10 = ptrtoint ptr %8 to i64, !dbg !1712
  %11 = ptrtoint ptr %9 to i64, !dbg !1712
  %12 = sub i64 %10, %11, !dbg !1712
  %13 = sdiv exact i64 %12, 4, !dbg !1712
  store i64 %13, ptr %7, align 8, !dbg !1709, !tbaa !1129
  %14 = load i64, ptr %7, align 8, !dbg !1713, !tbaa !1129
  %15 = icmp ne i64 %14, 0, !dbg !1713
  br i1 %15, label %16, label %21, !dbg !1715

16:                                               ; preds = %3
  %17 = load ptr, ptr %6, align 8, !dbg !1716, !tbaa !994
  %18 = load ptr, ptr %4, align 8, !dbg !1717, !tbaa !994
  %19 = load i64, ptr %7, align 8, !dbg !1718, !tbaa !1129
  %20 = mul i64 4, %19, !dbg !1719
  call void @llvm.memmove.p0.p0.i64(ptr align 4 %17, ptr align 4 %18, i64 %20, i1 false), !dbg !1720
  br label %21, !dbg !1720

21:                                               ; preds = %16, %3
  %22 = load ptr, ptr %6, align 8, !dbg !1721, !tbaa !994
  %23 = load i64, ptr %7, align 8, !dbg !1722, !tbaa !1129
  %24 = getelementptr inbounds i32, ptr %22, i64 %23, !dbg !1723
  call void @llvm.lifetime.end.p0(i64 8, ptr %7) #20, !dbg !1724
  ret ptr %24, !dbg !1725
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memmove.p0.p0.i64(ptr nocapture writeonly, ptr nocapture readonly, i64, i1 immarg) #17

; Function Attrs: mustprogress nounwind uwtable
define linkonce_odr dso_local noundef nonnull align 8 dereferenceable(8) ptr @_ZNK9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEE4baseEv(ptr noundef nonnull align 8 dereferenceable(8) %0) #3 comdat align 2 !dbg !1726 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1728, metadata !DIExpression()), !dbg !1730
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %3, i32 0, i32 0, !dbg !1731
  ret ptr %4, !dbg !1732
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEC2ERKS2_(ptr noundef nonnull align 8 dereferenceable(8) %0, ptr noundef nonnull align 8 dereferenceable(8) %1) unnamed_addr #10 comdat align 2 !dbg !1733 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1735, metadata !DIExpression()), !dbg !1738
  store ptr %1, ptr %4, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1737, metadata !DIExpression()), !dbg !1739
  %5 = load ptr, ptr %3, align 8
  %6 = getelementptr inbounds %"class.__gnu_cxx::__normal_iterator", ptr %5, i32 0, i32 0, !dbg !1740
  %7 = load ptr, ptr %4, align 8, !dbg !1741, !tbaa !994
  %8 = load ptr, ptr %7, align 8, !dbg !1741, !tbaa !994
  store ptr %8, ptr %6, align 8, !dbg !1740, !tbaa !1742
  ret void, !dbg !1744
}

; Function Attrs: mustprogress uwtable
define linkonce_odr dso_local void @_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPim(ptr noundef nonnull align 8 dereferenceable(24) %0, ptr noundef %1, i64 noundef %2) #0 comdat align 2 !dbg !1745 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1747, metadata !DIExpression()), !dbg !1750
  store ptr %1, ptr %5, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1748, metadata !DIExpression()), !dbg !1751
  store i64 %2, ptr %6, align 8, !tbaa !1129
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1749, metadata !DIExpression()), !dbg !1752
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8, !dbg !1753, !tbaa !994
  %9 = icmp ne ptr %8, null, !dbg !1753
  br i1 %9, label %10, label %14, !dbg !1755

10:                                               ; preds = %3
  %11 = getelementptr inbounds %"struct.std::_Vector_base", ptr %7, i32 0, i32 0, !dbg !1756
  %12 = load ptr, ptr %5, align 8, !dbg !1757, !tbaa !994
  %13 = load i64, ptr %6, align 8, !dbg !1758, !tbaa !1129
  call void @_ZNSt16allocator_traitsISaIiEE10deallocateERS0_Pim(ptr noundef nonnull align 1 dereferenceable(1) %11, ptr noundef %12, i64 noundef %13), !dbg !1759
  br label %14, !dbg !1759

14:                                               ; preds = %10, %3
  ret void, !dbg !1760
}

; Function Attrs: noinline noreturn nounwind
define linkonce_odr hidden void @__clang_call_terminate(ptr noundef %0) #18 comdat {
  %2 = call ptr @__cxa_begin_catch(ptr %0) #20
  call void @_ZSt9terminatev() #22
  unreachable
}

declare ptr @__cxa_begin_catch(ptr)

declare void @_ZSt9terminatev()

; Function Attrs: mustprogress uwtable
define linkonce_odr dso_local void @_ZNSt16allocator_traitsISaIiEE10deallocateERS0_Pim(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1, i64 noundef %2) #0 comdat align 2 !dbg !1761 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1763, metadata !DIExpression()), !dbg !1766
  store ptr %1, ptr %5, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1764, metadata !DIExpression()), !dbg !1767
  store i64 %2, ptr %6, align 8, !tbaa !1129
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1765, metadata !DIExpression()), !dbg !1768
  %7 = load ptr, ptr %4, align 8, !dbg !1769, !tbaa !994
  %8 = load ptr, ptr %5, align 8, !dbg !1770, !tbaa !994
  %9 = load i64, ptr %6, align 8, !dbg !1771, !tbaa !1129
  call void @_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPim(ptr noundef nonnull align 1 dereferenceable(1) %7, ptr noundef %8, i64 noundef %9), !dbg !1772
  ret void, !dbg !1773
}

; Function Attrs: mustprogress nounwind uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPim(ptr noundef nonnull align 1 dereferenceable(1) %0, ptr noundef %1, i64 noundef %2) #3 comdat align 2 !dbg !1774 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1776, metadata !DIExpression()), !dbg !1779
  store ptr %1, ptr %5, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1777, metadata !DIExpression()), !dbg !1780
  store i64 %2, ptr %6, align 8, !tbaa !1129
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1778, metadata !DIExpression()), !dbg !1781
  %7 = load ptr, ptr %4, align 8
  %8 = load ptr, ptr %5, align 8, !dbg !1782, !tbaa !994
  call void @_ZdlPv(ptr noundef %8) #20, !dbg !1783
  ret void, !dbg !1784
}

; Function Attrs: inlinehint mustprogress uwtable
define linkonce_odr dso_local void @_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E(ptr noundef %0, ptr noundef %1, ptr noundef nonnull align 1 dereferenceable(1) %2) #14 comdat !dbg !1785 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1789, metadata !DIExpression()), !dbg !1793
  store ptr %1, ptr %5, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1790, metadata !DIExpression()), !dbg !1794
  store ptr %2, ptr %6, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1791, metadata !DIExpression()), !dbg !1795
  %7 = load ptr, ptr %4, align 8, !dbg !1796, !tbaa !994
  %8 = load ptr, ptr %5, align 8, !dbg !1797, !tbaa !994
  call void @_ZSt8_DestroyIPiEvT_S1_(ptr noundef %7, ptr noundef %8), !dbg !1798
  ret void, !dbg !1799
}

; Function Attrs: inlinehint mustprogress uwtable
define linkonce_odr dso_local void @_ZSt8_DestroyIPiEvT_S1_(ptr noundef %0, ptr noundef %1) #14 comdat !dbg !1800 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1805, metadata !DIExpression()), !dbg !1808
  store ptr %1, ptr %4, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1806, metadata !DIExpression()), !dbg !1809
  %5 = load ptr, ptr %3, align 8, !dbg !1810, !tbaa !994
  %6 = load ptr, ptr %4, align 8, !dbg !1811, !tbaa !994
  call void @_ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_(ptr noundef %5, ptr noundef %6), !dbg !1812
  ret void, !dbg !1813
}

; Function Attrs: mustprogress nounwind uwtable
define linkonce_odr dso_local void @_ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_(ptr noundef %0, ptr noundef %1) #3 comdat align 2 !dbg !1814 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1820, metadata !DIExpression()), !dbg !1822
  store ptr %1, ptr %4, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1821, metadata !DIExpression()), !dbg !1823
  ret void, !dbg !1824
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @_ZNSt12_Vector_baseIiSaIiEEC2Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) unnamed_addr #10 comdat align 2 !dbg !1825 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1827, metadata !DIExpression()), !dbg !1828
  %3 = load ptr, ptr %2, align 8
  %4 = getelementptr inbounds %"struct.std::_Vector_base", ptr %3, i32 0, i32 0, !dbg !1829
  call void @_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC2Ev(ptr noundef nonnull align 8 dereferenceable(24) %4) #20, !dbg !1829
  ret void, !dbg !1830
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC2Ev(ptr noundef nonnull align 8 dereferenceable(24) %0) unnamed_addr #10 comdat align 2 !dbg !1831 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1833, metadata !DIExpression()), !dbg !1834
  %3 = load ptr, ptr %2, align 8
  call void @_ZNSaIiEC2Ev(ptr noundef nonnull align 1 dereferenceable(1) %3) #20, !dbg !1835
  call void @_ZNSt12_Vector_baseIiSaIiEE17_Vector_impl_dataC2Ev(ptr noundef nonnull align 8 dereferenceable(24) %3) #20, !dbg !1836
  ret void, !dbg !1837
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @_ZNSaIiEC2Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) unnamed_addr #10 comdat align 2 !dbg !1838 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1840, metadata !DIExpression()), !dbg !1841
  %3 = load ptr, ptr %2, align 8
  call void @_ZN9__gnu_cxx13new_allocatorIiEC2Ev(ptr noundef nonnull align 1 dereferenceable(1) %3) #20, !dbg !1842
  ret void, !dbg !1843
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @_ZN9__gnu_cxx13new_allocatorIiEC2Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) unnamed_addr #10 comdat align 2 !dbg !1844 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1846, metadata !DIExpression()), !dbg !1847
  %3 = load ptr, ptr %2, align 8
  ret void, !dbg !1848
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local void @_ZN4V1_018IExecutionCallbackC2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #5 comdat align 2 !dbg !1849 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1852, metadata !DIExpression()), !dbg !1853
  %3 = load ptr, ptr %2, align 8
  store ptr getelementptr inbounds ({ [5 x ptr] }, ptr @_ZTVN4V1_018IExecutionCallbackE, i32 0, inrange i32 0, i32 2), ptr %3, align 8, !dbg !1854, !tbaa !1037
  ret void, !dbg !1854
}

; Function Attrs: mustprogress uwtable
define linkonce_odr dso_local void @_ZN4V1_022DummyExecutionCallback6notifyE11ErrorStatus(ptr noundef nonnull align 8 dereferenceable(8) %0, i32 noundef %1) unnamed_addr #0 comdat align 2 !dbg !1855 {
  %3 = alloca %class.Return.0, align 1
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  store ptr %0, ptr %4, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1857, metadata !DIExpression()), !dbg !1859
  store i32 %1, ptr %5, align 4, !tbaa !1085
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1858, metadata !DIExpression()), !dbg !1860
  %6 = load ptr, ptr %4, align 8
  call void @_ZN6ReturnIvEC2Ev(ptr noundef nonnull align 1 dereferenceable(1) %3), !dbg !1861
  ret void, !dbg !1862
}

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @_ZN4V1_018IExecutionCallbackD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #10 comdat align 2 !dbg !1863 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1865, metadata !DIExpression()), !dbg !1866
  %3 = load ptr, ptr %2, align 8
  ret void, !dbg !1867
}

; Function Attrs: inlinehint nounwind uwtable
define linkonce_odr dso_local void @_ZN4V1_022DummyExecutionCallbackD0Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #5 comdat align 2 !dbg !1868 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1871, metadata !DIExpression()), !dbg !1872
  %3 = load ptr, ptr %2, align 8
  call void @_ZN4V1_018IExecutionCallbackD2Ev(ptr noundef nonnull align 8 dereferenceable(8) %3) #20, !dbg !1873
  call void @_ZdlPv(ptr noundef %3) #21, !dbg !1873
  ret void, !dbg !1873
}

declare void @__cxa_pure_virtual() unnamed_addr

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @_ZN4V1_018IExecutionCallbackD0Ev(ptr noundef nonnull align 8 dereferenceable(8) %0) unnamed_addr #10 comdat align 2 !dbg !1874 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1876, metadata !DIExpression()), !dbg !1877
  %3 = load ptr, ptr %2, align 8
  call void @llvm.trap() #22, !dbg !1878
  unreachable, !dbg !1878
}

; Function Attrs: cold noreturn nounwind
declare void @llvm.trap() #19

; Function Attrs: nounwind uwtable
define linkonce_odr dso_local void @_ZN6ReturnIvEC2Ev(ptr noundef nonnull align 1 dereferenceable(1) %0) unnamed_addr #10 comdat align 2 !dbg !1879 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !994
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1881, metadata !DIExpression()), !dbg !1883
  %3 = load ptr, ptr %2, align 8
  ret void, !dbg !1884
}

attributes #0 = { mustprogress uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { mustprogress nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { inlinehint mustprogress nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { inlinehint nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #6 = { nobuiltin nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #7 = { noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #8 = { nobuiltin allocsize(0) "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #9 = { inlinehint uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #10 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #11 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #12 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #13 = { uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #14 = { inlinehint mustprogress uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #15 = { nocallback nofree nosync nounwind willreturn memory(none) }
attributes #16 = { noreturn "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #17 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #18 = { noinline noreturn nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #19 = { cold noreturn nounwind }
attributes #20 = { nounwind }
attributes #21 = { builtin nounwind }
attributes #22 = { noreturn nounwind }
attributes #23 = { builtin allocsize(0) }
attributes #24 = { noreturn }
attributes #25 = { allocsize(0) }

!llvm.dbg.cu = !{!18}
!llvm.module.flags = !{!980, !981, !982, !983, !984, !985}
!llvm.ident = !{!986}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 96, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "TestExecution_pthread_UAS_logic.cpp", directory: "/home/demo/android_packages_modules_NeuralNetworks/runtime/test", checksumkind: CSK_MD5, checksum: "ba24823d736b01fcc25741def53730b0")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 240, elements: !6)
!4 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !5)
!5 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!6 = !{!7}
!7 = !DISubrange(count: 30)
!8 = !DIGlobalVariableExpression(var: !9, expr: !DIExpression())
!9 = distinct !DIGlobalVariable(scope: null, file: !2, line: 96, type: !10, isLocal: true, isDefinition: true)
!10 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 792, elements: !11)
!11 = !{!12}
!12 = !DISubrange(count: 99)
!13 = !DIGlobalVariableExpression(var: !14, expr: !DIExpression())
!14 = distinct !DIGlobalVariable(scope: null, file: !2, line: 96, type: !15, isLocal: true, isDefinition: true)
!15 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 920, elements: !16)
!16 = !{!17}
!17 = !DISubrange(count: 115)
!18 = distinct !DICompileUnit(language: DW_LANG_C_plus_plus_14, file: !19, producer: "clang version 16.0.0", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !20, retainedTypes: !35, globals: !693, imports: !694, splitDebugInlining: false, nameTableKind: None)
!19 = !DIFile(filename: "/home/demo/android_packages_modules_NeuralNetworks/runtime/test/TestExecution_pthread_UAS_logic.cpp", directory: "/home/demo/android_packages_modules_NeuralNetworks/runtime/test", checksumkind: CSK_MD5, checksum: "ba24823d736b01fcc25741def53730b0")
!20 = !{!21, !29}
!21 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "_Lock_policy", scope: !23, file: !22, line: 49, baseType: !24, size: 32, elements: !25, identifier: "_ZTSN9__gnu_cxx12_Lock_policyE")
!22 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ext/concurrence.h", directory: "")
!23 = !DINamespace(name: "__gnu_cxx", scope: null)
!24 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!25 = !{!26, !27, !28}
!26 = !DIEnumerator(name: "_S_single", value: 0, isUnsigned: true)
!27 = !DIEnumerator(name: "_S_mutex", value: 1, isUnsigned: true)
!28 = !DIEnumerator(name: "_S_atomic", value: 2, isUnsigned: true)
!29 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "ErrorStatus", file: !30, line: 429, baseType: !31, size: 32, flags: DIFlagEnumClass, elements: !32, identifier: "_ZTS11ErrorStatus")
!30 = !DIFile(filename: "TestExecution_pthread_UAS_logic.h", directory: "/home/demo/android_packages_modules_NeuralNetworks/runtime/test", checksumkind: CSK_MD5, checksum: "e939913e8535be23fc7ece221b7543ba")
!31 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!32 = !{!33, !34}
!33 = !DIEnumerator(name: "NONE", value: 0)
!34 = !DIEnumerator(name: "GENERAL_FAILURE", value: 1)
!35 = !{!36, !193, !358, !140, !137, !96, !417, !67, !71, !418, !99, !105, !76, !79, !203, !632, !41, !50, !618}
!36 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64)
!37 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ExecuteThreadData", file: !30, line: 476, size: 704, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !38, identifier: "_ZTS17ExecuteThreadData")
!38 = !{!39, !691, !692}
!39 = !DIDerivedType(tag: DW_TAG_member, name: "self", scope: !37, file: !30, line: 477, baseType: !40, size: 64)
!40 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64)
!41 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "ExecutionBurstController", file: !30, line: 490, size: 64, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !42, identifier: "_ZTS24ExecutionBurstController")
!42 = !{!43, !676, !680, !683, !688}
!43 = !DIDerivedType(tag: DW_TAG_member, name: "mPreparedModelV1_0", scope: !41, file: !30, line: 502, baseType: !44, size: 64)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "PreparedModel", file: !30, line: 483, size: 8, flags: DIFlagTypePassByValue, elements: !46, identifier: "_ZTS13PreparedModel")
!46 = !{!47}
!47 = !DISubprogram(name: "execute", linkageName: "_ZN13PreparedModel7executeERKN4V1_07RequestERK2spINS0_18IExecutionCallbackEE", scope: !45, file: !30, line: 484, type: !48, scopeLine: 484, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!48 = !DISubroutineType(types: !49)
!49 = !{!50, !64, !65, !616}
!50 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "Return<ErrorStatus>", file: !30, line: 436, size: 32, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !51, templateParams: !62, identifier: "_ZTS6ReturnI11ErrorStatusE")
!51 = !{!52, !53, !57}
!52 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !50, file: !30, line: 438, baseType: !29, size: 32, flags: DIFlagPublic)
!53 = !DISubprogram(name: "Return", scope: !50, file: !30, line: 439, type: !54, scopeLine: 439, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!54 = !DISubroutineType(types: !55)
!55 = !{null, !56, !29}
!56 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!57 = !DISubprogram(name: "operator ErrorStatus", linkageName: "_ZNK6ReturnI11ErrorStatusEcvS0_Ev", scope: !50, file: !30, line: 440, type: !58, scopeLine: 440, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!58 = !DISubroutineType(types: !59)
!59 = !{!29, !60}
!60 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !61, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!61 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !50)
!62 = !{!63}
!63 = !DITemplateTypeParameter(name: "T", type: !29)
!64 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!65 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !66, size: 64)
!66 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !67)
!67 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "Request", scope: !68, file: !30, line: 453, size: 576, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !69, identifier: "_ZTSN4V1_07RequestE")
!68 = !DINamespace(name: "V1_0", scope: null)
!69 = !{!70, !614, !615}
!70 = !DIDerivedType(tag: DW_TAG_member, name: "inputs", scope: !67, file: !30, line: 454, baseType: !71, size: 192)
!71 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "vector<int, std::allocator<int> >", scope: !73, file: !72, line: 389, size: 192, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !74, templateParams: !612, identifier: "_ZTSSt6vectorIiSaIiEE")
!72 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_vector.h", directory: "", checksumkind: CSK_MD5, checksum: "abcaf00227294b9790605822a1c03477")
!73 = !DINamespace(name: "std", scope: null)
!74 = !{!75, !297, !316, !332, !333, !339, !342, !345, !349, !355, !359, !365, !370, !374, !377, !380, !383, !386, !391, !392, !396, !399, !402, !405, !408, !414, !476, !477, !478, !483, !488, !489, !490, !491, !492, !493, !494, !497, !498, !501, !502, !503, !504, !507, !508, !516, !523, !526, !527, !528, !531, !534, !535, !536, !539, !542, !545, !549, !550, !553, !556, !559, !562, !565, !568, !571, !572, !573, !574, !575, !578, !579, !582, !583, !584, !589, !592, !597, !600, !603, !606, !609}
!75 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !71, baseType: !76, flags: DIFlagProtected, extraData: i32 0)
!76 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Vector_base<int, std::allocator<int> >", scope: !73, file: !72, line: 84, size: 192, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !77, templateParams: !296, identifier: "_ZTSSt12_Vector_baseIiSaIiEE")
!77 = !{!78, !247, !252, !257, !261, !264, !269, !272, !275, !279, !282, !285, !288, !289, !292, !295}
!78 = !DIDerivedType(tag: DW_TAG_member, name: "_M_impl", scope: !76, file: !72, line: 340, baseType: !79, size: 192)
!79 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Vector_impl", scope: !76, file: !72, line: 128, size: 192, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !80, identifier: "_ZTSNSt12_Vector_baseIiSaIiEE12_Vector_implE")
!80 = !{!81, !202, !227, !231, !236, !240, !244}
!81 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !79, baseType: !82, extraData: i32 0)
!82 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Tp_alloc_type", scope: !76, file: !72, line: 87, baseType: !83)
!83 = !DIDerivedType(tag: DW_TAG_typedef, name: "other", scope: !85, file: !84, line: 120, baseType: !201)
!84 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ext/alloc_traits.h", directory: "")
!85 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rebind<int>", scope: !86, file: !84, line: 119, size: 8, flags: DIFlagTypePassByValue, elements: !200, templateParams: !149, identifier: "_ZTSN9__gnu_cxx14__alloc_traitsISaIiEiE6rebindIiEE")
!86 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__alloc_traits<std::allocator<int>, int>", scope: !23, file: !84, line: 48, size: 8, flags: DIFlagTypePassByValue, elements: !87, templateParams: !198, identifier: "_ZTSN9__gnu_cxx14__alloc_traitsISaIiEiEE")
!87 = !{!88, !184, !187, !190, !194, !195, !196, !197}
!88 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !86, baseType: !89, extraData: i32 0)
!89 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "allocator_traits<std::allocator<int> >", scope: !73, file: !90, line: 411, size: 8, flags: DIFlagTypePassByValue, elements: !91, templateParams: !182, identifier: "_ZTSSt16allocator_traitsISaIiEE")
!90 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/alloc_traits.h", directory: "", checksumkind: CSK_MD5, checksum: "937e9d7f00d3ed7cff7ec8fafeb8a8bc")
!91 = !{!92, !166, !170, !173, !179}
!92 = !DISubprogram(name: "allocate", linkageName: "_ZNSt16allocator_traitsISaIiEE8allocateERS0_m", scope: !89, file: !90, line: 463, type: !93, scopeLine: 463, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!93 = !DISubroutineType(types: !94)
!94 = !{!95, !97, !165}
!95 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !89, file: !90, line: 420, baseType: !96)
!96 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !31, size: 64)
!97 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !98, size: 64)
!98 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !89, file: !90, line: 414, baseType: !99)
!99 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "allocator<int>", scope: !73, file: !100, line: 124, size: 8, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !101, templateParams: !149, identifier: "_ZTSSaIiE")
!100 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/allocator.h", directory: "", checksumkind: CSK_MD5, checksum: "52abf05a7426983321ecef80fe4251be")
!101 = !{!102, !151, !155, !160, !164}
!102 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !99, baseType: !103, flags: DIFlagPublic, extraData: i32 0)
!103 = !DIDerivedType(tag: DW_TAG_typedef, name: "__allocator_base<int>", scope: !73, file: !104, line: 48, baseType: !105)
!104 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/x86_64-linux-gnu/c++/11/bits/c++allocator.h", directory: "", checksumkind: CSK_MD5, checksum: "fcdcf111c9228da351f93cd81039e6d6")
!105 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "new_allocator<int>", scope: !23, file: !106, line: 55, size: 8, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !107, templateParams: !149, identifier: "_ZTSN9__gnu_cxx13new_allocatorIiEE")
!106 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/ext/new_allocator.h", directory: "", checksumkind: CSK_MD5, checksum: "4493add5a3fa57e0ec30b90cd4e81c11")
!107 = !{!108, !112, !117, !118, !125, !133, !142, !145, !148}
!108 = !DISubprogram(name: "new_allocator", scope: !105, file: !106, line: 79, type: !109, scopeLine: 79, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!109 = !DISubroutineType(types: !110)
!110 = !{null, !111}
!111 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!112 = !DISubprogram(name: "new_allocator", scope: !105, file: !106, line: 82, type: !113, scopeLine: 82, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!113 = !DISubroutineType(types: !114)
!114 = !{null, !111, !115}
!115 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !116, size: 64)
!116 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !105)
!117 = !DISubprogram(name: "~new_allocator", scope: !105, file: !106, line: 89, type: !109, scopeLine: 89, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!118 = !DISubprogram(name: "address", linkageName: "_ZNK9__gnu_cxx13new_allocatorIiE7addressERi", scope: !105, file: !106, line: 92, type: !119, scopeLine: 92, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!119 = !DISubroutineType(types: !120)
!120 = !{!121, !122, !123}
!121 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !105, file: !106, line: 62, baseType: !96, flags: DIFlagPublic)
!122 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !116, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!123 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !105, file: !106, line: 64, baseType: !124, flags: DIFlagPublic)
!124 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !31, size: 64)
!125 = !DISubprogram(name: "address", linkageName: "_ZNK9__gnu_cxx13new_allocatorIiE7addressERKi", scope: !105, file: !106, line: 96, type: !126, scopeLine: 96, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!126 = !DISubroutineType(types: !127)
!127 = !{!128, !122, !131}
!128 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_pointer", scope: !105, file: !106, line: 63, baseType: !129, flags: DIFlagPublic)
!129 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !130, size: 64)
!130 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !31)
!131 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !105, file: !106, line: 65, baseType: !132, flags: DIFlagPublic)
!132 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !130, size: 64)
!133 = !DISubprogram(name: "allocate", linkageName: "_ZN9__gnu_cxx13new_allocatorIiE8allocateEmPKv", scope: !105, file: !106, line: 103, type: !134, scopeLine: 103, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!134 = !DISubroutineType(types: !135)
!135 = !{!96, !111, !136, !140}
!136 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", file: !106, line: 59, baseType: !137, flags: DIFlagPublic)
!137 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", scope: !73, file: !138, line: 280, baseType: !139)
!138 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/x86_64-linux-gnu/c++/11/bits/c++config.h", directory: "", checksumkind: CSK_MD5, checksum: "b09addf8bea7ac9bf251a76b15f26064")
!139 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!140 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !141, size: 64)
!141 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!142 = !DISubprogram(name: "deallocate", linkageName: "_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPim", scope: !105, file: !106, line: 132, type: !143, scopeLine: 132, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!143 = !DISubroutineType(types: !144)
!144 = !{null, !111, !96, !136}
!145 = !DISubprogram(name: "max_size", linkageName: "_ZNK9__gnu_cxx13new_allocatorIiE8max_sizeEv", scope: !105, file: !106, line: 154, type: !146, scopeLine: 154, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!146 = !DISubroutineType(types: !147)
!147 = !{!136, !122}
!148 = !DISubprogram(name: "_M_max_size", linkageName: "_ZNK9__gnu_cxx13new_allocatorIiE11_M_max_sizeEv", scope: !105, file: !106, line: 197, type: !146, scopeLine: 197, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!149 = !{!150}
!150 = !DITemplateTypeParameter(name: "_Tp", type: !31)
!151 = !DISubprogram(name: "allocator", scope: !99, file: !100, line: 156, type: !152, scopeLine: 156, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!152 = !DISubroutineType(types: !153)
!153 = !{null, !154}
!154 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!155 = !DISubprogram(name: "allocator", scope: !99, file: !100, line: 159, type: !156, scopeLine: 159, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!156 = !DISubroutineType(types: !157)
!157 = !{null, !154, !158}
!158 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !159, size: 64)
!159 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !99)
!160 = !DISubprogram(name: "operator=", linkageName: "_ZNSaIiEaSERKS_", scope: !99, file: !100, line: 164, type: !161, scopeLine: 164, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!161 = !DISubroutineType(types: !162)
!162 = !{!163, !154, !158}
!163 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !99, size: 64)
!164 = !DISubprogram(name: "~allocator", scope: !99, file: !100, line: 174, type: !152, scopeLine: 174, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!165 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", file: !90, line: 435, baseType: !137)
!166 = !DISubprogram(name: "allocate", linkageName: "_ZNSt16allocator_traitsISaIiEE8allocateERS0_mPKv", scope: !89, file: !90, line: 477, type: !167, scopeLine: 477, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!167 = !DISubroutineType(types: !168)
!168 = !{!95, !97, !165, !169}
!169 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_void_pointer", file: !90, line: 429, baseType: !140)
!170 = !DISubprogram(name: "deallocate", linkageName: "_ZNSt16allocator_traitsISaIiEE10deallocateERS0_Pim", scope: !89, file: !90, line: 495, type: !171, scopeLine: 495, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!171 = !DISubroutineType(types: !172)
!172 = !{null, !97, !95, !165}
!173 = !DISubprogram(name: "max_size", linkageName: "_ZNSt16allocator_traitsISaIiEE8max_sizeERKS0_", scope: !89, file: !90, line: 547, type: !174, scopeLine: 547, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!174 = !DISubroutineType(types: !175)
!175 = !{!176, !177}
!176 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !89, file: !90, line: 435, baseType: !137)
!177 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !178, size: 64)
!178 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !98)
!179 = !DISubprogram(name: "select_on_container_copy_construction", linkageName: "_ZNSt16allocator_traitsISaIiEE37select_on_container_copy_constructionERKS0_", scope: !89, file: !90, line: 562, type: !180, scopeLine: 562, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!180 = !DISubroutineType(types: !181)
!181 = !{!98, !177}
!182 = !{!183}
!183 = !DITemplateTypeParameter(name: "_Alloc", type: !99)
!184 = !DISubprogram(name: "_S_select_on_copy", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaIiEiE17_S_select_on_copyERKS1_", scope: !86, file: !84, line: 97, type: !185, scopeLine: 97, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!185 = !DISubroutineType(types: !186)
!186 = !{!99, !158}
!187 = !DISubprogram(name: "_S_on_swap", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaIiEiE10_S_on_swapERS1_S3_", scope: !86, file: !84, line: 100, type: !188, scopeLine: 100, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!188 = !DISubroutineType(types: !189)
!189 = !{null, !163, !163}
!190 = !DISubprogram(name: "_S_propagate_on_copy_assign", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaIiEiE27_S_propagate_on_copy_assignEv", scope: !86, file: !84, line: 103, type: !191, scopeLine: 103, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!191 = !DISubroutineType(types: !192)
!192 = !{!193}
!193 = !DIBasicType(name: "bool", size: 8, encoding: DW_ATE_boolean)
!194 = !DISubprogram(name: "_S_propagate_on_move_assign", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaIiEiE27_S_propagate_on_move_assignEv", scope: !86, file: !84, line: 106, type: !191, scopeLine: 106, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!195 = !DISubprogram(name: "_S_propagate_on_swap", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaIiEiE20_S_propagate_on_swapEv", scope: !86, file: !84, line: 109, type: !191, scopeLine: 109, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!196 = !DISubprogram(name: "_S_always_equal", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaIiEiE15_S_always_equalEv", scope: !86, file: !84, line: 112, type: !191, scopeLine: 112, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!197 = !DISubprogram(name: "_S_nothrow_move", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaIiEiE15_S_nothrow_moveEv", scope: !86, file: !84, line: 115, type: !191, scopeLine: 115, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!198 = !{!183, !199}
!199 = !DITemplateTypeParameter(type: !31)
!200 = !{}
!201 = !DIDerivedType(tag: DW_TAG_typedef, name: "rebind_alloc<int>", scope: !89, file: !90, line: 450, baseType: !99)
!202 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !79, baseType: !203, extraData: i32 0)
!203 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Vector_impl_data", scope: !76, file: !72, line: 91, size: 192, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !204, identifier: "_ZTSNSt12_Vector_baseIiSaIiEE17_Vector_impl_dataE")
!204 = !{!205, !208, !209, !210, !214, !218, !223}
!205 = !DIDerivedType(tag: DW_TAG_member, name: "_M_start", scope: !203, file: !72, line: 93, baseType: !206, size: 64)
!206 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !76, file: !72, line: 89, baseType: !207)
!207 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !86, file: !84, line: 57, baseType: !95)
!208 = !DIDerivedType(tag: DW_TAG_member, name: "_M_finish", scope: !203, file: !72, line: 94, baseType: !206, size: 64, offset: 64)
!209 = !DIDerivedType(tag: DW_TAG_member, name: "_M_end_of_storage", scope: !203, file: !72, line: 95, baseType: !206, size: 64, offset: 128)
!210 = !DISubprogram(name: "_Vector_impl_data", scope: !203, file: !72, line: 97, type: !211, scopeLine: 97, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!211 = !DISubroutineType(types: !212)
!212 = !{null, !213}
!213 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !203, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!214 = !DISubprogram(name: "_Vector_impl_data", scope: !203, file: !72, line: 102, type: !215, scopeLine: 102, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!215 = !DISubroutineType(types: !216)
!216 = !{null, !213, !217}
!217 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !203, size: 64)
!218 = !DISubprogram(name: "_M_copy_data", linkageName: "_ZNSt12_Vector_baseIiSaIiEE17_Vector_impl_data12_M_copy_dataERKS2_", scope: !203, file: !72, line: 109, type: !219, scopeLine: 109, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!219 = !DISubroutineType(types: !220)
!220 = !{null, !213, !221}
!221 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !222, size: 64)
!222 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !203)
!223 = !DISubprogram(name: "_M_swap_data", linkageName: "_ZNSt12_Vector_baseIiSaIiEE17_Vector_impl_data12_M_swap_dataERS2_", scope: !203, file: !72, line: 117, type: !224, scopeLine: 117, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!224 = !DISubroutineType(types: !225)
!225 = !{null, !213, !226}
!226 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !203, size: 64)
!227 = !DISubprogram(name: "_Vector_impl", scope: !79, file: !72, line: 131, type: !228, scopeLine: 131, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!228 = !DISubroutineType(types: !229)
!229 = !{null, !230}
!230 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!231 = !DISubprogram(name: "_Vector_impl", scope: !79, file: !72, line: 136, type: !232, scopeLine: 136, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!232 = !DISubroutineType(types: !233)
!233 = !{null, !230, !234}
!234 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !235, size: 64)
!235 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !82)
!236 = !DISubprogram(name: "_Vector_impl", scope: !79, file: !72, line: 143, type: !237, scopeLine: 143, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!237 = !DISubroutineType(types: !238)
!238 = !{null, !230, !239}
!239 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !79, size: 64)
!240 = !DISubprogram(name: "_Vector_impl", scope: !79, file: !72, line: 147, type: !241, scopeLine: 147, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!241 = !DISubroutineType(types: !242)
!242 = !{null, !230, !243}
!243 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !82, size: 64)
!244 = !DISubprogram(name: "_Vector_impl", scope: !79, file: !72, line: 151, type: !245, scopeLine: 151, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!245 = !DISubroutineType(types: !246)
!246 = !{null, !230, !243, !239}
!247 = !DISubprogram(name: "_M_get_Tp_allocator", linkageName: "_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv", scope: !76, file: !72, line: 276, type: !248, scopeLine: 276, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!248 = !DISubroutineType(types: !249)
!249 = !{!250, !251}
!250 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !82, size: 64)
!251 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!252 = !DISubprogram(name: "_M_get_Tp_allocator", linkageName: "_ZNKSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv", scope: !76, file: !72, line: 280, type: !253, scopeLine: 280, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!253 = !DISubroutineType(types: !254)
!254 = !{!234, !255}
!255 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !256, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!256 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !76)
!257 = !DISubprogram(name: "get_allocator", linkageName: "_ZNKSt12_Vector_baseIiSaIiEE13get_allocatorEv", scope: !76, file: !72, line: 284, type: !258, scopeLine: 284, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!258 = !DISubroutineType(types: !259)
!259 = !{!260, !255}
!260 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !76, file: !72, line: 273, baseType: !99)
!261 = !DISubprogram(name: "_Vector_base", scope: !76, file: !72, line: 288, type: !262, scopeLine: 288, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!262 = !DISubroutineType(types: !263)
!263 = !{null, !251}
!264 = !DISubprogram(name: "_Vector_base", scope: !76, file: !72, line: 293, type: !265, scopeLine: 293, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!265 = !DISubroutineType(types: !266)
!266 = !{null, !251, !267}
!267 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !268, size: 64)
!268 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !260)
!269 = !DISubprogram(name: "_Vector_base", scope: !76, file: !72, line: 298, type: !270, scopeLine: 298, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!270 = !DISubroutineType(types: !271)
!271 = !{null, !251, !137}
!272 = !DISubprogram(name: "_Vector_base", scope: !76, file: !72, line: 303, type: !273, scopeLine: 303, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!273 = !DISubroutineType(types: !274)
!274 = !{null, !251, !137, !267}
!275 = !DISubprogram(name: "_Vector_base", scope: !76, file: !72, line: 308, type: !276, scopeLine: 308, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!276 = !DISubroutineType(types: !277)
!277 = !{null, !251, !278}
!278 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !76, size: 64)
!279 = !DISubprogram(name: "_Vector_base", scope: !76, file: !72, line: 312, type: !280, scopeLine: 312, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!280 = !DISubroutineType(types: !281)
!281 = !{null, !251, !243}
!282 = !DISubprogram(name: "_Vector_base", scope: !76, file: !72, line: 315, type: !283, scopeLine: 315, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!283 = !DISubroutineType(types: !284)
!284 = !{null, !251, !278, !267}
!285 = !DISubprogram(name: "_Vector_base", scope: !76, file: !72, line: 328, type: !286, scopeLine: 328, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!286 = !DISubroutineType(types: !287)
!287 = !{null, !251, !267, !278}
!288 = !DISubprogram(name: "~_Vector_base", scope: !76, file: !72, line: 333, type: !262, scopeLine: 333, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!289 = !DISubprogram(name: "_M_allocate", linkageName: "_ZNSt12_Vector_baseIiSaIiEE11_M_allocateEm", scope: !76, file: !72, line: 343, type: !290, scopeLine: 343, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!290 = !DISubroutineType(types: !291)
!291 = !{!206, !251, !137}
!292 = !DISubprogram(name: "_M_deallocate", linkageName: "_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPim", scope: !76, file: !72, line: 350, type: !293, scopeLine: 350, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!293 = !DISubroutineType(types: !294)
!294 = !{null, !251, !206, !137}
!295 = !DISubprogram(name: "_M_create_storage", linkageName: "_ZNSt12_Vector_baseIiSaIiEE17_M_create_storageEm", scope: !76, file: !72, line: 359, type: !270, scopeLine: 359, flags: DIFlagProtected | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!296 = !{!150, !183}
!297 = !DISubprogram(name: "_S_nothrow_relocate", linkageName: "_ZNSt6vectorIiSaIiEE19_S_nothrow_relocateESt17integral_constantIbLb1EE", scope: !71, file: !72, line: 431, type: !298, scopeLine: 431, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!298 = !DISubroutineType(types: !299)
!299 = !{!193, !300}
!300 = !DIDerivedType(tag: DW_TAG_typedef, name: "true_type", scope: !73, file: !301, line: 83, baseType: !302)
!301 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/type_traits", directory: "")
!302 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "integral_constant<bool, true>", scope: !73, file: !301, line: 65, size: 8, flags: DIFlagTypePassByValue, elements: !303, templateParams: !313, identifier: "_ZTSSt17integral_constantIbLb1EE")
!303 = !{!304, !306, !312}
!304 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !302, file: !301, line: 67, baseType: !305, flags: DIFlagStaticMember, extraData: i1 true)
!305 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !193)
!306 = !DISubprogram(name: "operator bool", linkageName: "_ZNKSt17integral_constantIbLb1EEcvbEv", scope: !302, file: !301, line: 70, type: !307, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!307 = !DISubroutineType(types: !308)
!308 = !{!309, !310}
!309 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !302, file: !301, line: 68, baseType: !193)
!310 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !311, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!311 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !302)
!312 = !DISubprogram(name: "operator()", linkageName: "_ZNKSt17integral_constantIbLb1EEclEv", scope: !302, file: !301, line: 75, type: !307, scopeLine: 75, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!313 = !{!314, !315}
!314 = !DITemplateTypeParameter(name: "_Tp", type: !193)
!315 = !DITemplateValueParameter(name: "__v", type: !193, value: i1 true)
!316 = !DISubprogram(name: "_S_nothrow_relocate", linkageName: "_ZNSt6vectorIiSaIiEE19_S_nothrow_relocateESt17integral_constantIbLb0EE", scope: !71, file: !72, line: 440, type: !317, scopeLine: 440, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!317 = !DISubroutineType(types: !318)
!318 = !{!193, !319}
!319 = !DIDerivedType(tag: DW_TAG_typedef, name: "false_type", scope: !73, file: !301, line: 86, baseType: !320)
!320 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "integral_constant<bool, false>", scope: !73, file: !301, line: 65, size: 8, flags: DIFlagTypePassByValue, elements: !321, templateParams: !330, identifier: "_ZTSSt17integral_constantIbLb0EE")
!321 = !{!322, !323, !329}
!322 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !320, file: !301, line: 67, baseType: !305, flags: DIFlagStaticMember, extraData: i1 false)
!323 = !DISubprogram(name: "operator bool", linkageName: "_ZNKSt17integral_constantIbLb0EEcvbEv", scope: !320, file: !301, line: 70, type: !324, scopeLine: 70, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!324 = !DISubroutineType(types: !325)
!325 = !{!326, !327}
!326 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !320, file: !301, line: 68, baseType: !193)
!327 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !328, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!328 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !320)
!329 = !DISubprogram(name: "operator()", linkageName: "_ZNKSt17integral_constantIbLb0EEclEv", scope: !320, file: !301, line: 75, type: !324, scopeLine: 75, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!330 = !{!314, !331}
!331 = !DITemplateValueParameter(name: "__v", type: !193, value: i1 false)
!332 = !DISubprogram(name: "_S_use_relocate", linkageName: "_ZNSt6vectorIiSaIiEE15_S_use_relocateEv", scope: !71, file: !72, line: 444, type: !191, scopeLine: 444, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!333 = !DISubprogram(name: "_S_do_relocate", linkageName: "_ZNSt6vectorIiSaIiEE14_S_do_relocateEPiS2_S2_RS0_St17integral_constantIbLb1EE", scope: !71, file: !72, line: 453, type: !334, scopeLine: 453, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!334 = !DISubroutineType(types: !335)
!335 = !{!336, !336, !336, !336, !337, !300}
!336 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !71, file: !72, line: 415, baseType: !206, flags: DIFlagPublic)
!337 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !338, size: 64)
!338 = !DIDerivedType(tag: DW_TAG_typedef, name: "_Tp_alloc_type", scope: !71, file: !72, line: 410, baseType: !82)
!339 = !DISubprogram(name: "_S_do_relocate", linkageName: "_ZNSt6vectorIiSaIiEE14_S_do_relocateEPiS2_S2_RS0_St17integral_constantIbLb0EE", scope: !71, file: !72, line: 460, type: !340, scopeLine: 460, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!340 = !DISubroutineType(types: !341)
!341 = !{!336, !336, !336, !336, !337, !319}
!342 = !DISubprogram(name: "_S_relocate", linkageName: "_ZNSt6vectorIiSaIiEE11_S_relocateEPiS2_S2_RS0_", scope: !71, file: !72, line: 465, type: !343, scopeLine: 465, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!343 = !DISubroutineType(types: !344)
!344 = !{!336, !336, !336, !336, !337}
!345 = !DISubprogram(name: "vector", scope: !71, file: !72, line: 487, type: !346, scopeLine: 487, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!346 = !DISubroutineType(types: !347)
!347 = !{null, !348}
!348 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!349 = !DISubprogram(name: "vector", scope: !71, file: !72, line: 497, type: !350, scopeLine: 497, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!350 = !DISubroutineType(types: !351)
!351 = !{null, !348, !352}
!352 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !353, size: 64)
!353 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !354)
!354 = !DIDerivedType(tag: DW_TAG_typedef, name: "allocator_type", scope: !71, file: !72, line: 426, baseType: !99, flags: DIFlagPublic)
!355 = !DISubprogram(name: "vector", scope: !71, file: !72, line: 510, type: !356, scopeLine: 510, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!356 = !DISubroutineType(types: !357)
!357 = !{null, !348, !358, !352}
!358 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", file: !72, line: 424, baseType: !137, flags: DIFlagPublic)
!359 = !DISubprogram(name: "vector", scope: !71, file: !72, line: 522, type: !360, scopeLine: 522, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!360 = !DISubroutineType(types: !361)
!361 = !{null, !348, !358, !362, !352}
!362 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !363, size: 64)
!363 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !364)
!364 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !71, file: !72, line: 414, baseType: !31, flags: DIFlagPublic)
!365 = !DISubprogram(name: "vector", scope: !71, file: !72, line: 553, type: !366, scopeLine: 553, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!366 = !DISubroutineType(types: !367)
!367 = !{null, !348, !368}
!368 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !369, size: 64)
!369 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !71)
!370 = !DISubprogram(name: "vector", scope: !71, file: !72, line: 572, type: !371, scopeLine: 572, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!371 = !DISubroutineType(types: !372)
!372 = !{null, !348, !373}
!373 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !71, size: 64)
!374 = !DISubprogram(name: "vector", scope: !71, file: !72, line: 575, type: !375, scopeLine: 575, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!375 = !DISubroutineType(types: !376)
!376 = !{null, !348, !368, !352}
!377 = !DISubprogram(name: "vector", scope: !71, file: !72, line: 585, type: !378, scopeLine: 585, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!378 = !DISubroutineType(types: !379)
!379 = !{null, !348, !373, !352, !300}
!380 = !DISubprogram(name: "vector", scope: !71, file: !72, line: 589, type: !381, scopeLine: 589, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!381 = !DISubroutineType(types: !382)
!382 = !{null, !348, !373, !352, !319}
!383 = !DISubprogram(name: "vector", scope: !71, file: !72, line: 607, type: !384, scopeLine: 607, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!384 = !DISubroutineType(types: !385)
!385 = !{null, !348, !373, !352}
!386 = !DISubprogram(name: "vector", scope: !71, file: !72, line: 625, type: !387, scopeLine: 625, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!387 = !DISubroutineType(types: !388)
!388 = !{null, !348, !389, !352}
!389 = !DICompositeType(tag: DW_TAG_class_type, name: "initializer_list<int>", scope: !73, file: !390, line: 47, size: 128, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt16initializer_listIiE")
!390 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/initializer_list", directory: "")
!391 = !DISubprogram(name: "~vector", scope: !71, file: !72, line: 678, type: !346, scopeLine: 678, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!392 = !DISubprogram(name: "operator=", linkageName: "_ZNSt6vectorIiSaIiEEaSERKS1_", scope: !71, file: !72, line: 695, type: !393, scopeLine: 695, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!393 = !DISubroutineType(types: !394)
!394 = !{!395, !348, !368}
!395 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !71, size: 64)
!396 = !DISubprogram(name: "operator=", linkageName: "_ZNSt6vectorIiSaIiEEaSEOS1_", scope: !71, file: !72, line: 709, type: !397, scopeLine: 709, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!397 = !DISubroutineType(types: !398)
!398 = !{!395, !348, !373}
!399 = !DISubprogram(name: "operator=", linkageName: "_ZNSt6vectorIiSaIiEEaSESt16initializer_listIiE", scope: !71, file: !72, line: 730, type: !400, scopeLine: 730, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!400 = !DISubroutineType(types: !401)
!401 = !{!395, !348, !389}
!402 = !DISubprogram(name: "assign", linkageName: "_ZNSt6vectorIiSaIiEE6assignEmRKi", scope: !71, file: !72, line: 749, type: !403, scopeLine: 749, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!403 = !DISubroutineType(types: !404)
!404 = !{null, !348, !358, !362}
!405 = !DISubprogram(name: "assign", linkageName: "_ZNSt6vectorIiSaIiEE6assignESt16initializer_listIiE", scope: !71, file: !72, line: 794, type: !406, scopeLine: 794, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!406 = !DISubroutineType(types: !407)
!407 = !{null, !348, !389}
!408 = !DISubprogram(name: "begin", linkageName: "_ZNSt6vectorIiSaIiEE5beginEv", scope: !71, file: !72, line: 811, type: !409, scopeLine: 811, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!409 = !DISubroutineType(types: !410)
!410 = !{!411, !348}
!411 = !DIDerivedType(tag: DW_TAG_typedef, name: "iterator", scope: !71, file: !72, line: 419, baseType: !412, flags: DIFlagPublic)
!412 = !DICompositeType(tag: DW_TAG_class_type, name: "__normal_iterator<int *, std::vector<int, std::allocator<int> > >", scope: !23, file: !413, line: 1004, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEE")
!413 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator.h", directory: "", checksumkind: CSK_MD5, checksum: "adfbaa72dad2c93f2f61417c54c47efb")
!414 = !DISubprogram(name: "begin", linkageName: "_ZNKSt6vectorIiSaIiEE5beginEv", scope: !71, file: !72, line: 820, type: !415, scopeLine: 820, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!415 = !DISubroutineType(types: !416)
!416 = !{!417, !475}
!417 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_iterator", scope: !71, file: !72, line: 421, baseType: !418, flags: DIFlagPublic)
!418 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "__normal_iterator<const int *, std::vector<int, std::allocator<int> > >", scope: !23, file: !413, line: 1004, size: 64, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !419, templateParams: !473, identifier: "_ZTSN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEE")
!419 = !{!420, !421, !425, !430, !441, !446, !450, !453, !454, !455, !462, !465, !468, !469, !470}
!420 = !DIDerivedType(tag: DW_TAG_member, name: "_M_current", scope: !418, file: !413, line: 1007, baseType: !129, size: 64, flags: DIFlagProtected)
!421 = !DISubprogram(name: "__normal_iterator", scope: !418, file: !413, line: 1023, type: !422, scopeLine: 1023, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!422 = !DISubroutineType(types: !423)
!423 = !{null, !424}
!424 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !418, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!425 = !DISubprogram(name: "__normal_iterator", scope: !418, file: !413, line: 1027, type: !426, scopeLine: 1027, flags: DIFlagPublic | DIFlagExplicit | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!426 = !DISubroutineType(types: !427)
!427 = !{null, !424, !428}
!428 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !429, size: 64)
!429 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !129)
!430 = !DISubprogram(name: "operator*", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEdeEv", scope: !418, file: !413, line: 1042, type: !431, scopeLine: 1042, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!431 = !DISubroutineType(types: !432)
!432 = !{!433, !439}
!433 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !418, file: !413, line: 1016, baseType: !434, flags: DIFlagPublic)
!434 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !436, file: !435, line: 227, baseType: !132)
!435 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_iterator_base_types.h", directory: "")
!436 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iterator_traits<const int *>", scope: !73, file: !435, line: 221, size: 8, flags: DIFlagTypePassByValue, elements: !200, templateParams: !437, identifier: "_ZTSSt15iterator_traitsIPKiE")
!437 = !{!438}
!438 = !DITemplateTypeParameter(name: "_Iterator", type: !129)
!439 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !440, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!440 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !418)
!441 = !DISubprogram(name: "operator->", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEptEv", scope: !418, file: !413, line: 1047, type: !442, scopeLine: 1047, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!442 = !DISubroutineType(types: !443)
!443 = !{!444, !439}
!444 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !418, file: !413, line: 1017, baseType: !445, flags: DIFlagPublic)
!445 = !DIDerivedType(tag: DW_TAG_typedef, name: "pointer", scope: !436, file: !435, line: 226, baseType: !129)
!446 = !DISubprogram(name: "operator++", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEppEv", scope: !418, file: !413, line: 1052, type: !447, scopeLine: 1052, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!447 = !DISubroutineType(types: !448)
!448 = !{!449, !424}
!449 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !418, size: 64)
!450 = !DISubprogram(name: "operator++", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEppEi", scope: !418, file: !413, line: 1060, type: !451, scopeLine: 1060, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!451 = !DISubroutineType(types: !452)
!452 = !{!418, !424, !31}
!453 = !DISubprogram(name: "operator--", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEmmEv", scope: !418, file: !413, line: 1066, type: !447, scopeLine: 1066, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!454 = !DISubprogram(name: "operator--", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEmmEi", scope: !418, file: !413, line: 1074, type: !451, scopeLine: 1074, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!455 = !DISubprogram(name: "operator[]", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEixEl", scope: !418, file: !413, line: 1080, type: !456, scopeLine: 1080, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!456 = !DISubroutineType(types: !457)
!457 = !{!433, !439, !458}
!458 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !418, file: !413, line: 1015, baseType: !459, flags: DIFlagPublic)
!459 = !DIDerivedType(tag: DW_TAG_typedef, name: "difference_type", scope: !436, file: !435, line: 225, baseType: !460)
!460 = !DIDerivedType(tag: DW_TAG_typedef, name: "ptrdiff_t", scope: !73, file: !138, line: 281, baseType: !461)
!461 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!462 = !DISubprogram(name: "operator+=", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEpLEl", scope: !418, file: !413, line: 1085, type: !463, scopeLine: 1085, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!463 = !DISubroutineType(types: !464)
!464 = !{!449, !424, !458}
!465 = !DISubprogram(name: "operator+", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEplEl", scope: !418, file: !413, line: 1090, type: !466, scopeLine: 1090, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!466 = !DISubroutineType(types: !467)
!467 = !{!418, !439, !458}
!468 = !DISubprogram(name: "operator-=", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEmIEl", scope: !418, file: !413, line: 1095, type: !463, scopeLine: 1095, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!469 = !DISubprogram(name: "operator-", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEmiEl", scope: !418, file: !413, line: 1100, type: !466, scopeLine: 1100, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!470 = !DISubprogram(name: "base", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEE4baseEv", scope: !418, file: !413, line: 1105, type: !471, scopeLine: 1105, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!471 = !DISubroutineType(types: !472)
!472 = !{!428, !439}
!473 = !{!438, !474}
!474 = !DITemplateTypeParameter(name: "_Container", type: !71)
!475 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !369, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!476 = !DISubprogram(name: "end", linkageName: "_ZNSt6vectorIiSaIiEE3endEv", scope: !71, file: !72, line: 829, type: !409, scopeLine: 829, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!477 = !DISubprogram(name: "end", linkageName: "_ZNKSt6vectorIiSaIiEE3endEv", scope: !71, file: !72, line: 838, type: !415, scopeLine: 838, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!478 = !DISubprogram(name: "rbegin", linkageName: "_ZNSt6vectorIiSaIiEE6rbeginEv", scope: !71, file: !72, line: 847, type: !479, scopeLine: 847, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!479 = !DISubroutineType(types: !480)
!480 = !{!481, !348}
!481 = !DIDerivedType(tag: DW_TAG_typedef, name: "reverse_iterator", scope: !71, file: !72, line: 423, baseType: !482, flags: DIFlagPublic)
!482 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<__gnu_cxx::__normal_iterator<int *, std::vector<int, std::allocator<int> > > >", scope: !73, file: !413, line: 128, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPiSt6vectorIiSaIiEEEEE")
!483 = !DISubprogram(name: "rbegin", linkageName: "_ZNKSt6vectorIiSaIiEE6rbeginEv", scope: !71, file: !72, line: 856, type: !484, scopeLine: 856, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!484 = !DISubroutineType(types: !485)
!485 = !{!486, !475}
!486 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reverse_iterator", scope: !71, file: !72, line: 422, baseType: !487, flags: DIFlagPublic)
!487 = !DICompositeType(tag: DW_TAG_class_type, name: "reverse_iterator<__gnu_cxx::__normal_iterator<const int *, std::vector<int, std::allocator<int> > > >", scope: !73, file: !413, line: 128, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSSt16reverse_iteratorIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEE")
!488 = !DISubprogram(name: "rend", linkageName: "_ZNSt6vectorIiSaIiEE4rendEv", scope: !71, file: !72, line: 865, type: !479, scopeLine: 865, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!489 = !DISubprogram(name: "rend", linkageName: "_ZNKSt6vectorIiSaIiEE4rendEv", scope: !71, file: !72, line: 874, type: !484, scopeLine: 874, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!490 = !DISubprogram(name: "cbegin", linkageName: "_ZNKSt6vectorIiSaIiEE6cbeginEv", scope: !71, file: !72, line: 884, type: !415, scopeLine: 884, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!491 = !DISubprogram(name: "cend", linkageName: "_ZNKSt6vectorIiSaIiEE4cendEv", scope: !71, file: !72, line: 893, type: !415, scopeLine: 893, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!492 = !DISubprogram(name: "crbegin", linkageName: "_ZNKSt6vectorIiSaIiEE7crbeginEv", scope: !71, file: !72, line: 902, type: !484, scopeLine: 902, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!493 = !DISubprogram(name: "crend", linkageName: "_ZNKSt6vectorIiSaIiEE5crendEv", scope: !71, file: !72, line: 911, type: !484, scopeLine: 911, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!494 = !DISubprogram(name: "size", linkageName: "_ZNKSt6vectorIiSaIiEE4sizeEv", scope: !71, file: !72, line: 918, type: !495, scopeLine: 918, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!495 = !DISubroutineType(types: !496)
!496 = !{!358, !475}
!497 = !DISubprogram(name: "max_size", linkageName: "_ZNKSt6vectorIiSaIiEE8max_sizeEv", scope: !71, file: !72, line: 923, type: !495, scopeLine: 923, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!498 = !DISubprogram(name: "resize", linkageName: "_ZNSt6vectorIiSaIiEE6resizeEm", scope: !71, file: !72, line: 937, type: !499, scopeLine: 937, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!499 = !DISubroutineType(types: !500)
!500 = !{null, !348, !358}
!501 = !DISubprogram(name: "resize", linkageName: "_ZNSt6vectorIiSaIiEE6resizeEmRKi", scope: !71, file: !72, line: 957, type: !403, scopeLine: 957, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!502 = !DISubprogram(name: "shrink_to_fit", linkageName: "_ZNSt6vectorIiSaIiEE13shrink_to_fitEv", scope: !71, file: !72, line: 989, type: !346, scopeLine: 989, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!503 = !DISubprogram(name: "capacity", linkageName: "_ZNKSt6vectorIiSaIiEE8capacityEv", scope: !71, file: !72, line: 998, type: !495, scopeLine: 998, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!504 = !DISubprogram(name: "empty", linkageName: "_ZNKSt6vectorIiSaIiEE5emptyEv", scope: !71, file: !72, line: 1007, type: !505, scopeLine: 1007, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!505 = !DISubroutineType(types: !506)
!506 = !{!193, !475}
!507 = !DISubprogram(name: "reserve", linkageName: "_ZNSt6vectorIiSaIiEE7reserveEm", scope: !71, file: !72, line: 1028, type: !499, scopeLine: 1028, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!508 = !DISubprogram(name: "operator[]", linkageName: "_ZNSt6vectorIiSaIiEEixEm", scope: !71, file: !72, line: 1043, type: !509, scopeLine: 1043, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!509 = !DISubroutineType(types: !510)
!510 = !{!511, !348, !358}
!511 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !71, file: !72, line: 417, baseType: !512, flags: DIFlagPublic)
!512 = !DIDerivedType(tag: DW_TAG_typedef, name: "reference", scope: !86, file: !84, line: 62, baseType: !513)
!513 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !514, size: 64)
!514 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !86, file: !84, line: 56, baseType: !515)
!515 = !DIDerivedType(tag: DW_TAG_typedef, name: "value_type", scope: !89, file: !90, line: 417, baseType: !31)
!516 = !DISubprogram(name: "operator[]", linkageName: "_ZNKSt6vectorIiSaIiEEixEm", scope: !71, file: !72, line: 1061, type: !517, scopeLine: 1061, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!517 = !DISubroutineType(types: !518)
!518 = !{!519, !475, !358}
!519 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !71, file: !72, line: 418, baseType: !520, flags: DIFlagPublic)
!520 = !DIDerivedType(tag: DW_TAG_typedef, name: "const_reference", scope: !86, file: !84, line: 63, baseType: !521)
!521 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !522, size: 64)
!522 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !514)
!523 = !DISubprogram(name: "_M_range_check", linkageName: "_ZNKSt6vectorIiSaIiEE14_M_range_checkEm", scope: !71, file: !72, line: 1070, type: !524, scopeLine: 1070, flags: DIFlagProtected | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!524 = !DISubroutineType(types: !525)
!525 = !{null, !475, !358}
!526 = !DISubprogram(name: "at", linkageName: "_ZNSt6vectorIiSaIiEE2atEm", scope: !71, file: !72, line: 1092, type: !509, scopeLine: 1092, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!527 = !DISubprogram(name: "at", linkageName: "_ZNKSt6vectorIiSaIiEE2atEm", scope: !71, file: !72, line: 1110, type: !517, scopeLine: 1110, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!528 = !DISubprogram(name: "front", linkageName: "_ZNSt6vectorIiSaIiEE5frontEv", scope: !71, file: !72, line: 1121, type: !529, scopeLine: 1121, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!529 = !DISubroutineType(types: !530)
!530 = !{!511, !348}
!531 = !DISubprogram(name: "front", linkageName: "_ZNKSt6vectorIiSaIiEE5frontEv", scope: !71, file: !72, line: 1132, type: !532, scopeLine: 1132, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!532 = !DISubroutineType(types: !533)
!533 = !{!519, !475}
!534 = !DISubprogram(name: "back", linkageName: "_ZNSt6vectorIiSaIiEE4backEv", scope: !71, file: !72, line: 1143, type: !529, scopeLine: 1143, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!535 = !DISubprogram(name: "back", linkageName: "_ZNKSt6vectorIiSaIiEE4backEv", scope: !71, file: !72, line: 1154, type: !532, scopeLine: 1154, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!536 = !DISubprogram(name: "data", linkageName: "_ZNSt6vectorIiSaIiEE4dataEv", scope: !71, file: !72, line: 1168, type: !537, scopeLine: 1168, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!537 = !DISubroutineType(types: !538)
!538 = !{!96, !348}
!539 = !DISubprogram(name: "data", linkageName: "_ZNKSt6vectorIiSaIiEE4dataEv", scope: !71, file: !72, line: 1172, type: !540, scopeLine: 1172, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!540 = !DISubroutineType(types: !541)
!541 = !{!129, !475}
!542 = !DISubprogram(name: "push_back", linkageName: "_ZNSt6vectorIiSaIiEE9push_backERKi", scope: !71, file: !72, line: 1187, type: !543, scopeLine: 1187, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!543 = !DISubroutineType(types: !544)
!544 = !{null, !348, !362}
!545 = !DISubprogram(name: "push_back", linkageName: "_ZNSt6vectorIiSaIiEE9push_backEOi", scope: !71, file: !72, line: 1203, type: !546, scopeLine: 1203, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!546 = !DISubroutineType(types: !547)
!547 = !{null, !348, !548}
!548 = !DIDerivedType(tag: DW_TAG_rvalue_reference_type, baseType: !364, size: 64)
!549 = !DISubprogram(name: "pop_back", linkageName: "_ZNSt6vectorIiSaIiEE8pop_backEv", scope: !71, file: !72, line: 1225, type: !346, scopeLine: 1225, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!550 = !DISubprogram(name: "insert", linkageName: "_ZNSt6vectorIiSaIiEE6insertEN9__gnu_cxx17__normal_iteratorIPKiS1_EERS4_", scope: !71, file: !72, line: 1263, type: !551, scopeLine: 1263, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!551 = !DISubroutineType(types: !552)
!552 = !{!411, !348, !417, !362}
!553 = !DISubprogram(name: "insert", linkageName: "_ZNSt6vectorIiSaIiEE6insertEN9__gnu_cxx17__normal_iteratorIPKiS1_EEOi", scope: !71, file: !72, line: 1293, type: !554, scopeLine: 1293, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!554 = !DISubroutineType(types: !555)
!555 = !{!411, !348, !417, !548}
!556 = !DISubprogram(name: "insert", linkageName: "_ZNSt6vectorIiSaIiEE6insertEN9__gnu_cxx17__normal_iteratorIPKiS1_EESt16initializer_listIiE", scope: !71, file: !72, line: 1310, type: !557, scopeLine: 1310, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!557 = !DISubroutineType(types: !558)
!558 = !{!411, !348, !417, !389}
!559 = !DISubprogram(name: "insert", linkageName: "_ZNSt6vectorIiSaIiEE6insertEN9__gnu_cxx17__normal_iteratorIPKiS1_EEmRS4_", scope: !71, file: !72, line: 1335, type: !560, scopeLine: 1335, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!560 = !DISubroutineType(types: !561)
!561 = !{!411, !348, !417, !358, !362}
!562 = !DISubprogram(name: "erase", linkageName: "_ZNSt6vectorIiSaIiEE5eraseEN9__gnu_cxx17__normal_iteratorIPKiS1_EE", scope: !71, file: !72, line: 1430, type: !563, scopeLine: 1430, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!563 = !DISubroutineType(types: !564)
!564 = !{!411, !348, !417}
!565 = !DISubprogram(name: "erase", linkageName: "_ZNSt6vectorIiSaIiEE5eraseEN9__gnu_cxx17__normal_iteratorIPKiS1_EES6_", scope: !71, file: !72, line: 1457, type: !566, scopeLine: 1457, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!566 = !DISubroutineType(types: !567)
!567 = !{!411, !348, !417, !417}
!568 = !DISubprogram(name: "swap", linkageName: "_ZNSt6vectorIiSaIiEE4swapERS1_", scope: !71, file: !72, line: 1480, type: !569, scopeLine: 1480, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!569 = !DISubroutineType(types: !570)
!570 = !{null, !348, !395}
!571 = !DISubprogram(name: "clear", linkageName: "_ZNSt6vectorIiSaIiEE5clearEv", scope: !71, file: !72, line: 1498, type: !346, scopeLine: 1498, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!572 = !DISubprogram(name: "_M_fill_initialize", linkageName: "_ZNSt6vectorIiSaIiEE18_M_fill_initializeEmRKi", scope: !71, file: !72, line: 1593, type: !403, scopeLine: 1593, flags: DIFlagProtected | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!573 = !DISubprogram(name: "_M_default_initialize", linkageName: "_ZNSt6vectorIiSaIiEE21_M_default_initializeEm", scope: !71, file: !72, line: 1603, type: !499, scopeLine: 1603, flags: DIFlagProtected | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!574 = !DISubprogram(name: "_M_fill_assign", linkageName: "_ZNSt6vectorIiSaIiEE14_M_fill_assignEmRKi", scope: !71, file: !72, line: 1645, type: !403, scopeLine: 1645, flags: DIFlagProtected | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!575 = !DISubprogram(name: "_M_fill_insert", linkageName: "_ZNSt6vectorIiSaIiEE14_M_fill_insertEN9__gnu_cxx17__normal_iteratorIPiS1_EEmRKi", scope: !71, file: !72, line: 1684, type: !576, scopeLine: 1684, flags: DIFlagProtected | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!576 = !DISubroutineType(types: !577)
!577 = !{null, !348, !411, !358, !362}
!578 = !DISubprogram(name: "_M_default_append", linkageName: "_ZNSt6vectorIiSaIiEE17_M_default_appendEm", scope: !71, file: !72, line: 1689, type: !499, scopeLine: 1689, flags: DIFlagProtected | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!579 = !DISubprogram(name: "_M_shrink_to_fit", linkageName: "_ZNSt6vectorIiSaIiEE16_M_shrink_to_fitEv", scope: !71, file: !72, line: 1692, type: !580, scopeLine: 1692, flags: DIFlagProtected | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!580 = !DISubroutineType(types: !581)
!581 = !{!193, !348}
!582 = !DISubprogram(name: "_M_insert_rval", linkageName: "_ZNSt6vectorIiSaIiEE14_M_insert_rvalEN9__gnu_cxx17__normal_iteratorIPKiS1_EEOi", scope: !71, file: !72, line: 1741, type: !554, scopeLine: 1741, flags: DIFlagProtected | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!583 = !DISubprogram(name: "_M_emplace_aux", linkageName: "_ZNSt6vectorIiSaIiEE14_M_emplace_auxEN9__gnu_cxx17__normal_iteratorIPKiS1_EEOi", scope: !71, file: !72, line: 1750, type: !554, scopeLine: 1750, flags: DIFlagProtected | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!584 = !DISubprogram(name: "_M_check_len", linkageName: "_ZNKSt6vectorIiSaIiEE12_M_check_lenEmPKc", scope: !71, file: !72, line: 1756, type: !585, scopeLine: 1756, flags: DIFlagProtected | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!585 = !DISubroutineType(types: !586)
!586 = !{!587, !475, !358, !588}
!587 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_type", scope: !71, file: !72, line: 424, baseType: !137, flags: DIFlagPublic)
!588 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!589 = !DISubprogram(name: "_S_check_init_len", linkageName: "_ZNSt6vectorIiSaIiEE17_S_check_init_lenEmRKS0_", scope: !71, file: !72, line: 1767, type: !590, scopeLine: 1767, flags: DIFlagProtected | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!590 = !DISubroutineType(types: !591)
!591 = !{!587, !358, !352}
!592 = !DISubprogram(name: "_S_max_size", linkageName: "_ZNSt6vectorIiSaIiEE11_S_max_sizeERKS0_", scope: !71, file: !72, line: 1776, type: !593, scopeLine: 1776, flags: DIFlagProtected | DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized)
!593 = !DISubroutineType(types: !594)
!594 = !{!587, !595}
!595 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !596, size: 64)
!596 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !338)
!597 = !DISubprogram(name: "_M_erase_at_end", linkageName: "_ZNSt6vectorIiSaIiEE15_M_erase_at_endEPi", scope: !71, file: !72, line: 1792, type: !598, scopeLine: 1792, flags: DIFlagProtected | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!598 = !DISubroutineType(types: !599)
!599 = !{null, !348, !336}
!600 = !DISubprogram(name: "_M_erase", linkageName: "_ZNSt6vectorIiSaIiEE8_M_eraseEN9__gnu_cxx17__normal_iteratorIPiS1_EE", scope: !71, file: !72, line: 1804, type: !601, scopeLine: 1804, flags: DIFlagProtected | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!601 = !DISubroutineType(types: !602)
!602 = !{!411, !348, !411}
!603 = !DISubprogram(name: "_M_erase", linkageName: "_ZNSt6vectorIiSaIiEE8_M_eraseEN9__gnu_cxx17__normal_iteratorIPiS1_EES5_", scope: !71, file: !72, line: 1807, type: !604, scopeLine: 1807, flags: DIFlagProtected | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!604 = !DISubroutineType(types: !605)
!605 = !{!411, !348, !411, !411}
!606 = !DISubprogram(name: "_M_move_assign", linkageName: "_ZNSt6vectorIiSaIiEE14_M_move_assignEOS1_St17integral_constantIbLb1EE", scope: !71, file: !72, line: 1815, type: !607, scopeLine: 1815, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!607 = !DISubroutineType(types: !608)
!608 = !{null, !348, !373, !300}
!609 = !DISubprogram(name: "_M_move_assign", linkageName: "_ZNSt6vectorIiSaIiEE14_M_move_assignEOS1_St17integral_constantIbLb0EE", scope: !71, file: !72, line: 1826, type: !610, scopeLine: 1826, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!610 = !DISubroutineType(types: !611)
!611 = !{null, !348, !373, !319}
!612 = !{!150, !613}
!613 = !DITemplateTypeParameter(name: "_Alloc", type: !99, defaulted: true)
!614 = !DIDerivedType(tag: DW_TAG_member, name: "outputs", scope: !67, file: !30, line: 455, baseType: !71, size: 192, offset: 192)
!615 = !DIDerivedType(tag: DW_TAG_member, name: "pools", scope: !67, file: !30, line: 456, baseType: !71, size: 192, offset: 384)
!616 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !617, size: 64)
!617 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !618)
!618 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "sp<V1_0::IExecutionCallback>", file: !30, line: 413, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !619, templateParams: !674, identifier: "_ZTS2spIN4V1_018IExecutionCallbackEE")
!619 = !{!620, !649, !653, !656, !659, !663, !667, !671}
!620 = !DIDerivedType(tag: DW_TAG_member, name: "ptr", scope: !618, file: !30, line: 415, baseType: !621, size: 64, flags: DIFlagPublic)
!621 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !622, size: 64)
!622 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "IExecutionCallback", scope: !68, file: !30, line: 459, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !623, vtableHolder: !622, identifier: "_ZTSN4V1_018IExecutionCallbackE")
!623 = !{!624, !629, !646}
!624 = !DIDerivedType(tag: DW_TAG_member, name: "_vptr$IExecutionCallback", scope: !30, file: !30, baseType: !625, size: 64, flags: DIFlagArtificial)
!625 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !626, size: 64)
!626 = !DIDerivedType(tag: DW_TAG_pointer_type, name: "__vtbl_ptr_type", baseType: !627, size: 64)
!627 = !DISubroutineType(types: !628)
!628 = !{!31}
!629 = !DISubprogram(name: "notify", linkageName: "_ZN4V1_018IExecutionCallback6notifyE11ErrorStatus", scope: !622, file: !30, line: 460, type: !630, scopeLine: 460, containingType: !622, virtualIndex: 0, flags: DIFlagPrototyped, spFlags: DISPFlagPureVirtual | DISPFlagOptimized)
!630 = !DISubroutineType(types: !631)
!631 = !{!632, !645, !29}
!632 = distinct !DICompositeType(tag: DW_TAG_class_type, name: "Return<void>", file: !30, line: 445, size: 8, flags: DIFlagTypePassByValue | DIFlagNonTrivial, elements: !633, templateParams: !643, identifier: "_ZTS6ReturnIvE")
!633 = !{!634, !638}
!634 = !DISubprogram(name: "Return", scope: !632, file: !30, line: 447, type: !635, scopeLine: 447, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!635 = !DISubroutineType(types: !636)
!636 = !{null, !637}
!637 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !632, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!638 = !DISubprogram(name: "operator void", linkageName: "_ZNK6ReturnIvEcvvEv", scope: !632, file: !30, line: 448, type: !639, scopeLine: 448, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!639 = !DISubroutineType(types: !640)
!640 = !{null, !641}
!641 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !642, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!642 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !632)
!643 = !{!644}
!644 = !DITemplateTypeParameter(name: "T", type: null)
!645 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !622, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!646 = !DISubprogram(name: "~IExecutionCallback", scope: !622, file: !30, line: 461, type: !647, scopeLine: 461, containingType: !622, virtualIndex: 0, flags: DIFlagPrototyped, spFlags: DISPFlagVirtual | DISPFlagOptimized)
!647 = !DISubroutineType(types: !648)
!648 = !{null, !645}
!649 = !DISubprogram(name: "sp", scope: !618, file: !30, line: 417, type: !650, scopeLine: 417, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!650 = !DISubroutineType(types: !651)
!651 = !{null, !652}
!652 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !618, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!653 = !DISubprogram(name: "sp", scope: !618, file: !30, line: 418, type: !654, scopeLine: 418, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!654 = !DISubroutineType(types: !655)
!655 = !{null, !652, !621}
!656 = !DISubprogram(name: "sp", scope: !618, file: !30, line: 419, type: !657, scopeLine: 419, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!657 = !DISubroutineType(types: !658)
!658 = !{null, !652, !616}
!659 = !DISubprogram(name: "operator=", linkageName: "_ZN2spIN4V1_018IExecutionCallbackEEaSEPS1_", scope: !618, file: !30, line: 420, type: !660, scopeLine: 420, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!660 = !DISubroutineType(types: !661)
!661 = !{!662, !652, !621}
!662 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !618, size: 64)
!663 = !DISubprogram(name: "operator->", linkageName: "_ZNK2spIN4V1_018IExecutionCallbackEEptEv", scope: !618, file: !30, line: 424, type: !664, scopeLine: 424, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!664 = !DISubroutineType(types: !665)
!665 = !{!621, !666}
!666 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !617, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!667 = !DISubprogram(name: "operator*", linkageName: "_ZNK2spIN4V1_018IExecutionCallbackEEdeEv", scope: !618, file: !30, line: 425, type: !668, scopeLine: 425, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!668 = !DISubroutineType(types: !669)
!669 = !{!670, !666}
!670 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !622, size: 64)
!671 = !DISubprogram(name: "operator bool", linkageName: "_ZNK2spIN4V1_018IExecutionCallbackEEcvbEv", scope: !618, file: !30, line: 426, type: !672, scopeLine: 426, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!672 = !DISubroutineType(types: !673)
!673 = !{!193, !666}
!674 = !{!675}
!675 = !DITemplateTypeParameter(name: "T", type: !622)
!676 = !DISubprogram(name: "execute", linkageName: "_ZN24ExecutionBurstController7executeERKN4V1_07RequestERK2spINS0_18IExecutionCallbackEE", scope: !41, file: !30, line: 492, type: !677, scopeLine: 492, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!677 = !DISubroutineType(types: !678)
!678 = !{!50, !679, !65, !616}
!679 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !41, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!680 = !DISubprogram(name: "dummyExecution", linkageName: "_ZN24ExecutionBurstController14dummyExecutionEv", scope: !41, file: !30, line: 495, type: !681, scopeLine: 495, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!681 = !DISubroutineType(types: !682)
!682 = !{null, !679}
!683 = !DISubprogram(name: "getErrorStatus", linkageName: "_ZNK24ExecutionBurstController14getErrorStatusEv", scope: !41, file: !30, line: 497, type: !684, scopeLine: 497, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!684 = !DISubroutineType(types: !685)
!685 = !{!29, !686}
!686 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !687, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!687 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !41)
!688 = !DISubprogram(name: "getPreparedModelV1_0", linkageName: "_ZNK24ExecutionBurstController20getPreparedModelV1_0Ev", scope: !41, file: !30, line: 499, type: !689, scopeLine: 499, flags: DIFlagPublic | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!689 = !DISubroutineType(types: !690)
!690 = !{!44, !686}
!691 = !DIDerivedType(tag: DW_TAG_member, name: "request", scope: !37, file: !30, line: 478, baseType: !67, size: 576, offset: 64)
!692 = !DIDerivedType(tag: DW_TAG_member, name: "callback_v1_0", scope: !37, file: !30, line: 479, baseType: !618, size: 64, offset: 640)
!693 = !{!0, !8, !13}
!694 = !{!695, !699, !706, !709, !714, !722, !730, !734, !741, !745, !749, !751, !753, !757, !766, !770, !776, !782, !784, !788, !792, !796, !800, !807, !809, !813, !817, !821, !823, !829, !833, !837, !839, !841, !845, !854, !858, !862, !866, !868, !874, !876, !883, !888, !892, !896, !900, !904, !908, !910, !912, !916, !920, !924, !926, !930, !934, !936, !938, !942, !947, !952, !957, !958, !959, !960, !961, !962, !963, !964, !965, !966, !967, !971, !975, !977}
!695 = !DIImportedEntity(tag: DW_TAG_imported_module, scope: !696, entity: !697, file: !698, line: 58)
!696 = !DINamespace(name: "__gnu_debug", scope: null)
!697 = !DINamespace(name: "__debug", scope: !73)
!698 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/debug/debug.h", directory: "", checksumkind: CSK_MD5, checksum: "982c0103e1e5f86b0818efdfc5273c3c")
!699 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !700, file: !705, line: 64)
!700 = !DIDerivedType(tag: DW_TAG_typedef, name: "mbstate_t", file: !701, line: 6, baseType: !702)
!701 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "ba8742313715e20e434cf6ccb2db98e3")
!702 = !DIDerivedType(tag: DW_TAG_typedef, name: "__mbstate_t", file: !703, line: 21, baseType: !704)
!703 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__mbstate_t.h", directory: "", checksumkind: CSK_MD5, checksum: "82911a3e689448e3691ded3e0b471a55")
!704 = !DICompositeType(tag: DW_TAG_structure_type, file: !703, line: 13, size: 64, flags: DIFlagFwdDecl, identifier: "_ZTS11__mbstate_t")
!705 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/cwchar", directory: "")
!706 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !707, file: !705, line: 141)
!707 = !DIDerivedType(tag: DW_TAG_typedef, name: "wint_t", file: !708, line: 20, baseType: !24)
!708 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/wint_t.h", directory: "", checksumkind: CSK_MD5, checksum: "aa31b53ef28dc23152ceb41e2763ded3")
!709 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !710, file: !705, line: 143)
!710 = !DISubprogram(name: "btowc", scope: !711, file: !711, line: 319, type: !712, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!711 = !DIFile(filename: "/usr/include/wchar.h", directory: "", checksumkind: CSK_MD5, checksum: "484b7adbbc849bb51cdbcb2d985b07a0")
!712 = !DISubroutineType(types: !713)
!713 = !{!707, !31}
!714 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !715, file: !705, line: 144)
!715 = !DISubprogram(name: "fgetwc", scope: !711, file: !711, line: 744, type: !716, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!716 = !DISubroutineType(types: !717)
!717 = !{!707, !718}
!718 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !719, size: 64)
!719 = !DIDerivedType(tag: DW_TAG_typedef, name: "__FILE", file: !720, line: 5, baseType: !721)
!720 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/__FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "72a8fe90981f484acae7c6f3dfc5c2b7")
!721 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !720, line: 4, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTS8_IO_FILE")
!722 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !723, file: !705, line: 145)
!723 = !DISubprogram(name: "fgetws", scope: !711, file: !711, line: 773, type: !724, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!724 = !DISubroutineType(types: !725)
!725 = !{!726, !728, !31, !729}
!726 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !727, size: 64)
!727 = !DIBasicType(name: "wchar_t", size: 32, encoding: DW_ATE_signed)
!728 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !726)
!729 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !718)
!730 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !731, file: !705, line: 146)
!731 = !DISubprogram(name: "fputwc", scope: !711, file: !711, line: 758, type: !732, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!732 = !DISubroutineType(types: !733)
!733 = !{!707, !727, !718}
!734 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !735, file: !705, line: 147)
!735 = !DISubprogram(name: "fputws", scope: !711, file: !711, line: 780, type: !736, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!736 = !DISubroutineType(types: !737)
!737 = !{!31, !738, !729}
!738 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !739)
!739 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !740, size: 64)
!740 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !727)
!741 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !742, file: !705, line: 148)
!742 = !DISubprogram(name: "fwide", scope: !711, file: !711, line: 588, type: !743, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!743 = !DISubroutineType(types: !744)
!744 = !{!31, !718, !31}
!745 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !746, file: !705, line: 149)
!746 = !DISubprogram(name: "fwprintf", scope: !711, file: !711, line: 595, type: !747, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!747 = !DISubroutineType(types: !748)
!748 = !{!31, !729, !738, null}
!749 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !750, file: !705, line: 150)
!750 = !DISubprogram(name: "fwscanf", linkageName: "__isoc99_fwscanf", scope: !711, file: !711, line: 657, type: !747, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!751 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !752, file: !705, line: 151)
!752 = !DISubprogram(name: "getwc", scope: !711, file: !711, line: 745, type: !716, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!753 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !754, file: !705, line: 152)
!754 = !DISubprogram(name: "getwchar", scope: !711, file: !711, line: 751, type: !755, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!755 = !DISubroutineType(types: !756)
!756 = !{!707}
!757 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !758, file: !705, line: 153)
!758 = !DISubprogram(name: "mbrlen", scope: !711, file: !711, line: 330, type: !759, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!759 = !DISubroutineType(types: !760)
!760 = !{!761, !763, !761, !764}
!761 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !762, line: 46, baseType: !139)
!762 = !DIFile(filename: "SVF/llvm-16.0.0.obj/lib/clang/16/include/stddef.h", directory: "/home/demo", checksumkind: CSK_MD5, checksum: "f95079da609b0e8f201cb8136304bf3b")
!763 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !588)
!764 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !765)
!765 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !700, size: 64)
!766 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !767, file: !705, line: 154)
!767 = !DISubprogram(name: "mbrtowc", scope: !711, file: !711, line: 297, type: !768, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!768 = !DISubroutineType(types: !769)
!769 = !{!761, !728, !763, !761, !764}
!770 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !771, file: !705, line: 155)
!771 = !DISubprogram(name: "mbsinit", scope: !711, file: !711, line: 293, type: !772, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!772 = !DISubroutineType(types: !773)
!773 = !{!31, !774}
!774 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !775, size: 64)
!775 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !700)
!776 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !777, file: !705, line: 156)
!777 = !DISubprogram(name: "mbsrtowcs", scope: !711, file: !711, line: 338, type: !778, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!778 = !DISubroutineType(types: !779)
!779 = !{!761, !728, !780, !761, !764}
!780 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !781)
!781 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !588, size: 64)
!782 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !783, file: !705, line: 157)
!783 = !DISubprogram(name: "putwc", scope: !711, file: !711, line: 759, type: !732, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!784 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !785, file: !705, line: 158)
!785 = !DISubprogram(name: "putwchar", scope: !711, file: !711, line: 765, type: !786, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!786 = !DISubroutineType(types: !787)
!787 = !{!707, !727}
!788 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !789, file: !705, line: 160)
!789 = !DISubprogram(name: "swprintf", scope: !711, file: !711, line: 605, type: !790, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!790 = !DISubroutineType(types: !791)
!791 = !{!31, !728, !761, !738, null}
!792 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !793, file: !705, line: 162)
!793 = !DISubprogram(name: "swscanf", linkageName: "__isoc99_swscanf", scope: !711, file: !711, line: 664, type: !794, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!794 = !DISubroutineType(types: !795)
!795 = !{!31, !738, !738, null}
!796 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !797, file: !705, line: 163)
!797 = !DISubprogram(name: "ungetwc", scope: !711, file: !711, line: 788, type: !798, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!798 = !DISubroutineType(types: !799)
!799 = !{!707, !707, !718}
!800 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !801, file: !705, line: 164)
!801 = !DISubprogram(name: "vfwprintf", scope: !711, file: !711, line: 613, type: !802, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!802 = !DISubroutineType(types: !803)
!803 = !{!31, !729, !738, !804}
!804 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !805, size: 64)
!805 = !DICompositeType(tag: DW_TAG_structure_type, name: "__va_list_tag", file: !806, size: 192, flags: DIFlagFwdDecl, identifier: "_ZTS13__va_list_tag")
!806 = !DIFile(filename: "TestExecution_pthread_UAS_logic.cpp", directory: "/home/demo/android_packages_modules_NeuralNetworks/runtime/test")
!807 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !808, file: !705, line: 166)
!808 = !DISubprogram(name: "vfwscanf", linkageName: "__isoc99_vfwscanf", scope: !711, file: !711, line: 711, type: !802, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!809 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !810, file: !705, line: 169)
!810 = !DISubprogram(name: "vswprintf", scope: !711, file: !711, line: 626, type: !811, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!811 = !DISubroutineType(types: !812)
!812 = !{!31, !728, !761, !738, !804}
!813 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !814, file: !705, line: 172)
!814 = !DISubprogram(name: "vswscanf", linkageName: "__isoc99_vswscanf", scope: !711, file: !711, line: 718, type: !815, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!815 = !DISubroutineType(types: !816)
!816 = !{!31, !738, !738, !804}
!817 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !818, file: !705, line: 174)
!818 = !DISubprogram(name: "vwprintf", scope: !711, file: !711, line: 621, type: !819, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!819 = !DISubroutineType(types: !820)
!820 = !{!31, !738, !804}
!821 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !822, file: !705, line: 176)
!822 = !DISubprogram(name: "vwscanf", linkageName: "__isoc99_vwscanf", scope: !711, file: !711, line: 715, type: !819, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!823 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !824, file: !705, line: 178)
!824 = !DISubprogram(name: "wcrtomb", scope: !711, file: !711, line: 302, type: !825, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!825 = !DISubroutineType(types: !826)
!826 = !{!761, !827, !727, !764}
!827 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !828)
!828 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5, size: 64)
!829 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !830, file: !705, line: 179)
!830 = !DISubprogram(name: "wcscat", scope: !711, file: !711, line: 97, type: !831, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!831 = !DISubroutineType(types: !832)
!832 = !{!726, !728, !738}
!833 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !834, file: !705, line: 180)
!834 = !DISubprogram(name: "wcscmp", scope: !711, file: !711, line: 106, type: !835, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!835 = !DISubroutineType(types: !836)
!836 = !{!31, !739, !739}
!837 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !838, file: !705, line: 181)
!838 = !DISubprogram(name: "wcscoll", scope: !711, file: !711, line: 131, type: !835, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!839 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !840, file: !705, line: 182)
!840 = !DISubprogram(name: "wcscpy", scope: !711, file: !711, line: 87, type: !831, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!841 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !842, file: !705, line: 183)
!842 = !DISubprogram(name: "wcscspn", scope: !711, file: !711, line: 188, type: !843, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!843 = !DISubroutineType(types: !844)
!844 = !{!761, !739, !739}
!845 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !846, file: !705, line: 184)
!846 = !DISubprogram(name: "wcsftime", scope: !711, file: !711, line: 852, type: !847, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!847 = !DISubroutineType(types: !848)
!848 = !{!761, !728, !761, !738, !849}
!849 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !850)
!850 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !851, size: 64)
!851 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !852)
!852 = !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !853, line: 7, size: 448, flags: DIFlagFwdDecl, identifier: "_ZTS2tm")
!853 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_tm.h", directory: "", checksumkind: CSK_MD5, checksum: "9e5545b565ef031c4cd0faf90b69386f")
!854 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !855, file: !705, line: 185)
!855 = !DISubprogram(name: "wcslen", scope: !711, file: !711, line: 223, type: !856, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!856 = !DISubroutineType(types: !857)
!857 = !{!761, !739}
!858 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !859, file: !705, line: 186)
!859 = !DISubprogram(name: "wcsncat", scope: !711, file: !711, line: 101, type: !860, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!860 = !DISubroutineType(types: !861)
!861 = !{!726, !728, !738, !761}
!862 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !863, file: !705, line: 187)
!863 = !DISubprogram(name: "wcsncmp", scope: !711, file: !711, line: 109, type: !864, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!864 = !DISubroutineType(types: !865)
!865 = !{!31, !739, !739, !761}
!866 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !867, file: !705, line: 188)
!867 = !DISubprogram(name: "wcsncpy", scope: !711, file: !711, line: 92, type: !860, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!868 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !869, file: !705, line: 189)
!869 = !DISubprogram(name: "wcsrtombs", scope: !711, file: !711, line: 344, type: !870, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!870 = !DISubroutineType(types: !871)
!871 = !{!761, !827, !872, !761, !764}
!872 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !873)
!873 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !739, size: 64)
!874 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !875, file: !705, line: 190)
!875 = !DISubprogram(name: "wcsspn", scope: !711, file: !711, line: 192, type: !843, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!876 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !877, file: !705, line: 191)
!877 = !DISubprogram(name: "wcstod", scope: !711, file: !711, line: 378, type: !878, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!878 = !DISubroutineType(types: !879)
!879 = !{!880, !738, !881}
!880 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!881 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !882)
!882 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !726, size: 64)
!883 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !884, file: !705, line: 193)
!884 = !DISubprogram(name: "wcstof", scope: !711, file: !711, line: 383, type: !885, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!885 = !DISubroutineType(types: !886)
!886 = !{!887, !738, !881}
!887 = !DIBasicType(name: "float", size: 32, encoding: DW_ATE_float)
!888 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !889, file: !705, line: 195)
!889 = !DISubprogram(name: "wcstok", scope: !711, file: !711, line: 218, type: !890, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!890 = !DISubroutineType(types: !891)
!891 = !{!726, !728, !738, !881}
!892 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !893, file: !705, line: 196)
!893 = !DISubprogram(name: "wcstol", scope: !711, file: !711, line: 429, type: !894, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!894 = !DISubroutineType(types: !895)
!895 = !{!461, !738, !881, !31}
!896 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !897, file: !705, line: 197)
!897 = !DISubprogram(name: "wcstoul", scope: !711, file: !711, line: 434, type: !898, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!898 = !DISubroutineType(types: !899)
!899 = !{!139, !738, !881, !31}
!900 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !901, file: !705, line: 198)
!901 = !DISubprogram(name: "wcsxfrm", scope: !711, file: !711, line: 135, type: !902, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!902 = !DISubroutineType(types: !903)
!903 = !{!761, !728, !738, !761}
!904 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !905, file: !705, line: 199)
!905 = !DISubprogram(name: "wctob", scope: !711, file: !711, line: 325, type: !906, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!906 = !DISubroutineType(types: !907)
!907 = !{!31, !707}
!908 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !909, file: !705, line: 200)
!909 = !DISubprogram(name: "wmemcmp", scope: !711, file: !711, line: 259, type: !864, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!910 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !911, file: !705, line: 201)
!911 = !DISubprogram(name: "wmemcpy", scope: !711, file: !711, line: 263, type: !860, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!912 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !913, file: !705, line: 202)
!913 = !DISubprogram(name: "wmemmove", scope: !711, file: !711, line: 268, type: !914, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!914 = !DISubroutineType(types: !915)
!915 = !{!726, !726, !739, !761}
!916 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !917, file: !705, line: 203)
!917 = !DISubprogram(name: "wmemset", scope: !711, file: !711, line: 272, type: !918, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!918 = !DISubroutineType(types: !919)
!919 = !{!726, !726, !727, !761}
!920 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !921, file: !705, line: 204)
!921 = !DISubprogram(name: "wprintf", scope: !711, file: !711, line: 602, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!922 = !DISubroutineType(types: !923)
!923 = !{!31, !738, null}
!924 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !925, file: !705, line: 205)
!925 = !DISubprogram(name: "wscanf", linkageName: "__isoc99_wscanf", scope: !711, file: !711, line: 661, type: !922, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!926 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !927, file: !705, line: 206)
!927 = !DISubprogram(name: "wcschr", scope: !711, file: !711, line: 165, type: !928, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!928 = !DISubroutineType(types: !929)
!929 = !{!726, !739, !727}
!930 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !931, file: !705, line: 207)
!931 = !DISubprogram(name: "wcspbrk", scope: !711, file: !711, line: 202, type: !932, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!932 = !DISubroutineType(types: !933)
!933 = !{!726, !739, !739}
!934 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !935, file: !705, line: 208)
!935 = !DISubprogram(name: "wcsrchr", scope: !711, file: !711, line: 175, type: !928, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!936 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !937, file: !705, line: 209)
!937 = !DISubprogram(name: "wcsstr", scope: !711, file: !711, line: 213, type: !932, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!938 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !939, file: !705, line: 210)
!939 = !DISubprogram(name: "wmemchr", scope: !711, file: !711, line: 254, type: !940, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!940 = !DISubroutineType(types: !941)
!941 = !{!726, !739, !727, !761}
!942 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !943, file: !705, line: 251)
!943 = !DISubprogram(name: "wcstold", scope: !711, file: !711, line: 385, type: !944, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!944 = !DISubroutineType(types: !945)
!945 = !{!946, !738, !881}
!946 = !DIBasicType(name: "long double", size: 128, encoding: DW_ATE_float)
!947 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !948, file: !705, line: 260)
!948 = !DISubprogram(name: "wcstoll", scope: !711, file: !711, line: 442, type: !949, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!949 = !DISubroutineType(types: !950)
!950 = !{!951, !738, !881, !31}
!951 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!952 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !23, entity: !953, file: !705, line: 261)
!953 = !DISubprogram(name: "wcstoull", scope: !711, file: !711, line: 449, type: !954, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized)
!954 = !DISubroutineType(types: !955)
!955 = !{!956, !738, !881, !31}
!956 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!957 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !943, file: !705, line: 267)
!958 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !948, file: !705, line: 268)
!959 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !953, file: !705, line: 269)
!960 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !884, file: !705, line: 283)
!961 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !808, file: !705, line: 286)
!962 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !814, file: !705, line: 289)
!963 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !822, file: !705, line: 292)
!964 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !943, file: !705, line: 296)
!965 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !948, file: !705, line: 297)
!966 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !953, file: !705, line: 298)
!967 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !968, file: !969, line: 68)
!968 = !DICompositeType(tag: DW_TAG_class_type, name: "exception_ptr", scope: !970, file: !969, line: 90, size: 64, flags: DIFlagFwdDecl | DIFlagNonTrivial, identifier: "_ZTSNSt15__exception_ptr13exception_ptrE")
!969 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/exception_ptr.h", directory: "", checksumkind: CSK_MD5, checksum: "ed433011c81450fc2dabd9aa8a29a038")
!970 = !DINamespace(name: "__exception_ptr", scope: !73)
!971 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !970, entity: !972, file: !969, line: 84)
!972 = !DISubprogram(name: "rethrow_exception", linkageName: "_ZSt17rethrow_exceptionNSt15__exception_ptr13exception_ptrE", scope: !73, file: !969, line: 80, type: !973, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized)
!973 = !DISubroutineType(types: !974)
!974 = !{null, !968}
!975 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !21, file: !976, line: 95)
!976 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/shared_ptr_base.h", directory: "", checksumkind: CSK_MD5, checksum: "8d23d9a03c9ca5773e092d05679e2362")
!977 = !DIImportedEntity(tag: DW_TAG_imported_declaration, scope: !73, entity: !978, file: !976, line: 96)
!978 = !DIGlobalVariable(name: "__default_lock_policy", linkageName: "_ZN9__gnu_cxxL21__default_lock_policyE", scope: !23, file: !22, line: 53, type: !979, isLocal: true, isDefinition: false)
!979 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !21)
!980 = !{i32 7, !"Dwarf Version", i32 5}
!981 = !{i32 2, !"Debug Info Version", i32 3}
!982 = !{i32 1, !"wchar_size", i32 4}
!983 = !{i32 8, !"PIC Level", i32 2}
!984 = !{i32 7, !"PIE Level", i32 2}
!985 = !{i32 7, !"uwtable", i32 2}
!986 = !{!"clang version 16.0.0"}
!987 = distinct !DISubprogram(name: "execute_thread_func", linkageName: "_Z19execute_thread_funcPv", scope: !2, file: !2, line: 78, type: !988, scopeLine: 78, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, retainedNodes: !991)
!988 = !DISubroutineType(types: !989)
!989 = !{!990, !990}
!990 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!991 = !{!992, !993}
!992 = !DILocalVariable(name: "arg", arg: 1, scope: !987, file: !2, line: 78, type: !990)
!993 = !DILocalVariable(name: "data", scope: !987, file: !2, line: 79, type: !36)
!994 = !{!995, !995, i64 0}
!995 = !{!"any pointer", !996, i64 0}
!996 = !{!"omnipotent char", !997, i64 0}
!997 = !{!"Simple C++ TBAA"}
!998 = !DILocation(line: 78, column: 33, scope: !987)
!999 = !DILocation(line: 79, column: 5, scope: !987)
!1000 = !DILocation(line: 79, column: 24, scope: !987)
!1001 = !DILocation(line: 79, column: 63, scope: !987)
!1002 = !DILocation(line: 80, column: 5, scope: !987)
!1003 = !DILocation(line: 80, column: 11, scope: !987)
!1004 = !{!1005, !995, i64 0}
!1005 = !{!"_ZTS17ExecuteThreadData", !995, i64 0, !1006, i64 8, !1011, i64 80}
!1006 = !{!"_ZTSN4V1_07RequestE", !1007, i64 0, !1007, i64 24, !1007, i64 48}
!1007 = !{!"_ZTSSt6vectorIiSaIiEE", !1008, i64 0}
!1008 = !{!"_ZTSSt12_Vector_baseIiSaIiEE", !1009, i64 0}
!1009 = !{!"_ZTSNSt12_Vector_baseIiSaIiEE12_Vector_implE", !1010, i64 0}
!1010 = !{!"_ZTSNSt12_Vector_baseIiSaIiEE17_Vector_impl_dataE", !995, i64 0, !995, i64 8, !995, i64 16}
!1011 = !{!"_ZTS2spIN4V1_018IExecutionCallbackEE", !995, i64 0}
!1012 = !DILocation(line: 80, column: 17, scope: !987)
!1013 = !DILocation(line: 82, column: 9, scope: !1014)
!1014 = distinct !DILexicalBlock(scope: !987, file: !2, line: 82, column: 9)
!1015 = !DILocation(line: 82, column: 15, scope: !1014)
!1016 = !DILocation(line: 82, column: 21, scope: !1014)
!1017 = !DILocation(line: 82, column: 38, scope: !1014)
!1018 = !DILocation(line: 82, column: 9, scope: !987)
!1019 = !DILocation(line: 83, column: 9, scope: !1020)
!1020 = distinct !DILexicalBlock(scope: !1014, file: !2, line: 82, column: 60)
!1021 = !DILocation(line: 83, column: 15, scope: !1020)
!1022 = !DILocation(line: 83, column: 21, scope: !1020)
!1023 = !DILocation(line: 83, column: 53, scope: !1020)
!1024 = !DILocation(line: 83, column: 59, scope: !1020)
!1025 = !DILocation(line: 83, column: 68, scope: !1020)
!1026 = !DILocation(line: 83, column: 74, scope: !1020)
!1027 = !DILocation(line: 83, column: 45, scope: !1020)
!1028 = !DILocation(line: 84, column: 5, scope: !1020)
!1029 = !DILocation(line: 85, column: 9, scope: !1030)
!1030 = distinct !DILexicalBlock(scope: !1014, file: !2, line: 84, column: 12)
!1031 = !DILocation(line: 85, column: 15, scope: !1030)
!1032 = !DILocation(line: 85, column: 51, scope: !1030)
!1033 = !DILocation(line: 85, column: 57, scope: !1030)
!1034 = !DILocation(line: 85, column: 63, scope: !1030)
!1035 = !DILocation(line: 85, column: 37, scope: !1030)
!1036 = !DILocation(line: 85, column: 30, scope: !1030)
!1037 = !{!1038, !1038, i64 0}
!1038 = !{!"vtable pointer", !997, i64 0}
!1039 = !DILocation(line: 88, column: 12, scope: !987)
!1040 = !DILocation(line: 88, column: 5, scope: !987)
!1041 = !DILocation(line: 90, column: 1, scope: !987)
!1042 = !DILocation(line: 89, column: 5, scope: !987)
!1043 = distinct !DISubprogram(name: "dummyExecution", linkageName: "_ZN24ExecutionBurstController14dummyExecutionEv", scope: !41, file: !30, line: 495, type: !681, scopeLine: 495, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !680, retainedNodes: !1044)
!1044 = !{!1045}
!1045 = !DILocalVariable(name: "this", arg: 1, scope: !1043, type: !40, flags: DIFlagArtificial | DIFlagObjectPointer)
!1046 = !DILocation(line: 0, scope: !1043)
!1047 = !DILocation(line: 495, column: 28, scope: !1043)
!1048 = distinct !DISubprogram(name: "getErrorStatus", linkageName: "_ZNK24ExecutionBurstController14getErrorStatusEv", scope: !41, file: !30, line: 497, type: !684, scopeLine: 497, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !683, retainedNodes: !1049)
!1049 = !{!1050}
!1050 = !DILocalVariable(name: "this", arg: 1, scope: !1048, type: !1051, flags: DIFlagArtificial | DIFlagObjectPointer)
!1051 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !687, size: 64)
!1052 = !DILocation(line: 0, scope: !1048)
!1053 = !DILocation(line: 497, column: 42, scope: !1048)
!1054 = distinct !DISubprogram(name: "getPreparedModelV1_0", linkageName: "_ZNK24ExecutionBurstController20getPreparedModelV1_0Ev", scope: !41, file: !30, line: 499, type: !689, scopeLine: 499, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !688, retainedNodes: !1055)
!1055 = !{!1056}
!1056 = !DILocalVariable(name: "this", arg: 1, scope: !1054, type: !1051, flags: DIFlagArtificial | DIFlagObjectPointer)
!1057 = !DILocation(line: 0, scope: !1054)
!1058 = !DILocation(line: 499, column: 58, scope: !1054)
!1059 = !{!1060, !995, i64 0}
!1060 = !{!"_ZTS24ExecutionBurstController", !995, i64 0}
!1061 = !DILocation(line: 499, column: 51, scope: !1054)
!1062 = distinct !DISubprogram(name: "execute", linkageName: "_ZN13PreparedModel7executeERKN4V1_07RequestERK2spINS0_18IExecutionCallbackEE", scope: !45, file: !30, line: 484, type: !48, scopeLine: 484, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !47, retainedNodes: !1063)
!1063 = !{!1064, !1065, !1066}
!1064 = !DILocalVariable(name: "this", arg: 1, scope: !1062, type: !44, flags: DIFlagArtificial | DIFlagObjectPointer)
!1065 = !DILocalVariable(arg: 2, scope: !1062, file: !30, line: 484, type: !65)
!1066 = !DILocalVariable(arg: 3, scope: !1062, file: !30, line: 484, type: !616)
!1067 = !DILocation(line: 0, scope: !1062)
!1068 = !DILocation(line: 484, column: 53, scope: !1062)
!1069 = !DILocation(line: 484, column: 90, scope: !1062)
!1070 = !DILocation(line: 485, column: 16, scope: !1062)
!1071 = !DILocation(line: 485, column: 9, scope: !1062)
!1072 = distinct !DISubprogram(name: "operator->", linkageName: "_ZNK2spIN4V1_018IExecutionCallbackEEptEv", scope: !618, file: !30, line: 424, type: !664, scopeLine: 424, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !663, retainedNodes: !1073)
!1073 = !{!1074}
!1074 = !DILocalVariable(name: "this", arg: 1, scope: !1072, type: !1075, flags: DIFlagArtificial | DIFlagObjectPointer)
!1075 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !617, size: 64)
!1076 = !DILocation(line: 0, scope: !1072)
!1077 = !DILocation(line: 424, column: 36, scope: !1072)
!1078 = !{!1011, !995, i64 0}
!1079 = !DILocation(line: 424, column: 29, scope: !1072)
!1080 = distinct !DISubprogram(name: "convertToV1_0", linkageName: "_Z13convertToV1_011ErrorStatus", scope: !30, file: !30, line: 506, type: !1081, scopeLine: 506, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, retainedNodes: !1083)
!1081 = !DISubroutineType(types: !1082)
!1082 = !{!29, !29}
!1083 = !{!1084}
!1084 = !DILocalVariable(name: "status", arg: 1, scope: !1080, file: !30, line: 506, type: !29)
!1085 = !{!1086, !1086, i64 0}
!1086 = !{!"_ZTS11ErrorStatus", !996, i64 0}
!1087 = !DILocation(line: 506, column: 46, scope: !1080)
!1088 = !DILocation(line: 507, column: 12, scope: !1080)
!1089 = !DILocation(line: 507, column: 5, scope: !1080)
!1090 = distinct !DISubprogram(name: "~ExecuteThreadData", linkageName: "_ZN17ExecuteThreadDataD2Ev", scope: !37, file: !30, line: 476, type: !1091, scopeLine: 476, flags: DIFlagArtificial | DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !1094, retainedNodes: !1095)
!1091 = !DISubroutineType(types: !1092)
!1092 = !{null, !1093}
!1093 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !37, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1094 = !DISubprogram(name: "~ExecuteThreadData", scope: !37, type: !1091, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1095 = !{!1096}
!1096 = !DILocalVariable(name: "this", arg: 1, scope: !1090, type: !36, flags: DIFlagArtificial | DIFlagObjectPointer)
!1097 = !DILocation(line: 0, scope: !1090)
!1098 = !DILocation(line: 476, column: 8, scope: !1099)
!1099 = distinct !DILexicalBlock(scope: !1090, file: !30, line: 476, column: 8)
!1100 = !DILocation(line: 476, column: 8, scope: !1090)
!1101 = !DISubprogram(name: "operator delete", linkageName: "_ZdlPv", scope: !1102, file: !1102, line: 130, type: !1103, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !200)
!1102 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/new", directory: "")
!1103 = !DISubroutineType(types: !1104)
!1104 = !{null, !990}
!1105 = distinct !DISubprogram(name: "execute", linkageName: "_ZN24ExecutionBurstController7executeERKN4V1_07RequestERK2spINS0_18IExecutionCallbackEE", scope: !41, file: !2, line: 92, type: !677, scopeLine: 94, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !676, retainedNodes: !1106)
!1106 = !{!1107, !1108, !1109, !1110, !1111}
!1107 = !DILocalVariable(name: "this", arg: 1, scope: !1105, type: !40, flags: DIFlagArtificial | DIFlagObjectPointer)
!1108 = !DILocalVariable(name: "request", arg: 2, scope: !1105, file: !2, line: 93, type: !65)
!1109 = !DILocalVariable(name: "callback", arg: 3, scope: !1105, file: !2, line: 94, type: !616)
!1110 = !DILocalVariable(name: "data", scope: !1105, file: !2, line: 98, type: !36)
!1111 = !DILocalVariable(name: "thread", scope: !1105, file: !2, line: 100, type: !1112)
!1112 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !1113, line: 27, baseType: !139)
!1113 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h", directory: "", checksumkind: CSK_MD5, checksum: "735e3bf264ff9d8f5d95898b1692fbdb")
!1114 = !DILocation(line: 0, scope: !1105)
!1115 = !DILocation(line: 93, column: 26, scope: !1105)
!1116 = !DILocation(line: 94, column: 41, scope: !1105)
!1117 = !DILocation(line: 96, column: 5, scope: !1105)
!1118 = !DILocation(line: 98, column: 5, scope: !1105)
!1119 = !DILocation(line: 98, column: 24, scope: !1105)
!1120 = !DILocation(line: 98, column: 31, scope: !1105)
!1121 = !DILocation(line: 98, column: 52, scope: !1105)
!1122 = !DILocation(line: 98, column: 59, scope: !1105)
!1123 = !DILocation(line: 98, column: 68, scope: !1105)
!1124 = !DILocation(line: 100, column: 5, scope: !1105)
!1125 = !DILocation(line: 100, column: 15, scope: !1105)
!1126 = !DILocation(line: 101, column: 59, scope: !1105)
!1127 = !DILocation(line: 101, column: 5, scope: !1105)
!1128 = !DILocation(line: 102, column: 20, scope: !1105)
!1129 = !{!1130, !1130, i64 0}
!1130 = !{!"long", !996, i64 0}
!1131 = !DILocation(line: 102, column: 5, scope: !1105)
!1132 = !DILocation(line: 104, column: 12, scope: !1105)
!1133 = !DILocation(line: 105, column: 1, scope: !1105)
!1134 = !DISubprogram(name: "__assert_fail", scope: !1135, file: !1135, line: 69, type: !1136, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized, retainedNodes: !200)
!1135 = !DIFile(filename: "/usr/include/assert.h", directory: "", checksumkind: CSK_MD5, checksum: "ab7dc6991d501750085448b20099a5a0")
!1136 = !DISubroutineType(types: !1137)
!1137 = !{null, !588, !588, !24, !588}
!1138 = !DISubprogram(name: "operator new", linkageName: "_Znwm", scope: !1102, file: !1102, line: 126, type: !1139, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !200)
!1139 = !DISubroutineType(types: !1140)
!1140 = !{!990, !137}
!1141 = distinct !DISubprogram(name: "Request", linkageName: "_ZN4V1_07RequestC2ERKS0_", scope: !67, file: !30, line: 453, type: !1142, scopeLine: 453, flags: DIFlagArtificial | DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !1145, retainedNodes: !1146)
!1142 = !DISubroutineType(types: !1143)
!1143 = !{null, !1144, !65}
!1144 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1145 = !DISubprogram(name: "Request", scope: !67, type: !1142, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1146 = !{!1147, !1149}
!1147 = !DILocalVariable(name: "this", arg: 1, scope: !1141, type: !1148, flags: DIFlagArtificial | DIFlagObjectPointer)
!1148 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !67, size: 64)
!1149 = !DILocalVariable(arg: 2, scope: !1141, type: !65)
!1150 = !DILocation(line: 0, scope: !1141)
!1151 = !DILocation(line: 453, column: 12, scope: !1141)
!1152 = !DILocation(line: 453, column: 12, scope: !1153)
!1153 = distinct !DILexicalBlock(scope: !1141, file: !30, line: 453, column: 12)
!1154 = distinct !DISubprogram(name: "sp", linkageName: "_ZN2spIN4V1_018IExecutionCallbackEEC2ERKS2_", scope: !618, file: !30, line: 419, type: !657, scopeLine: 419, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !656, retainedNodes: !1155)
!1155 = !{!1156, !1158}
!1156 = !DILocalVariable(name: "this", arg: 1, scope: !1154, type: !1157, flags: DIFlagArtificial | DIFlagObjectPointer)
!1157 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !618, size: 64)
!1158 = !DILocalVariable(name: "other", arg: 2, scope: !1154, file: !30, line: 419, type: !616)
!1159 = !DILocation(line: 0, scope: !1154)
!1160 = !DILocation(line: 419, column: 18, scope: !1154)
!1161 = !DILocation(line: 419, column: 27, scope: !1154)
!1162 = !DILocation(line: 419, column: 31, scope: !1154)
!1163 = !DILocation(line: 419, column: 37, scope: !1154)
!1164 = !DILocation(line: 419, column: 43, scope: !1154)
!1165 = distinct !DISubprogram(name: "~Request", linkageName: "_ZN4V1_07RequestD2Ev", scope: !67, file: !30, line: 453, type: !1166, scopeLine: 453, flags: DIFlagArtificial | DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !1168, retainedNodes: !1169)
!1166 = !DISubroutineType(types: !1167)
!1167 = !{null, !1144}
!1168 = !DISubprogram(name: "~Request", scope: !67, type: !1166, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1169 = !{!1170}
!1170 = !DILocalVariable(name: "this", arg: 1, scope: !1165, type: !1148, flags: DIFlagArtificial | DIFlagObjectPointer)
!1171 = !DILocation(line: 0, scope: !1165)
!1172 = !DILocation(line: 453, column: 12, scope: !1173)
!1173 = distinct !DILexicalBlock(scope: !1165, file: !30, line: 453, column: 12)
!1174 = !DILocation(line: 453, column: 12, scope: !1165)
!1175 = !DISubprogram(name: "pthread_create", scope: !1176, file: !1176, line: 202, type: !1177, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !200)
!1176 = !DIFile(filename: "/usr/include/pthread.h", directory: "", checksumkind: CSK_MD5, checksum: "5205981c6f80cc3dc1e81231df63d8ef")
!1177 = !DISubroutineType(types: !1178)
!1178 = !{!31, !1179, !1181, !1186, !1187}
!1179 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1180)
!1180 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1112, size: 64)
!1181 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1182)
!1182 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1183, size: 64)
!1183 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1184)
!1184 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_attr_t", file: !1113, line: 62, baseType: !1185)
!1185 = !DICompositeType(tag: DW_TAG_union_type, name: "pthread_attr_t", file: !1113, line: 56, size: 448, flags: DIFlagFwdDecl, identifier: "_ZTS14pthread_attr_t")
!1186 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !988, size: 64)
!1187 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !990)
!1188 = !DISubprogram(name: "pthread_detach", scope: !1176, file: !1176, line: 269, type: !1189, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !200)
!1189 = !DISubroutineType(types: !1190)
!1190 = !{!31, !1112}
!1191 = distinct !DISubprogram(name: "Return", linkageName: "_ZN6ReturnI11ErrorStatusEC2ES0_", scope: !50, file: !30, line: 439, type: !54, scopeLine: 439, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !53, retainedNodes: !1192)
!1192 = !{!1193, !1195}
!1193 = !DILocalVariable(name: "this", arg: 1, scope: !1191, type: !1194, flags: DIFlagArtificial | DIFlagObjectPointer)
!1194 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !50, size: 64)
!1195 = !DILocalVariable(name: "v", arg: 2, scope: !1191, file: !30, line: 439, type: !29)
!1196 = !DILocation(line: 0, scope: !1191)
!1197 = !DILocation(line: 439, column: 14, scope: !1191)
!1198 = !DILocation(line: 439, column: 24, scope: !1191)
!1199 = !DILocation(line: 439, column: 30, scope: !1191)
!1200 = !{!1201, !1086, i64 0}
!1201 = !{!"_ZTS6ReturnI11ErrorStatusE", !1086, i64 0}
!1202 = !DILocation(line: 439, column: 34, scope: !1191)
!1203 = distinct !DISubprogram(name: "testExecuteFunction", linkageName: "_Z19testExecuteFunctionv", scope: !2, file: !2, line: 108, type: !1204, scopeLine: 108, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, retainedNodes: !1206)
!1204 = !DISubroutineType(types: !1205)
!1205 = !{null}
!1206 = !{!1207, !1208, !1209}
!1207 = !DILocalVariable(name: "request", scope: !1203, file: !2, line: 110, type: !67)
!1208 = !DILocalVariable(name: "callback", scope: !1203, file: !2, line: 117, type: !618)
!1209 = !DILocalVariable(name: "controller", scope: !1203, file: !2, line: 120, type: !41)
!1210 = !DILocation(line: 110, column: 5, scope: !1203)
!1211 = !DILocation(line: 110, column: 19, scope: !1203)
!1212 = !DILocation(line: 110, column: 29, scope: !1203)
!1213 = !DILocation(line: 111, column: 19, scope: !1203)
!1214 = !DILocation(line: 112, column: 20, scope: !1203)
!1215 = !DILocation(line: 113, column: 18, scope: !1203)
!1216 = !DILocation(line: 117, column: 5, scope: !1203)
!1217 = !DILocation(line: 117, column: 34, scope: !1203)
!1218 = !DILocation(line: 117, column: 45, scope: !1203)
!1219 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "DummyExecutionCallback", scope: !68, file: !30, line: 465, size: 64, flags: DIFlagTypePassByReference | DIFlagNonTrivial, elements: !1220, vtableHolder: !622, identifier: "_ZTSN4V1_022DummyExecutionCallbackE")
!1220 = !{!1221, !1222}
!1221 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !1219, baseType: !622, extraData: i32 0)
!1222 = !DISubprogram(name: "notify", linkageName: "_ZN4V1_022DummyExecutionCallback6notifyE11ErrorStatus", scope: !1219, file: !30, line: 466, type: !1223, scopeLine: 466, containingType: !1219, virtualIndex: 0, flags: DIFlagPrototyped, spFlags: DISPFlagVirtual | DISPFlagOptimized)
!1223 = !DISubroutineType(types: !1224)
!1224 = !{!632, !1225, !29}
!1225 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1219, size: 64, flags: DIFlagArtificial | DIFlagObjectPointer)
!1226 = !DILocation(line: 117, column: 49, scope: !1203)
!1227 = !DILocation(line: 120, column: 5, scope: !1203)
!1228 = !DILocation(line: 120, column: 30, scope: !1203)
!1229 = !DILocation(line: 123, column: 16, scope: !1203)
!1230 = !DILocation(line: 124, column: 1, scope: !1203)
!1231 = distinct !DISubprogram(name: "vector", linkageName: "_ZNSt6vectorIiSaIiEEC2Ev", scope: !71, file: !72, line: 487, type: !346, scopeLine: 487, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !345, retainedNodes: !1232)
!1232 = !{!1233}
!1233 = !DILocalVariable(name: "this", arg: 1, scope: !1231, type: !1234, flags: DIFlagArtificial | DIFlagObjectPointer)
!1234 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !71, size: 64)
!1235 = !DILocation(line: 0, scope: !1231)
!1236 = !DILocation(line: 487, column: 7, scope: !1231)
!1237 = !DILocation(line: 487, column: 24, scope: !1231)
!1238 = distinct !DISubprogram(name: "DummyExecutionCallback", linkageName: "_ZN4V1_022DummyExecutionCallbackC2Ev", scope: !1219, file: !30, line: 465, type: !1239, scopeLine: 465, flags: DIFlagArtificial | DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !1241, retainedNodes: !1242)
!1239 = !DISubroutineType(types: !1240)
!1240 = !{null, !1225}
!1241 = !DISubprogram(name: "DummyExecutionCallback", scope: !1219, type: !1239, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1242 = !{!1243}
!1243 = !DILocalVariable(name: "this", arg: 1, scope: !1238, type: !1244, flags: DIFlagArtificial | DIFlagObjectPointer)
!1244 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1219, size: 64)
!1245 = !DILocation(line: 0, scope: !1238)
!1246 = !DILocation(line: 465, column: 12, scope: !1238)
!1247 = distinct !DISubprogram(name: "sp", linkageName: "_ZN2spIN4V1_018IExecutionCallbackEEC2EPS1_", scope: !618, file: !30, line: 418, type: !654, scopeLine: 418, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !653, retainedNodes: !1248)
!1248 = !{!1249, !1250}
!1249 = !DILocalVariable(name: "this", arg: 1, scope: !1247, type: !1157, flags: DIFlagArtificial | DIFlagObjectPointer)
!1250 = !DILocalVariable(name: "p", arg: 2, scope: !1247, file: !30, line: 418, type: !621)
!1251 = !DILocation(line: 0, scope: !1247)
!1252 = !DILocation(line: 418, column: 11, scope: !1247)
!1253 = !DILocation(line: 418, column: 16, scope: !1247)
!1254 = !DILocation(line: 418, column: 20, scope: !1247)
!1255 = !DILocation(line: 418, column: 24, scope: !1247)
!1256 = distinct !DISubprogram(name: "ExecutionBurstController", linkageName: "_ZN24ExecutionBurstControllerC2Ev", scope: !41, file: !30, line: 490, type: !681, scopeLine: 490, flags: DIFlagArtificial | DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !1257, retainedNodes: !1258)
!1257 = !DISubprogram(name: "ExecutionBurstController", scope: !41, type: !681, flags: DIFlagPublic | DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1258 = !{!1259}
!1259 = !DILocalVariable(name: "this", arg: 1, scope: !1256, type: !40, flags: DIFlagArtificial | DIFlagObjectPointer)
!1260 = !DILocation(line: 0, scope: !1256)
!1261 = !DILocation(line: 502, column: 20, scope: !1256)
!1262 = !DILocation(line: 502, column: 41, scope: !1256)
!1263 = !DILocation(line: 490, column: 7, scope: !1256)
!1264 = distinct !DISubprogram(name: "vector", linkageName: "_ZNSt6vectorIiSaIiEEC2ERKS1_", scope: !71, file: !72, line: 553, type: !366, scopeLine: 556, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !365, retainedNodes: !1265)
!1265 = !{!1266, !1267}
!1266 = !DILocalVariable(name: "this", arg: 1, scope: !1264, type: !1234, flags: DIFlagArtificial | DIFlagObjectPointer)
!1267 = !DILocalVariable(name: "__x", arg: 2, scope: !1264, file: !72, line: 553, type: !368)
!1268 = !DILocation(line: 0, scope: !1264)
!1269 = !DILocation(line: 553, column: 28, scope: !1264)
!1270 = !DILocation(line: 554, column: 15, scope: !1264)
!1271 = !DILocation(line: 554, column: 19, scope: !1264)
!1272 = !DILocation(line: 555, column: 2, scope: !1264)
!1273 = !DILocation(line: 555, column: 35, scope: !1264)
!1274 = !DILocation(line: 555, column: 39, scope: !1264)
!1275 = !DILocation(line: 554, column: 9, scope: !1264)
!1276 = !DILocation(line: 558, column: 32, scope: !1277)
!1277 = distinct !DILexicalBlock(scope: !1264, file: !72, line: 556, column: 7)
!1278 = !DILocation(line: 558, column: 36, scope: !1277)
!1279 = !DILocation(line: 558, column: 45, scope: !1277)
!1280 = !DILocation(line: 558, column: 49, scope: !1277)
!1281 = !DILocation(line: 559, column: 17, scope: !1277)
!1282 = !DILocation(line: 559, column: 25, scope: !1277)
!1283 = !{!1010, !995, i64 0}
!1284 = !DILocation(line: 560, column: 11, scope: !1277)
!1285 = !DILocation(line: 558, column: 4, scope: !1277)
!1286 = !DILocation(line: 557, column: 8, scope: !1277)
!1287 = !DILocation(line: 557, column: 16, scope: !1277)
!1288 = !DILocation(line: 557, column: 26, scope: !1277)
!1289 = !{!1010, !995, i64 8}
!1290 = !DILocation(line: 561, column: 7, scope: !1264)
!1291 = !DILocation(line: 561, column: 7, scope: !1277)
!1292 = distinct !DISubprogram(name: "~vector", linkageName: "_ZNSt6vectorIiSaIiEED2Ev", scope: !71, file: !72, line: 678, type: !346, scopeLine: 679, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !391, retainedNodes: !1293)
!1293 = !{!1294}
!1294 = !DILocalVariable(name: "this", arg: 1, scope: !1292, type: !1234, flags: DIFlagArtificial | DIFlagObjectPointer)
!1295 = !DILocation(line: 0, scope: !1292)
!1296 = !DILocation(line: 680, column: 22, scope: !1297)
!1297 = distinct !DILexicalBlock(scope: !1292, file: !72, line: 679, column: 7)
!1298 = !DILocation(line: 680, column: 30, scope: !1297)
!1299 = !DILocation(line: 680, column: 46, scope: !1297)
!1300 = !DILocation(line: 680, column: 54, scope: !1297)
!1301 = !DILocation(line: 681, column: 9, scope: !1297)
!1302 = !DILocation(line: 680, column: 2, scope: !1297)
!1303 = !DILocation(line: 683, column: 7, scope: !1297)
!1304 = !DILocation(line: 683, column: 7, scope: !1292)
!1305 = distinct !DISubprogram(name: "size", linkageName: "_ZNKSt6vectorIiSaIiEE4sizeEv", scope: !71, file: !72, line: 918, type: !495, scopeLine: 919, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !494, retainedNodes: !1306)
!1306 = !{!1307}
!1307 = !DILocalVariable(name: "this", arg: 1, scope: !1305, type: !1308, flags: DIFlagArtificial | DIFlagObjectPointer)
!1308 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !369, size: 64)
!1309 = !DILocation(line: 0, scope: !1305)
!1310 = !DILocation(line: 919, column: 32, scope: !1305)
!1311 = !DILocation(line: 919, column: 40, scope: !1305)
!1312 = !DILocation(line: 919, column: 58, scope: !1305)
!1313 = !DILocation(line: 919, column: 66, scope: !1305)
!1314 = !DILocation(line: 919, column: 50, scope: !1305)
!1315 = !DILocation(line: 919, column: 9, scope: !1305)
!1316 = distinct !DISubprogram(name: "_S_select_on_copy", linkageName: "_ZN9__gnu_cxx14__alloc_traitsISaIiEiE17_S_select_on_copyERKS1_", scope: !86, file: !84, line: 97, type: !185, scopeLine: 98, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !184, retainedNodes: !1317)
!1317 = !{!1318}
!1318 = !DILocalVariable(name: "__a", arg: 1, scope: !1316, file: !84, line: 97, type: !158)
!1319 = !DILocation(line: 97, column: 61, scope: !1316)
!1320 = !DILocation(line: 98, column: 64, scope: !1316)
!1321 = !DILocation(line: 98, column: 14, scope: !1316)
!1322 = !DILocation(line: 98, column: 7, scope: !1316)
!1323 = distinct !DISubprogram(name: "_M_get_Tp_allocator", linkageName: "_ZNKSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv", scope: !76, file: !72, line: 280, type: !253, scopeLine: 281, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !252, retainedNodes: !1324)
!1324 = !{!1325}
!1325 = !DILocalVariable(name: "this", arg: 1, scope: !1323, type: !1326, flags: DIFlagArtificial | DIFlagObjectPointer)
!1326 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !256, size: 64)
!1327 = !DILocation(line: 0, scope: !1323)
!1328 = !DILocation(line: 281, column: 22, scope: !1323)
!1329 = !DILocation(line: 281, column: 9, scope: !1323)
!1330 = distinct !DISubprogram(name: "_Vector_base", linkageName: "_ZNSt12_Vector_baseIiSaIiEEC2EmRKS0_", scope: !76, file: !72, line: 303, type: !273, scopeLine: 305, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !272, retainedNodes: !1331)
!1331 = !{!1332, !1334, !1335}
!1332 = !DILocalVariable(name: "this", arg: 1, scope: !1330, type: !1333, flags: DIFlagArtificial | DIFlagObjectPointer)
!1333 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !76, size: 64)
!1334 = !DILocalVariable(name: "__n", arg: 2, scope: !1330, file: !72, line: 303, type: !137)
!1335 = !DILocalVariable(name: "__a", arg: 3, scope: !1330, file: !72, line: 303, type: !267)
!1336 = !DILocation(line: 0, scope: !1330)
!1337 = !DILocation(line: 303, column: 27, scope: !1330)
!1338 = !DILocation(line: 303, column: 54, scope: !1330)
!1339 = !DILocation(line: 304, column: 9, scope: !1330)
!1340 = !DILocation(line: 304, column: 17, scope: !1330)
!1341 = !DILocation(line: 305, column: 27, scope: !1342)
!1342 = distinct !DILexicalBlock(scope: !1330, file: !72, line: 305, column: 7)
!1343 = !DILocation(line: 305, column: 9, scope: !1342)
!1344 = !DILocation(line: 305, column: 33, scope: !1330)
!1345 = !DILocation(line: 305, column: 33, scope: !1342)
!1346 = distinct !DISubprogram(name: "__uninitialized_copy_a<__gnu_cxx::__normal_iterator<const int *, std::vector<int, std::allocator<int> > >, int *, int>", linkageName: "_ZSt22__uninitialized_copy_aIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEPiiET0_T_SA_S9_RSaIT1_E", scope: !73, file: !1347, line: 331, type: !1348, scopeLine: 333, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, templateParams: !1355, retainedNodes: !1350)
!1347 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_uninitialized.h", directory: "", checksumkind: CSK_MD5, checksum: "e5b2dfda2795d428e8e4a9ac15177146")
!1348 = !DISubroutineType(types: !1349)
!1349 = !{!96, !418, !418, !96, !163}
!1350 = !{!1351, !1352, !1353, !1354}
!1351 = !DILocalVariable(name: "__first", arg: 1, scope: !1346, file: !1347, line: 331, type: !418)
!1352 = !DILocalVariable(name: "__last", arg: 2, scope: !1346, file: !1347, line: 331, type: !418)
!1353 = !DILocalVariable(name: "__result", arg: 3, scope: !1346, file: !1347, line: 332, type: !96)
!1354 = !DILocalVariable(arg: 4, scope: !1346, file: !1347, line: 332, type: !163)
!1355 = !{!1356, !1357, !150}
!1356 = !DITemplateTypeParameter(name: "_InputIterator", type: !418)
!1357 = !DITemplateTypeParameter(name: "_ForwardIterator", type: !96)
!1358 = !DILocation(line: 331, column: 43, scope: !1346)
!1359 = !DILocation(line: 331, column: 67, scope: !1346)
!1360 = !DILocation(line: 332, column: 24, scope: !1346)
!1361 = !DILocation(line: 332, column: 49, scope: !1346)
!1362 = !DILocation(line: 333, column: 38, scope: !1346)
!1363 = !{i64 0, i64 8, !994}
!1364 = !DILocation(line: 333, column: 47, scope: !1346)
!1365 = !DILocation(line: 333, column: 55, scope: !1346)
!1366 = !DILocation(line: 333, column: 14, scope: !1346)
!1367 = !DILocation(line: 333, column: 7, scope: !1346)
!1368 = distinct !DISubprogram(name: "begin", linkageName: "_ZNKSt6vectorIiSaIiEE5beginEv", scope: !71, file: !72, line: 820, type: !415, scopeLine: 821, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !414, retainedNodes: !1369)
!1369 = !{!1370}
!1370 = !DILocalVariable(name: "this", arg: 1, scope: !1368, type: !1308, flags: DIFlagArtificial | DIFlagObjectPointer)
!1371 = !DILocation(line: 0, scope: !1368)
!1372 = !DILocation(line: 821, column: 37, scope: !1368)
!1373 = !DILocation(line: 821, column: 45, scope: !1368)
!1374 = !DILocation(line: 821, column: 16, scope: !1368)
!1375 = !DILocation(line: 821, column: 9, scope: !1368)
!1376 = distinct !DISubprogram(name: "end", linkageName: "_ZNKSt6vectorIiSaIiEE3endEv", scope: !71, file: !72, line: 838, type: !415, scopeLine: 839, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !477, retainedNodes: !1377)
!1377 = !{!1378}
!1378 = !DILocalVariable(name: "this", arg: 1, scope: !1376, type: !1308, flags: DIFlagArtificial | DIFlagObjectPointer)
!1379 = !DILocation(line: 0, scope: !1376)
!1380 = !DILocation(line: 839, column: 37, scope: !1376)
!1381 = !DILocation(line: 839, column: 45, scope: !1376)
!1382 = !DILocation(line: 839, column: 16, scope: !1376)
!1383 = !DILocation(line: 839, column: 9, scope: !1376)
!1384 = distinct !DISubprogram(name: "_M_get_Tp_allocator", linkageName: "_ZNSt12_Vector_baseIiSaIiEE19_M_get_Tp_allocatorEv", scope: !76, file: !72, line: 276, type: !248, scopeLine: 277, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !247, retainedNodes: !1385)
!1385 = !{!1386}
!1386 = !DILocalVariable(name: "this", arg: 1, scope: !1384, type: !1333, flags: DIFlagArtificial | DIFlagObjectPointer)
!1387 = !DILocation(line: 0, scope: !1384)
!1388 = !DILocation(line: 277, column: 22, scope: !1384)
!1389 = !DILocation(line: 277, column: 9, scope: !1384)
!1390 = distinct !DISubprogram(name: "~_Vector_base", linkageName: "_ZNSt12_Vector_baseIiSaIiEED2Ev", scope: !76, file: !72, line: 333, type: !262, scopeLine: 334, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !288, retainedNodes: !1391)
!1391 = !{!1392}
!1392 = !DILocalVariable(name: "this", arg: 1, scope: !1390, type: !1333, flags: DIFlagArtificial | DIFlagObjectPointer)
!1393 = !DILocation(line: 0, scope: !1390)
!1394 = !DILocation(line: 335, column: 16, scope: !1395)
!1395 = distinct !DILexicalBlock(scope: !1390, file: !72, line: 334, column: 7)
!1396 = !DILocation(line: 335, column: 24, scope: !1395)
!1397 = !DILocation(line: 336, column: 9, scope: !1395)
!1398 = !DILocation(line: 336, column: 17, scope: !1395)
!1399 = !{!1010, !995, i64 16}
!1400 = !DILocation(line: 336, column: 37, scope: !1395)
!1401 = !DILocation(line: 336, column: 45, scope: !1395)
!1402 = !DILocation(line: 336, column: 35, scope: !1395)
!1403 = !DILocation(line: 335, column: 2, scope: !1395)
!1404 = !DILocation(line: 337, column: 7, scope: !1395)
!1405 = !DILocation(line: 337, column: 7, scope: !1390)
!1406 = distinct !DISubprogram(name: "select_on_container_copy_construction", linkageName: "_ZNSt16allocator_traitsISaIiEE37select_on_container_copy_constructionERKS0_", scope: !89, file: !90, line: 562, type: !180, scopeLine: 563, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !179, retainedNodes: !1407)
!1407 = !{!1408}
!1408 = !DILocalVariable(name: "__rhs", arg: 1, scope: !1406, file: !90, line: 562, type: !177)
!1409 = !DILocation(line: 562, column: 67, scope: !1406)
!1410 = !DILocation(line: 563, column: 16, scope: !1406)
!1411 = !DILocation(line: 563, column: 9, scope: !1406)
!1412 = distinct !DISubprogram(name: "allocator", linkageName: "_ZNSaIiEC2ERKS_", scope: !99, file: !100, line: 159, type: !156, scopeLine: 160, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !155, retainedNodes: !1413)
!1413 = !{!1414, !1416}
!1414 = !DILocalVariable(name: "this", arg: 1, scope: !1412, type: !1415, flags: DIFlagArtificial | DIFlagObjectPointer)
!1415 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !99, size: 64)
!1416 = !DILocalVariable(name: "__a", arg: 2, scope: !1412, file: !100, line: 159, type: !158)
!1417 = !DILocation(line: 0, scope: !1412)
!1418 = !DILocation(line: 159, column: 34, scope: !1412)
!1419 = !DILocation(line: 160, column: 31, scope: !1412)
!1420 = !DILocation(line: 160, column: 9, scope: !1412)
!1421 = !DILocation(line: 160, column: 38, scope: !1412)
!1422 = distinct !DISubprogram(name: "new_allocator", linkageName: "_ZN9__gnu_cxx13new_allocatorIiEC2ERKS1_", scope: !105, file: !106, line: 82, type: !113, scopeLine: 82, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !112, retainedNodes: !1423)
!1423 = !{!1424, !1426}
!1424 = !DILocalVariable(name: "this", arg: 1, scope: !1422, type: !1425, flags: DIFlagArtificial | DIFlagObjectPointer)
!1425 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !105, size: 64)
!1426 = !DILocalVariable(arg: 2, scope: !1422, file: !106, line: 82, type: !115)
!1427 = !DILocation(line: 0, scope: !1422)
!1428 = !DILocation(line: 82, column: 41, scope: !1422)
!1429 = !DILocation(line: 82, column: 67, scope: !1422)
!1430 = distinct !DISubprogram(name: "_Vector_impl", linkageName: "_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC2ERKS0_", scope: !79, file: !72, line: 136, type: !232, scopeLine: 138, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !231, retainedNodes: !1431)
!1431 = !{!1432, !1434}
!1432 = !DILocalVariable(name: "this", arg: 1, scope: !1430, type: !1433, flags: DIFlagArtificial | DIFlagObjectPointer)
!1433 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !79, size: 64)
!1434 = !DILocalVariable(name: "__a", arg: 2, scope: !1430, file: !72, line: 136, type: !234)
!1435 = !DILocation(line: 0, scope: !1430)
!1436 = !DILocation(line: 136, column: 37, scope: !1430)
!1437 = !DILocation(line: 137, column: 19, scope: !1430)
!1438 = !DILocation(line: 137, column: 4, scope: !1430)
!1439 = !DILocation(line: 136, column: 2, scope: !1430)
!1440 = !DILocation(line: 138, column: 4, scope: !1430)
!1441 = distinct !DISubprogram(name: "_M_create_storage", linkageName: "_ZNSt12_Vector_baseIiSaIiEE17_M_create_storageEm", scope: !76, file: !72, line: 359, type: !270, scopeLine: 360, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !295, retainedNodes: !1442)
!1442 = !{!1443, !1444}
!1443 = !DILocalVariable(name: "this", arg: 1, scope: !1441, type: !1333, flags: DIFlagArtificial | DIFlagObjectPointer)
!1444 = !DILocalVariable(name: "__n", arg: 2, scope: !1441, file: !72, line: 359, type: !137)
!1445 = !DILocation(line: 0, scope: !1441)
!1446 = !DILocation(line: 359, column: 32, scope: !1441)
!1447 = !DILocation(line: 361, column: 45, scope: !1441)
!1448 = !DILocation(line: 361, column: 33, scope: !1441)
!1449 = !DILocation(line: 361, column: 8, scope: !1441)
!1450 = !DILocation(line: 361, column: 16, scope: !1441)
!1451 = !DILocation(line: 361, column: 25, scope: !1441)
!1452 = !DILocation(line: 362, column: 34, scope: !1441)
!1453 = !DILocation(line: 362, column: 42, scope: !1441)
!1454 = !DILocation(line: 362, column: 8, scope: !1441)
!1455 = !DILocation(line: 362, column: 16, scope: !1441)
!1456 = !DILocation(line: 362, column: 26, scope: !1441)
!1457 = !DILocation(line: 363, column: 42, scope: !1441)
!1458 = !DILocation(line: 363, column: 50, scope: !1441)
!1459 = !DILocation(line: 363, column: 61, scope: !1441)
!1460 = !DILocation(line: 363, column: 59, scope: !1441)
!1461 = !DILocation(line: 363, column: 8, scope: !1441)
!1462 = !DILocation(line: 363, column: 16, scope: !1441)
!1463 = !DILocation(line: 363, column: 34, scope: !1441)
!1464 = !DILocation(line: 364, column: 7, scope: !1441)
!1465 = distinct !DISubprogram(name: "~new_allocator", linkageName: "_ZN9__gnu_cxx13new_allocatorIiED2Ev", scope: !105, file: !106, line: 89, type: !109, scopeLine: 89, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !117, retainedNodes: !1466)
!1466 = !{!1467}
!1467 = !DILocalVariable(name: "this", arg: 1, scope: !1465, type: !1425, flags: DIFlagArtificial | DIFlagObjectPointer)
!1468 = !DILocation(line: 0, scope: !1465)
!1469 = !DILocation(line: 89, column: 48, scope: !1465)
!1470 = distinct !DISubprogram(name: "_Vector_impl_data", linkageName: "_ZNSt12_Vector_baseIiSaIiEE17_Vector_impl_dataC2Ev", scope: !203, file: !72, line: 97, type: !211, scopeLine: 99, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !210, retainedNodes: !1471)
!1471 = !{!1472}
!1472 = !DILocalVariable(name: "this", arg: 1, scope: !1470, type: !1473, flags: DIFlagArtificial | DIFlagObjectPointer)
!1473 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !203, size: 64)
!1474 = !DILocation(line: 0, scope: !1470)
!1475 = !DILocation(line: 98, column: 4, scope: !1470)
!1476 = !DILocation(line: 98, column: 16, scope: !1470)
!1477 = !DILocation(line: 98, column: 29, scope: !1470)
!1478 = !DILocation(line: 99, column: 4, scope: !1470)
!1479 = distinct !DISubprogram(name: "_M_allocate", linkageName: "_ZNSt12_Vector_baseIiSaIiEE11_M_allocateEm", scope: !76, file: !72, line: 343, type: !290, scopeLine: 344, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !289, retainedNodes: !1480)
!1480 = !{!1481, !1482}
!1481 = !DILocalVariable(name: "this", arg: 1, scope: !1479, type: !1333, flags: DIFlagArtificial | DIFlagObjectPointer)
!1482 = !DILocalVariable(name: "__n", arg: 2, scope: !1479, file: !72, line: 343, type: !137)
!1483 = !DILocation(line: 0, scope: !1479)
!1484 = !DILocation(line: 343, column: 26, scope: !1479)
!1485 = !DILocation(line: 346, column: 9, scope: !1479)
!1486 = !DILocation(line: 346, column: 13, scope: !1479)
!1487 = !DILocation(line: 346, column: 34, scope: !1479)
!1488 = !DILocation(line: 346, column: 43, scope: !1479)
!1489 = !DILocation(line: 346, column: 20, scope: !1479)
!1490 = !DILocation(line: 346, column: 2, scope: !1479)
!1491 = distinct !DISubprogram(name: "allocate", linkageName: "_ZNSt16allocator_traitsISaIiEE8allocateERS0_m", scope: !89, file: !90, line: 463, type: !93, scopeLine: 464, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !92, retainedNodes: !1492)
!1492 = !{!1493, !1494}
!1493 = !DILocalVariable(name: "__a", arg: 1, scope: !1491, file: !90, line: 463, type: !97)
!1494 = !DILocalVariable(name: "__n", arg: 2, scope: !1491, file: !90, line: 463, type: !165)
!1495 = !DILocation(line: 463, column: 32, scope: !1491)
!1496 = !DILocation(line: 463, column: 47, scope: !1491)
!1497 = !DILocation(line: 464, column: 16, scope: !1491)
!1498 = !DILocation(line: 464, column: 29, scope: !1491)
!1499 = !DILocation(line: 464, column: 20, scope: !1491)
!1500 = !DILocation(line: 464, column: 9, scope: !1491)
!1501 = distinct !DISubprogram(name: "allocate", linkageName: "_ZN9__gnu_cxx13new_allocatorIiE8allocateEmPKv", scope: !105, file: !106, line: 103, type: !134, scopeLine: 104, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !133, retainedNodes: !1502)
!1502 = !{!1503, !1504, !1505}
!1503 = !DILocalVariable(name: "this", arg: 1, scope: !1501, type: !1425, flags: DIFlagArtificial | DIFlagObjectPointer)
!1504 = !DILocalVariable(name: "__n", arg: 2, scope: !1501, file: !106, line: 103, type: !136)
!1505 = !DILocalVariable(arg: 3, scope: !1501, file: !106, line: 103, type: !140)
!1506 = !DILocation(line: 0, scope: !1501)
!1507 = !DILocation(line: 103, column: 26, scope: !1501)
!1508 = !DILocation(line: 103, column: 43, scope: !1501)
!1509 = !DILocation(line: 111, column: 23, scope: !1510)
!1510 = distinct !DILexicalBlock(scope: !1501, file: !106, line: 111, column: 6)
!1511 = !DILocation(line: 111, column: 35, scope: !1510)
!1512 = !DILocation(line: 111, column: 27, scope: !1510)
!1513 = !DILocation(line: 111, column: 6, scope: !1510)
!1514 = !DILocation(line: 111, column: 6, scope: !1501)
!1515 = !DILocation(line: 115, column: 10, scope: !1516)
!1516 = distinct !DILexicalBlock(scope: !1517, file: !106, line: 115, column: 10)
!1517 = distinct !DILexicalBlock(scope: !1510, file: !106, line: 112, column: 4)
!1518 = !DILocation(line: 115, column: 14, scope: !1516)
!1519 = !DILocation(line: 115, column: 10, scope: !1517)
!1520 = !DILocation(line: 116, column: 8, scope: !1516)
!1521 = !DILocation(line: 117, column: 6, scope: !1517)
!1522 = !DILocation(line: 127, column: 42, scope: !1501)
!1523 = !DILocation(line: 127, column: 46, scope: !1501)
!1524 = !DILocation(line: 127, column: 27, scope: !1501)
!1525 = !DILocation(line: 127, column: 2, scope: !1501)
!1526 = distinct !DISubprogram(name: "_M_max_size", linkageName: "_ZNK9__gnu_cxx13new_allocatorIiE11_M_max_sizeEv", scope: !105, file: !106, line: 197, type: !146, scopeLine: 198, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !148, retainedNodes: !1527)
!1527 = !{!1528}
!1528 = !DILocalVariable(name: "this", arg: 1, scope: !1526, type: !1529, flags: DIFlagArtificial | DIFlagObjectPointer)
!1529 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !116, size: 64)
!1530 = !DILocation(line: 0, scope: !1526)
!1531 = !DILocation(line: 200, column: 2, scope: !1526)
!1532 = !DISubprogram(name: "__throw_bad_array_new_length", linkageName: "_ZSt28__throw_bad_array_new_lengthv", scope: !73, file: !1533, line: 55, type: !1204, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized, retainedNodes: !200)
!1533 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/functexcept.h", directory: "", checksumkind: CSK_MD5, checksum: "dd8a128f529a9f6f73237a176e7299bc")
!1534 = !DISubprogram(name: "__throw_bad_alloc", linkageName: "_ZSt17__throw_bad_allocv", scope: !73, file: !1533, line: 52, type: !1204, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized, retainedNodes: !200)
!1535 = distinct !DISubprogram(name: "uninitialized_copy<__gnu_cxx::__normal_iterator<const int *, std::vector<int, std::allocator<int> > >, int *>", linkageName: "_ZSt18uninitialized_copyIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEPiET0_T_SA_S9_", scope: !73, file: !1347, line: 126, type: !1536, scopeLine: 128, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, templateParams: !1543, retainedNodes: !1538)
!1536 = !DISubroutineType(types: !1537)
!1537 = !{!96, !418, !418, !96}
!1538 = !{!1539, !1540, !1541, !1542}
!1539 = !DILocalVariable(name: "__first", arg: 1, scope: !1535, file: !1347, line: 126, type: !418)
!1540 = !DILocalVariable(name: "__last", arg: 2, scope: !1535, file: !1347, line: 126, type: !418)
!1541 = !DILocalVariable(name: "__result", arg: 3, scope: !1535, file: !1347, line: 127, type: !96)
!1542 = !DILocalVariable(name: "__assignable", scope: !1535, file: !1347, line: 145, type: !305)
!1543 = !{!1356, !1357}
!1544 = !DILocation(line: 126, column: 39, scope: !1535)
!1545 = !DILocation(line: 126, column: 63, scope: !1535)
!1546 = !DILocation(line: 127, column: 27, scope: !1535)
!1547 = !DILocation(line: 145, column: 7, scope: !1535)
!1548 = !DILocation(line: 145, column: 18, scope: !1535)
!1549 = !{!1550, !1550, i64 0}
!1550 = !{!"bool", !996, i64 0}
!1551 = !DILocation(line: 151, column: 16, scope: !1535)
!1552 = !DILocation(line: 151, column: 25, scope: !1535)
!1553 = !DILocation(line: 151, column: 33, scope: !1535)
!1554 = !DILocation(line: 148, column: 14, scope: !1535)
!1555 = !DILocation(line: 152, column: 5, scope: !1535)
!1556 = !DILocation(line: 148, column: 7, scope: !1535)
!1557 = distinct !DISubprogram(name: "__uninit_copy<__gnu_cxx::__normal_iterator<const int *, std::vector<int, std::allocator<int> > >, int *>", linkageName: "_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEPiEET0_T_SC_SB_", scope: !1558, file: !1347, line: 108, type: !1536, scopeLine: 110, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, templateParams: !1543, declaration: !1561, retainedNodes: !1562)
!1558 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__uninitialized_copy<true>", scope: !73, file: !1347, line: 104, size: 8, flags: DIFlagTypePassByValue, elements: !200, templateParams: !1559, identifier: "_ZTSSt20__uninitialized_copyILb1EE")
!1559 = !{!1560}
!1560 = !DITemplateValueParameter(name: "_TrivialValueTypes", type: !193, value: i1 true)
!1561 = !DISubprogram(name: "__uninit_copy<__gnu_cxx::__normal_iterator<const int *, std::vector<int, std::allocator<int> > >, int *>", linkageName: "_ZNSt20__uninitialized_copyILb1EE13__uninit_copyIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEPiEET0_T_SC_SB_", scope: !1558, file: !1347, line: 108, type: !1536, scopeLine: 108, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized, templateParams: !1543)
!1562 = !{!1563, !1564, !1565}
!1563 = !DILocalVariable(name: "__first", arg: 1, scope: !1557, file: !1347, line: 108, type: !418)
!1564 = !DILocalVariable(name: "__last", arg: 2, scope: !1557, file: !1347, line: 108, type: !418)
!1565 = !DILocalVariable(name: "__result", arg: 3, scope: !1557, file: !1347, line: 109, type: !96)
!1566 = !DILocation(line: 108, column: 38, scope: !1557)
!1567 = !DILocation(line: 108, column: 62, scope: !1557)
!1568 = !DILocation(line: 109, column: 26, scope: !1557)
!1569 = !DILocation(line: 110, column: 28, scope: !1557)
!1570 = !DILocation(line: 110, column: 37, scope: !1557)
!1571 = !DILocation(line: 110, column: 45, scope: !1557)
!1572 = !DILocation(line: 110, column: 18, scope: !1557)
!1573 = !DILocation(line: 110, column: 11, scope: !1557)
!1574 = distinct !DISubprogram(name: "copy<__gnu_cxx::__normal_iterator<const int *, std::vector<int, std::allocator<int> > >, int *>", linkageName: "_ZSt4copyIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEPiET0_T_SA_S9_", scope: !73, file: !1575, line: 611, type: !1536, scopeLine: 612, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, templateParams: !1580, retainedNodes: !1576)
!1575 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_algobase.h", directory: "", checksumkind: CSK_MD5, checksum: "906433670cd4a8daf96f73a1b6f6012b")
!1576 = !{!1577, !1578, !1579}
!1577 = !DILocalVariable(name: "__first", arg: 1, scope: !1574, file: !1575, line: 611, type: !418)
!1578 = !DILocalVariable(name: "__last", arg: 2, scope: !1574, file: !1575, line: 611, type: !418)
!1579 = !DILocalVariable(name: "__result", arg: 3, scope: !1574, file: !1575, line: 611, type: !96)
!1580 = !{!1581, !1582}
!1581 = !DITemplateTypeParameter(name: "_II", type: !418)
!1582 = !DITemplateTypeParameter(name: "_OI", type: !96)
!1583 = !DILocation(line: 611, column: 14, scope: !1574)
!1584 = !DILocation(line: 611, column: 27, scope: !1574)
!1585 = !DILocation(line: 611, column: 39, scope: !1574)
!1586 = !DILocation(line: 620, column: 26, scope: !1574)
!1587 = !DILocation(line: 620, column: 8, scope: !1574)
!1588 = !DILocation(line: 620, column: 54, scope: !1574)
!1589 = !DILocation(line: 620, column: 36, scope: !1574)
!1590 = !DILocation(line: 620, column: 63, scope: !1574)
!1591 = !DILocation(line: 619, column: 14, scope: !1574)
!1592 = !DILocation(line: 619, column: 7, scope: !1574)
!1593 = distinct !DISubprogram(name: "__copy_move_a<false, __gnu_cxx::__normal_iterator<const int *, std::vector<int, std::allocator<int> > >, int *>", linkageName: "_ZSt13__copy_move_aILb0EN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEPiET1_T0_SA_S9_", scope: !73, file: !1575, line: 527, type: !1536, scopeLine: 528, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, templateParams: !1598, retainedNodes: !1594)
!1594 = !{!1595, !1596, !1597}
!1595 = !DILocalVariable(name: "__first", arg: 1, scope: !1593, file: !1575, line: 527, type: !418)
!1596 = !DILocalVariable(name: "__last", arg: 2, scope: !1593, file: !1575, line: 527, type: !418)
!1597 = !DILocalVariable(name: "__result", arg: 3, scope: !1593, file: !1575, line: 527, type: !96)
!1598 = !{!1599, !1581, !1582}
!1599 = !DITemplateValueParameter(name: "_IsMove", type: !193, value: i1 false)
!1600 = !DILocation(line: 527, column: 23, scope: !1593)
!1601 = !DILocation(line: 527, column: 36, scope: !1593)
!1602 = !DILocation(line: 527, column: 48, scope: !1593)
!1603 = !DILocation(line: 530, column: 50, scope: !1593)
!1604 = !DILocation(line: 530, column: 32, scope: !1593)
!1605 = !DILocation(line: 531, column: 29, scope: !1593)
!1606 = !DILocation(line: 531, column: 11, scope: !1593)
!1607 = !DILocation(line: 532, column: 29, scope: !1593)
!1608 = !DILocation(line: 532, column: 11, scope: !1593)
!1609 = !DILocation(line: 530, column: 3, scope: !1593)
!1610 = !DILocation(line: 529, column: 14, scope: !1593)
!1611 = !DILocation(line: 529, column: 7, scope: !1593)
!1612 = distinct !DISubprogram(name: "__miter_base<__gnu_cxx::__normal_iterator<const int *, std::vector<int, std::allocator<int> > > >", linkageName: "_ZSt12__miter_baseIN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEEET_S8_", scope: !73, file: !1613, line: 560, type: !1614, scopeLine: 561, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, templateParams: !1618, retainedNodes: !1616)
!1613 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/cpp_type_traits.h", directory: "")
!1614 = !DISubroutineType(types: !1615)
!1615 = !{!418, !418}
!1616 = !{!1617}
!1617 = !DILocalVariable(name: "__it", arg: 1, scope: !1612, file: !1613, line: 560, type: !418)
!1618 = !{!1619}
!1619 = !DITemplateTypeParameter(name: "_Iterator", type: !418)
!1620 = !DILocation(line: 560, column: 28, scope: !1612)
!1621 = !DILocation(line: 561, column: 14, scope: !1612)
!1622 = !DILocation(line: 561, column: 7, scope: !1612)
!1623 = distinct !DISubprogram(name: "__niter_wrap<int *>", linkageName: "_ZSt12__niter_wrapIPiET_RKS1_S1_", scope: !73, file: !1575, line: 335, type: !1624, scopeLine: 336, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, templateParams: !1631, retainedNodes: !1628)
!1624 = !DISubroutineType(types: !1625)
!1625 = !{!96, !1626, !96}
!1626 = !DIDerivedType(tag: DW_TAG_reference_type, baseType: !1627, size: 64)
!1627 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !96)
!1628 = !{!1629, !1630}
!1629 = !DILocalVariable(arg: 1, scope: !1623, file: !1575, line: 335, type: !1626)
!1630 = !DILocalVariable(name: "__res", arg: 2, scope: !1623, file: !1575, line: 335, type: !96)
!1631 = !{!1632}
!1632 = !DITemplateTypeParameter(name: "_Iterator", type: !96)
!1633 = !DILocation(line: 335, column: 34, scope: !1623)
!1634 = !DILocation(line: 335, column: 46, scope: !1623)
!1635 = !DILocation(line: 336, column: 14, scope: !1623)
!1636 = !DILocation(line: 336, column: 7, scope: !1623)
!1637 = distinct !DISubprogram(name: "__copy_move_a1<false, const int *, int *>", linkageName: "_ZSt14__copy_move_a1ILb0EPKiPiET1_T0_S4_S3_", scope: !73, file: !1575, line: 521, type: !1638, scopeLine: 522, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, templateParams: !1644, retainedNodes: !1640)
!1638 = !DISubroutineType(types: !1639)
!1639 = !{!96, !129, !129, !96}
!1640 = !{!1641, !1642, !1643}
!1641 = !DILocalVariable(name: "__first", arg: 1, scope: !1637, file: !1575, line: 521, type: !129)
!1642 = !DILocalVariable(name: "__last", arg: 2, scope: !1637, file: !1575, line: 521, type: !129)
!1643 = !DILocalVariable(name: "__result", arg: 3, scope: !1637, file: !1575, line: 521, type: !96)
!1644 = !{!1599, !1645, !1582}
!1645 = !DITemplateTypeParameter(name: "_II", type: !129)
!1646 = !DILocation(line: 521, column: 24, scope: !1637)
!1647 = !DILocation(line: 521, column: 37, scope: !1637)
!1648 = !DILocation(line: 521, column: 49, scope: !1637)
!1649 = !DILocation(line: 522, column: 43, scope: !1637)
!1650 = !DILocation(line: 522, column: 52, scope: !1637)
!1651 = !DILocation(line: 522, column: 60, scope: !1637)
!1652 = !DILocation(line: 522, column: 14, scope: !1637)
!1653 = !DILocation(line: 522, column: 7, scope: !1637)
!1654 = distinct !DISubprogram(name: "__niter_base<const int *, std::vector<int, std::allocator<int> > >", linkageName: "_ZSt12__niter_baseIPKiSt6vectorIiSaIiEEET_N9__gnu_cxx17__normal_iteratorIS5_T0_EE", scope: !73, file: !413, line: 1291, type: !1655, scopeLine: 1293, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, templateParams: !473, retainedNodes: !1657)
!1655 = !DISubroutineType(types: !1656)
!1656 = !{!129, !418}
!1657 = !{!1658}
!1658 = !DILocalVariable(name: "__it", arg: 1, scope: !1654, file: !413, line: 1291, type: !418)
!1659 = !DILocation(line: 1291, column: 70, scope: !1654)
!1660 = !DILocation(line: 1293, column: 19, scope: !1654)
!1661 = !DILocation(line: 1293, column: 7, scope: !1654)
!1662 = distinct !DISubprogram(name: "__niter_base<int *>", linkageName: "_ZSt12__niter_baseIPiET_S1_", scope: !73, file: !1575, line: 313, type: !1663, scopeLine: 315, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, templateParams: !1631, retainedNodes: !1665)
!1663 = !DISubroutineType(types: !1664)
!1664 = !{!96, !96}
!1665 = !{!1666}
!1666 = !DILocalVariable(name: "__it", arg: 1, scope: !1662, file: !1575, line: 313, type: !96)
!1667 = !DILocation(line: 313, column: 28, scope: !1662)
!1668 = !DILocation(line: 315, column: 14, scope: !1662)
!1669 = !DILocation(line: 315, column: 7, scope: !1662)
!1670 = distinct !DISubprogram(name: "__copy_move_a2<false, const int *, int *>", linkageName: "_ZSt14__copy_move_a2ILb0EPKiPiET1_T0_S4_S3_", scope: !73, file: !1575, line: 486, type: !1638, scopeLine: 487, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, templateParams: !1644, retainedNodes: !1671)
!1671 = !{!1672, !1673, !1674}
!1672 = !DILocalVariable(name: "__first", arg: 1, scope: !1670, file: !1575, line: 486, type: !129)
!1673 = !DILocalVariable(name: "__last", arg: 2, scope: !1670, file: !1575, line: 486, type: !129)
!1674 = !DILocalVariable(name: "__result", arg: 3, scope: !1670, file: !1575, line: 486, type: !96)
!1675 = !DILocation(line: 486, column: 24, scope: !1670)
!1676 = !DILocation(line: 486, column: 37, scope: !1670)
!1677 = !DILocation(line: 486, column: 49, scope: !1670)
!1678 = !DILocation(line: 495, column: 31, scope: !1670)
!1679 = !DILocation(line: 495, column: 40, scope: !1670)
!1680 = !DILocation(line: 495, column: 48, scope: !1670)
!1681 = !DILocation(line: 494, column: 14, scope: !1670)
!1682 = !DILocation(line: 494, column: 7, scope: !1670)
!1683 = distinct !DISubprogram(name: "__copy_m<int>", linkageName: "_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIiEEPT_PKS3_S6_S4_", scope: !1684, file: !1575, line: 420, type: !1638, scopeLine: 421, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, templateParams: !149, declaration: !1698, retainedNodes: !1699)
!1684 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__copy_move<false, true, std::random_access_iterator_tag>", scope: !73, file: !1575, line: 415, size: 8, flags: DIFlagTypePassByValue, elements: !200, templateParams: !1685, identifier: "_ZTSSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE")
!1685 = !{!1599, !1686, !1687}
!1686 = !DITemplateValueParameter(name: "_IsSimple", type: !193, value: i1 true)
!1687 = !DITemplateTypeParameter(name: "_Category", type: !1688)
!1688 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "random_access_iterator_tag", scope: !73, file: !435, line: 107, size: 8, flags: DIFlagTypePassByValue, elements: !1689, identifier: "_ZTSSt26random_access_iterator_tag")
!1689 = !{!1690}
!1690 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !1688, baseType: !1691, extraData: i32 0)
!1691 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bidirectional_iterator_tag", scope: !73, file: !435, line: 103, size: 8, flags: DIFlagTypePassByValue, elements: !1692, identifier: "_ZTSSt26bidirectional_iterator_tag")
!1692 = !{!1693}
!1693 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !1691, baseType: !1694, extraData: i32 0)
!1694 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "forward_iterator_tag", scope: !73, file: !435, line: 99, size: 8, flags: DIFlagTypePassByValue, elements: !1695, identifier: "_ZTSSt20forward_iterator_tag")
!1695 = !{!1696}
!1696 = !DIDerivedType(tag: DW_TAG_inheritance, scope: !1694, baseType: !1697, extraData: i32 0)
!1697 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "input_iterator_tag", scope: !73, file: !435, line: 93, size: 8, flags: DIFlagTypePassByValue, elements: !200, identifier: "_ZTSSt18input_iterator_tag")
!1698 = !DISubprogram(name: "__copy_m<int>", linkageName: "_ZNSt11__copy_moveILb0ELb1ESt26random_access_iterator_tagE8__copy_mIiEEPT_PKS3_S6_S4_", scope: !1684, file: !1575, line: 420, type: !1638, scopeLine: 420, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized, templateParams: !149)
!1699 = !{!1700, !1701, !1702, !1703}
!1700 = !DILocalVariable(name: "__first", arg: 1, scope: !1683, file: !1575, line: 420, type: !129)
!1701 = !DILocalVariable(name: "__last", arg: 2, scope: !1683, file: !1575, line: 420, type: !129)
!1702 = !DILocalVariable(name: "__result", arg: 3, scope: !1683, file: !1575, line: 420, type: !96)
!1703 = !DILocalVariable(name: "_Num", scope: !1683, file: !1575, line: 429, type: !1704)
!1704 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !460)
!1705 = !DILocation(line: 420, column: 22, scope: !1683)
!1706 = !DILocation(line: 420, column: 42, scope: !1683)
!1707 = !DILocation(line: 420, column: 55, scope: !1683)
!1708 = !DILocation(line: 429, column: 4, scope: !1683)
!1709 = !DILocation(line: 429, column: 20, scope: !1683)
!1710 = !DILocation(line: 429, column: 27, scope: !1683)
!1711 = !DILocation(line: 429, column: 36, scope: !1683)
!1712 = !DILocation(line: 429, column: 34, scope: !1683)
!1713 = !DILocation(line: 430, column: 8, scope: !1714)
!1714 = distinct !DILexicalBlock(scope: !1683, file: !1575, line: 430, column: 8)
!1715 = !DILocation(line: 430, column: 8, scope: !1683)
!1716 = !DILocation(line: 431, column: 24, scope: !1714)
!1717 = !DILocation(line: 431, column: 34, scope: !1714)
!1718 = !DILocation(line: 431, column: 57, scope: !1714)
!1719 = !DILocation(line: 431, column: 55, scope: !1714)
!1720 = !DILocation(line: 431, column: 6, scope: !1714)
!1721 = !DILocation(line: 432, column: 11, scope: !1683)
!1722 = !DILocation(line: 432, column: 22, scope: !1683)
!1723 = !DILocation(line: 432, column: 20, scope: !1683)
!1724 = !DILocation(line: 433, column: 2, scope: !1683)
!1725 = !DILocation(line: 432, column: 4, scope: !1683)
!1726 = distinct !DISubprogram(name: "base", linkageName: "_ZNK9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEE4baseEv", scope: !418, file: !413, line: 1105, type: !471, scopeLine: 1106, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !470, retainedNodes: !1727)
!1727 = !{!1728}
!1728 = !DILocalVariable(name: "this", arg: 1, scope: !1726, type: !1729, flags: DIFlagArtificial | DIFlagObjectPointer)
!1729 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !440, size: 64)
!1730 = !DILocation(line: 0, scope: !1726)
!1731 = !DILocation(line: 1106, column: 16, scope: !1726)
!1732 = !DILocation(line: 1106, column: 9, scope: !1726)
!1733 = distinct !DISubprogram(name: "__normal_iterator", linkageName: "_ZN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEC2ERKS2_", scope: !418, file: !413, line: 1027, type: !426, scopeLine: 1028, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !425, retainedNodes: !1734)
!1734 = !{!1735, !1737}
!1735 = !DILocalVariable(name: "this", arg: 1, scope: !1733, type: !1736, flags: DIFlagArtificial | DIFlagObjectPointer)
!1736 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !418, size: 64)
!1737 = !DILocalVariable(name: "__i", arg: 2, scope: !1733, file: !413, line: 1027, type: !428)
!1738 = !DILocation(line: 0, scope: !1733)
!1739 = !DILocation(line: 1027, column: 42, scope: !1733)
!1740 = !DILocation(line: 1028, column: 9, scope: !1733)
!1741 = !DILocation(line: 1028, column: 20, scope: !1733)
!1742 = !{!1743, !995, i64 0}
!1743 = !{!"_ZTSN9__gnu_cxx17__normal_iteratorIPKiSt6vectorIiSaIiEEEE", !995, i64 0}
!1744 = !DILocation(line: 1028, column: 27, scope: !1733)
!1745 = distinct !DISubprogram(name: "_M_deallocate", linkageName: "_ZNSt12_Vector_baseIiSaIiEE13_M_deallocateEPim", scope: !76, file: !72, line: 350, type: !293, scopeLine: 351, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !292, retainedNodes: !1746)
!1746 = !{!1747, !1748, !1749}
!1747 = !DILocalVariable(name: "this", arg: 1, scope: !1745, type: !1333, flags: DIFlagArtificial | DIFlagObjectPointer)
!1748 = !DILocalVariable(name: "__p", arg: 2, scope: !1745, file: !72, line: 350, type: !206)
!1749 = !DILocalVariable(name: "__n", arg: 3, scope: !1745, file: !72, line: 350, type: !137)
!1750 = !DILocation(line: 0, scope: !1745)
!1751 = !DILocation(line: 350, column: 29, scope: !1745)
!1752 = !DILocation(line: 350, column: 41, scope: !1745)
!1753 = !DILocation(line: 353, column: 6, scope: !1754)
!1754 = distinct !DILexicalBlock(scope: !1745, file: !72, line: 353, column: 6)
!1755 = !DILocation(line: 353, column: 6, scope: !1745)
!1756 = !DILocation(line: 354, column: 20, scope: !1754)
!1757 = !DILocation(line: 354, column: 29, scope: !1754)
!1758 = !DILocation(line: 354, column: 34, scope: !1754)
!1759 = !DILocation(line: 354, column: 4, scope: !1754)
!1760 = !DILocation(line: 355, column: 7, scope: !1745)
!1761 = distinct !DISubprogram(name: "deallocate", linkageName: "_ZNSt16allocator_traitsISaIiEE10deallocateERS0_Pim", scope: !89, file: !90, line: 495, type: !171, scopeLine: 496, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !170, retainedNodes: !1762)
!1762 = !{!1763, !1764, !1765}
!1763 = !DILocalVariable(name: "__a", arg: 1, scope: !1761, file: !90, line: 495, type: !97)
!1764 = !DILocalVariable(name: "__p", arg: 2, scope: !1761, file: !90, line: 495, type: !95)
!1765 = !DILocalVariable(name: "__n", arg: 3, scope: !1761, file: !90, line: 495, type: !165)
!1766 = !DILocation(line: 495, column: 34, scope: !1761)
!1767 = !DILocation(line: 495, column: 47, scope: !1761)
!1768 = !DILocation(line: 495, column: 62, scope: !1761)
!1769 = !DILocation(line: 496, column: 9, scope: !1761)
!1770 = !DILocation(line: 496, column: 24, scope: !1761)
!1771 = !DILocation(line: 496, column: 29, scope: !1761)
!1772 = !DILocation(line: 496, column: 13, scope: !1761)
!1773 = !DILocation(line: 496, column: 35, scope: !1761)
!1774 = distinct !DISubprogram(name: "deallocate", linkageName: "_ZN9__gnu_cxx13new_allocatorIiE10deallocateEPim", scope: !105, file: !106, line: 132, type: !143, scopeLine: 133, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !142, retainedNodes: !1775)
!1775 = !{!1776, !1777, !1778}
!1776 = !DILocalVariable(name: "this", arg: 1, scope: !1774, type: !1425, flags: DIFlagArtificial | DIFlagObjectPointer)
!1777 = !DILocalVariable(name: "__p", arg: 2, scope: !1774, file: !106, line: 132, type: !96)
!1778 = !DILocalVariable(name: "__t", arg: 3, scope: !1774, file: !106, line: 132, type: !136)
!1779 = !DILocation(line: 0, scope: !1774)
!1780 = !DILocation(line: 132, column: 23, scope: !1774)
!1781 = !DILocation(line: 132, column: 38, scope: !1774)
!1782 = !DILocation(line: 145, column: 20, scope: !1774)
!1783 = !DILocation(line: 145, column: 2, scope: !1774)
!1784 = !DILocation(line: 150, column: 7, scope: !1774)
!1785 = distinct !DISubprogram(name: "_Destroy<int *, int>", linkageName: "_ZSt8_DestroyIPiiEvT_S1_RSaIT0_E", scope: !73, file: !90, line: 845, type: !1786, scopeLine: 847, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, templateParams: !1792, retainedNodes: !1788)
!1786 = !DISubroutineType(types: !1787)
!1787 = !{null, !96, !96, !163}
!1788 = !{!1789, !1790, !1791}
!1789 = !DILocalVariable(name: "__first", arg: 1, scope: !1785, file: !90, line: 845, type: !96)
!1790 = !DILocalVariable(name: "__last", arg: 2, scope: !1785, file: !90, line: 845, type: !96)
!1791 = !DILocalVariable(arg: 3, scope: !1785, file: !90, line: 846, type: !163)
!1792 = !{!1357, !150}
!1793 = !DILocation(line: 845, column: 31, scope: !1785)
!1794 = !DILocation(line: 845, column: 57, scope: !1785)
!1795 = !DILocation(line: 846, column: 22, scope: !1785)
!1796 = !DILocation(line: 848, column: 16, scope: !1785)
!1797 = !DILocation(line: 848, column: 25, scope: !1785)
!1798 = !DILocation(line: 848, column: 7, scope: !1785)
!1799 = !DILocation(line: 849, column: 5, scope: !1785)
!1800 = distinct !DISubprogram(name: "_Destroy<int *>", linkageName: "_ZSt8_DestroyIPiEvT_S1_", scope: !73, file: !1801, line: 182, type: !1802, scopeLine: 183, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, templateParams: !1807, retainedNodes: !1804)
!1801 = !DIFile(filename: "/usr/lib/gcc/x86_64-linux-gnu/11/../../../../include/c++/11/bits/stl_construct.h", directory: "", checksumkind: CSK_MD5, checksum: "d13395651729d9a26632373217b7daf3")
!1802 = !DISubroutineType(types: !1803)
!1803 = !{null, !96, !96}
!1804 = !{!1805, !1806}
!1805 = !DILocalVariable(name: "__first", arg: 1, scope: !1800, file: !1801, line: 182, type: !96)
!1806 = !DILocalVariable(name: "__last", arg: 2, scope: !1800, file: !1801, line: 182, type: !96)
!1807 = !{!1357}
!1808 = !DILocation(line: 182, column: 31, scope: !1800)
!1809 = !DILocation(line: 182, column: 57, scope: !1800)
!1810 = !DILocation(line: 196, column: 12, scope: !1800)
!1811 = !DILocation(line: 196, column: 21, scope: !1800)
!1812 = !DILocation(line: 195, column: 7, scope: !1800)
!1813 = !DILocation(line: 197, column: 5, scope: !1800)
!1814 = distinct !DISubprogram(name: "__destroy<int *>", linkageName: "_ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_", scope: !1815, file: !1801, line: 172, type: !1802, scopeLine: 172, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, templateParams: !1807, declaration: !1818, retainedNodes: !1819)
!1815 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_Destroy_aux<true>", scope: !73, file: !1801, line: 168, size: 8, flags: DIFlagTypePassByValue, elements: !200, templateParams: !1816, identifier: "_ZTSSt12_Destroy_auxILb1EE")
!1816 = !{!1817}
!1817 = !DITemplateValueParameter(type: !193, value: i1 true)
!1818 = !DISubprogram(name: "__destroy<int *>", linkageName: "_ZNSt12_Destroy_auxILb1EE9__destroyIPiEEvT_S3_", scope: !1815, file: !1801, line: 172, type: !1802, scopeLine: 172, flags: DIFlagPrototyped | DIFlagStaticMember, spFlags: DISPFlagOptimized, templateParams: !1807)
!1819 = !{!1820, !1821}
!1820 = !DILocalVariable(arg: 1, scope: !1814, file: !1801, line: 172, type: !96)
!1821 = !DILocalVariable(arg: 2, scope: !1814, file: !1801, line: 172, type: !96)
!1822 = !DILocation(line: 172, column: 35, scope: !1814)
!1823 = !DILocation(line: 172, column: 53, scope: !1814)
!1824 = !DILocation(line: 172, column: 57, scope: !1814)
!1825 = distinct !DISubprogram(name: "_Vector_base", linkageName: "_ZNSt12_Vector_baseIiSaIiEEC2Ev", scope: !76, file: !72, line: 288, type: !262, scopeLine: 288, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !261, retainedNodes: !1826)
!1826 = !{!1827}
!1827 = !DILocalVariable(name: "this", arg: 1, scope: !1825, type: !1333, flags: DIFlagArtificial | DIFlagObjectPointer)
!1828 = !DILocation(line: 0, scope: !1825)
!1829 = !DILocation(line: 288, column: 7, scope: !1825)
!1830 = !DILocation(line: 288, column: 30, scope: !1825)
!1831 = distinct !DISubprogram(name: "_Vector_impl", linkageName: "_ZNSt12_Vector_baseIiSaIiEE12_Vector_implC2Ev", scope: !79, file: !72, line: 131, type: !228, scopeLine: 134, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !227, retainedNodes: !1832)
!1832 = !{!1833}
!1833 = !DILocalVariable(name: "this", arg: 1, scope: !1831, type: !1433, flags: DIFlagArtificial | DIFlagObjectPointer)
!1834 = !DILocation(line: 0, scope: !1831)
!1835 = !DILocation(line: 133, column: 4, scope: !1831)
!1836 = !DILocation(line: 131, column: 2, scope: !1831)
!1837 = !DILocation(line: 134, column: 4, scope: !1831)
!1838 = distinct !DISubprogram(name: "allocator", linkageName: "_ZNSaIiEC2Ev", scope: !99, file: !100, line: 156, type: !152, scopeLine: 156, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !151, retainedNodes: !1839)
!1839 = !{!1840}
!1840 = !DILocalVariable(name: "this", arg: 1, scope: !1838, type: !1415, flags: DIFlagArtificial | DIFlagObjectPointer)
!1841 = !DILocation(line: 0, scope: !1838)
!1842 = !DILocation(line: 156, column: 7, scope: !1838)
!1843 = !DILocation(line: 156, column: 38, scope: !1838)
!1844 = distinct !DISubprogram(name: "new_allocator", linkageName: "_ZN9__gnu_cxx13new_allocatorIiEC2Ev", scope: !105, file: !106, line: 79, type: !109, scopeLine: 79, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !108, retainedNodes: !1845)
!1845 = !{!1846}
!1846 = !DILocalVariable(name: "this", arg: 1, scope: !1844, type: !1425, flags: DIFlagArtificial | DIFlagObjectPointer)
!1847 = !DILocation(line: 0, scope: !1844)
!1848 = !DILocation(line: 79, column: 47, scope: !1844)
!1849 = distinct !DISubprogram(name: "IExecutionCallback", linkageName: "_ZN4V1_018IExecutionCallbackC2Ev", scope: !622, file: !30, line: 459, type: !647, scopeLine: 459, flags: DIFlagArtificial | DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !1850, retainedNodes: !1851)
!1850 = !DISubprogram(name: "IExecutionCallback", scope: !622, type: !647, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagOptimized)
!1851 = !{!1852}
!1852 = !DILocalVariable(name: "this", arg: 1, scope: !1849, type: !621, flags: DIFlagArtificial | DIFlagObjectPointer)
!1853 = !DILocation(line: 0, scope: !1849)
!1854 = !DILocation(line: 459, column: 12, scope: !1849)
!1855 = distinct !DISubprogram(name: "notify", linkageName: "_ZN4V1_022DummyExecutionCallback6notifyE11ErrorStatus", scope: !1219, file: !30, line: 466, type: !1223, scopeLine: 466, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !1222, retainedNodes: !1856)
!1856 = !{!1857, !1858}
!1857 = !DILocalVariable(name: "this", arg: 1, scope: !1855, type: !1244, flags: DIFlagArtificial | DIFlagObjectPointer)
!1858 = !DILocalVariable(arg: 2, scope: !1855, file: !30, line: 466, type: !29)
!1859 = !DILocation(line: 0, scope: !1855)
!1860 = !DILocation(line: 466, column: 40, scope: !1855)
!1861 = !DILocation(line: 467, column: 20, scope: !1855)
!1862 = !DILocation(line: 467, column: 13, scope: !1855)
!1863 = distinct !DISubprogram(name: "~IExecutionCallback", linkageName: "_ZN4V1_018IExecutionCallbackD2Ev", scope: !622, file: !30, line: 461, type: !647, scopeLine: 461, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !646, retainedNodes: !1864)
!1864 = !{!1865}
!1865 = !DILocalVariable(name: "this", arg: 1, scope: !1863, type: !621, flags: DIFlagArtificial | DIFlagObjectPointer)
!1866 = !DILocation(line: 0, scope: !1863)
!1867 = !DILocation(line: 461, column: 47, scope: !1863)
!1868 = distinct !DISubprogram(name: "~DummyExecutionCallback", linkageName: "_ZN4V1_022DummyExecutionCallbackD0Ev", scope: !1219, file: !30, line: 465, type: !1239, scopeLine: 465, flags: DIFlagArtificial | DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !1869, retainedNodes: !1870)
!1869 = !DISubprogram(name: "~DummyExecutionCallback", scope: !1219, type: !1239, containingType: !1219, virtualIndex: 0, flags: DIFlagArtificial | DIFlagPrototyped, spFlags: DISPFlagVirtual | DISPFlagOptimized)
!1870 = !{!1871}
!1871 = !DILocalVariable(name: "this", arg: 1, scope: !1868, type: !1244, flags: DIFlagArtificial | DIFlagObjectPointer)
!1872 = !DILocation(line: 0, scope: !1868)
!1873 = !DILocation(line: 465, column: 12, scope: !1868)
!1874 = distinct !DISubprogram(name: "~IExecutionCallback", linkageName: "_ZN4V1_018IExecutionCallbackD0Ev", scope: !622, file: !30, line: 461, type: !647, scopeLine: 461, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !646, retainedNodes: !1875)
!1875 = !{!1876}
!1876 = !DILocalVariable(name: "this", arg: 1, scope: !1874, type: !621, flags: DIFlagArtificial | DIFlagObjectPointer)
!1877 = !DILocation(line: 0, scope: !1874)
!1878 = !DILocation(line: 461, column: 47, scope: !1874)
!1879 = distinct !DISubprogram(name: "Return", linkageName: "_ZN6ReturnIvEC2Ev", scope: !632, file: !30, line: 447, type: !635, scopeLine: 447, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !18, declaration: !634, retainedNodes: !1880)
!1880 = !{!1881}
!1881 = !DILocalVariable(name: "this", arg: 1, scope: !1879, type: !1882, flags: DIFlagArtificial | DIFlagObjectPointer)
!1882 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !632, size: 64)
!1883 = !DILocation(line: 0, scope: !1879)
!1884 = !DILocation(line: 447, column: 15, scope: !1879)
