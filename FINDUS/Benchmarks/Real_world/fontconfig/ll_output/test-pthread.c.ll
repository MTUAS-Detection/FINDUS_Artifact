; ModuleID = '/home/demo/fontconfig-shared/test/test-pthread.c'
source_filename = "/home/demo/fontconfig-shared/test/test-pthread.c"
target datalayout = "e-m:e-p270:32:32-p271:32:32-p272:64:64-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.thr_arg_s = type { i32 }

@.str = private unnamed_addr constant [21 x i8] c"Creating %d threads\0A\00", align 1, !dbg !0
@stderr = external global ptr, align 8
@.str.1 = private unnamed_addr constant [25 x i8] c"Cannot create thread %d\0A\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [18 x i8] c"Joined thread %d\0A\00", align 1, !dbg !12
@.str.3 = private unnamed_addr constant [17 x i8] c"Thread %d: done\0A\00", align 1, !dbg !17
@.str.4 = private unnamed_addr constant [23 x i8] c"New Century Schoolbook\00", align 1, !dbg !22

; Function Attrs: nounwind uwtable
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !65 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca [100 x i64], align 16
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.thr_arg_s, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4, !tbaa !87
  call void @llvm.dbg.declare(metadata ptr %4, metadata !71, metadata !DIExpression()), !dbg !91
  store ptr %1, ptr %5, align 8, !tbaa !92
  call void @llvm.dbg.declare(metadata ptr %5, metadata !72, metadata !DIExpression()), !dbg !94
  call void @llvm.lifetime.start.p0(i64 800, ptr %6) #5, !dbg !95
  call void @llvm.dbg.declare(metadata ptr %6, metadata !73, metadata !DIExpression()), !dbg !96
  call void @llvm.lifetime.start.p0(i64 4, ptr %7) #5, !dbg !97
  call void @llvm.dbg.declare(metadata ptr %7, metadata !80, metadata !DIExpression()), !dbg !98
  call void @llvm.lifetime.start.p0(i64 4, ptr %8) #5, !dbg !97
  call void @llvm.dbg.declare(metadata ptr %8, metadata !81, metadata !DIExpression()), !dbg !99
  %12 = call i32 (ptr, ...) @printf(ptr noundef @.str, i32 noundef 100), !dbg !100
  store i32 0, ptr %7, align 4, !dbg !101, !tbaa !87
  br label %13, !dbg !102

13:                                               ; preds = %33, %2
  %14 = load i32, ptr %7, align 4, !dbg !103, !tbaa !87
  %15 = icmp slt i32 %14, 100, !dbg !104
  br i1 %15, label %16, label %36, !dbg !105

16:                                               ; preds = %13
  call void @llvm.lifetime.start.p0(i64 4, ptr %9) #5, !dbg !106
  call void @llvm.dbg.declare(metadata ptr %9, metadata !82, metadata !DIExpression()), !dbg !107
  call void @llvm.lifetime.start.p0(i64 4, ptr %10) #5, !dbg !108
  call void @llvm.dbg.declare(metadata ptr %10, metadata !86, metadata !DIExpression()), !dbg !109
  %17 = load i32, ptr %7, align 4, !dbg !110, !tbaa !87
  %18 = getelementptr inbounds %struct.thr_arg_s, ptr %9, i32 0, i32 0, !dbg !111
  store i32 %17, ptr %18, align 4, !dbg !112, !tbaa !113
  %19 = load i32, ptr %7, align 4, !dbg !115, !tbaa !87
  %20 = sext i32 %19 to i64, !dbg !116
  %21 = getelementptr inbounds [100 x i64], ptr %6, i64 0, i64 %20, !dbg !116
  %22 = call i32 @pthread_create(ptr noundef %21, ptr noundef null, ptr noundef @run_test_in_thread, ptr noundef %9) #5, !dbg !117
  store i32 %22, ptr %10, align 4, !dbg !118, !tbaa !87
  %23 = load i32, ptr %10, align 4, !dbg !119, !tbaa !87
  %24 = icmp ne i32 %23, 0, !dbg !121
  br i1 %24, label %25, label %29, !dbg !122

25:                                               ; preds = %16
  %26 = load ptr, ptr @stderr, align 8, !dbg !123, !tbaa !92
  %27 = load i32, ptr %7, align 4, !dbg !125, !tbaa !87
  %28 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %26, ptr noundef @.str.1, i32 noundef %27), !dbg !126
  store i32 2, ptr %11, align 4
  br label %30, !dbg !127

29:                                               ; preds = %16
  store i32 0, ptr %11, align 4, !dbg !128
  br label %30, !dbg !128

30:                                               ; preds = %29, %25
  call void @llvm.lifetime.end.p0(i64 4, ptr %10) #5, !dbg !128
  call void @llvm.lifetime.end.p0(i64 4, ptr %9) #5, !dbg !128
  %31 = load i32, ptr %11, align 4
  switch i32 %31, label %54 [
    i32 0, label %32
    i32 2, label %36
  ]

32:                                               ; preds = %30
  br label %33, !dbg !129

33:                                               ; preds = %32
  %34 = load i32, ptr %7, align 4, !dbg !130, !tbaa !87
  %35 = add nsw i32 %34, 1, !dbg !130
  store i32 %35, ptr %7, align 4, !dbg !130, !tbaa !87
  br label %13, !dbg !131, !llvm.loop !132

36:                                               ; preds = %30, %13
  store i32 0, ptr %8, align 4, !dbg !136, !tbaa !87
  br label %37, !dbg !138

37:                                               ; preds = %49, %36
  %38 = load i32, ptr %8, align 4, !dbg !139, !tbaa !87
  %39 = load i32, ptr %7, align 4, !dbg !141, !tbaa !87
  %40 = icmp slt i32 %38, %39, !dbg !142
  br i1 %40, label %41, label %52, !dbg !143

41:                                               ; preds = %37
  %42 = load i32, ptr %8, align 4, !dbg !144, !tbaa !87
  %43 = sext i32 %42 to i64, !dbg !146
  %44 = getelementptr inbounds [100 x i64], ptr %6, i64 0, i64 %43, !dbg !146
  %45 = load i64, ptr %44, align 8, !dbg !146, !tbaa !147
  %46 = call i32 @pthread_join(i64 noundef %45, ptr noundef null), !dbg !149
  %47 = load i32, ptr %8, align 4, !dbg !150, !tbaa !87
  %48 = call i32 (ptr, ...) @printf(ptr noundef @.str.2, i32 noundef %47), !dbg !151
  br label %49, !dbg !152

49:                                               ; preds = %41
  %50 = load i32, ptr %8, align 4, !dbg !153, !tbaa !87
  %51 = add nsw i32 %50, 1, !dbg !153
  store i32 %51, ptr %8, align 4, !dbg !153, !tbaa !87
  br label %37, !dbg !154, !llvm.loop !155

52:                                               ; preds = %37
  call void @FcFini(), !dbg !157
  store i32 0, ptr %3, align 4, !dbg !158
  store i32 1, ptr %11, align 4
  call void @llvm.lifetime.end.p0(i64 4, ptr %8) #5, !dbg !159
  call void @llvm.lifetime.end.p0(i64 4, ptr %7) #5, !dbg !159
  call void @llvm.lifetime.end.p0(i64 800, ptr %6) #5, !dbg !159
  %53 = load i32, ptr %3, align 4, !dbg !159
  ret i32 %53, !dbg !159

54:                                               ; preds = %30
  unreachable
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

declare !dbg !160 i32 @printf(ptr noundef, ...) #3

; Function Attrs: nounwind
declare !dbg !168 i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #4

; Function Attrs: nounwind uwtable
define internal ptr @run_test_in_thread(ptr noundef %0) #0 !dbg !190 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  store ptr %0, ptr %2, align 8, !tbaa !92
  call void @llvm.dbg.declare(metadata ptr %2, metadata !192, metadata !DIExpression()), !dbg !196
  call void @llvm.lifetime.start.p0(i64 8, ptr %3) #5, !dbg !197
  call void @llvm.dbg.declare(metadata ptr %3, metadata !193, metadata !DIExpression()), !dbg !198
  %6 = load ptr, ptr %2, align 8, !dbg !199, !tbaa !92
  store ptr %6, ptr %3, align 8, !dbg !198, !tbaa !92
  call void @llvm.lifetime.start.p0(i64 4, ptr %4) #5, !dbg !200
  call void @llvm.dbg.declare(metadata ptr %4, metadata !194, metadata !DIExpression()), !dbg !201
  %7 = load ptr, ptr %3, align 8, !dbg !202, !tbaa !92
  %8 = getelementptr inbounds %struct.thr_arg_s, ptr %7, i32 0, i32 0, !dbg !203
  %9 = load i32, ptr %8, align 4, !dbg !203, !tbaa !113
  store i32 %9, ptr %4, align 4, !dbg !201, !tbaa !87
  call void @llvm.lifetime.start.p0(i64 4, ptr %5) #5, !dbg !204
  call void @llvm.dbg.declare(metadata ptr %5, metadata !195, metadata !DIExpression()), !dbg !205
  store i32 0, ptr %5, align 4, !dbg !205, !tbaa !87
  br label %10, !dbg !206

10:                                               ; preds = %16, %1
  %11 = load i32, ptr %5, align 4, !dbg !207, !tbaa !87
  %12 = icmp slt i32 %11, 100, !dbg !210
  br i1 %12, label %13, label %19, !dbg !211

13:                                               ; preds = %10
  %14 = load i32, ptr %4, align 4, !dbg !212, !tbaa !87
  %15 = load i32, ptr %5, align 4, !dbg !213, !tbaa !87
  call void @test_match(i32 noundef %14, i32 noundef %15), !dbg !214
  br label %16, !dbg !214

16:                                               ; preds = %13
  %17 = load i32, ptr %5, align 4, !dbg !215, !tbaa !87
  %18 = add nsw i32 %17, 1, !dbg !215
  store i32 %18, ptr %5, align 4, !dbg !215, !tbaa !87
  br label %10, !dbg !216, !llvm.loop !217

19:                                               ; preds = %10
  %20 = load i32, ptr %4, align 4, !dbg !219, !tbaa !87
  %21 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, i32 noundef %20), !dbg !220
  call void @llvm.lifetime.end.p0(i64 4, ptr %5) #5, !dbg !221
  call void @llvm.lifetime.end.p0(i64 4, ptr %4) #5, !dbg !221
  call void @llvm.lifetime.end.p0(i64 8, ptr %3) #5, !dbg !221
  ret ptr null, !dbg !222
}

declare !dbg !223 i32 @fprintf(ptr noundef, ptr noundef, ...) #3

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

declare !dbg !284 i32 @pthread_join(i64 noundef, ptr noundef) #3

declare !dbg !288 void @FcFini() #3

; Function Attrs: nounwind uwtable
define internal void @test_match(i32 noundef %0, i32 noundef %1) #0 !dbg !291 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store i32 %0, ptr %3, align 4, !tbaa !87
  call void @llvm.dbg.declare(metadata ptr %3, metadata !295, metadata !DIExpression()), !dbg !304
  store i32 %1, ptr %4, align 4, !tbaa !87
  call void @llvm.dbg.declare(metadata ptr %4, metadata !296, metadata !DIExpression()), !dbg !305
  call void @llvm.lifetime.start.p0(i64 8, ptr %5) #5, !dbg !306
  call void @llvm.dbg.declare(metadata ptr %5, metadata !297, metadata !DIExpression()), !dbg !307
  call void @llvm.lifetime.start.p0(i64 8, ptr %6) #5, !dbg !308
  call void @llvm.dbg.declare(metadata ptr %6, metadata !301, metadata !DIExpression()), !dbg !309
  call void @llvm.lifetime.start.p0(i64 4, ptr %7) #5, !dbg !310
  call void @llvm.dbg.declare(metadata ptr %7, metadata !302, metadata !DIExpression()), !dbg !311
  %8 = call i32 @FcInit(), !dbg !312
  %9 = call ptr @FcNameParse(ptr noundef @.str.4), !dbg !313
  store ptr %9, ptr %5, align 8, !dbg !314, !tbaa !92
  %10 = load ptr, ptr %5, align 8, !dbg !315, !tbaa !92
  %11 = call i32 @FcConfigSubstitute(ptr noundef null, ptr noundef %10, i32 noundef 0), !dbg !316
  %12 = load ptr, ptr %5, align 8, !dbg !317, !tbaa !92
  call void @FcDefaultSubstitute(ptr noundef %12), !dbg !318
  %13 = load ptr, ptr %5, align 8, !dbg !319, !tbaa !92
  %14 = call ptr @FcFontMatch(ptr noundef null, ptr noundef %13, ptr noundef %7), !dbg !320
  store ptr %14, ptr %6, align 8, !dbg !321, !tbaa !92
  %15 = load ptr, ptr %5, align 8, !dbg !322, !tbaa !92
  call void @FcPatternDestroy(ptr noundef %15), !dbg !323
  %16 = load ptr, ptr %6, align 8, !dbg !324, !tbaa !92
  call void @FcPatternDestroy(ptr noundef %16), !dbg !325
  call void @llvm.lifetime.end.p0(i64 4, ptr %7) #5, !dbg !326
  call void @llvm.lifetime.end.p0(i64 8, ptr %6) #5, !dbg !326
  call void @llvm.lifetime.end.p0(i64 8, ptr %5) #5, !dbg !326
  ret void, !dbg !326
}

declare !dbg !327 i32 @FcInit() #3

declare !dbg !331 ptr @FcNameParse(ptr noundef) #3

declare !dbg !334 i32 @FcConfigSubstitute(ptr noundef, ptr noundef, i32 noundef) #3

declare !dbg !341 void @FcDefaultSubstitute(ptr noundef) #3

declare !dbg !344 ptr @FcFontMatch(ptr noundef, ptr noundef, ptr noundef) #3

declare !dbg !348 void @FcPatternDestroy(ptr noundef) #3

attributes #0 = { nounwind uwtable "min-legal-vector-width"="0" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #4 = { nounwind "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+cx8,+fxsr,+mmx,+sse,+sse2,+x87" "tune-cpu"="generic" }
attributes #5 = { nounwind }

!llvm.dbg.cu = !{!27}
!llvm.module.flags = !{!58, !59, !60, !61, !62, !63}
!llvm.ident = !{!64}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 78, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "fontconfig-shared/test/test-pthread.c", directory: "/home/demo", checksumkind: CSK_MD5, checksum: "b03fb21936197101e3c6963ccd99a206")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 168, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 21)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 89, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 200, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 25)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 97, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 144, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 18)
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(scope: null, file: !2, line: 68, type: !19, isLocal: true, isDefinition: true)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 136, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 17)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(scope: null, file: !2, line: 49, type: !24, isLocal: true, isDefinition: true)
!24 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 184, elements: !25)
!25 = !{!26}
!26 = !DISubrange(count: 23)
!27 = distinct !DICompileUnit(language: DW_LANG_C11, file: !28, producer: "clang version 16.0.0", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !29, retainedTypes: !46, globals: !57, splitDebugInlining: false, nameTableKind: None)
!28 = !DIFile(filename: "/home/demo/fontconfig-shared/test/test-pthread.c", directory: "/home/demo", checksumkind: CSK_MD5, checksum: "b03fb21936197101e3c6963ccd99a206")
!29 = !{!30, !39}
!30 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "_FcResult", file: !31, line: 238, baseType: !32, size: 32, elements: !33)
!31 = !DIFile(filename: "/usr/include/fontconfig/fontconfig.h", directory: "", checksumkind: CSK_MD5, checksum: "74710ecd6dfb359d6d1cf05935691155")
!32 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!33 = !{!34, !35, !36, !37, !38}
!34 = !DIEnumerator(name: "FcResultMatch", value: 0)
!35 = !DIEnumerator(name: "FcResultNoMatch", value: 1)
!36 = !DIEnumerator(name: "FcResultTypeMismatch", value: 2)
!37 = !DIEnumerator(name: "FcResultNoId", value: 3)
!38 = !DIEnumerator(name: "FcResultOutOfMemory", value: 4)
!39 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "_FcMatchKind", file: !31, line: 287, baseType: !32, size: 32, elements: !40)
!40 = !{!41, !42, !43, !44, !45}
!41 = !DIEnumerator(name: "FcMatchPattern", value: 0)
!42 = !DIEnumerator(name: "FcMatchFont", value: 1)
!43 = !DIEnumerator(name: "FcMatchScan", value: 2)
!44 = !DIEnumerator(name: "FcMatchKindEnd", value: 3)
!45 = !DIEnumerator(name: "FcMatchKindBegin", value: 0)
!46 = !{!47, !48, !53}
!47 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!48 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !49, size: 64)
!49 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "thr_arg_s", file: !2, line: 36, size: 32, elements: !50)
!50 = !{!51}
!51 = !DIDerivedType(tag: DW_TAG_member, name: "thr_num", scope: !49, file: !2, line: 38, baseType: !52, size: 32)
!52 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!53 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !54, size: 64)
!54 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !55)
!55 = !DIDerivedType(tag: DW_TAG_typedef, name: "FcChar8", file: !31, line: 43, baseType: !56)
!56 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!57 = !{!0, !7, !12, !17, !22}
!58 = !{i32 7, !"Dwarf Version", i32 5}
!59 = !{i32 2, !"Debug Info Version", i32 3}
!60 = !{i32 1, !"wchar_size", i32 4}
!61 = !{i32 8, !"PIC Level", i32 2}
!62 = !{i32 7, !"PIE Level", i32 2}
!63 = !{i32 7, !"uwtable", i32 2}
!64 = !{!"clang version 16.0.0"}
!65 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 73, type: !66, scopeLine: 74, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !27, retainedNodes: !70)
!66 = !DISubroutineType(types: !67)
!67 = !{!52, !52, !68}
!68 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !69, size: 64)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!70 = !{!71, !72, !73, !80, !81, !82, !86}
!71 = !DILocalVariable(name: "argc", arg: 1, scope: !65, file: !2, line: 73, type: !52)
!72 = !DILocalVariable(name: "argv", arg: 2, scope: !65, file: !2, line: 73, type: !68)
!73 = !DILocalVariable(name: "threads", scope: !65, file: !2, line: 75, type: !74)
!74 = !DICompositeType(tag: DW_TAG_array_type, baseType: !75, size: 6400, elements: !78)
!75 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !76, line: 27, baseType: !77)
!76 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h", directory: "", checksumkind: CSK_MD5, checksum: "735e3bf264ff9d8f5d95898b1692fbdb")
!77 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!78 = !{!79}
!79 = !DISubrange(count: 100)
!80 = !DILocalVariable(name: "i", scope: !65, file: !2, line: 76, type: !52)
!81 = !DILocalVariable(name: "j", scope: !65, file: !2, line: 76, type: !52)
!82 = !DILocalVariable(name: "thr_arg", scope: !83, file: !2, line: 82, type: !49)
!83 = distinct !DILexicalBlock(scope: !84, file: !2, line: 81, column: 2)
!84 = distinct !DILexicalBlock(scope: !85, file: !2, line: 80, column: 2)
!85 = distinct !DILexicalBlock(scope: !65, file: !2, line: 80, column: 2)
!86 = !DILocalVariable(name: "result", scope: !83, file: !2, line: 83, type: !52)
!87 = !{!88, !88, i64 0}
!88 = !{!"int", !89, i64 0}
!89 = !{!"omnipotent char", !90, i64 0}
!90 = !{!"Simple C/C++ TBAA"}
!91 = !DILocation(line: 73, column: 14, scope: !65)
!92 = !{!93, !93, i64 0}
!93 = !{!"any pointer", !89, i64 0}
!94 = !DILocation(line: 73, column: 26, scope: !65)
!95 = !DILocation(line: 75, column: 2, scope: !65)
!96 = !DILocation(line: 75, column: 12, scope: !65)
!97 = !DILocation(line: 76, column: 2, scope: !65)
!98 = !DILocation(line: 76, column: 6, scope: !65)
!99 = !DILocation(line: 76, column: 9, scope: !65)
!100 = !DILocation(line: 78, column: 2, scope: !65)
!101 = !DILocation(line: 80, column: 8, scope: !85)
!102 = !DILocation(line: 80, column: 6, scope: !85)
!103 = !DILocation(line: 80, column: 12, scope: !84)
!104 = !DILocation(line: 80, column: 13, scope: !84)
!105 = !DILocation(line: 80, column: 2, scope: !85)
!106 = !DILocation(line: 82, column: 3, scope: !83)
!107 = !DILocation(line: 82, column: 20, scope: !83)
!108 = !DILocation(line: 83, column: 3, scope: !83)
!109 = !DILocation(line: 83, column: 7, scope: !83)
!110 = !DILocation(line: 84, column: 19, scope: !83)
!111 = !DILocation(line: 84, column: 11, scope: !83)
!112 = !DILocation(line: 84, column: 18, scope: !83)
!113 = !{!114, !88, i64 0}
!114 = !{!"thr_arg_s", !88, i64 0}
!115 = !DILocation(line: 85, column: 36, scope: !83)
!116 = !DILocation(line: 85, column: 28, scope: !83)
!117 = !DILocation(line: 85, column: 12, scope: !83)
!118 = !DILocation(line: 85, column: 10, scope: !83)
!119 = !DILocation(line: 87, column: 6, scope: !120)
!120 = distinct !DILexicalBlock(scope: !83, file: !2, line: 87, column: 6)
!121 = !DILocation(line: 87, column: 12, scope: !120)
!122 = !DILocation(line: 87, column: 6, scope: !83)
!123 = !DILocation(line: 89, column: 12, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !2, line: 88, column: 3)
!125 = !DILocation(line: 89, column: 47, scope: !124)
!126 = !DILocation(line: 89, column: 4, scope: !124)
!127 = !DILocation(line: 90, column: 4, scope: !124)
!128 = !DILocation(line: 92, column: 2, scope: !84)
!129 = !DILocation(line: 92, column: 2, scope: !83)
!130 = !DILocation(line: 80, column: 20, scope: !84)
!131 = !DILocation(line: 80, column: 2, scope: !84)
!132 = distinct !{!132, !105, !133, !134, !135}
!133 = !DILocation(line: 92, column: 2, scope: !85)
!134 = !{!"llvm.loop.mustprogress"}
!135 = !{!"llvm.loop.unroll.disable"}
!136 = !DILocation(line: 94, column: 7, scope: !137)
!137 = distinct !DILexicalBlock(scope: !65, file: !2, line: 94, column: 2)
!138 = !DILocation(line: 94, column: 6, scope: !137)
!139 = !DILocation(line: 94, column: 10, scope: !140)
!140 = distinct !DILexicalBlock(scope: !137, file: !2, line: 94, column: 2)
!141 = !DILocation(line: 94, column: 12, scope: !140)
!142 = !DILocation(line: 94, column: 11, scope: !140)
!143 = !DILocation(line: 94, column: 2, scope: !137)
!144 = !DILocation(line: 96, column: 24, scope: !145)
!145 = distinct !DILexicalBlock(scope: !140, file: !2, line: 95, column: 2)
!146 = !DILocation(line: 96, column: 16, scope: !145)
!147 = !{!148, !148, i64 0}
!148 = !{!"long", !89, i64 0}
!149 = !DILocation(line: 96, column: 3, scope: !145)
!150 = !DILocation(line: 97, column: 31, scope: !145)
!151 = !DILocation(line: 97, column: 3, scope: !145)
!152 = !DILocation(line: 98, column: 2, scope: !145)
!153 = !DILocation(line: 94, column: 15, scope: !140)
!154 = !DILocation(line: 94, column: 2, scope: !140)
!155 = distinct !{!155, !143, !156, !134, !135}
!156 = !DILocation(line: 98, column: 2, scope: !137)
!157 = !DILocation(line: 100, column: 2, scope: !65)
!158 = !DILocation(line: 102, column: 2, scope: !65)
!159 = !DILocation(line: 103, column: 1, scope: !65)
!160 = !DISubprogram(name: "printf", scope: !161, file: !161, line: 356, type: !162, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !167)
!161 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "f31eefcc3f15835fc5a4023a625cf609")
!162 = !DISubroutineType(types: !163)
!163 = !{!52, !164, null}
!164 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !165)
!165 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !166, size: 64)
!166 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!167 = !{}
!168 = !DISubprogram(name: "pthread_create", scope: !169, file: !169, line: 202, type: !170, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !167)
!169 = !DIFile(filename: "/usr/include/pthread.h", directory: "", checksumkind: CSK_MD5, checksum: "5205981c6f80cc3dc1e81231df63d8ef")
!170 = !DISubroutineType(types: !171)
!171 = !{!52, !172, !174, !186, !189}
!172 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !173)
!173 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!174 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !175)
!175 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !176, size: 64)
!176 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !177)
!177 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_attr_t", file: !76, line: 62, baseType: !178)
!178 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "pthread_attr_t", file: !76, line: 56, size: 448, elements: !179)
!179 = !{!180, !184}
!180 = !DIDerivedType(tag: DW_TAG_member, name: "__size", scope: !178, file: !76, line: 58, baseType: !181, size: 448)
!181 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 448, elements: !182)
!182 = !{!183}
!183 = !DISubrange(count: 56)
!184 = !DIDerivedType(tag: DW_TAG_member, name: "__align", scope: !178, file: !76, line: 59, baseType: !185, size: 64)
!185 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!186 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !187, size: 64)
!187 = !DISubroutineType(types: !188)
!188 = !{!47, !47}
!189 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !47)
!190 = distinct !DISubprogram(name: "run_test_in_thread", scope: !2, file: !2, line: 60, type: !187, scopeLine: 61, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !27, retainedNodes: !191)
!191 = !{!192, !193, !194, !195}
!192 = !DILocalVariable(name: "arg", arg: 1, scope: !190, file: !2, line: 60, type: !47)
!193 = !DILocalVariable(name: "thr_arg", scope: !190, file: !2, line: 62, type: !48)
!194 = !DILocalVariable(name: "thread_num", scope: !190, file: !2, line: 63, type: !52)
!195 = !DILocalVariable(name: "i", scope: !190, file: !2, line: 64, type: !52)
!196 = !DILocation(line: 60, column: 39, scope: !190)
!197 = !DILocation(line: 62, column: 2, scope: !190)
!198 = !DILocation(line: 62, column: 20, scope: !190)
!199 = !DILocation(line: 62, column: 48, scope: !190)
!200 = !DILocation(line: 63, column: 2, scope: !190)
!201 = !DILocation(line: 63, column: 6, scope: !190)
!202 = !DILocation(line: 63, column: 19, scope: !190)
!203 = !DILocation(line: 63, column: 28, scope: !190)
!204 = !DILocation(line: 64, column: 2, scope: !190)
!205 = !DILocation(line: 64, column: 6, scope: !190)
!206 = !DILocation(line: 66, column: 2, scope: !190)
!207 = !DILocation(line: 66, column: 7, scope: !208)
!208 = distinct !DILexicalBlock(scope: !209, file: !2, line: 66, column: 2)
!209 = distinct !DILexicalBlock(scope: !190, file: !2, line: 66, column: 2)
!210 = !DILocation(line: 66, column: 8, scope: !208)
!211 = !DILocation(line: 66, column: 2, scope: !209)
!212 = !DILocation(line: 66, column: 31, scope: !208)
!213 = !DILocation(line: 66, column: 42, scope: !208)
!214 = !DILocation(line: 66, column: 20, scope: !208)
!215 = !DILocation(line: 66, column: 16, scope: !208)
!216 = !DILocation(line: 66, column: 2, scope: !208)
!217 = distinct !{!217, !211, !218, !134, !135}
!218 = !DILocation(line: 66, column: 43, scope: !209)
!219 = !DILocation(line: 68, column: 29, scope: !190)
!220 = !DILocation(line: 68, column: 2, scope: !190)
!221 = !DILocation(line: 71, column: 1, scope: !190)
!222 = !DILocation(line: 70, column: 2, scope: !190)
!223 = !DISubprogram(name: "fprintf", scope: !161, file: !161, line: 350, type: !224, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !167)
!224 = !DISubroutineType(types: !225)
!225 = !{!52, !226, !164, null}
!226 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !227)
!227 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !228, size: 64)
!228 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !229, line: 7, baseType: !230)
!229 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "571f9fb6223c42439075fdde11a0de5d")
!230 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !231, line: 49, size: 1728, elements: !232)
!231 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "1bad07471b7974df4ecc1d1c2ca207e6")
!232 = !{!233, !234, !235, !236, !237, !238, !239, !240, !241, !242, !243, !244, !245, !248, !250, !251, !252, !255, !257, !259, !263, !266, !268, !271, !274, !275, !276, !279, !280}
!233 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !230, file: !231, line: 51, baseType: !52, size: 32)
!234 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !230, file: !231, line: 54, baseType: !69, size: 64, offset: 64)
!235 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !230, file: !231, line: 55, baseType: !69, size: 64, offset: 128)
!236 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !230, file: !231, line: 56, baseType: !69, size: 64, offset: 192)
!237 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !230, file: !231, line: 57, baseType: !69, size: 64, offset: 256)
!238 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !230, file: !231, line: 58, baseType: !69, size: 64, offset: 320)
!239 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !230, file: !231, line: 59, baseType: !69, size: 64, offset: 384)
!240 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !230, file: !231, line: 60, baseType: !69, size: 64, offset: 448)
!241 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !230, file: !231, line: 61, baseType: !69, size: 64, offset: 512)
!242 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !230, file: !231, line: 64, baseType: !69, size: 64, offset: 576)
!243 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !230, file: !231, line: 65, baseType: !69, size: 64, offset: 640)
!244 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !230, file: !231, line: 66, baseType: !69, size: 64, offset: 704)
!245 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !230, file: !231, line: 68, baseType: !246, size: 64, offset: 768)
!246 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !247, size: 64)
!247 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !231, line: 36, flags: DIFlagFwdDecl)
!248 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !230, file: !231, line: 70, baseType: !249, size: 64, offset: 832)
!249 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !230, size: 64)
!250 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !230, file: !231, line: 72, baseType: !52, size: 32, offset: 896)
!251 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !230, file: !231, line: 73, baseType: !52, size: 32, offset: 928)
!252 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !230, file: !231, line: 74, baseType: !253, size: 64, offset: 960)
!253 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !254, line: 152, baseType: !185)
!254 = !DIFile(filename: "/usr/include/x86_64-linux-gnu/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!255 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !230, file: !231, line: 77, baseType: !256, size: 16, offset: 1024)
!256 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!257 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !230, file: !231, line: 78, baseType: !258, size: 8, offset: 1040)
!258 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!259 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !230, file: !231, line: 79, baseType: !260, size: 8, offset: 1048)
!260 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 8, elements: !261)
!261 = !{!262}
!262 = !DISubrange(count: 1)
!263 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !230, file: !231, line: 81, baseType: !264, size: 64, offset: 1088)
!264 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !265, size: 64)
!265 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !231, line: 43, baseType: null)
!266 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !230, file: !231, line: 89, baseType: !267, size: 64, offset: 1152)
!267 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !254, line: 153, baseType: !185)
!268 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !230, file: !231, line: 91, baseType: !269, size: 64, offset: 1216)
!269 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !270, size: 64)
!270 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !231, line: 37, flags: DIFlagFwdDecl)
!271 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !230, file: !231, line: 92, baseType: !272, size: 64, offset: 1280)
!272 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !273, size: 64)
!273 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !231, line: 38, flags: DIFlagFwdDecl)
!274 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !230, file: !231, line: 93, baseType: !249, size: 64, offset: 1344)
!275 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !230, file: !231, line: 94, baseType: !47, size: 64, offset: 1408)
!276 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !230, file: !231, line: 95, baseType: !277, size: 64, offset: 1472)
!277 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !278, line: 46, baseType: !77)
!278 = !DIFile(filename: "SVF/llvm-16.0.0.obj/lib/clang/16/include/stddef.h", directory: "/home/demo", checksumkind: CSK_MD5, checksum: "f95079da609b0e8f201cb8136304bf3b")
!279 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !230, file: !231, line: 96, baseType: !52, size: 32, offset: 1536)
!280 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !230, file: !231, line: 98, baseType: !281, size: 160, offset: 1568)
!281 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 160, elements: !282)
!282 = !{!283}
!283 = !DISubrange(count: 20)
!284 = !DISubprogram(name: "pthread_join", scope: !169, file: !169, line: 219, type: !285, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !167)
!285 = !DISubroutineType(types: !286)
!286 = !{!52, !75, !287}
!287 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !47, size: 64)
!288 = !DISubprogram(name: "FcFini", scope: !31, file: !31, line: 645, type: !289, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !167)
!289 = !DISubroutineType(types: !290)
!290 = !{null}
!291 = distinct !DISubprogram(name: "test_match", scope: !2, file: !2, line: 41, type: !292, scopeLine: 42, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !27, retainedNodes: !294)
!292 = !DISubroutineType(types: !293)
!293 = !{null, !52, !52}
!294 = !{!295, !296, !297, !301, !302}
!295 = !DILocalVariable(name: "thr_num", arg: 1, scope: !291, file: !2, line: 41, type: !52)
!296 = !DILocalVariable(name: "test_num", arg: 2, scope: !291, file: !2, line: 41, type: !52)
!297 = !DILocalVariable(name: "pat", scope: !291, file: !2, line: 43, type: !298)
!298 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !299, size: 64)
!299 = !DIDerivedType(tag: DW_TAG_typedef, name: "FcPattern", file: !31, line: 249, baseType: !300)
!300 = !DICompositeType(tag: DW_TAG_structure_type, name: "_FcPattern", file: !31, line: 249, flags: DIFlagFwdDecl)
!301 = !DILocalVariable(name: "match", scope: !291, file: !2, line: 44, type: !298)
!302 = !DILocalVariable(name: "result", scope: !291, file: !2, line: 45, type: !303)
!303 = !DIDerivedType(tag: DW_TAG_typedef, name: "FcResult", file: !31, line: 241, baseType: !30)
!304 = !DILocation(line: 41, column: 28, scope: !291)
!305 = !DILocation(line: 41, column: 40, scope: !291)
!306 = !DILocation(line: 43, column: 2, scope: !291)
!307 = !DILocation(line: 43, column: 13, scope: !291)
!308 = !DILocation(line: 44, column: 2, scope: !291)
!309 = !DILocation(line: 44, column: 13, scope: !291)
!310 = !DILocation(line: 45, column: 2, scope: !291)
!311 = !DILocation(line: 45, column: 12, scope: !291)
!312 = !DILocation(line: 47, column: 2, scope: !291)
!313 = !DILocation(line: 49, column: 8, scope: !291)
!314 = !DILocation(line: 49, column: 6, scope: !291)
!315 = !DILocation(line: 51, column: 23, scope: !291)
!316 = !DILocation(line: 51, column: 2, scope: !291)
!317 = !DILocation(line: 52, column: 22, scope: !291)
!318 = !DILocation(line: 52, column: 2, scope: !291)
!319 = !DILocation(line: 54, column: 24, scope: !291)
!320 = !DILocation(line: 54, column: 10, scope: !291)
!321 = !DILocation(line: 54, column: 8, scope: !291)
!322 = !DILocation(line: 56, column: 19, scope: !291)
!323 = !DILocation(line: 56, column: 2, scope: !291)
!324 = !DILocation(line: 57, column: 19, scope: !291)
!325 = !DILocation(line: 57, column: 2, scope: !291)
!326 = !DILocation(line: 58, column: 1, scope: !291)
!327 = !DISubprogram(name: "FcInit", scope: !31, file: !31, line: 642, type: !328, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !167)
!328 = !DISubroutineType(types: !329)
!329 = !{!330}
!330 = !DIDerivedType(tag: DW_TAG_typedef, name: "FcBool", file: !31, line: 46, baseType: !52)
!331 = !DISubprogram(name: "FcNameParse", scope: !31, file: !31, line: 843, type: !332, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !167)
!332 = !DISubroutineType(types: !333)
!333 = !{!298, !53}
!334 = !DISubprogram(name: "FcConfigSubstitute", scope: !31, file: !31, line: 465, type: !335, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !167)
!335 = !DISubroutineType(types: !336)
!336 = !{!330, !337, !298, !340}
!337 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !338, size: 64)
!338 = !DIDerivedType(tag: DW_TAG_typedef, name: "FcConfig", file: !31, line: 323, baseType: !339)
!339 = !DICompositeType(tag: DW_TAG_structure_type, name: "_FcConfig", file: !31, line: 323, flags: DIFlagFwdDecl)
!340 = !DIDerivedType(tag: DW_TAG_typedef, name: "FcMatchKind", file: !31, line: 291, baseType: !39)
!341 = !DISubprogram(name: "FcDefaultSubstitute", scope: !31, file: !31, line: 576, type: !342, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !167)
!342 = !DISubroutineType(types: !343)
!343 = !{null, !298}
!344 = !DISubprogram(name: "FcFontMatch", scope: !31, file: !31, line: 768, type: !345, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !167)
!345 = !DISubroutineType(types: !346)
!346 = !{!298, !337, !298, !347}
!347 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !303, size: 64)
!348 = !DISubprogram(name: "FcPatternDestroy", scope: !31, file: !31, line: 871, type: !342, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !167)
