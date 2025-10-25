; ModuleID = 'pping_kern.c'
source_filename = "pping_kern.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.anon.3 = type { ptr, ptr, ptr, ptr }
%struct.anon.5 = type { ptr, ptr, ptr, ptr }
%struct.anon.6 = type { ptr, ptr, ptr }
%struct.bpf_config = type { i64, i64, i8, i8, i8, i8, i32 }
%struct.parsing_context = type { ptr, ptr, %struct.hdr_cursor, i32, i32, i8 }
%struct.hdr_cursor = type { ptr }
%struct.__sk_buff = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [5 x i32], i32, i32, i32, i32, i32, i32, i32, i32, [4 x i32], [4 x i32], i32, i32, i32, %union.anon, i64, i32, i32, %union.anon.2, i32 }
%union.anon = type { ptr }
%union.anon.2 = type { ptr }
%struct.packet_info = type { %union.anon.7, %union.anon.14, i64, i32, %struct.packet_id, %struct.packet_id, i8, i8, i8, i8 }
%union.anon.7 = type { ptr }
%union.anon.14 = type { ptr }
%struct.packet_id = type { %struct.network_tuple, i32 }
%struct.network_tuple = type { %struct.flow_address, %struct.flow_address, i16, i8, i8 }
%struct.flow_address = type { %struct.in6_addr, i16, i16 }
%struct.in6_addr = type { %union.anon.4 }
%union.anon.4 = type { [4 x i32] }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon.8 }
%union.anon.8 = type { %struct.anon.9 }
%struct.anon.9 = type { i32, i32 }
%struct.ipv6hdr = type { i8, [3 x i8], i16, i8, i8, %union.anon.11 }
%union.anon.11 = type { %struct.anon.12 }
%struct.anon.12 = type { %struct.in6_addr, %struct.in6_addr }
%struct.flow_state = type { i64, i64, i64, i64, i64, i64, i64, i32, i8, i8, i16 }
%struct.rtt_event = type { i64, i64, %struct.network_tuple, i32, i64, i64, i64, i64, i64, i64, i8, [7 x i8] }
%struct.tcphdr = type { i16, i16, i32, i32, i16, i16, i16, i16 }
%struct.icmp6hdr = type { i8, i8, i16, %union.anon.18 }
%union.anon.18 = type { [1 x i32] }
%struct.icmpv6_echo = type { i16, i16 }
%struct.icmphdr = type { i8, i8, i16, %union.anon.15 }
%union.anon.15 = type { i32 }
%struct.anon.16 = type { i16, i16 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.vlan_hdr = type { i16, i16 }
%struct.collect_vlans = type { [2 x i16] }
%struct.ipv6_opt_hdr = type { i8, i8 }
%struct.map_full_event = type { i64, i64, %struct.network_tuple, i8, [3 x i8] }
%struct.bpf_fib_lookup = type { i8, i8, i16, i16, i16, i32, %union.anon.19, %union.anon.20, %union.anon.21, i16, i16, [6 x i8], [6 x i8] }
%union.anon.19 = type { i32 }
%union.anon.20 = type { [4 x i32] }
%union.anon.21 = type { [4 x i32] }
%struct.flow_event = type { i64, i64, %struct.network_tuple, i8, i8, i8, i8 }

@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !0
@packet_ts = dso_local global %struct.anon.3 zeroinitializer, section ".maps", align 8, !dbg !129
@flow_state = dso_local global %struct.anon.5 zeroinitializer, section ".maps", align 8, !dbg !166
@events = dso_local global %struct.anon.6 zeroinitializer, section ".maps", align 8, !dbg !190
@bpf_ktime_get_ns = internal global ptr inttoptr (i64 5 to ptr), align 8, !dbg !199
@config = internal constant %struct.bpf_config zeroinitializer, align 8, !dbg !205
@bpf_map_lookup_elem = internal global ptr inttoptr (i64 1 to ptr), align 8, !dbg !219
@bpf_map_update_elem = internal global ptr inttoptr (i64 2 to ptr), align 8, !dbg !226
@last_warn_time = internal global [2 x i64] zeroinitializer, align 8, !dbg !231
@bpf_perf_event_output = internal global ptr inttoptr (i64 25 to ptr), align 8, !dbg !237
@bpf_fib_lookup = internal global ptr inttoptr (i64 69 to ptr), align 8, !dbg !242
@bpf_map_delete_elem = internal global ptr inttoptr (i64 3 to ptr), align 8, !dbg !280
@llvm.compiler.used = appending global [7 x ptr] [ptr @_license, ptr @pping_tc_egress, ptr @pping_tc_ingress, ptr @pping_xdp_ingress, ptr @packet_ts, ptr @flow_state, ptr @events], section "llvm.metadata"

; Function Attrs: nounwind
define dso_local i32 @pping_tc_egress(ptr noundef %0) #0 section "tc" !dbg !291 {
  %2 = alloca ptr, align 8
  %3 = alloca %struct.parsing_context, align 8
  store ptr %0, ptr %2, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %2, metadata !385, metadata !DIExpression()), !dbg !403
  call void @llvm.lifetime.start.p0(i64 40, ptr %3) #7, !dbg !404
  call void @llvm.dbg.declare(metadata ptr %3, metadata !386, metadata !DIExpression()), !dbg !405
  %4 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 0, !dbg !406
  %5 = load ptr, ptr %2, align 8, !dbg !407, !tbaa !399
  %6 = getelementptr inbounds %struct.__sk_buff, ptr %5, i32 0, i32 15, !dbg !408
  %7 = load i32, ptr %6, align 4, !dbg !408, !tbaa !409
  %8 = zext i32 %7 to i64, !dbg !413
  %9 = inttoptr i64 %8 to ptr, !dbg !414
  store ptr %9, ptr %4, align 8, !dbg !406, !tbaa !415
  %10 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 1, !dbg !406
  %11 = load ptr, ptr %2, align 8, !dbg !419, !tbaa !399
  %12 = getelementptr inbounds %struct.__sk_buff, ptr %11, i32 0, i32 16, !dbg !420
  %13 = load i32, ptr %12, align 8, !dbg !420, !tbaa !421
  %14 = zext i32 %13 to i64, !dbg !422
  %15 = inttoptr i64 %14 to ptr, !dbg !423
  store ptr %15, ptr %10, align 8, !dbg !406, !tbaa !424
  %16 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 2, !dbg !406
  %17 = getelementptr inbounds %struct.hdr_cursor, ptr %16, i32 0, i32 0, !dbg !425
  %18 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 0, !dbg !426
  %19 = load ptr, ptr %18, align 8, !dbg !426, !tbaa !415
  store ptr %19, ptr %17, align 8, !dbg !425, !tbaa !427
  %20 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 3, !dbg !406
  %21 = load ptr, ptr %2, align 8, !dbg !428, !tbaa !399
  %22 = getelementptr inbounds %struct.__sk_buff, ptr %21, i32 0, i32 0, !dbg !429
  %23 = load i32, ptr %22, align 8, !dbg !429, !tbaa !430
  store i32 %23, ptr %20, align 8, !dbg !406, !tbaa !431
  %24 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 4, !dbg !406
  store i32 0, ptr %24, align 4, !dbg !406, !tbaa !432
  %25 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 5, !dbg !406
  store i8 1, ptr %25, align 8, !dbg !406, !tbaa !433
  %26 = load ptr, ptr %2, align 8, !dbg !434, !tbaa !399
  call void @pping(ptr noundef %26, ptr noundef %3), !dbg !435
  call void @llvm.lifetime.end.p0(i64 40, ptr %3) #7, !dbg !436
  ret i32 -1, !dbg !437
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nounwind
define internal void @pping(ptr noundef %0, ptr noundef %1) #0 !dbg !438 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %struct.packet_info, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i8, align 1
  %9 = alloca i32, align 4
  store ptr %0, ptr %3, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %3, metadata !443, metadata !DIExpression()), !dbg !605
  store ptr %1, ptr %4, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %4, metadata !444, metadata !DIExpression()), !dbg !606
  call void @llvm.lifetime.start.p0(i64 128, ptr %5) #7, !dbg !607
  call void @llvm.dbg.declare(metadata ptr %5, metadata !445, metadata !DIExpression()), !dbg !608
  call void @llvm.memset.p0.i64(ptr align 8 %5, i8 0, i64 128, i1 false), !dbg !608
  call void @llvm.lifetime.start.p0(i64 8, ptr %6) #7, !dbg !609
  call void @llvm.dbg.declare(metadata ptr %6, metadata !602, metadata !DIExpression()), !dbg !610
  call void @llvm.lifetime.start.p0(i64 8, ptr %7) #7, !dbg !609
  call void @llvm.dbg.declare(metadata ptr %7, metadata !603, metadata !DIExpression()), !dbg !611
  call void @llvm.lifetime.start.p0(i64 1, ptr %8) #7, !dbg !612
  call void @llvm.dbg.declare(metadata ptr %8, metadata !604, metadata !DIExpression()), !dbg !613
  %10 = load ptr, ptr %4, align 8, !dbg !614, !tbaa !399
  %11 = call i32 @parse_packet_identifier(ptr noundef %10, ptr noundef %5), !dbg !616
  %12 = icmp slt i32 %11, 0, !dbg !617
  br i1 %12, label %13, label %14, !dbg !618

13:                                               ; preds = %2
  store i32 1, ptr %9, align 4
  br label %30, !dbg !619

14:                                               ; preds = %2
  %15 = load ptr, ptr %3, align 8, !dbg !620, !tbaa !399
  %16 = call ptr @update_flow(ptr noundef %15, ptr noundef %5, ptr noundef %8), !dbg !621
  store ptr %16, ptr %6, align 8, !dbg !622, !tbaa !399
  %17 = load ptr, ptr %6, align 8, !dbg !623, !tbaa !399
  %18 = load ptr, ptr %3, align 8, !dbg !624, !tbaa !399
  %19 = load ptr, ptr %4, align 8, !dbg !625, !tbaa !399
  %20 = load i8, ptr %8, align 1, !dbg !626, !tbaa !627, !range !628, !noundef !629
  %21 = trunc i8 %20 to i1, !dbg !626
  call void @pping_timestamp_packet(ptr noundef %17, ptr noundef %18, ptr noundef %19, ptr noundef %5, i1 noundef zeroext %21), !dbg !630
  %22 = load ptr, ptr %3, align 8, !dbg !631, !tbaa !399
  %23 = call ptr @update_rev_flow(ptr noundef %22, ptr noundef %5), !dbg !632
  store ptr %23, ptr %7, align 8, !dbg !633, !tbaa !399
  %24 = load ptr, ptr %7, align 8, !dbg !634, !tbaa !399
  %25 = load ptr, ptr %3, align 8, !dbg !635, !tbaa !399
  %26 = load ptr, ptr %4, align 8, !dbg !636, !tbaa !399
  call void @pping_match_packet(ptr noundef %24, ptr noundef %25, ptr noundef %26, ptr noundef %5), !dbg !637
  %27 = load ptr, ptr %3, align 8, !dbg !638, !tbaa !399
  %28 = load ptr, ptr %6, align 8, !dbg !639, !tbaa !399
  %29 = load ptr, ptr %7, align 8, !dbg !640, !tbaa !399
  call void @delete_closed_flows(ptr noundef %27, ptr noundef %5, ptr noundef %28, ptr noundef %29), !dbg !641
  store i32 0, ptr %9, align 4, !dbg !642
  br label %30, !dbg !642

30:                                               ; preds = %14, %13
  call void @llvm.lifetime.end.p0(i64 1, ptr %8) #7, !dbg !642
  call void @llvm.lifetime.end.p0(i64 8, ptr %7) #7, !dbg !642
  call void @llvm.lifetime.end.p0(i64 8, ptr %6) #7, !dbg !642
  call void @llvm.lifetime.end.p0(i64 128, ptr %5) #7, !dbg !642
  %31 = load i32, ptr %9, align 4
  switch i32 %31, label %33 [
    i32 0, label %32
    i32 1, label %32
  ]

32:                                               ; preds = %30, %30
  ret void, !dbg !642

33:                                               ; preds = %30
  unreachable
}

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nounwind
define dso_local i32 @pping_tc_ingress(ptr noundef %0) #0 section "tc" !dbg !643 {
  %2 = alloca ptr, align 8
  %3 = alloca %struct.parsing_context, align 8
  store ptr %0, ptr %2, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %2, metadata !645, metadata !DIExpression()), !dbg !647
  call void @llvm.lifetime.start.p0(i64 40, ptr %3) #7, !dbg !648
  call void @llvm.dbg.declare(metadata ptr %3, metadata !646, metadata !DIExpression()), !dbg !649
  %4 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 0, !dbg !650
  %5 = load ptr, ptr %2, align 8, !dbg !651, !tbaa !399
  %6 = getelementptr inbounds %struct.__sk_buff, ptr %5, i32 0, i32 15, !dbg !652
  %7 = load i32, ptr %6, align 4, !dbg !652, !tbaa !409
  %8 = zext i32 %7 to i64, !dbg !653
  %9 = inttoptr i64 %8 to ptr, !dbg !654
  store ptr %9, ptr %4, align 8, !dbg !650, !tbaa !415
  %10 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 1, !dbg !650
  %11 = load ptr, ptr %2, align 8, !dbg !655, !tbaa !399
  %12 = getelementptr inbounds %struct.__sk_buff, ptr %11, i32 0, i32 16, !dbg !656
  %13 = load i32, ptr %12, align 8, !dbg !656, !tbaa !421
  %14 = zext i32 %13 to i64, !dbg !657
  %15 = inttoptr i64 %14 to ptr, !dbg !658
  store ptr %15, ptr %10, align 8, !dbg !650, !tbaa !424
  %16 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 2, !dbg !650
  %17 = getelementptr inbounds %struct.hdr_cursor, ptr %16, i32 0, i32 0, !dbg !659
  %18 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 0, !dbg !660
  %19 = load ptr, ptr %18, align 8, !dbg !660, !tbaa !415
  store ptr %19, ptr %17, align 8, !dbg !659, !tbaa !427
  %20 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 3, !dbg !650
  %21 = load ptr, ptr %2, align 8, !dbg !661, !tbaa !399
  %22 = getelementptr inbounds %struct.__sk_buff, ptr %21, i32 0, i32 0, !dbg !662
  %23 = load i32, ptr %22, align 8, !dbg !662, !tbaa !430
  store i32 %23, ptr %20, align 8, !dbg !650, !tbaa !431
  %24 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 4, !dbg !650
  %25 = load ptr, ptr %2, align 8, !dbg !663, !tbaa !399
  %26 = getelementptr inbounds %struct.__sk_buff, ptr %25, i32 0, i32 9, !dbg !664
  %27 = load i32, ptr %26, align 4, !dbg !664, !tbaa !665
  store i32 %27, ptr %24, align 4, !dbg !650, !tbaa !432
  %28 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 5, !dbg !650
  store i8 0, ptr %28, align 8, !dbg !650, !tbaa !433
  %29 = load ptr, ptr %2, align 8, !dbg !666, !tbaa !399
  call void @pping(ptr noundef %29, ptr noundef %3), !dbg !667
  call void @llvm.lifetime.end.p0(i64 40, ptr %3) #7, !dbg !668
  ret i32 -1, !dbg !669
}

; Function Attrs: nounwind
define dso_local i32 @pping_xdp_ingress(ptr noundef %0) #0 section "xdp" !dbg !670 {
  %2 = alloca ptr, align 8
  %3 = alloca %struct.parsing_context, align 8
  store ptr %0, ptr %2, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %2, metadata !683, metadata !DIExpression()), !dbg !685
  call void @llvm.lifetime.start.p0(i64 40, ptr %3) #7, !dbg !686
  call void @llvm.dbg.declare(metadata ptr %3, metadata !684, metadata !DIExpression()), !dbg !687
  %4 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 0, !dbg !688
  %5 = load ptr, ptr %2, align 8, !dbg !689, !tbaa !399
  %6 = getelementptr inbounds %struct.xdp_md, ptr %5, i32 0, i32 0, !dbg !690
  %7 = load i32, ptr %6, align 4, !dbg !690, !tbaa !691
  %8 = zext i32 %7 to i64, !dbg !693
  %9 = inttoptr i64 %8 to ptr, !dbg !694
  store ptr %9, ptr %4, align 8, !dbg !688, !tbaa !415
  %10 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 1, !dbg !688
  %11 = load ptr, ptr %2, align 8, !dbg !695, !tbaa !399
  %12 = getelementptr inbounds %struct.xdp_md, ptr %11, i32 0, i32 1, !dbg !696
  %13 = load i32, ptr %12, align 4, !dbg !696, !tbaa !697
  %14 = zext i32 %13 to i64, !dbg !698
  %15 = inttoptr i64 %14 to ptr, !dbg !699
  store ptr %15, ptr %10, align 8, !dbg !688, !tbaa !424
  %16 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 2, !dbg !688
  %17 = getelementptr inbounds %struct.hdr_cursor, ptr %16, i32 0, i32 0, !dbg !700
  %18 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 0, !dbg !701
  %19 = load ptr, ptr %18, align 8, !dbg !701, !tbaa !415
  store ptr %19, ptr %17, align 8, !dbg !700, !tbaa !427
  %20 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 3, !dbg !688
  %21 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 1, !dbg !702
  %22 = load ptr, ptr %21, align 8, !dbg !702, !tbaa !424
  %23 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 0, !dbg !703
  %24 = load ptr, ptr %23, align 8, !dbg !703, !tbaa !415
  %25 = ptrtoint ptr %22 to i64, !dbg !704
  %26 = ptrtoint ptr %24 to i64, !dbg !704
  %27 = sub i64 %25, %26, !dbg !704
  %28 = trunc i64 %27 to i32, !dbg !705
  store i32 %28, ptr %20, align 8, !dbg !688, !tbaa !431
  %29 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 4, !dbg !688
  %30 = load ptr, ptr %2, align 8, !dbg !706, !tbaa !399
  %31 = getelementptr inbounds %struct.xdp_md, ptr %30, i32 0, i32 3, !dbg !707
  %32 = load i32, ptr %31, align 4, !dbg !707, !tbaa !708
  store i32 %32, ptr %29, align 4, !dbg !688, !tbaa !432
  %33 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 5, !dbg !688
  store i8 0, ptr %33, align 8, !dbg !688, !tbaa !433
  %34 = load ptr, ptr %2, align 8, !dbg !709, !tbaa !399
  call void @pping(ptr noundef %34, ptr noundef %3), !dbg !710
  call void @llvm.lifetime.end.p0(i64 40, ptr %3) #7, !dbg !711
  ret i32 2, !dbg !712
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nounwind
define internal i32 @parse_packet_identifier(ptr noundef %0, ptr noundef %1) #0 !dbg !713 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %4, metadata !718, metadata !DIExpression()), !dbg !731
  store ptr %1, ptr %5, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %5, metadata !719, metadata !DIExpression()), !dbg !732
  call void @llvm.lifetime.start.p0(i64 4, ptr %6) #7, !dbg !733
  call void @llvm.dbg.declare(metadata ptr %6, metadata !720, metadata !DIExpression()), !dbg !734
  call void @llvm.lifetime.start.p0(i64 4, ptr %7) #7, !dbg !733
  call void @llvm.dbg.declare(metadata ptr %7, metadata !721, metadata !DIExpression()), !dbg !735
  call void @llvm.lifetime.start.p0(i64 8, ptr %8) #7, !dbg !736
  call void @llvm.dbg.declare(metadata ptr %8, metadata !722, metadata !DIExpression()), !dbg !737
  %10 = load ptr, ptr @bpf_ktime_get_ns, align 8, !dbg !738, !tbaa !399
  %11 = call i64 %10(), !dbg !738
  %12 = load ptr, ptr %5, align 8, !dbg !739, !tbaa !399
  %13 = getelementptr inbounds %struct.packet_info, ptr %12, i32 0, i32 2, !dbg !740
  store i64 %11, ptr %13, align 8, !dbg !741, !tbaa !742
  %14 = load ptr, ptr %4, align 8, !dbg !749, !tbaa !399
  %15 = getelementptr inbounds %struct.parsing_context, ptr %14, i32 0, i32 2, !dbg !750
  %16 = load ptr, ptr %4, align 8, !dbg !751, !tbaa !399
  %17 = getelementptr inbounds %struct.parsing_context, ptr %16, i32 0, i32 1, !dbg !752
  %18 = load ptr, ptr %17, align 8, !dbg !752, !tbaa !424
  %19 = call i32 @parse_ethhdr(ptr noundef %15, ptr noundef %18, ptr noundef %8), !dbg !753
  store i32 %19, ptr %6, align 4, !dbg !754, !tbaa !755
  %20 = load i32, ptr %6, align 4, !dbg !756, !tbaa !755
  %21 = icmp eq i32 %20, 8, !dbg !758
  br i1 %21, label %22, label %40, !dbg !759

22:                                               ; preds = %2
  %23 = load ptr, ptr %5, align 8, !dbg !760, !tbaa !399
  %24 = getelementptr inbounds %struct.packet_info, ptr %23, i32 0, i32 4, !dbg !762
  %25 = getelementptr inbounds %struct.packet_id, ptr %24, i32 0, i32 0, !dbg !763
  %26 = getelementptr inbounds %struct.network_tuple, ptr %25, i32 0, i32 3, !dbg !764
  store i8 2, ptr %26, align 2, !dbg !765, !tbaa !766
  %27 = load ptr, ptr %4, align 8, !dbg !767, !tbaa !399
  %28 = getelementptr inbounds %struct.parsing_context, ptr %27, i32 0, i32 2, !dbg !768
  %29 = load ptr, ptr %4, align 8, !dbg !769, !tbaa !399
  %30 = getelementptr inbounds %struct.parsing_context, ptr %29, i32 0, i32 1, !dbg !770
  %31 = load ptr, ptr %30, align 8, !dbg !770, !tbaa !424
  %32 = load ptr, ptr %5, align 8, !dbg !771, !tbaa !399
  %33 = getelementptr inbounds %struct.packet_info, ptr %32, i32 0, i32 0, !dbg !772
  %34 = call i32 @parse_iphdr(ptr noundef %28, ptr noundef %31, ptr noundef %33), !dbg !773
  %35 = trunc i32 %34 to i16, !dbg !773
  %36 = load ptr, ptr %5, align 8, !dbg !774, !tbaa !399
  %37 = getelementptr inbounds %struct.packet_info, ptr %36, i32 0, i32 4, !dbg !775
  %38 = getelementptr inbounds %struct.packet_id, ptr %37, i32 0, i32 0, !dbg !776
  %39 = getelementptr inbounds %struct.network_tuple, ptr %38, i32 0, i32 2, !dbg !777
  store i16 %35, ptr %39, align 4, !dbg !778, !tbaa !779
  br label %63, !dbg !780

40:                                               ; preds = %2
  %41 = load i32, ptr %6, align 4, !dbg !781, !tbaa !755
  %42 = icmp eq i32 %41, 56710, !dbg !783
  br i1 %42, label %43, label %61, !dbg !784

43:                                               ; preds = %40
  %44 = load ptr, ptr %5, align 8, !dbg !785, !tbaa !399
  %45 = getelementptr inbounds %struct.packet_info, ptr %44, i32 0, i32 4, !dbg !787
  %46 = getelementptr inbounds %struct.packet_id, ptr %45, i32 0, i32 0, !dbg !788
  %47 = getelementptr inbounds %struct.network_tuple, ptr %46, i32 0, i32 3, !dbg !789
  store i8 10, ptr %47, align 2, !dbg !790, !tbaa !766
  %48 = load ptr, ptr %4, align 8, !dbg !791, !tbaa !399
  %49 = getelementptr inbounds %struct.parsing_context, ptr %48, i32 0, i32 2, !dbg !792
  %50 = load ptr, ptr %4, align 8, !dbg !793, !tbaa !399
  %51 = getelementptr inbounds %struct.parsing_context, ptr %50, i32 0, i32 1, !dbg !794
  %52 = load ptr, ptr %51, align 8, !dbg !794, !tbaa !424
  %53 = load ptr, ptr %5, align 8, !dbg !795, !tbaa !399
  %54 = getelementptr inbounds %struct.packet_info, ptr %53, i32 0, i32 0, !dbg !796
  %55 = call i32 @parse_ip6hdr(ptr noundef %49, ptr noundef %52, ptr noundef %54), !dbg !797
  %56 = trunc i32 %55 to i16, !dbg !797
  %57 = load ptr, ptr %5, align 8, !dbg !798, !tbaa !399
  %58 = getelementptr inbounds %struct.packet_info, ptr %57, i32 0, i32 4, !dbg !799
  %59 = getelementptr inbounds %struct.packet_id, ptr %58, i32 0, i32 0, !dbg !800
  %60 = getelementptr inbounds %struct.network_tuple, ptr %59, i32 0, i32 2, !dbg !801
  store i16 %56, ptr %60, align 4, !dbg !802, !tbaa !779
  br label %62, !dbg !803

61:                                               ; preds = %40
  store i32 -1, ptr %3, align 4, !dbg !804
  store i32 1, ptr %9, align 4
  br label %194, !dbg !804

62:                                               ; preds = %43
  br label %63

63:                                               ; preds = %62, %22
  %64 = load volatile i8, ptr getelementptr inbounds (%struct.bpf_config, ptr @config, i32 0, i32 3), align 1, !dbg !806, !tbaa !808, !range !628, !noundef !629
  %65 = trunc i8 %64 to i1, !dbg !806
  br i1 %65, label %66, label %78, !dbg !810

66:                                               ; preds = %63
  %67 = load ptr, ptr %5, align 8, !dbg !811, !tbaa !399
  %68 = getelementptr inbounds %struct.packet_info, ptr %67, i32 0, i32 4, !dbg !812
  %69 = getelementptr inbounds %struct.packet_id, ptr %68, i32 0, i32 0, !dbg !813
  %70 = getelementptr inbounds %struct.network_tuple, ptr %69, i32 0, i32 2, !dbg !814
  %71 = load i16, ptr %70, align 4, !dbg !814, !tbaa !779
  %72 = zext i16 %71 to i32, !dbg !811
  %73 = icmp eq i32 %72, 6, !dbg !815
  br i1 %73, label %74, label %78, !dbg !816

74:                                               ; preds = %66
  %75 = load ptr, ptr %4, align 8, !dbg !817, !tbaa !399
  %76 = load ptr, ptr %5, align 8, !dbg !818, !tbaa !399
  %77 = call i32 @parse_tcp_identifier(ptr noundef %75, ptr noundef %76), !dbg !819
  store i32 %77, ptr %7, align 4, !dbg !820, !tbaa !755
  br label %127, !dbg !821

78:                                               ; preds = %66, %63
  %79 = load volatile i8, ptr getelementptr inbounds (%struct.bpf_config, ptr @config, i32 0, i32 4), align 2, !dbg !822, !tbaa !824, !range !628, !noundef !629
  %80 = trunc i8 %79 to i1, !dbg !822
  br i1 %80, label %81, label %101, !dbg !825

81:                                               ; preds = %78
  %82 = load ptr, ptr %5, align 8, !dbg !826, !tbaa !399
  %83 = getelementptr inbounds %struct.packet_info, ptr %82, i32 0, i32 4, !dbg !827
  %84 = getelementptr inbounds %struct.packet_id, ptr %83, i32 0, i32 0, !dbg !828
  %85 = getelementptr inbounds %struct.network_tuple, ptr %84, i32 0, i32 2, !dbg !829
  %86 = load i16, ptr %85, align 4, !dbg !829, !tbaa !779
  %87 = zext i16 %86 to i32, !dbg !826
  %88 = icmp eq i32 %87, 58, !dbg !830
  br i1 %88, label %89, label %101, !dbg !831

89:                                               ; preds = %81
  %90 = load ptr, ptr %5, align 8, !dbg !832, !tbaa !399
  %91 = getelementptr inbounds %struct.packet_info, ptr %90, i32 0, i32 4, !dbg !833
  %92 = getelementptr inbounds %struct.packet_id, ptr %91, i32 0, i32 0, !dbg !834
  %93 = getelementptr inbounds %struct.network_tuple, ptr %92, i32 0, i32 3, !dbg !835
  %94 = load i8, ptr %93, align 2, !dbg !835, !tbaa !766
  %95 = zext i8 %94 to i32, !dbg !832
  %96 = icmp eq i32 %95, 10, !dbg !836
  br i1 %96, label %97, label %101, !dbg !837

97:                                               ; preds = %89
  %98 = load ptr, ptr %4, align 8, !dbg !838, !tbaa !399
  %99 = load ptr, ptr %5, align 8, !dbg !839, !tbaa !399
  %100 = call i32 @parse_icmp6_identifier(ptr noundef %98, ptr noundef %99), !dbg !840
  store i32 %100, ptr %7, align 4, !dbg !841, !tbaa !755
  br label %126, !dbg !842

101:                                              ; preds = %89, %81, %78
  %102 = load volatile i8, ptr getelementptr inbounds (%struct.bpf_config, ptr @config, i32 0, i32 4), align 2, !dbg !843, !tbaa !824, !range !628, !noundef !629
  %103 = trunc i8 %102 to i1, !dbg !843
  br i1 %103, label %104, label %124, !dbg !845

104:                                              ; preds = %101
  %105 = load ptr, ptr %5, align 8, !dbg !846, !tbaa !399
  %106 = getelementptr inbounds %struct.packet_info, ptr %105, i32 0, i32 4, !dbg !847
  %107 = getelementptr inbounds %struct.packet_id, ptr %106, i32 0, i32 0, !dbg !848
  %108 = getelementptr inbounds %struct.network_tuple, ptr %107, i32 0, i32 2, !dbg !849
  %109 = load i16, ptr %108, align 4, !dbg !849, !tbaa !779
  %110 = zext i16 %109 to i32, !dbg !846
  %111 = icmp eq i32 %110, 1, !dbg !850
  br i1 %111, label %112, label %124, !dbg !851

112:                                              ; preds = %104
  %113 = load ptr, ptr %5, align 8, !dbg !852, !tbaa !399
  %114 = getelementptr inbounds %struct.packet_info, ptr %113, i32 0, i32 4, !dbg !853
  %115 = getelementptr inbounds %struct.packet_id, ptr %114, i32 0, i32 0, !dbg !854
  %116 = getelementptr inbounds %struct.network_tuple, ptr %115, i32 0, i32 3, !dbg !855
  %117 = load i8, ptr %116, align 2, !dbg !855, !tbaa !766
  %118 = zext i8 %117 to i32, !dbg !852
  %119 = icmp eq i32 %118, 2, !dbg !856
  br i1 %119, label %120, label %124, !dbg !857

120:                                              ; preds = %112
  %121 = load ptr, ptr %4, align 8, !dbg !858, !tbaa !399
  %122 = load ptr, ptr %5, align 8, !dbg !859, !tbaa !399
  %123 = call i32 @parse_icmp_identifier(ptr noundef %121, ptr noundef %122), !dbg !860
  store i32 %123, ptr %7, align 4, !dbg !861, !tbaa !755
  br label %125, !dbg !862

124:                                              ; preds = %112, %104, %101
  store i32 -1, ptr %3, align 4, !dbg !863
  store i32 1, ptr %9, align 4
  br label %194, !dbg !863

125:                                              ; preds = %120
  br label %126

126:                                              ; preds = %125, %97
  br label %127

127:                                              ; preds = %126, %74
  %128 = load i32, ptr %7, align 4, !dbg !864, !tbaa !755
  %129 = icmp ne i32 %128, 0, !dbg !864
  br i1 %129, label %130, label %131, !dbg !866

130:                                              ; preds = %127
  store i32 -1, ptr %3, align 4, !dbg !867
  store i32 1, ptr %9, align 4
  br label %194, !dbg !867

131:                                              ; preds = %127
  %132 = load ptr, ptr %5, align 8, !dbg !868, !tbaa !399
  %133 = getelementptr inbounds %struct.packet_info, ptr %132, i32 0, i32 4, !dbg !870
  %134 = getelementptr inbounds %struct.packet_id, ptr %133, i32 0, i32 0, !dbg !871
  %135 = getelementptr inbounds %struct.network_tuple, ptr %134, i32 0, i32 3, !dbg !872
  %136 = load i8, ptr %135, align 2, !dbg !872, !tbaa !766
  %137 = zext i8 %136 to i32, !dbg !868
  %138 = icmp eq i32 %137, 2, !dbg !873
  br i1 %138, label %139, label %162, !dbg !874

139:                                              ; preds = %131
  %140 = load ptr, ptr %5, align 8, !dbg !875, !tbaa !399
  %141 = getelementptr inbounds %struct.packet_info, ptr %140, i32 0, i32 4, !dbg !877
  %142 = getelementptr inbounds %struct.packet_id, ptr %141, i32 0, i32 0, !dbg !878
  %143 = getelementptr inbounds %struct.network_tuple, ptr %142, i32 0, i32 0, !dbg !879
  %144 = getelementptr inbounds %struct.flow_address, ptr %143, i32 0, i32 0, !dbg !880
  %145 = load ptr, ptr %5, align 8, !dbg !881, !tbaa !399
  %146 = getelementptr inbounds %struct.packet_info, ptr %145, i32 0, i32 0, !dbg !882
  %147 = load ptr, ptr %146, align 8, !dbg !882, !tbaa !883
  %148 = getelementptr inbounds %struct.iphdr, ptr %147, i32 0, i32 8, !dbg !884
  %149 = getelementptr inbounds %struct.anon.9, ptr %148, i32 0, i32 0, !dbg !884
  %150 = load i32, ptr %149, align 4, !dbg !884, !tbaa !883
  call void @map_ipv4_to_ipv6(ptr noundef %144, i32 noundef %150), !dbg !885
  %151 = load ptr, ptr %5, align 8, !dbg !886, !tbaa !399
  %152 = getelementptr inbounds %struct.packet_info, ptr %151, i32 0, i32 4, !dbg !887
  %153 = getelementptr inbounds %struct.packet_id, ptr %152, i32 0, i32 0, !dbg !888
  %154 = getelementptr inbounds %struct.network_tuple, ptr %153, i32 0, i32 1, !dbg !889
  %155 = getelementptr inbounds %struct.flow_address, ptr %154, i32 0, i32 0, !dbg !890
  %156 = load ptr, ptr %5, align 8, !dbg !891, !tbaa !399
  %157 = getelementptr inbounds %struct.packet_info, ptr %156, i32 0, i32 0, !dbg !892
  %158 = load ptr, ptr %157, align 8, !dbg !892, !tbaa !883
  %159 = getelementptr inbounds %struct.iphdr, ptr %158, i32 0, i32 8, !dbg !893
  %160 = getelementptr inbounds %struct.anon.9, ptr %159, i32 0, i32 1, !dbg !893
  %161 = load i32, ptr %160, align 4, !dbg !893, !tbaa !883
  call void @map_ipv4_to_ipv6(ptr noundef %155, i32 noundef %161), !dbg !894
  br label %183, !dbg !895

162:                                              ; preds = %131
  %163 = load ptr, ptr %5, align 8, !dbg !896, !tbaa !399
  %164 = getelementptr inbounds %struct.packet_info, ptr %163, i32 0, i32 4, !dbg !898
  %165 = getelementptr inbounds %struct.packet_id, ptr %164, i32 0, i32 0, !dbg !899
  %166 = getelementptr inbounds %struct.network_tuple, ptr %165, i32 0, i32 0, !dbg !900
  %167 = getelementptr inbounds %struct.flow_address, ptr %166, i32 0, i32 0, !dbg !901
  %168 = load ptr, ptr %5, align 8, !dbg !902, !tbaa !399
  %169 = getelementptr inbounds %struct.packet_info, ptr %168, i32 0, i32 0, !dbg !903
  %170 = load ptr, ptr %169, align 8, !dbg !903, !tbaa !883
  %171 = getelementptr inbounds %struct.ipv6hdr, ptr %170, i32 0, i32 5, !dbg !904
  %172 = getelementptr inbounds %struct.anon.12, ptr %171, i32 0, i32 0, !dbg !904
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %167, ptr align 4 %172, i64 16, i1 false), !dbg !904, !tbaa.struct !905
  %173 = load ptr, ptr %5, align 8, !dbg !906, !tbaa !399
  %174 = getelementptr inbounds %struct.packet_info, ptr %173, i32 0, i32 4, !dbg !907
  %175 = getelementptr inbounds %struct.packet_id, ptr %174, i32 0, i32 0, !dbg !908
  %176 = getelementptr inbounds %struct.network_tuple, ptr %175, i32 0, i32 1, !dbg !909
  %177 = getelementptr inbounds %struct.flow_address, ptr %176, i32 0, i32 0, !dbg !910
  %178 = load ptr, ptr %5, align 8, !dbg !911, !tbaa !399
  %179 = getelementptr inbounds %struct.packet_info, ptr %178, i32 0, i32 0, !dbg !912
  %180 = load ptr, ptr %179, align 8, !dbg !912, !tbaa !883
  %181 = getelementptr inbounds %struct.ipv6hdr, ptr %180, i32 0, i32 5, !dbg !913
  %182 = getelementptr inbounds %struct.anon.12, ptr %181, i32 0, i32 1, !dbg !913
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %177, ptr align 4 %182, i64 16, i1 false), !dbg !913, !tbaa.struct !905
  br label %183

183:                                              ; preds = %162, %139
  %184 = load ptr, ptr %5, align 8, !dbg !914, !tbaa !399
  %185 = getelementptr inbounds %struct.packet_info, ptr %184, i32 0, i32 5, !dbg !915
  %186 = getelementptr inbounds %struct.packet_id, ptr %185, i32 0, i32 0, !dbg !916
  %187 = load ptr, ptr %5, align 8, !dbg !917, !tbaa !399
  %188 = getelementptr inbounds %struct.packet_info, ptr %187, i32 0, i32 4, !dbg !918
  %189 = getelementptr inbounds %struct.packet_id, ptr %188, i32 0, i32 0, !dbg !919
  call void @reverse_flow(ptr noundef %186, ptr noundef %189), !dbg !920
  %190 = load ptr, ptr %4, align 8, !dbg !921, !tbaa !399
  %191 = call i32 @remaining_pkt_payload(ptr noundef %190), !dbg !922
  %192 = load ptr, ptr %5, align 8, !dbg !923, !tbaa !399
  %193 = getelementptr inbounds %struct.packet_info, ptr %192, i32 0, i32 3, !dbg !924
  store i32 %191, ptr %193, align 8, !dbg !925, !tbaa !926
  store i32 0, ptr %3, align 4, !dbg !927
  store i32 1, ptr %9, align 4
  br label %194, !dbg !927

194:                                              ; preds = %183, %130, %124, %61
  call void @llvm.lifetime.end.p0(i64 8, ptr %8) #7, !dbg !928
  call void @llvm.lifetime.end.p0(i64 4, ptr %7) #7, !dbg !928
  call void @llvm.lifetime.end.p0(i64 4, ptr %6) #7, !dbg !928
  %195 = load i32, ptr %3, align 4, !dbg !928
  ret i32 %195, !dbg !928
}

; Function Attrs: nounwind
define internal ptr @update_flow(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !929 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %5, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %5, metadata !934, metadata !DIExpression()), !dbg !938
  store ptr %1, ptr %6, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %6, metadata !935, metadata !DIExpression()), !dbg !939
  store ptr %2, ptr %7, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %7, metadata !936, metadata !DIExpression()), !dbg !940
  call void @llvm.lifetime.start.p0(i64 8, ptr %8) #7, !dbg !941
  call void @llvm.dbg.declare(metadata ptr %8, metadata !937, metadata !DIExpression()), !dbg !942
  %10 = load ptr, ptr %7, align 8, !dbg !943, !tbaa !399
  store i8 0, ptr %10, align 1, !dbg !944, !tbaa !627
  %11 = load ptr, ptr @bpf_map_lookup_elem, align 8, !dbg !945, !tbaa !399
  %12 = load ptr, ptr %6, align 8, !dbg !946, !tbaa !399
  %13 = getelementptr inbounds %struct.packet_info, ptr %12, i32 0, i32 4, !dbg !947
  %14 = getelementptr inbounds %struct.packet_id, ptr %13, i32 0, i32 0, !dbg !948
  %15 = call ptr %11(ptr noundef @flow_state, ptr noundef %14), !dbg !945
  store ptr %15, ptr %8, align 8, !dbg !949, !tbaa !399
  %16 = load ptr, ptr %8, align 8, !dbg !950, !tbaa !399
  %17 = icmp ne ptr %16, null, !dbg !950
  br i1 %17, label %40, label %18, !dbg !952

18:                                               ; preds = %3
  %19 = load ptr, ptr %6, align 8, !dbg !953, !tbaa !399
  %20 = getelementptr inbounds %struct.packet_info, ptr %19, i32 0, i32 6, !dbg !954
  %21 = load i8, ptr %20, align 4, !dbg !954, !tbaa !955, !range !628, !noundef !629
  %22 = trunc i8 %21 to i1, !dbg !954
  br i1 %22, label %23, label %40, !dbg !956

23:                                               ; preds = %18
  %24 = load ptr, ptr %6, align 8, !dbg !957, !tbaa !399
  %25 = getelementptr inbounds %struct.packet_info, ptr %24, i32 0, i32 8, !dbg !958
  %26 = load i8, ptr %25, align 2, !dbg !958, !tbaa !959
  %27 = zext i8 %26 to i32, !dbg !957
  %28 = icmp eq i32 %27, 2, !dbg !960
  br i1 %28, label %40, label %29, !dbg !961

29:                                               ; preds = %23
  %30 = load ptr, ptr %6, align 8, !dbg !962, !tbaa !399
  %31 = getelementptr inbounds %struct.packet_info, ptr %30, i32 0, i32 8, !dbg !963
  %32 = load i8, ptr %31, align 2, !dbg !963, !tbaa !959
  %33 = zext i8 %32 to i32, !dbg !962
  %34 = icmp eq i32 %33, 3, !dbg !964
  br i1 %34, label %40, label %35, !dbg !965

35:                                               ; preds = %29
  %36 = load ptr, ptr %7, align 8, !dbg !966, !tbaa !399
  store i8 1, ptr %36, align 1, !dbg !968, !tbaa !627
  %37 = load ptr, ptr %5, align 8, !dbg !969, !tbaa !399
  %38 = load ptr, ptr %6, align 8, !dbg !970, !tbaa !399
  %39 = call ptr @create_flow(ptr noundef %37, ptr noundef %38), !dbg !971
  store ptr %39, ptr %8, align 8, !dbg !972, !tbaa !399
  br label %40, !dbg !973

40:                                               ; preds = %35, %29, %23, %18, %3
  %41 = load ptr, ptr %8, align 8, !dbg !974, !tbaa !399
  %42 = icmp ne ptr %41, null, !dbg !974
  br i1 %42, label %44, label %43, !dbg !976

43:                                               ; preds = %40
  store ptr null, ptr %4, align 8, !dbg !977
  store i32 1, ptr %9, align 4
  br label %58, !dbg !977

44:                                               ; preds = %40
  %45 = load ptr, ptr %8, align 8, !dbg !978, !tbaa !399
  %46 = getelementptr inbounds %struct.flow_state, ptr %45, i32 0, i32 3, !dbg !979
  %47 = load i64, ptr %46, align 8, !dbg !980, !tbaa !981
  %48 = add i64 %47, 1, !dbg !980
  store i64 %48, ptr %46, align 8, !dbg !980, !tbaa !981
  %49 = load ptr, ptr %6, align 8, !dbg !983, !tbaa !399
  %50 = getelementptr inbounds %struct.packet_info, ptr %49, i32 0, i32 3, !dbg !984
  %51 = load i32, ptr %50, align 8, !dbg !984, !tbaa !926
  %52 = zext i32 %51 to i64, !dbg !983
  %53 = load ptr, ptr %8, align 8, !dbg !985, !tbaa !399
  %54 = getelementptr inbounds %struct.flow_state, ptr %53, i32 0, i32 4, !dbg !986
  %55 = load i64, ptr %54, align 8, !dbg !987, !tbaa !988
  %56 = add i64 %55, %52, !dbg !987
  store i64 %56, ptr %54, align 8, !dbg !987, !tbaa !988
  %57 = load ptr, ptr %8, align 8, !dbg !989, !tbaa !399
  store ptr %57, ptr %4, align 8, !dbg !990
  store i32 1, ptr %9, align 4
  br label %58, !dbg !990

58:                                               ; preds = %44, %43
  call void @llvm.lifetime.end.p0(i64 8, ptr %8) #7, !dbg !991
  %59 = load ptr, ptr %4, align 8, !dbg !991
  ret ptr %59, !dbg !991
}

; Function Attrs: nounwind
define internal void @pping_timestamp_packet(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i1 noundef zeroext %4) #0 !dbg !992 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i8, align 1
  store ptr %0, ptr %6, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %6, metadata !996, metadata !DIExpression()), !dbg !1001
  store ptr %1, ptr %7, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %7, metadata !997, metadata !DIExpression()), !dbg !1002
  store ptr %2, ptr %8, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %8, metadata !998, metadata !DIExpression()), !dbg !1003
  store ptr %3, ptr %9, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %9, metadata !999, metadata !DIExpression()), !dbg !1004
  %11 = zext i1 %4 to i8
  store i8 %11, ptr %10, align 1, !tbaa !627
  call void @llvm.dbg.declare(metadata ptr %10, metadata !1000, metadata !DIExpression()), !dbg !1005
  %12 = load ptr, ptr %6, align 8, !dbg !1006, !tbaa !399
  %13 = icmp ne ptr %12, null, !dbg !1006
  br i1 %13, label %14, label %19, !dbg !1008

14:                                               ; preds = %5
  %15 = load ptr, ptr %9, align 8, !dbg !1009, !tbaa !399
  %16 = getelementptr inbounds %struct.packet_info, ptr %15, i32 0, i32 6, !dbg !1010
  %17 = load i8, ptr %16, align 4, !dbg !1010, !tbaa !955, !range !628, !noundef !629
  %18 = trunc i8 %17 to i1, !dbg !1010
  br i1 %18, label %20, label %19, !dbg !1011

19:                                               ; preds = %14, %5
  br label %93, !dbg !1012

20:                                               ; preds = %14
  %21 = load volatile i8, ptr getelementptr inbounds (%struct.bpf_config, ptr @config, i32 0, i32 5), align 1, !dbg !1013, !tbaa !1015, !range !628, !noundef !629
  %22 = trunc i8 %21 to i1, !dbg !1013
  br i1 %22, label %23, label %34, !dbg !1016

23:                                               ; preds = %20
  %24 = load ptr, ptr %8, align 8, !dbg !1017, !tbaa !399
  %25 = getelementptr inbounds %struct.parsing_context, ptr %24, i32 0, i32 5, !dbg !1018
  %26 = load i8, ptr %25, align 8, !dbg !1018, !tbaa !433, !range !628, !noundef !629
  %27 = trunc i8 %26 to i1, !dbg !1018
  br i1 %27, label %34, label %28, !dbg !1019

28:                                               ; preds = %23
  %29 = load ptr, ptr %9, align 8, !dbg !1020, !tbaa !399
  %30 = load ptr, ptr %7, align 8, !dbg !1021, !tbaa !399
  %31 = load ptr, ptr %8, align 8, !dbg !1022, !tbaa !399
  %32 = call i1 @is_local_address(ptr noundef %29, ptr noundef %30, ptr noundef %31), !dbg !1023
  br i1 %32, label %33, label %34, !dbg !1024

33:                                               ; preds = %28
  br label %93, !dbg !1025

34:                                               ; preds = %28, %23, %20
  %35 = load i8, ptr %10, align 1, !dbg !1026, !tbaa !627, !range !628, !noundef !629
  %36 = trunc i8 %35 to i1, !dbg !1026
  br i1 %36, label %47, label %37, !dbg !1028

37:                                               ; preds = %34
  %38 = load ptr, ptr %6, align 8, !dbg !1029, !tbaa !399
  %39 = getelementptr inbounds %struct.flow_state, ptr %38, i32 0, i32 7, !dbg !1030
  %40 = load i32, ptr %39, align 8, !dbg !1030, !tbaa !1031
  %41 = load ptr, ptr %9, align 8, !dbg !1032, !tbaa !399
  %42 = getelementptr inbounds %struct.packet_info, ptr %41, i32 0, i32 4, !dbg !1033
  %43 = getelementptr inbounds %struct.packet_id, ptr %42, i32 0, i32 1, !dbg !1034
  %44 = load i32, ptr %43, align 4, !dbg !1034, !tbaa !1035
  %45 = icmp eq i32 %40, %44, !dbg !1036
  br i1 %45, label %46, label %47, !dbg !1037

46:                                               ; preds = %37
  br label %93, !dbg !1038

47:                                               ; preds = %37, %34
  %48 = load ptr, ptr %9, align 8, !dbg !1039, !tbaa !399
  %49 = getelementptr inbounds %struct.packet_info, ptr %48, i32 0, i32 4, !dbg !1040
  %50 = getelementptr inbounds %struct.packet_id, ptr %49, i32 0, i32 1, !dbg !1041
  %51 = load i32, ptr %50, align 4, !dbg !1041, !tbaa !1035
  %52 = load ptr, ptr %6, align 8, !dbg !1042, !tbaa !399
  %53 = getelementptr inbounds %struct.flow_state, ptr %52, i32 0, i32 7, !dbg !1043
  store i32 %51, ptr %53, align 8, !dbg !1044, !tbaa !1031
  %54 = load i8, ptr %10, align 1, !dbg !1045, !tbaa !627, !range !628, !noundef !629
  %55 = trunc i8 %54 to i1, !dbg !1045
  br i1 %55, label %77, label %56, !dbg !1047

56:                                               ; preds = %47
  %57 = load ptr, ptr %9, align 8, !dbg !1048, !tbaa !399
  %58 = getelementptr inbounds %struct.packet_info, ptr %57, i32 0, i32 2, !dbg !1049
  %59 = load i64, ptr %58, align 8, !dbg !1049, !tbaa !742
  %60 = load ptr, ptr %6, align 8, !dbg !1050, !tbaa !399
  %61 = getelementptr inbounds %struct.flow_state, ptr %60, i32 0, i32 2, !dbg !1051
  %62 = load i64, ptr %61, align 8, !dbg !1051, !tbaa !1052
  %63 = load volatile i8, ptr getelementptr inbounds (%struct.bpf_config, ptr @config, i32 0, i32 2), align 8, !dbg !1053, !tbaa !1054, !range !628, !noundef !629
  %64 = trunc i8 %63 to i1, !dbg !1053
  br i1 %64, label %65, label %69, !dbg !1055

65:                                               ; preds = %56
  %66 = load ptr, ptr %6, align 8, !dbg !1056, !tbaa !399
  %67 = getelementptr inbounds %struct.flow_state, ptr %66, i32 0, i32 1, !dbg !1057
  %68 = load i64, ptr %67, align 8, !dbg !1057, !tbaa !1058
  br label %73, !dbg !1055

69:                                               ; preds = %56
  %70 = load ptr, ptr %6, align 8, !dbg !1059, !tbaa !399
  %71 = getelementptr inbounds %struct.flow_state, ptr %70, i32 0, i32 0, !dbg !1060
  %72 = load i64, ptr %71, align 8, !dbg !1060, !tbaa !1061
  br label %73, !dbg !1055

73:                                               ; preds = %69, %65
  %74 = phi i64 [ %68, %65 ], [ %72, %69 ], !dbg !1055
  %75 = call i1 @is_rate_limited(i64 noundef %59, i64 noundef %62, i64 noundef %74), !dbg !1062
  br i1 %75, label %76, label %77, !dbg !1063

76:                                               ; preds = %73
  br label %93, !dbg !1064

77:                                               ; preds = %73, %47
  %78 = load ptr, ptr %9, align 8, !dbg !1065, !tbaa !399
  %79 = getelementptr inbounds %struct.packet_info, ptr %78, i32 0, i32 2, !dbg !1066
  %80 = load i64, ptr %79, align 8, !dbg !1066, !tbaa !742
  %81 = load ptr, ptr %6, align 8, !dbg !1067, !tbaa !399
  %82 = getelementptr inbounds %struct.flow_state, ptr %81, i32 0, i32 2, !dbg !1068
  store i64 %80, ptr %82, align 8, !dbg !1069, !tbaa !1052
  %83 = load ptr, ptr @bpf_map_update_elem, align 8, !dbg !1070, !tbaa !399
  %84 = load ptr, ptr %9, align 8, !dbg !1072, !tbaa !399
  %85 = getelementptr inbounds %struct.packet_info, ptr %84, i32 0, i32 4, !dbg !1073
  %86 = load ptr, ptr %9, align 8, !dbg !1074, !tbaa !399
  %87 = getelementptr inbounds %struct.packet_info, ptr %86, i32 0, i32 2, !dbg !1075
  %88 = call i64 %83(ptr noundef @packet_ts, ptr noundef %85, ptr noundef %87, i64 noundef 1), !dbg !1070
  %89 = icmp ne i64 %88, 0, !dbg !1076
  br i1 %89, label %90, label %93, !dbg !1077

90:                                               ; preds = %77
  %91 = load ptr, ptr %7, align 8, !dbg !1078, !tbaa !399
  %92 = load ptr, ptr %9, align 8, !dbg !1079, !tbaa !399
  call void @send_map_full_event(ptr noundef %91, ptr noundef %92, i8 noundef zeroext 1), !dbg !1080
  br label %93, !dbg !1080

93:                                               ; preds = %19, %33, %46, %76, %90, %77
  ret void, !dbg !1081
}

; Function Attrs: nounwind
define internal ptr @update_rev_flow(ptr noundef %0, ptr noundef %1) #0 !dbg !1082 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1086, metadata !DIExpression()), !dbg !1089
  store ptr %1, ptr %5, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1087, metadata !DIExpression()), !dbg !1090
  call void @llvm.lifetime.start.p0(i64 8, ptr %6) #7, !dbg !1091
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1088, metadata !DIExpression()), !dbg !1092
  %8 = load ptr, ptr @bpf_map_lookup_elem, align 8, !dbg !1093, !tbaa !399
  %9 = load ptr, ptr %5, align 8, !dbg !1094, !tbaa !399
  %10 = getelementptr inbounds %struct.packet_info, ptr %9, i32 0, i32 5, !dbg !1095
  %11 = getelementptr inbounds %struct.packet_id, ptr %10, i32 0, i32 0, !dbg !1096
  %12 = call ptr %8(ptr noundef @flow_state, ptr noundef %11), !dbg !1093
  store ptr %12, ptr %6, align 8, !dbg !1097, !tbaa !399
  %13 = load ptr, ptr %6, align 8, !dbg !1098, !tbaa !399
  %14 = icmp ne ptr %13, null, !dbg !1098
  br i1 %14, label %16, label %15, !dbg !1100

15:                                               ; preds = %2
  store ptr null, ptr %3, align 8, !dbg !1101
  store i32 1, ptr %7, align 4
  br label %47, !dbg !1101

16:                                               ; preds = %2
  %17 = load ptr, ptr %6, align 8, !dbg !1102, !tbaa !399
  %18 = getelementptr inbounds %struct.flow_state, ptr %17, i32 0, i32 8, !dbg !1104
  %19 = load i8, ptr %18, align 4, !dbg !1104, !tbaa !1105, !range !628, !noundef !629
  %20 = trunc i8 %19 to i1, !dbg !1104
  br i1 %20, label %33, label %21, !dbg !1106

21:                                               ; preds = %16
  %22 = load ptr, ptr %5, align 8, !dbg !1107, !tbaa !399
  %23 = getelementptr inbounds %struct.packet_info, ptr %22, i32 0, i32 8, !dbg !1108
  %24 = load i8, ptr %23, align 2, !dbg !1108, !tbaa !959
  %25 = zext i8 %24 to i32, !dbg !1107
  %26 = icmp ne i32 %25, 3, !dbg !1109
  br i1 %26, label %27, label %33, !dbg !1110

27:                                               ; preds = %21
  %28 = load ptr, ptr %6, align 8, !dbg !1111, !tbaa !399
  %29 = getelementptr inbounds %struct.flow_state, ptr %28, i32 0, i32 8, !dbg !1113
  store i8 1, ptr %29, align 4, !dbg !1114, !tbaa !1105
  %30 = load ptr, ptr %4, align 8, !dbg !1115, !tbaa !399
  %31 = load ptr, ptr %5, align 8, !dbg !1116, !tbaa !399
  %32 = load ptr, ptr %6, align 8, !dbg !1117, !tbaa !399
  call void @send_flow_open_event(ptr noundef %30, ptr noundef %31, ptr noundef %32), !dbg !1118
  br label %33, !dbg !1119

33:                                               ; preds = %27, %21, %16
  %34 = load ptr, ptr %6, align 8, !dbg !1120, !tbaa !399
  %35 = getelementptr inbounds %struct.flow_state, ptr %34, i32 0, i32 5, !dbg !1121
  %36 = load i64, ptr %35, align 8, !dbg !1122, !tbaa !1123
  %37 = add i64 %36, 1, !dbg !1122
  store i64 %37, ptr %35, align 8, !dbg !1122, !tbaa !1123
  %38 = load ptr, ptr %5, align 8, !dbg !1124, !tbaa !399
  %39 = getelementptr inbounds %struct.packet_info, ptr %38, i32 0, i32 3, !dbg !1125
  %40 = load i32, ptr %39, align 8, !dbg !1125, !tbaa !926
  %41 = zext i32 %40 to i64, !dbg !1124
  %42 = load ptr, ptr %6, align 8, !dbg !1126, !tbaa !399
  %43 = getelementptr inbounds %struct.flow_state, ptr %42, i32 0, i32 6, !dbg !1127
  %44 = load i64, ptr %43, align 8, !dbg !1128, !tbaa !1129
  %45 = add i64 %44, %41, !dbg !1128
  store i64 %45, ptr %43, align 8, !dbg !1128, !tbaa !1129
  %46 = load ptr, ptr %6, align 8, !dbg !1130, !tbaa !399
  store ptr %46, ptr %3, align 8, !dbg !1131
  store i32 1, ptr %7, align 4
  br label %47, !dbg !1131

47:                                               ; preds = %33, %15
  call void @llvm.lifetime.end.p0(i64 8, ptr %6) #7, !dbg !1132
  %48 = load ptr, ptr %3, align 8, !dbg !1132
  ret ptr %48, !dbg !1132
}

; Function Attrs: nounwind
define internal void @pping_match_packet(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 !dbg !1133 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca %struct.rtt_event, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  store ptr %0, ptr %5, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1137, metadata !DIExpression()), !dbg !1160
  store ptr %1, ptr %6, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1138, metadata !DIExpression()), !dbg !1161
  store ptr %2, ptr %7, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1139, metadata !DIExpression()), !dbg !1162
  store ptr %3, ptr %8, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1140, metadata !DIExpression()), !dbg !1163
  call void @llvm.lifetime.start.p0(i64 120, ptr %9) #7, !dbg !1164
  call void @llvm.dbg.declare(metadata ptr %9, metadata !1141, metadata !DIExpression()), !dbg !1165
  call void @llvm.memset.p0.i64(ptr align 8 %9, i8 0, i64 120, i1 false), !dbg !1165
  call void @llvm.lifetime.start.p0(i64 8, ptr %10) #7, !dbg !1166
  call void @llvm.dbg.declare(metadata ptr %10, metadata !1159, metadata !DIExpression()), !dbg !1167
  %12 = load ptr, ptr %5, align 8, !dbg !1168, !tbaa !399
  %13 = icmp ne ptr %12, null, !dbg !1168
  br i1 %13, label %14, label %19, !dbg !1170

14:                                               ; preds = %4
  %15 = load ptr, ptr %8, align 8, !dbg !1171, !tbaa !399
  %16 = getelementptr inbounds %struct.packet_info, ptr %15, i32 0, i32 7, !dbg !1172
  %17 = load i8, ptr %16, align 1, !dbg !1172, !tbaa !1173, !range !628, !noundef !629
  %18 = trunc i8 %17 to i1, !dbg !1172
  br i1 %18, label %20, label %19, !dbg !1174

19:                                               ; preds = %14, %4
  store i32 1, ptr %11, align 4
  br label %110, !dbg !1175

20:                                               ; preds = %14
  %21 = load ptr, ptr @bpf_map_lookup_elem, align 8, !dbg !1176, !tbaa !399
  %22 = load ptr, ptr %8, align 8, !dbg !1177, !tbaa !399
  %23 = getelementptr inbounds %struct.packet_info, ptr %22, i32 0, i32 5, !dbg !1178
  %24 = call ptr %21(ptr noundef @packet_ts, ptr noundef %23), !dbg !1176
  store ptr %24, ptr %10, align 8, !dbg !1179, !tbaa !399
  %25 = load ptr, ptr %10, align 8, !dbg !1180, !tbaa !399
  %26 = icmp ne ptr %25, null, !dbg !1180
  br i1 %26, label %27, label %34, !dbg !1182

27:                                               ; preds = %20
  %28 = load ptr, ptr %8, align 8, !dbg !1183, !tbaa !399
  %29 = getelementptr inbounds %struct.packet_info, ptr %28, i32 0, i32 2, !dbg !1184
  %30 = load i64, ptr %29, align 8, !dbg !1184, !tbaa !742
  %31 = load ptr, ptr %10, align 8, !dbg !1185, !tbaa !399
  %32 = load i64, ptr %31, align 8, !dbg !1186, !tbaa !1187
  %33 = icmp ult i64 %30, %32, !dbg !1188
  br i1 %33, label %34, label %35, !dbg !1189

34:                                               ; preds = %27, %20
  store i32 1, ptr %11, align 4
  br label %110, !dbg !1190

35:                                               ; preds = %27
  %36 = load ptr, ptr %8, align 8, !dbg !1191, !tbaa !399
  %37 = getelementptr inbounds %struct.packet_info, ptr %36, i32 0, i32 2, !dbg !1192
  %38 = load i64, ptr %37, align 8, !dbg !1192, !tbaa !742
  %39 = load ptr, ptr %10, align 8, !dbg !1193, !tbaa !399
  %40 = load i64, ptr %39, align 8, !dbg !1194, !tbaa !1187
  %41 = sub i64 %38, %40, !dbg !1195
  %42 = getelementptr inbounds %struct.rtt_event, ptr %9, i32 0, i32 4, !dbg !1196
  store i64 %41, ptr %42, align 8, !dbg !1197, !tbaa !1198
  %43 = load ptr, ptr @bpf_map_delete_elem, align 8, !dbg !1200, !tbaa !399
  %44 = load ptr, ptr %8, align 8, !dbg !1201, !tbaa !399
  %45 = getelementptr inbounds %struct.packet_info, ptr %44, i32 0, i32 5, !dbg !1202
  %46 = call i64 %43(ptr noundef @packet_ts, ptr noundef %45), !dbg !1200
  %47 = load ptr, ptr %5, align 8, !dbg !1203, !tbaa !399
  %48 = getelementptr inbounds %struct.flow_state, ptr %47, i32 0, i32 0, !dbg !1205
  %49 = load i64, ptr %48, align 8, !dbg !1205, !tbaa !1061
  %50 = icmp eq i64 %49, 0, !dbg !1206
  br i1 %50, label %58, label %51, !dbg !1207

51:                                               ; preds = %35
  %52 = getelementptr inbounds %struct.rtt_event, ptr %9, i32 0, i32 4, !dbg !1208
  %53 = load i64, ptr %52, align 8, !dbg !1208, !tbaa !1198
  %54 = load ptr, ptr %5, align 8, !dbg !1209, !tbaa !399
  %55 = getelementptr inbounds %struct.flow_state, ptr %54, i32 0, i32 0, !dbg !1210
  %56 = load i64, ptr %55, align 8, !dbg !1210, !tbaa !1061
  %57 = icmp ult i64 %53, %56, !dbg !1211
  br i1 %57, label %58, label %63, !dbg !1212

58:                                               ; preds = %51, %35
  %59 = getelementptr inbounds %struct.rtt_event, ptr %9, i32 0, i32 4, !dbg !1213
  %60 = load i64, ptr %59, align 8, !dbg !1213, !tbaa !1198
  %61 = load ptr, ptr %5, align 8, !dbg !1214, !tbaa !399
  %62 = getelementptr inbounds %struct.flow_state, ptr %61, i32 0, i32 0, !dbg !1215
  store i64 %60, ptr %62, align 8, !dbg !1216, !tbaa !1061
  br label %63, !dbg !1214

63:                                               ; preds = %58, %51
  %64 = load ptr, ptr %5, align 8, !dbg !1217, !tbaa !399
  %65 = getelementptr inbounds %struct.flow_state, ptr %64, i32 0, i32 1, !dbg !1218
  %66 = load i64, ptr %65, align 8, !dbg !1218, !tbaa !1058
  %67 = getelementptr inbounds %struct.rtt_event, ptr %9, i32 0, i32 4, !dbg !1219
  %68 = load i64, ptr %67, align 8, !dbg !1219, !tbaa !1198
  %69 = call i64 @calculate_srtt(i64 noundef %66, i64 noundef %68), !dbg !1220
  %70 = load ptr, ptr %5, align 8, !dbg !1221, !tbaa !399
  %71 = getelementptr inbounds %struct.flow_state, ptr %70, i32 0, i32 1, !dbg !1222
  store i64 %69, ptr %71, align 8, !dbg !1223, !tbaa !1058
  %72 = getelementptr inbounds %struct.rtt_event, ptr %9, i32 0, i32 0, !dbg !1224
  store i64 2, ptr %72, align 8, !dbg !1225, !tbaa !1226
  %73 = load ptr, ptr %8, align 8, !dbg !1227, !tbaa !399
  %74 = getelementptr inbounds %struct.packet_info, ptr %73, i32 0, i32 2, !dbg !1228
  %75 = load i64, ptr %74, align 8, !dbg !1228, !tbaa !742
  %76 = getelementptr inbounds %struct.rtt_event, ptr %9, i32 0, i32 1, !dbg !1229
  store i64 %75, ptr %76, align 8, !dbg !1230, !tbaa !1231
  %77 = load ptr, ptr %5, align 8, !dbg !1232, !tbaa !399
  %78 = getelementptr inbounds %struct.flow_state, ptr %77, i32 0, i32 0, !dbg !1233
  %79 = load i64, ptr %78, align 8, !dbg !1233, !tbaa !1061
  %80 = getelementptr inbounds %struct.rtt_event, ptr %9, i32 0, i32 5, !dbg !1234
  store i64 %79, ptr %80, align 8, !dbg !1235, !tbaa !1236
  %81 = load ptr, ptr %5, align 8, !dbg !1237, !tbaa !399
  %82 = getelementptr inbounds %struct.flow_state, ptr %81, i32 0, i32 3, !dbg !1238
  %83 = load i64, ptr %82, align 8, !dbg !1238, !tbaa !981
  %84 = getelementptr inbounds %struct.rtt_event, ptr %9, i32 0, i32 6, !dbg !1239
  store i64 %83, ptr %84, align 8, !dbg !1240, !tbaa !1241
  %85 = load ptr, ptr %5, align 8, !dbg !1242, !tbaa !399
  %86 = getelementptr inbounds %struct.flow_state, ptr %85, i32 0, i32 4, !dbg !1243
  %87 = load i64, ptr %86, align 8, !dbg !1243, !tbaa !988
  %88 = getelementptr inbounds %struct.rtt_event, ptr %9, i32 0, i32 7, !dbg !1244
  store i64 %87, ptr %88, align 8, !dbg !1245, !tbaa !1246
  %89 = load ptr, ptr %5, align 8, !dbg !1247, !tbaa !399
  %90 = getelementptr inbounds %struct.flow_state, ptr %89, i32 0, i32 5, !dbg !1248
  %91 = load i64, ptr %90, align 8, !dbg !1248, !tbaa !1123
  %92 = getelementptr inbounds %struct.rtt_event, ptr %9, i32 0, i32 8, !dbg !1249
  store i64 %91, ptr %92, align 8, !dbg !1250, !tbaa !1251
  %93 = load ptr, ptr %5, align 8, !dbg !1252, !tbaa !399
  %94 = getelementptr inbounds %struct.flow_state, ptr %93, i32 0, i32 6, !dbg !1253
  %95 = load i64, ptr %94, align 8, !dbg !1253, !tbaa !1129
  %96 = getelementptr inbounds %struct.rtt_event, ptr %9, i32 0, i32 9, !dbg !1254
  store i64 %95, ptr %96, align 8, !dbg !1255, !tbaa !1256
  %97 = getelementptr inbounds %struct.rtt_event, ptr %9, i32 0, i32 2, !dbg !1257
  %98 = load ptr, ptr %8, align 8, !dbg !1258, !tbaa !399
  %99 = getelementptr inbounds %struct.packet_info, ptr %98, i32 0, i32 4, !dbg !1259
  %100 = getelementptr inbounds %struct.packet_id, ptr %99, i32 0, i32 0, !dbg !1260
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %97, ptr align 4 %100, i64 44, i1 false), !dbg !1260, !tbaa.struct !1261
  %101 = load ptr, ptr %7, align 8, !dbg !1263, !tbaa !399
  %102 = getelementptr inbounds %struct.parsing_context, ptr %101, i32 0, i32 5, !dbg !1264
  %103 = load i8, ptr %102, align 8, !dbg !1264, !tbaa !433, !range !628, !noundef !629
  %104 = trunc i8 %103 to i1, !dbg !1264
  %105 = getelementptr inbounds %struct.rtt_event, ptr %9, i32 0, i32 10, !dbg !1265
  %106 = zext i1 %104 to i8, !dbg !1266
  store i8 %106, ptr %105, align 8, !dbg !1266, !tbaa !1267
  %107 = load ptr, ptr @bpf_perf_event_output, align 8, !dbg !1268, !tbaa !399
  %108 = load ptr, ptr %6, align 8, !dbg !1269, !tbaa !399
  %109 = call i64 %107(ptr noundef %108, ptr noundef @events, i64 noundef 4294967295, ptr noundef %9, i64 noundef 120), !dbg !1268
  store i32 0, ptr %11, align 4, !dbg !1270
  br label %110, !dbg !1270

110:                                              ; preds = %63, %34, %19
  call void @llvm.lifetime.end.p0(i64 8, ptr %10) #7, !dbg !1270
  call void @llvm.lifetime.end.p0(i64 120, ptr %9) #7, !dbg !1270
  %111 = load i32, ptr %11, align 4
  switch i32 %111, label %113 [
    i32 0, label %112
    i32 1, label %112
  ]

112:                                              ; preds = %110, %110
  ret void, !dbg !1270

113:                                              ; preds = %110
  unreachable
}

; Function Attrs: nounwind
define internal void @delete_closed_flows(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 !dbg !1271 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i8, align 1
  store ptr %0, ptr %5, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1275, metadata !DIExpression()), !dbg !1280
  store ptr %1, ptr %6, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1276, metadata !DIExpression()), !dbg !1281
  store ptr %2, ptr %7, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1277, metadata !DIExpression()), !dbg !1282
  store ptr %3, ptr %8, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1278, metadata !DIExpression()), !dbg !1283
  call void @llvm.lifetime.start.p0(i64 1, ptr %9) #7, !dbg !1284
  call void @llvm.dbg.declare(metadata ptr %9, metadata !1279, metadata !DIExpression()), !dbg !1285
  %10 = load ptr, ptr %7, align 8, !dbg !1286, !tbaa !399
  %11 = icmp ne ptr %10, null, !dbg !1286
  br i1 %11, label %12, label %43, !dbg !1288

12:                                               ; preds = %4
  %13 = load ptr, ptr %6, align 8, !dbg !1289, !tbaa !399
  %14 = getelementptr inbounds %struct.packet_info, ptr %13, i32 0, i32 8, !dbg !1290
  %15 = load i8, ptr %14, align 2, !dbg !1290, !tbaa !959
  %16 = zext i8 %15 to i32, !dbg !1289
  %17 = icmp eq i32 %16, 2, !dbg !1291
  br i1 %17, label %24, label %18, !dbg !1292

18:                                               ; preds = %12
  %19 = load ptr, ptr %6, align 8, !dbg !1293, !tbaa !399
  %20 = getelementptr inbounds %struct.packet_info, ptr %19, i32 0, i32 8, !dbg !1294
  %21 = load i8, ptr %20, align 2, !dbg !1294, !tbaa !959
  %22 = zext i8 %21 to i32, !dbg !1293
  %23 = icmp eq i32 %22, 3, !dbg !1295
  br i1 %23, label %24, label %43, !dbg !1296

24:                                               ; preds = %18, %12
  %25 = load ptr, ptr %7, align 8, !dbg !1297, !tbaa !399
  %26 = getelementptr inbounds %struct.flow_state, ptr %25, i32 0, i32 8, !dbg !1299
  %27 = load i8, ptr %26, align 4, !dbg !1299, !tbaa !1105, !range !628, !noundef !629
  %28 = trunc i8 %27 to i1, !dbg !1299
  %29 = zext i1 %28 to i8, !dbg !1300
  store i8 %29, ptr %9, align 1, !dbg !1300, !tbaa !627
  %30 = load ptr, ptr @bpf_map_delete_elem, align 8, !dbg !1301, !tbaa !399
  %31 = load ptr, ptr %6, align 8, !dbg !1303, !tbaa !399
  %32 = getelementptr inbounds %struct.packet_info, ptr %31, i32 0, i32 4, !dbg !1304
  %33 = getelementptr inbounds %struct.packet_id, ptr %32, i32 0, i32 0, !dbg !1305
  %34 = call i64 %30(ptr noundef @flow_state, ptr noundef %33), !dbg !1301
  %35 = icmp ne i64 %34, 0, !dbg !1301
  br i1 %35, label %42, label %36, !dbg !1306

36:                                               ; preds = %24
  %37 = load i8, ptr %9, align 1, !dbg !1307, !tbaa !627, !range !628, !noundef !629
  %38 = trunc i8 %37 to i1, !dbg !1307
  br i1 %38, label %39, label %42, !dbg !1308

39:                                               ; preds = %36
  %40 = load ptr, ptr %5, align 8, !dbg !1309, !tbaa !399
  %41 = load ptr, ptr %6, align 8, !dbg !1310, !tbaa !399
  call void @send_flow_event(ptr noundef %40, ptr noundef %41, i1 noundef zeroext false), !dbg !1311
  br label %42, !dbg !1311

42:                                               ; preds = %39, %36, %24
  br label %43, !dbg !1312

43:                                               ; preds = %42, %18, %4
  %44 = load ptr, ptr %8, align 8, !dbg !1313, !tbaa !399
  %45 = icmp ne ptr %44, null, !dbg !1313
  br i1 %45, label %46, label %71, !dbg !1315

46:                                               ; preds = %43
  %47 = load ptr, ptr %6, align 8, !dbg !1316, !tbaa !399
  %48 = getelementptr inbounds %struct.packet_info, ptr %47, i32 0, i32 8, !dbg !1317
  %49 = load i8, ptr %48, align 2, !dbg !1317, !tbaa !959
  %50 = zext i8 %49 to i32, !dbg !1316
  %51 = icmp eq i32 %50, 3, !dbg !1318
  br i1 %51, label %52, label %71, !dbg !1319

52:                                               ; preds = %46
  %53 = load ptr, ptr %8, align 8, !dbg !1320, !tbaa !399
  %54 = getelementptr inbounds %struct.flow_state, ptr %53, i32 0, i32 8, !dbg !1322
  %55 = load i8, ptr %54, align 4, !dbg !1322, !tbaa !1105, !range !628, !noundef !629
  %56 = trunc i8 %55 to i1, !dbg !1322
  %57 = zext i1 %56 to i8, !dbg !1323
  store i8 %57, ptr %9, align 1, !dbg !1323, !tbaa !627
  %58 = load ptr, ptr @bpf_map_delete_elem, align 8, !dbg !1324, !tbaa !399
  %59 = load ptr, ptr %6, align 8, !dbg !1326, !tbaa !399
  %60 = getelementptr inbounds %struct.packet_info, ptr %59, i32 0, i32 5, !dbg !1327
  %61 = getelementptr inbounds %struct.packet_id, ptr %60, i32 0, i32 0, !dbg !1328
  %62 = call i64 %58(ptr noundef @flow_state, ptr noundef %61), !dbg !1324
  %63 = icmp ne i64 %62, 0, !dbg !1324
  br i1 %63, label %70, label %64, !dbg !1329

64:                                               ; preds = %52
  %65 = load i8, ptr %9, align 1, !dbg !1330, !tbaa !627, !range !628, !noundef !629
  %66 = trunc i8 %65 to i1, !dbg !1330
  br i1 %66, label %67, label %70, !dbg !1331

67:                                               ; preds = %64
  %68 = load ptr, ptr %5, align 8, !dbg !1332, !tbaa !399
  %69 = load ptr, ptr %6, align 8, !dbg !1333, !tbaa !399
  call void @send_flow_event(ptr noundef %68, ptr noundef %69, i1 noundef zeroext true), !dbg !1334
  br label %70, !dbg !1334

70:                                               ; preds = %67, %64, %52
  br label %71, !dbg !1335

71:                                               ; preds = %70, %46, %43
  call void @llvm.lifetime.end.p0(i64 1, ptr %9) #7, !dbg !1336
  ret void, !dbg !1336
}

; Function Attrs: alwaysinline nounwind
define internal i32 @parse_ethhdr(ptr noundef %0, ptr noundef %1, ptr noundef %2) #4 !dbg !1337 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1343, metadata !DIExpression()), !dbg !1346
  store ptr %1, ptr %5, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1344, metadata !DIExpression()), !dbg !1347
  store ptr %2, ptr %6, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1345, metadata !DIExpression()), !dbg !1348
  %7 = load ptr, ptr %4, align 8, !dbg !1349, !tbaa !399
  %8 = load ptr, ptr %5, align 8, !dbg !1350, !tbaa !399
  %9 = load ptr, ptr %6, align 8, !dbg !1351, !tbaa !399
  %10 = call i32 @parse_ethhdr_vlan(ptr noundef %7, ptr noundef %8, ptr noundef %9, ptr noundef null), !dbg !1352
  ret i32 %10, !dbg !1353
}

; Function Attrs: alwaysinline nounwind
define internal i32 @parse_iphdr(ptr noundef %0, ptr noundef %1, ptr noundef %2) #4 !dbg !1354 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1359, metadata !DIExpression()), !dbg !1364
  store ptr %1, ptr %6, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1360, metadata !DIExpression()), !dbg !1365
  store ptr %2, ptr %7, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1361, metadata !DIExpression()), !dbg !1366
  call void @llvm.lifetime.start.p0(i64 8, ptr %8) #7, !dbg !1367
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1362, metadata !DIExpression()), !dbg !1368
  %11 = load ptr, ptr %5, align 8, !dbg !1369, !tbaa !399
  %12 = getelementptr inbounds %struct.hdr_cursor, ptr %11, i32 0, i32 0, !dbg !1370
  %13 = load ptr, ptr %12, align 8, !dbg !1370, !tbaa !427
  store ptr %13, ptr %8, align 8, !dbg !1368, !tbaa !399
  call void @llvm.lifetime.start.p0(i64 4, ptr %9) #7, !dbg !1371
  call void @llvm.dbg.declare(metadata ptr %9, metadata !1363, metadata !DIExpression()), !dbg !1372
  %14 = load ptr, ptr %8, align 8, !dbg !1373, !tbaa !399
  %15 = getelementptr inbounds %struct.iphdr, ptr %14, i64 1, !dbg !1375
  %16 = load ptr, ptr %6, align 8, !dbg !1376, !tbaa !399
  %17 = icmp ugt ptr %15, %16, !dbg !1377
  br i1 %17, label %18, label %19, !dbg !1378

18:                                               ; preds = %3
  store i32 -1, ptr %4, align 4, !dbg !1379
  store i32 1, ptr %10, align 4
  br label %59, !dbg !1379

19:                                               ; preds = %3
  %20 = load ptr, ptr %8, align 8, !dbg !1380, !tbaa !399
  %21 = load i8, ptr %20, align 4, !dbg !1382
  %22 = lshr i8 %21, 4, !dbg !1382
  %23 = zext i8 %22 to i32, !dbg !1380
  %24 = icmp ne i32 %23, 4, !dbg !1383
  br i1 %24, label %25, label %26, !dbg !1384

25:                                               ; preds = %19
  store i32 -1, ptr %4, align 4, !dbg !1385
  store i32 1, ptr %10, align 4
  br label %59, !dbg !1385

26:                                               ; preds = %19
  %27 = load ptr, ptr %8, align 8, !dbg !1386, !tbaa !399
  %28 = load i8, ptr %27, align 4, !dbg !1387
  %29 = and i8 %28, 15, !dbg !1387
  %30 = zext i8 %29 to i32, !dbg !1386
  %31 = mul nsw i32 %30, 4, !dbg !1388
  store i32 %31, ptr %9, align 4, !dbg !1389, !tbaa !755
  %32 = load i32, ptr %9, align 4, !dbg !1390, !tbaa !755
  %33 = sext i32 %32 to i64, !dbg !1390
  %34 = icmp ult i64 %33, 20, !dbg !1392
  br i1 %34, label %35, label %36, !dbg !1393

35:                                               ; preds = %26
  store i32 -1, ptr %4, align 4, !dbg !1394
  store i32 1, ptr %10, align 4
  br label %59, !dbg !1394

36:                                               ; preds = %26
  %37 = load ptr, ptr %5, align 8, !dbg !1395, !tbaa !399
  %38 = getelementptr inbounds %struct.hdr_cursor, ptr %37, i32 0, i32 0, !dbg !1397
  %39 = load ptr, ptr %38, align 8, !dbg !1397, !tbaa !427
  %40 = load i32, ptr %9, align 4, !dbg !1398, !tbaa !755
  %41 = sext i32 %40 to i64, !dbg !1399
  %42 = getelementptr i8, ptr %39, i64 %41, !dbg !1399
  %43 = load ptr, ptr %6, align 8, !dbg !1400, !tbaa !399
  %44 = icmp ugt ptr %42, %43, !dbg !1401
  br i1 %44, label %45, label %46, !dbg !1402

45:                                               ; preds = %36
  store i32 -1, ptr %4, align 4, !dbg !1403
  store i32 1, ptr %10, align 4
  br label %59, !dbg !1403

46:                                               ; preds = %36
  %47 = load i32, ptr %9, align 4, !dbg !1404, !tbaa !755
  %48 = load ptr, ptr %5, align 8, !dbg !1405, !tbaa !399
  %49 = getelementptr inbounds %struct.hdr_cursor, ptr %48, i32 0, i32 0, !dbg !1406
  %50 = load ptr, ptr %49, align 8, !dbg !1407, !tbaa !427
  %51 = sext i32 %47 to i64, !dbg !1407
  %52 = getelementptr i8, ptr %50, i64 %51, !dbg !1407
  store ptr %52, ptr %49, align 8, !dbg !1407, !tbaa !427
  %53 = load ptr, ptr %8, align 8, !dbg !1408, !tbaa !399
  %54 = load ptr, ptr %7, align 8, !dbg !1409, !tbaa !399
  store ptr %53, ptr %54, align 8, !dbg !1410, !tbaa !399
  %55 = load ptr, ptr %8, align 8, !dbg !1411, !tbaa !399
  %56 = getelementptr inbounds %struct.iphdr, ptr %55, i32 0, i32 6, !dbg !1412
  %57 = load i8, ptr %56, align 1, !dbg !1412, !tbaa !1413
  %58 = zext i8 %57 to i32, !dbg !1411
  store i32 %58, ptr %4, align 4, !dbg !1415
  store i32 1, ptr %10, align 4
  br label %59, !dbg !1415

59:                                               ; preds = %46, %45, %35, %25, %18
  call void @llvm.lifetime.end.p0(i64 4, ptr %9) #7, !dbg !1416
  call void @llvm.lifetime.end.p0(i64 8, ptr %8) #7, !dbg !1416
  %60 = load i32, ptr %4, align 4, !dbg !1416
  ret i32 %60, !dbg !1416
}

; Function Attrs: alwaysinline nounwind
define internal i32 @parse_ip6hdr(ptr noundef %0, ptr noundef %1, ptr noundef %2) #4 !dbg !1417 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %5, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1422, metadata !DIExpression()), !dbg !1426
  store ptr %1, ptr %6, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1423, metadata !DIExpression()), !dbg !1427
  store ptr %2, ptr %7, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1424, metadata !DIExpression()), !dbg !1428
  call void @llvm.lifetime.start.p0(i64 8, ptr %8) #7, !dbg !1429
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1425, metadata !DIExpression()), !dbg !1430
  %10 = load ptr, ptr %5, align 8, !dbg !1431, !tbaa !399
  %11 = getelementptr inbounds %struct.hdr_cursor, ptr %10, i32 0, i32 0, !dbg !1432
  %12 = load ptr, ptr %11, align 8, !dbg !1432, !tbaa !427
  store ptr %12, ptr %8, align 8, !dbg !1430, !tbaa !399
  %13 = load ptr, ptr %8, align 8, !dbg !1433, !tbaa !399
  %14 = getelementptr inbounds %struct.ipv6hdr, ptr %13, i64 1, !dbg !1435
  %15 = load ptr, ptr %6, align 8, !dbg !1436, !tbaa !399
  %16 = icmp ugt ptr %14, %15, !dbg !1437
  br i1 %16, label %17, label %18, !dbg !1438

17:                                               ; preds = %3
  store i32 -1, ptr %4, align 4, !dbg !1439
  store i32 1, ptr %9, align 4
  br label %38, !dbg !1439

18:                                               ; preds = %3
  %19 = load ptr, ptr %8, align 8, !dbg !1440, !tbaa !399
  %20 = load i8, ptr %19, align 4, !dbg !1442
  %21 = lshr i8 %20, 4, !dbg !1442
  %22 = zext i8 %21 to i32, !dbg !1440
  %23 = icmp ne i32 %22, 6, !dbg !1443
  br i1 %23, label %24, label %25, !dbg !1444

24:                                               ; preds = %18
  store i32 -1, ptr %4, align 4, !dbg !1445
  store i32 1, ptr %9, align 4
  br label %38, !dbg !1445

25:                                               ; preds = %18
  %26 = load ptr, ptr %8, align 8, !dbg !1446, !tbaa !399
  %27 = getelementptr inbounds %struct.ipv6hdr, ptr %26, i64 1, !dbg !1447
  %28 = load ptr, ptr %5, align 8, !dbg !1448, !tbaa !399
  %29 = getelementptr inbounds %struct.hdr_cursor, ptr %28, i32 0, i32 0, !dbg !1449
  store ptr %27, ptr %29, align 8, !dbg !1450, !tbaa !427
  %30 = load ptr, ptr %8, align 8, !dbg !1451, !tbaa !399
  %31 = load ptr, ptr %7, align 8, !dbg !1452, !tbaa !399
  store ptr %30, ptr %31, align 8, !dbg !1453, !tbaa !399
  %32 = load ptr, ptr %5, align 8, !dbg !1454, !tbaa !399
  %33 = load ptr, ptr %6, align 8, !dbg !1455, !tbaa !399
  %34 = load ptr, ptr %8, align 8, !dbg !1456, !tbaa !399
  %35 = getelementptr inbounds %struct.ipv6hdr, ptr %34, i32 0, i32 3, !dbg !1457
  %36 = load i8, ptr %35, align 2, !dbg !1457, !tbaa !1458
  %37 = call i32 @skip_ip6hdrext(ptr noundef %32, ptr noundef %33, i8 noundef zeroext %36), !dbg !1460
  store i32 %37, ptr %4, align 4, !dbg !1461
  store i32 1, ptr %9, align 4
  br label %38, !dbg !1461

38:                                               ; preds = %25, %24, %17
  call void @llvm.lifetime.end.p0(i64 8, ptr %8) #7, !dbg !1462
  %39 = load i32, ptr %4, align 4, !dbg !1462
  ret i32 %39, !dbg !1462
}

; Function Attrs: nounwind
define internal i32 @parse_tcp_identifier(ptr noundef %0, ptr noundef %1) #0 !dbg !1463 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1465, metadata !DIExpression()), !dbg !1467
  store ptr %1, ptr %5, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1466, metadata !DIExpression()), !dbg !1468
  %6 = load ptr, ptr %4, align 8, !dbg !1469, !tbaa !399
  %7 = getelementptr inbounds %struct.parsing_context, ptr %6, i32 0, i32 2, !dbg !1471
  %8 = load ptr, ptr %4, align 8, !dbg !1472, !tbaa !399
  %9 = getelementptr inbounds %struct.parsing_context, ptr %8, i32 0, i32 1, !dbg !1473
  %10 = load ptr, ptr %9, align 8, !dbg !1473, !tbaa !424
  %11 = load ptr, ptr %5, align 8, !dbg !1474, !tbaa !399
  %12 = getelementptr inbounds %struct.packet_info, ptr %11, i32 0, i32 1, !dbg !1475
  %13 = call i32 @parse_tcphdr(ptr noundef %7, ptr noundef %10, ptr noundef %12), !dbg !1476
  %14 = icmp slt i32 %13, 0, !dbg !1477
  br i1 %14, label %15, label %16, !dbg !1478

15:                                               ; preds = %2
  store i32 -1, ptr %3, align 4, !dbg !1479
  br label %153, !dbg !1479

16:                                               ; preds = %2
  %17 = load ptr, ptr %5, align 8, !dbg !1480, !tbaa !399
  %18 = getelementptr inbounds %struct.packet_info, ptr %17, i32 0, i32 1, !dbg !1482
  %19 = load ptr, ptr %18, align 8, !dbg !1482, !tbaa !883
  %20 = load ptr, ptr %4, align 8, !dbg !1483, !tbaa !399
  %21 = getelementptr inbounds %struct.parsing_context, ptr %20, i32 0, i32 1, !dbg !1484
  %22 = load ptr, ptr %21, align 8, !dbg !1484, !tbaa !424
  %23 = load ptr, ptr %5, align 8, !dbg !1485, !tbaa !399
  %24 = getelementptr inbounds %struct.packet_info, ptr %23, i32 0, i32 4, !dbg !1486
  %25 = getelementptr inbounds %struct.packet_id, ptr %24, i32 0, i32 1, !dbg !1487
  %26 = load ptr, ptr %5, align 8, !dbg !1488, !tbaa !399
  %27 = getelementptr inbounds %struct.packet_info, ptr %26, i32 0, i32 5, !dbg !1489
  %28 = getelementptr inbounds %struct.packet_id, ptr %27, i32 0, i32 1, !dbg !1490
  %29 = call i32 @parse_tcp_ts(ptr noundef %19, ptr noundef %22, ptr noundef %25, ptr noundef %28), !dbg !1491
  %30 = icmp slt i32 %29, 0, !dbg !1492
  br i1 %30, label %31, label %32, !dbg !1493

31:                                               ; preds = %16
  store i32 -1, ptr %3, align 4, !dbg !1494
  br label %153, !dbg !1494

32:                                               ; preds = %16
  %33 = load ptr, ptr %5, align 8, !dbg !1495, !tbaa !399
  %34 = getelementptr inbounds %struct.packet_info, ptr %33, i32 0, i32 1, !dbg !1496
  %35 = load ptr, ptr %34, align 8, !dbg !1496, !tbaa !883
  %36 = getelementptr inbounds %struct.tcphdr, ptr %35, i32 0, i32 0, !dbg !1497
  %37 = load i16, ptr %36, align 4, !dbg !1497, !tbaa !1498
  %38 = load ptr, ptr %5, align 8, !dbg !1500, !tbaa !399
  %39 = getelementptr inbounds %struct.packet_info, ptr %38, i32 0, i32 4, !dbg !1501
  %40 = getelementptr inbounds %struct.packet_id, ptr %39, i32 0, i32 0, !dbg !1502
  %41 = getelementptr inbounds %struct.network_tuple, ptr %40, i32 0, i32 0, !dbg !1503
  %42 = getelementptr inbounds %struct.flow_address, ptr %41, i32 0, i32 1, !dbg !1504
  store i16 %37, ptr %42, align 4, !dbg !1505, !tbaa !1506
  %43 = load ptr, ptr %5, align 8, !dbg !1507, !tbaa !399
  %44 = getelementptr inbounds %struct.packet_info, ptr %43, i32 0, i32 1, !dbg !1508
  %45 = load ptr, ptr %44, align 8, !dbg !1508, !tbaa !883
  %46 = getelementptr inbounds %struct.tcphdr, ptr %45, i32 0, i32 1, !dbg !1509
  %47 = load i16, ptr %46, align 2, !dbg !1509, !tbaa !1510
  %48 = load ptr, ptr %5, align 8, !dbg !1511, !tbaa !399
  %49 = getelementptr inbounds %struct.packet_info, ptr %48, i32 0, i32 4, !dbg !1512
  %50 = getelementptr inbounds %struct.packet_id, ptr %49, i32 0, i32 0, !dbg !1513
  %51 = getelementptr inbounds %struct.network_tuple, ptr %50, i32 0, i32 1, !dbg !1514
  %52 = getelementptr inbounds %struct.flow_address, ptr %51, i32 0, i32 1, !dbg !1515
  store i16 %47, ptr %52, align 4, !dbg !1516, !tbaa !1517
  %53 = load ptr, ptr %4, align 8, !dbg !1518, !tbaa !399
  %54 = getelementptr inbounds %struct.parsing_context, ptr %53, i32 0, i32 2, !dbg !1519
  %55 = getelementptr inbounds %struct.hdr_cursor, ptr %54, i32 0, i32 0, !dbg !1520
  %56 = load ptr, ptr %55, align 8, !dbg !1520, !tbaa !1521
  %57 = load ptr, ptr %4, align 8, !dbg !1522, !tbaa !399
  %58 = getelementptr inbounds %struct.parsing_context, ptr %57, i32 0, i32 0, !dbg !1523
  %59 = load ptr, ptr %58, align 8, !dbg !1523, !tbaa !415
  %60 = ptrtoint ptr %56 to i64, !dbg !1524
  %61 = ptrtoint ptr %59 to i64, !dbg !1524
  %62 = sub i64 %60, %61, !dbg !1524
  %63 = load ptr, ptr %4, align 8, !dbg !1525, !tbaa !399
  %64 = getelementptr inbounds %struct.parsing_context, ptr %63, i32 0, i32 3, !dbg !1526
  %65 = load i32, ptr %64, align 8, !dbg !1526, !tbaa !431
  %66 = zext i32 %65 to i64, !dbg !1525
  %67 = icmp slt i64 %62, %66, !dbg !1527
  br i1 %67, label %78, label %68, !dbg !1528

68:                                               ; preds = %32
  %69 = load ptr, ptr %5, align 8, !dbg !1529, !tbaa !399
  %70 = getelementptr inbounds %struct.packet_info, ptr %69, i32 0, i32 1, !dbg !1530
  %71 = load ptr, ptr %70, align 8, !dbg !1530, !tbaa !883
  %72 = getelementptr inbounds %struct.tcphdr, ptr %71, i32 0, i32 4, !dbg !1531
  %73 = load i16, ptr %72, align 4, !dbg !1531
  %74 = lshr i16 %73, 9, !dbg !1531
  %75 = and i16 %74, 1, !dbg !1531
  %76 = zext i16 %75 to i32, !dbg !1529
  %77 = icmp ne i32 %76, 0, !dbg !1528
  br label %78, !dbg !1528

78:                                               ; preds = %68, %32
  %79 = phi i1 [ true, %32 ], [ %77, %68 ]
  %80 = load ptr, ptr %5, align 8, !dbg !1532, !tbaa !399
  %81 = getelementptr inbounds %struct.packet_info, ptr %80, i32 0, i32 6, !dbg !1533
  %82 = zext i1 %79 to i8, !dbg !1534
  store i8 %82, ptr %81, align 4, !dbg !1534, !tbaa !955
  %83 = load ptr, ptr %5, align 8, !dbg !1535, !tbaa !399
  %84 = getelementptr inbounds %struct.packet_info, ptr %83, i32 0, i32 1, !dbg !1536
  %85 = load ptr, ptr %84, align 8, !dbg !1536, !tbaa !883
  %86 = getelementptr inbounds %struct.tcphdr, ptr %85, i32 0, i32 4, !dbg !1537
  %87 = load i16, ptr %86, align 4, !dbg !1537
  %88 = lshr i16 %87, 12, !dbg !1537
  %89 = and i16 %88, 1, !dbg !1537
  %90 = icmp ne i16 %89, 0, !dbg !1535
  %91 = load ptr, ptr %5, align 8, !dbg !1538, !tbaa !399
  %92 = getelementptr inbounds %struct.packet_info, ptr %91, i32 0, i32 7, !dbg !1539
  %93 = zext i1 %90 to i8, !dbg !1540
  store i8 %93, ptr %92, align 1, !dbg !1540, !tbaa !1173
  %94 = load ptr, ptr %5, align 8, !dbg !1541, !tbaa !399
  %95 = getelementptr inbounds %struct.packet_info, ptr %94, i32 0, i32 1, !dbg !1543
  %96 = load ptr, ptr %95, align 8, !dbg !1543, !tbaa !883
  %97 = getelementptr inbounds %struct.tcphdr, ptr %96, i32 0, i32 4, !dbg !1544
  %98 = load i16, ptr %97, align 4, !dbg !1544
  %99 = lshr i16 %98, 10, !dbg !1544
  %100 = and i16 %99, 1, !dbg !1544
  %101 = icmp ne i16 %100, 0, !dbg !1541
  br i1 %101, label %102, label %107, !dbg !1545

102:                                              ; preds = %78
  %103 = load ptr, ptr %5, align 8, !dbg !1546, !tbaa !399
  %104 = getelementptr inbounds %struct.packet_info, ptr %103, i32 0, i32 8, !dbg !1548
  store i8 3, ptr %104, align 2, !dbg !1549, !tbaa !959
  %105 = load ptr, ptr %5, align 8, !dbg !1550, !tbaa !399
  %106 = getelementptr inbounds %struct.packet_info, ptr %105, i32 0, i32 9, !dbg !1551
  store i8 4, ptr %106, align 1, !dbg !1552, !tbaa !1553
  br label %152, !dbg !1554

107:                                              ; preds = %78
  %108 = load ptr, ptr %5, align 8, !dbg !1555, !tbaa !399
  %109 = getelementptr inbounds %struct.packet_info, ptr %108, i32 0, i32 1, !dbg !1557
  %110 = load ptr, ptr %109, align 8, !dbg !1557, !tbaa !883
  %111 = getelementptr inbounds %struct.tcphdr, ptr %110, i32 0, i32 4, !dbg !1558
  %112 = load i16, ptr %111, align 4, !dbg !1558
  %113 = lshr i16 %112, 8, !dbg !1558
  %114 = and i16 %113, 1, !dbg !1558
  %115 = icmp ne i16 %114, 0, !dbg !1555
  br i1 %115, label %116, label %121, !dbg !1559

116:                                              ; preds = %107
  %117 = load ptr, ptr %5, align 8, !dbg !1560, !tbaa !399
  %118 = getelementptr inbounds %struct.packet_info, ptr %117, i32 0, i32 8, !dbg !1562
  store i8 2, ptr %118, align 2, !dbg !1563, !tbaa !959
  %119 = load ptr, ptr %5, align 8, !dbg !1564, !tbaa !399
  %120 = getelementptr inbounds %struct.packet_info, ptr %119, i32 0, i32 9, !dbg !1565
  store i8 3, ptr %120, align 1, !dbg !1566, !tbaa !1553
  br label %151, !dbg !1567

121:                                              ; preds = %107
  %122 = load ptr, ptr %5, align 8, !dbg !1568, !tbaa !399
  %123 = getelementptr inbounds %struct.packet_info, ptr %122, i32 0, i32 1, !dbg !1570
  %124 = load ptr, ptr %123, align 8, !dbg !1570, !tbaa !883
  %125 = getelementptr inbounds %struct.tcphdr, ptr %124, i32 0, i32 4, !dbg !1571
  %126 = load i16, ptr %125, align 4, !dbg !1571
  %127 = lshr i16 %126, 9, !dbg !1571
  %128 = and i16 %127, 1, !dbg !1571
  %129 = icmp ne i16 %128, 0, !dbg !1568
  br i1 %129, label %130, label %147, !dbg !1572

130:                                              ; preds = %121
  %131 = load ptr, ptr %5, align 8, !dbg !1573, !tbaa !399
  %132 = getelementptr inbounds %struct.packet_info, ptr %131, i32 0, i32 8, !dbg !1575
  store i8 1, ptr %132, align 2, !dbg !1576, !tbaa !959
  %133 = load ptr, ptr %5, align 8, !dbg !1577, !tbaa !399
  %134 = getelementptr inbounds %struct.packet_info, ptr %133, i32 0, i32 1, !dbg !1578
  %135 = load ptr, ptr %134, align 8, !dbg !1578, !tbaa !883
  %136 = getelementptr inbounds %struct.tcphdr, ptr %135, i32 0, i32 4, !dbg !1579
  %137 = load i16, ptr %136, align 4, !dbg !1579
  %138 = lshr i16 %137, 12, !dbg !1579
  %139 = and i16 %138, 1, !dbg !1579
  %140 = zext i16 %139 to i32, !dbg !1577
  %141 = icmp ne i32 %140, 0, !dbg !1577
  %142 = zext i1 %141 to i64, !dbg !1577
  %143 = select i1 %141, i32 1, i32 0, !dbg !1577
  %144 = trunc i32 %143 to i8, !dbg !1577
  %145 = load ptr, ptr %5, align 8, !dbg !1580, !tbaa !399
  %146 = getelementptr inbounds %struct.packet_info, ptr %145, i32 0, i32 9, !dbg !1581
  store i8 %144, ptr %146, align 1, !dbg !1582, !tbaa !1553
  br label %150, !dbg !1583

147:                                              ; preds = %121
  %148 = load ptr, ptr %5, align 8, !dbg !1584, !tbaa !399
  %149 = getelementptr inbounds %struct.packet_info, ptr %148, i32 0, i32 8, !dbg !1586
  store i8 0, ptr %149, align 2, !dbg !1587, !tbaa !959
  br label %150

150:                                              ; preds = %147, %130
  br label %151

151:                                              ; preds = %150, %116
  br label %152

152:                                              ; preds = %151, %102
  store i32 0, ptr %3, align 4, !dbg !1588
  br label %153, !dbg !1588

153:                                              ; preds = %152, %31, %15
  %154 = load i32, ptr %3, align 4, !dbg !1589
  ret i32 %154, !dbg !1589
}

; Function Attrs: nounwind
define internal i32 @parse_icmp6_identifier(ptr noundef %0, ptr noundef %1) #0 !dbg !1590 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1592, metadata !DIExpression()), !dbg !1594
  store ptr %1, ptr %5, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1593, metadata !DIExpression()), !dbg !1595
  %6 = load ptr, ptr %4, align 8, !dbg !1596, !tbaa !399
  %7 = getelementptr inbounds %struct.parsing_context, ptr %6, i32 0, i32 2, !dbg !1598
  %8 = load ptr, ptr %4, align 8, !dbg !1599, !tbaa !399
  %9 = getelementptr inbounds %struct.parsing_context, ptr %8, i32 0, i32 1, !dbg !1600
  %10 = load ptr, ptr %9, align 8, !dbg !1600, !tbaa !424
  %11 = load ptr, ptr %5, align 8, !dbg !1601, !tbaa !399
  %12 = getelementptr inbounds %struct.packet_info, ptr %11, i32 0, i32 1, !dbg !1602
  %13 = call i32 @parse_icmp6hdr(ptr noundef %7, ptr noundef %10, ptr noundef %12), !dbg !1603
  %14 = icmp slt i32 %13, 0, !dbg !1604
  br i1 %14, label %15, label %16, !dbg !1605

15:                                               ; preds = %2
  store i32 -1, ptr %3, align 4, !dbg !1606
  br label %98, !dbg !1606

16:                                               ; preds = %2
  %17 = load ptr, ptr %5, align 8, !dbg !1607, !tbaa !399
  %18 = getelementptr inbounds %struct.packet_info, ptr %17, i32 0, i32 1, !dbg !1609
  %19 = load ptr, ptr %18, align 8, !dbg !1609, !tbaa !883
  %20 = getelementptr inbounds %struct.icmp6hdr, ptr %19, i32 0, i32 1, !dbg !1610
  %21 = load i8, ptr %20, align 1, !dbg !1610, !tbaa !1611
  %22 = zext i8 %21 to i32, !dbg !1607
  %23 = icmp ne i32 %22, 0, !dbg !1613
  br i1 %23, label %24, label %25, !dbg !1614

24:                                               ; preds = %16
  store i32 -1, ptr %3, align 4, !dbg !1615
  br label %98, !dbg !1615

25:                                               ; preds = %16
  %26 = load ptr, ptr %5, align 8, !dbg !1616, !tbaa !399
  %27 = getelementptr inbounds %struct.packet_info, ptr %26, i32 0, i32 1, !dbg !1618
  %28 = load ptr, ptr %27, align 8, !dbg !1618, !tbaa !883
  %29 = getelementptr inbounds %struct.icmp6hdr, ptr %28, i32 0, i32 0, !dbg !1619
  %30 = load i8, ptr %29, align 4, !dbg !1619, !tbaa !1620
  %31 = zext i8 %30 to i32, !dbg !1616
  %32 = icmp eq i32 %31, 128, !dbg !1621
  br i1 %32, label %33, label %48, !dbg !1622

33:                                               ; preds = %25
  %34 = load ptr, ptr %5, align 8, !dbg !1623, !tbaa !399
  %35 = getelementptr inbounds %struct.packet_info, ptr %34, i32 0, i32 1, !dbg !1625
  %36 = load ptr, ptr %35, align 8, !dbg !1625, !tbaa !883
  %37 = getelementptr inbounds %struct.icmp6hdr, ptr %36, i32 0, i32 3, !dbg !1626
  %38 = getelementptr inbounds %struct.icmpv6_echo, ptr %37, i32 0, i32 1, !dbg !1626
  %39 = load i16, ptr %38, align 2, !dbg !1626, !tbaa !883
  %40 = zext i16 %39 to i32, !dbg !1623
  %41 = load ptr, ptr %5, align 8, !dbg !1627, !tbaa !399
  %42 = getelementptr inbounds %struct.packet_info, ptr %41, i32 0, i32 4, !dbg !1628
  %43 = getelementptr inbounds %struct.packet_id, ptr %42, i32 0, i32 1, !dbg !1629
  store i32 %40, ptr %43, align 4, !dbg !1630, !tbaa !1035
  %44 = load ptr, ptr %5, align 8, !dbg !1631, !tbaa !399
  %45 = getelementptr inbounds %struct.packet_info, ptr %44, i32 0, i32 6, !dbg !1632
  store i8 1, ptr %45, align 4, !dbg !1633, !tbaa !955
  %46 = load ptr, ptr %5, align 8, !dbg !1634, !tbaa !399
  %47 = getelementptr inbounds %struct.packet_info, ptr %46, i32 0, i32 7, !dbg !1635
  store i8 0, ptr %47, align 1, !dbg !1636, !tbaa !1173
  br label %73, !dbg !1637

48:                                               ; preds = %25
  %49 = load ptr, ptr %5, align 8, !dbg !1638, !tbaa !399
  %50 = getelementptr inbounds %struct.packet_info, ptr %49, i32 0, i32 1, !dbg !1640
  %51 = load ptr, ptr %50, align 8, !dbg !1640, !tbaa !883
  %52 = getelementptr inbounds %struct.icmp6hdr, ptr %51, i32 0, i32 0, !dbg !1641
  %53 = load i8, ptr %52, align 4, !dbg !1641, !tbaa !1620
  %54 = zext i8 %53 to i32, !dbg !1638
  %55 = icmp eq i32 %54, 129, !dbg !1642
  br i1 %55, label %56, label %71, !dbg !1643

56:                                               ; preds = %48
  %57 = load ptr, ptr %5, align 8, !dbg !1644, !tbaa !399
  %58 = getelementptr inbounds %struct.packet_info, ptr %57, i32 0, i32 1, !dbg !1646
  %59 = load ptr, ptr %58, align 8, !dbg !1646, !tbaa !883
  %60 = getelementptr inbounds %struct.icmp6hdr, ptr %59, i32 0, i32 3, !dbg !1647
  %61 = getelementptr inbounds %struct.icmpv6_echo, ptr %60, i32 0, i32 1, !dbg !1647
  %62 = load i16, ptr %61, align 2, !dbg !1647, !tbaa !883
  %63 = zext i16 %62 to i32, !dbg !1644
  %64 = load ptr, ptr %5, align 8, !dbg !1648, !tbaa !399
  %65 = getelementptr inbounds %struct.packet_info, ptr %64, i32 0, i32 5, !dbg !1649
  %66 = getelementptr inbounds %struct.packet_id, ptr %65, i32 0, i32 1, !dbg !1650
  store i32 %63, ptr %66, align 4, !dbg !1651, !tbaa !1652
  %67 = load ptr, ptr %5, align 8, !dbg !1653, !tbaa !399
  %68 = getelementptr inbounds %struct.packet_info, ptr %67, i32 0, i32 7, !dbg !1654
  store i8 1, ptr %68, align 1, !dbg !1655, !tbaa !1173
  %69 = load ptr, ptr %5, align 8, !dbg !1656, !tbaa !399
  %70 = getelementptr inbounds %struct.packet_info, ptr %69, i32 0, i32 6, !dbg !1657
  store i8 0, ptr %70, align 4, !dbg !1658, !tbaa !955
  br label %72, !dbg !1659

71:                                               ; preds = %48
  store i32 -1, ptr %3, align 4, !dbg !1660
  br label %98, !dbg !1660

72:                                               ; preds = %56
  br label %73

73:                                               ; preds = %72, %33
  %74 = load ptr, ptr %5, align 8, !dbg !1662, !tbaa !399
  %75 = getelementptr inbounds %struct.packet_info, ptr %74, i32 0, i32 8, !dbg !1663
  store i8 0, ptr %75, align 2, !dbg !1664, !tbaa !959
  %76 = load ptr, ptr %5, align 8, !dbg !1665, !tbaa !399
  %77 = getelementptr inbounds %struct.packet_info, ptr %76, i32 0, i32 1, !dbg !1666
  %78 = load ptr, ptr %77, align 8, !dbg !1666, !tbaa !883
  %79 = getelementptr inbounds %struct.icmp6hdr, ptr %78, i32 0, i32 3, !dbg !1667
  %80 = getelementptr inbounds %struct.icmpv6_echo, ptr %79, i32 0, i32 0, !dbg !1667
  %81 = load i16, ptr %80, align 4, !dbg !1667, !tbaa !883
  %82 = load ptr, ptr %5, align 8, !dbg !1668, !tbaa !399
  %83 = getelementptr inbounds %struct.packet_info, ptr %82, i32 0, i32 4, !dbg !1669
  %84 = getelementptr inbounds %struct.packet_id, ptr %83, i32 0, i32 0, !dbg !1670
  %85 = getelementptr inbounds %struct.network_tuple, ptr %84, i32 0, i32 0, !dbg !1671
  %86 = getelementptr inbounds %struct.flow_address, ptr %85, i32 0, i32 1, !dbg !1672
  store i16 %81, ptr %86, align 4, !dbg !1673, !tbaa !1506
  %87 = load ptr, ptr %5, align 8, !dbg !1674, !tbaa !399
  %88 = getelementptr inbounds %struct.packet_info, ptr %87, i32 0, i32 4, !dbg !1675
  %89 = getelementptr inbounds %struct.packet_id, ptr %88, i32 0, i32 0, !dbg !1676
  %90 = getelementptr inbounds %struct.network_tuple, ptr %89, i32 0, i32 0, !dbg !1677
  %91 = getelementptr inbounds %struct.flow_address, ptr %90, i32 0, i32 1, !dbg !1678
  %92 = load i16, ptr %91, align 4, !dbg !1678, !tbaa !1506
  %93 = load ptr, ptr %5, align 8, !dbg !1679, !tbaa !399
  %94 = getelementptr inbounds %struct.packet_info, ptr %93, i32 0, i32 4, !dbg !1680
  %95 = getelementptr inbounds %struct.packet_id, ptr %94, i32 0, i32 0, !dbg !1681
  %96 = getelementptr inbounds %struct.network_tuple, ptr %95, i32 0, i32 1, !dbg !1682
  %97 = getelementptr inbounds %struct.flow_address, ptr %96, i32 0, i32 1, !dbg !1683
  store i16 %92, ptr %97, align 4, !dbg !1684, !tbaa !1517
  store i32 0, ptr %3, align 4, !dbg !1685
  br label %98, !dbg !1685

98:                                               ; preds = %73, %71, %24, %15
  %99 = load i32, ptr %3, align 4, !dbg !1686
  ret i32 %99, !dbg !1686
}

; Function Attrs: nounwind
define internal i32 @parse_icmp_identifier(ptr noundef %0, ptr noundef %1) #0 !dbg !1687 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1689, metadata !DIExpression()), !dbg !1691
  store ptr %1, ptr %5, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1690, metadata !DIExpression()), !dbg !1692
  %6 = load ptr, ptr %4, align 8, !dbg !1693, !tbaa !399
  %7 = getelementptr inbounds %struct.parsing_context, ptr %6, i32 0, i32 2, !dbg !1695
  %8 = load ptr, ptr %4, align 8, !dbg !1696, !tbaa !399
  %9 = getelementptr inbounds %struct.parsing_context, ptr %8, i32 0, i32 1, !dbg !1697
  %10 = load ptr, ptr %9, align 8, !dbg !1697, !tbaa !424
  %11 = load ptr, ptr %5, align 8, !dbg !1698, !tbaa !399
  %12 = getelementptr inbounds %struct.packet_info, ptr %11, i32 0, i32 1, !dbg !1699
  %13 = call i32 @parse_icmphdr(ptr noundef %7, ptr noundef %10, ptr noundef %12), !dbg !1700
  %14 = icmp slt i32 %13, 0, !dbg !1701
  br i1 %14, label %15, label %16, !dbg !1702

15:                                               ; preds = %2
  store i32 -1, ptr %3, align 4, !dbg !1703
  br label %98, !dbg !1703

16:                                               ; preds = %2
  %17 = load ptr, ptr %5, align 8, !dbg !1704, !tbaa !399
  %18 = getelementptr inbounds %struct.packet_info, ptr %17, i32 0, i32 1, !dbg !1706
  %19 = load ptr, ptr %18, align 8, !dbg !1706, !tbaa !883
  %20 = getelementptr inbounds %struct.icmphdr, ptr %19, i32 0, i32 1, !dbg !1707
  %21 = load i8, ptr %20, align 1, !dbg !1707, !tbaa !1708
  %22 = zext i8 %21 to i32, !dbg !1704
  %23 = icmp ne i32 %22, 0, !dbg !1710
  br i1 %23, label %24, label %25, !dbg !1711

24:                                               ; preds = %16
  store i32 -1, ptr %3, align 4, !dbg !1712
  br label %98, !dbg !1712

25:                                               ; preds = %16
  %26 = load ptr, ptr %5, align 8, !dbg !1713, !tbaa !399
  %27 = getelementptr inbounds %struct.packet_info, ptr %26, i32 0, i32 1, !dbg !1715
  %28 = load ptr, ptr %27, align 8, !dbg !1715, !tbaa !883
  %29 = getelementptr inbounds %struct.icmphdr, ptr %28, i32 0, i32 0, !dbg !1716
  %30 = load i8, ptr %29, align 4, !dbg !1716, !tbaa !1717
  %31 = zext i8 %30 to i32, !dbg !1713
  %32 = icmp eq i32 %31, 8, !dbg !1718
  br i1 %32, label %33, label %48, !dbg !1719

33:                                               ; preds = %25
  %34 = load ptr, ptr %5, align 8, !dbg !1720, !tbaa !399
  %35 = getelementptr inbounds %struct.packet_info, ptr %34, i32 0, i32 1, !dbg !1722
  %36 = load ptr, ptr %35, align 8, !dbg !1722, !tbaa !883
  %37 = getelementptr inbounds %struct.icmphdr, ptr %36, i32 0, i32 3, !dbg !1723
  %38 = getelementptr inbounds %struct.anon.16, ptr %37, i32 0, i32 1, !dbg !1724
  %39 = load i16, ptr %38, align 2, !dbg !1724, !tbaa !883
  %40 = zext i16 %39 to i32, !dbg !1720
  %41 = load ptr, ptr %5, align 8, !dbg !1725, !tbaa !399
  %42 = getelementptr inbounds %struct.packet_info, ptr %41, i32 0, i32 4, !dbg !1726
  %43 = getelementptr inbounds %struct.packet_id, ptr %42, i32 0, i32 1, !dbg !1727
  store i32 %40, ptr %43, align 4, !dbg !1728, !tbaa !1035
  %44 = load ptr, ptr %5, align 8, !dbg !1729, !tbaa !399
  %45 = getelementptr inbounds %struct.packet_info, ptr %44, i32 0, i32 6, !dbg !1730
  store i8 1, ptr %45, align 4, !dbg !1731, !tbaa !955
  %46 = load ptr, ptr %5, align 8, !dbg !1732, !tbaa !399
  %47 = getelementptr inbounds %struct.packet_info, ptr %46, i32 0, i32 7, !dbg !1733
  store i8 0, ptr %47, align 1, !dbg !1734, !tbaa !1173
  br label %73, !dbg !1735

48:                                               ; preds = %25
  %49 = load ptr, ptr %5, align 8, !dbg !1736, !tbaa !399
  %50 = getelementptr inbounds %struct.packet_info, ptr %49, i32 0, i32 1, !dbg !1738
  %51 = load ptr, ptr %50, align 8, !dbg !1738, !tbaa !883
  %52 = getelementptr inbounds %struct.icmphdr, ptr %51, i32 0, i32 0, !dbg !1739
  %53 = load i8, ptr %52, align 4, !dbg !1739, !tbaa !1717
  %54 = zext i8 %53 to i32, !dbg !1736
  %55 = icmp eq i32 %54, 0, !dbg !1740
  br i1 %55, label %56, label %71, !dbg !1741

56:                                               ; preds = %48
  %57 = load ptr, ptr %5, align 8, !dbg !1742, !tbaa !399
  %58 = getelementptr inbounds %struct.packet_info, ptr %57, i32 0, i32 1, !dbg !1744
  %59 = load ptr, ptr %58, align 8, !dbg !1744, !tbaa !883
  %60 = getelementptr inbounds %struct.icmphdr, ptr %59, i32 0, i32 3, !dbg !1745
  %61 = getelementptr inbounds %struct.anon.16, ptr %60, i32 0, i32 1, !dbg !1746
  %62 = load i16, ptr %61, align 2, !dbg !1746, !tbaa !883
  %63 = zext i16 %62 to i32, !dbg !1742
  %64 = load ptr, ptr %5, align 8, !dbg !1747, !tbaa !399
  %65 = getelementptr inbounds %struct.packet_info, ptr %64, i32 0, i32 5, !dbg !1748
  %66 = getelementptr inbounds %struct.packet_id, ptr %65, i32 0, i32 1, !dbg !1749
  store i32 %63, ptr %66, align 4, !dbg !1750, !tbaa !1652
  %67 = load ptr, ptr %5, align 8, !dbg !1751, !tbaa !399
  %68 = getelementptr inbounds %struct.packet_info, ptr %67, i32 0, i32 7, !dbg !1752
  store i8 1, ptr %68, align 1, !dbg !1753, !tbaa !1173
  %69 = load ptr, ptr %5, align 8, !dbg !1754, !tbaa !399
  %70 = getelementptr inbounds %struct.packet_info, ptr %69, i32 0, i32 6, !dbg !1755
  store i8 0, ptr %70, align 4, !dbg !1756, !tbaa !955
  br label %72, !dbg !1757

71:                                               ; preds = %48
  store i32 -1, ptr %3, align 4, !dbg !1758
  br label %98, !dbg !1758

72:                                               ; preds = %56
  br label %73

73:                                               ; preds = %72, %33
  %74 = load ptr, ptr %5, align 8, !dbg !1760, !tbaa !399
  %75 = getelementptr inbounds %struct.packet_info, ptr %74, i32 0, i32 8, !dbg !1761
  store i8 0, ptr %75, align 2, !dbg !1762, !tbaa !959
  %76 = load ptr, ptr %5, align 8, !dbg !1763, !tbaa !399
  %77 = getelementptr inbounds %struct.packet_info, ptr %76, i32 0, i32 1, !dbg !1764
  %78 = load ptr, ptr %77, align 8, !dbg !1764, !tbaa !883
  %79 = getelementptr inbounds %struct.icmphdr, ptr %78, i32 0, i32 3, !dbg !1765
  %80 = getelementptr inbounds %struct.anon.16, ptr %79, i32 0, i32 0, !dbg !1766
  %81 = load i16, ptr %80, align 4, !dbg !1766, !tbaa !883
  %82 = load ptr, ptr %5, align 8, !dbg !1767, !tbaa !399
  %83 = getelementptr inbounds %struct.packet_info, ptr %82, i32 0, i32 4, !dbg !1768
  %84 = getelementptr inbounds %struct.packet_id, ptr %83, i32 0, i32 0, !dbg !1769
  %85 = getelementptr inbounds %struct.network_tuple, ptr %84, i32 0, i32 0, !dbg !1770
  %86 = getelementptr inbounds %struct.flow_address, ptr %85, i32 0, i32 1, !dbg !1771
  store i16 %81, ptr %86, align 4, !dbg !1772, !tbaa !1506
  %87 = load ptr, ptr %5, align 8, !dbg !1773, !tbaa !399
  %88 = getelementptr inbounds %struct.packet_info, ptr %87, i32 0, i32 4, !dbg !1774
  %89 = getelementptr inbounds %struct.packet_id, ptr %88, i32 0, i32 0, !dbg !1775
  %90 = getelementptr inbounds %struct.network_tuple, ptr %89, i32 0, i32 0, !dbg !1776
  %91 = getelementptr inbounds %struct.flow_address, ptr %90, i32 0, i32 1, !dbg !1777
  %92 = load i16, ptr %91, align 4, !dbg !1777, !tbaa !1506
  %93 = load ptr, ptr %5, align 8, !dbg !1778, !tbaa !399
  %94 = getelementptr inbounds %struct.packet_info, ptr %93, i32 0, i32 4, !dbg !1779
  %95 = getelementptr inbounds %struct.packet_id, ptr %94, i32 0, i32 0, !dbg !1780
  %96 = getelementptr inbounds %struct.network_tuple, ptr %95, i32 0, i32 1, !dbg !1781
  %97 = getelementptr inbounds %struct.flow_address, ptr %96, i32 0, i32 1, !dbg !1782
  store i16 %92, ptr %97, align 4, !dbg !1783, !tbaa !1517
  store i32 0, ptr %3, align 4, !dbg !1784
  br label %98, !dbg !1784

98:                                               ; preds = %73, %71, %24, %15
  %99 = load i32, ptr %3, align 4, !dbg !1785
  ret i32 %99, !dbg !1785
}

; Function Attrs: nounwind
define internal void @map_ipv4_to_ipv6(ptr noundef %0, i32 noundef %1) #0 !dbg !1786 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1790, metadata !DIExpression()), !dbg !1792
  store i32 %1, ptr %4, align 4, !tbaa !755
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1791, metadata !DIExpression()), !dbg !1793
  %5 = load ptr, ptr %3, align 8, !dbg !1794, !tbaa !399
  %6 = getelementptr inbounds %struct.in6_addr, ptr %5, i32 0, i32 0, !dbg !1795
  %7 = getelementptr inbounds [16 x i8], ptr %6, i64 0, i64 0, !dbg !1794
  call void @llvm.memset.p0.i64(ptr align 4 %7, i8 0, i64 10, i1 false), !dbg !1796
  %8 = load ptr, ptr %3, align 8, !dbg !1797, !tbaa !399
  %9 = getelementptr inbounds %struct.in6_addr, ptr %8, i32 0, i32 0, !dbg !1798
  %10 = getelementptr inbounds [16 x i8], ptr %9, i64 0, i64 10, !dbg !1797
  call void @llvm.memset.p0.i64(ptr align 2 %10, i8 -1, i64 2, i1 false), !dbg !1799
  %11 = load i32, ptr %4, align 4, !dbg !1800, !tbaa !755
  %12 = load ptr, ptr %3, align 8, !dbg !1801, !tbaa !399
  %13 = getelementptr inbounds %struct.in6_addr, ptr %12, i32 0, i32 0, !dbg !1802
  %14 = getelementptr inbounds [4 x i32], ptr %13, i64 0, i64 3, !dbg !1801
  store i32 %11, ptr %14, align 4, !dbg !1803, !tbaa !883
  ret void, !dbg !1804
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #5

; Function Attrs: nounwind
define internal void @reverse_flow(ptr noundef %0, ptr noundef %1) #0 !dbg !1805 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1809, metadata !DIExpression()), !dbg !1811
  store ptr %1, ptr %4, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1810, metadata !DIExpression()), !dbg !1812
  %5 = load ptr, ptr %4, align 8, !dbg !1813, !tbaa !399
  %6 = getelementptr inbounds %struct.network_tuple, ptr %5, i32 0, i32 3, !dbg !1814
  %7 = load i8, ptr %6, align 2, !dbg !1814, !tbaa !1815
  %8 = load ptr, ptr %3, align 8, !dbg !1816, !tbaa !399
  %9 = getelementptr inbounds %struct.network_tuple, ptr %8, i32 0, i32 3, !dbg !1817
  store i8 %7, ptr %9, align 2, !dbg !1818, !tbaa !1815
  %10 = load ptr, ptr %4, align 8, !dbg !1819, !tbaa !399
  %11 = getelementptr inbounds %struct.network_tuple, ptr %10, i32 0, i32 2, !dbg !1820
  %12 = load i16, ptr %11, align 4, !dbg !1820, !tbaa !1821
  %13 = load ptr, ptr %3, align 8, !dbg !1822, !tbaa !399
  %14 = getelementptr inbounds %struct.network_tuple, ptr %13, i32 0, i32 2, !dbg !1823
  store i16 %12, ptr %14, align 4, !dbg !1824, !tbaa !1821
  %15 = load ptr, ptr %3, align 8, !dbg !1825, !tbaa !399
  %16 = getelementptr inbounds %struct.network_tuple, ptr %15, i32 0, i32 0, !dbg !1826
  %17 = load ptr, ptr %4, align 8, !dbg !1827, !tbaa !399
  %18 = getelementptr inbounds %struct.network_tuple, ptr %17, i32 0, i32 1, !dbg !1828
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %16, ptr align 4 %18, i64 20, i1 false), !dbg !1828, !tbaa.struct !1829
  %19 = load ptr, ptr %3, align 8, !dbg !1830, !tbaa !399
  %20 = getelementptr inbounds %struct.network_tuple, ptr %19, i32 0, i32 1, !dbg !1831
  %21 = load ptr, ptr %4, align 8, !dbg !1832, !tbaa !399
  %22 = getelementptr inbounds %struct.network_tuple, ptr %21, i32 0, i32 0, !dbg !1833
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %20, ptr align 4 %22, i64 20, i1 false), !dbg !1833, !tbaa.struct !1829
  %23 = load ptr, ptr %3, align 8, !dbg !1834, !tbaa !399
  %24 = getelementptr inbounds %struct.network_tuple, ptr %23, i32 0, i32 4, !dbg !1835
  store i8 0, ptr %24, align 1, !dbg !1836, !tbaa !1837
  ret void, !dbg !1838
}

; Function Attrs: nounwind
define internal i32 @remaining_pkt_payload(ptr noundef %0) #0 !dbg !1839 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1843, metadata !DIExpression()), !dbg !1845
  call void @llvm.lifetime.start.p0(i64 4, ptr %3) #7, !dbg !1846
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1844, metadata !DIExpression()), !dbg !1847
  %4 = load ptr, ptr %2, align 8, !dbg !1848, !tbaa !399
  %5 = getelementptr inbounds %struct.parsing_context, ptr %4, i32 0, i32 2, !dbg !1849
  %6 = getelementptr inbounds %struct.hdr_cursor, ptr %5, i32 0, i32 0, !dbg !1850
  %7 = load ptr, ptr %6, align 8, !dbg !1850, !tbaa !1521
  %8 = load ptr, ptr %2, align 8, !dbg !1851, !tbaa !399
  %9 = getelementptr inbounds %struct.parsing_context, ptr %8, i32 0, i32 0, !dbg !1852
  %10 = load ptr, ptr %9, align 8, !dbg !1852, !tbaa !415
  %11 = ptrtoint ptr %7 to i64, !dbg !1853
  %12 = ptrtoint ptr %10 to i64, !dbg !1853
  %13 = sub i64 %11, %12, !dbg !1853
  %14 = trunc i64 %13 to i32, !dbg !1848
  store i32 %14, ptr %3, align 4, !dbg !1847, !tbaa !755
  %15 = load i32, ptr %3, align 4, !dbg !1854, !tbaa !755
  %16 = load ptr, ptr %2, align 8, !dbg !1855, !tbaa !399
  %17 = getelementptr inbounds %struct.parsing_context, ptr %16, i32 0, i32 3, !dbg !1856
  %18 = load i32, ptr %17, align 8, !dbg !1856, !tbaa !431
  %19 = icmp ult i32 %15, %18, !dbg !1857
  br i1 %19, label %20, label %26, !dbg !1854

20:                                               ; preds = %1
  %21 = load ptr, ptr %2, align 8, !dbg !1858, !tbaa !399
  %22 = getelementptr inbounds %struct.parsing_context, ptr %21, i32 0, i32 3, !dbg !1859
  %23 = load i32, ptr %22, align 8, !dbg !1859, !tbaa !431
  %24 = load i32, ptr %3, align 4, !dbg !1860, !tbaa !755
  %25 = sub i32 %23, %24, !dbg !1861
  br label %27, !dbg !1854

26:                                               ; preds = %1
  br label %27, !dbg !1854

27:                                               ; preds = %26, %20
  %28 = phi i32 [ %25, %20 ], [ 0, %26 ], !dbg !1854
  call void @llvm.lifetime.end.p0(i64 4, ptr %3) #7, !dbg !1862
  ret i32 %28, !dbg !1863
}

; Function Attrs: alwaysinline nounwind
define internal i32 @parse_ethhdr_vlan(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #4 !dbg !1864 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca ptr, align 8
  %13 = alloca i16, align 2
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  store ptr %0, ptr %6, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1873, metadata !DIExpression()), !dbg !1887
  store ptr %1, ptr %7, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1874, metadata !DIExpression()), !dbg !1888
  store ptr %2, ptr %8, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1875, metadata !DIExpression()), !dbg !1889
  store ptr %3, ptr %9, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %9, metadata !1876, metadata !DIExpression()), !dbg !1890
  call void @llvm.lifetime.start.p0(i64 8, ptr %10) #7, !dbg !1891
  call void @llvm.dbg.declare(metadata ptr %10, metadata !1877, metadata !DIExpression()), !dbg !1892
  %16 = load ptr, ptr %6, align 8, !dbg !1893, !tbaa !399
  %17 = getelementptr inbounds %struct.hdr_cursor, ptr %16, i32 0, i32 0, !dbg !1894
  %18 = load ptr, ptr %17, align 8, !dbg !1894, !tbaa !427
  store ptr %18, ptr %10, align 8, !dbg !1892, !tbaa !399
  call void @llvm.lifetime.start.p0(i64 4, ptr %11) #7, !dbg !1895
  call void @llvm.dbg.declare(metadata ptr %11, metadata !1878, metadata !DIExpression()), !dbg !1896
  store i32 14, ptr %11, align 4, !dbg !1896, !tbaa !755
  call void @llvm.lifetime.start.p0(i64 8, ptr %12) #7, !dbg !1897
  call void @llvm.dbg.declare(metadata ptr %12, metadata !1879, metadata !DIExpression()), !dbg !1898
  call void @llvm.lifetime.start.p0(i64 2, ptr %13) #7, !dbg !1899
  call void @llvm.dbg.declare(metadata ptr %13, metadata !1885, metadata !DIExpression()), !dbg !1900
  call void @llvm.lifetime.start.p0(i64 4, ptr %14) #7, !dbg !1901
  call void @llvm.dbg.declare(metadata ptr %14, metadata !1886, metadata !DIExpression()), !dbg !1902
  %19 = load ptr, ptr %6, align 8, !dbg !1903, !tbaa !399
  %20 = getelementptr inbounds %struct.hdr_cursor, ptr %19, i32 0, i32 0, !dbg !1905
  %21 = load ptr, ptr %20, align 8, !dbg !1905, !tbaa !427
  %22 = load i32, ptr %11, align 4, !dbg !1906, !tbaa !755
  %23 = sext i32 %22 to i64, !dbg !1907
  %24 = getelementptr i8, ptr %21, i64 %23, !dbg !1907
  %25 = load ptr, ptr %7, align 8, !dbg !1908, !tbaa !399
  %26 = icmp ugt ptr %24, %25, !dbg !1909
  br i1 %26, label %27, label %28, !dbg !1910

27:                                               ; preds = %4
  store i32 -1, ptr %5, align 4, !dbg !1911
  store i32 1, ptr %15, align 4
  br label %113, !dbg !1911

28:                                               ; preds = %4
  %29 = load i32, ptr %11, align 4, !dbg !1912, !tbaa !755
  %30 = load ptr, ptr %6, align 8, !dbg !1913, !tbaa !399
  %31 = getelementptr inbounds %struct.hdr_cursor, ptr %30, i32 0, i32 0, !dbg !1914
  %32 = load ptr, ptr %31, align 8, !dbg !1915, !tbaa !427
  %33 = sext i32 %29 to i64, !dbg !1915
  %34 = getelementptr i8, ptr %32, i64 %33, !dbg !1915
  store ptr %34, ptr %31, align 8, !dbg !1915, !tbaa !427
  %35 = load ptr, ptr %10, align 8, !dbg !1916, !tbaa !399
  %36 = load ptr, ptr %8, align 8, !dbg !1917, !tbaa !399
  store ptr %35, ptr %36, align 8, !dbg !1918, !tbaa !399
  %37 = load ptr, ptr %6, align 8, !dbg !1919, !tbaa !399
  %38 = getelementptr inbounds %struct.hdr_cursor, ptr %37, i32 0, i32 0, !dbg !1920
  %39 = load ptr, ptr %38, align 8, !dbg !1920, !tbaa !427
  store ptr %39, ptr %12, align 8, !dbg !1921, !tbaa !399
  %40 = load ptr, ptr %10, align 8, !dbg !1922, !tbaa !399
  %41 = getelementptr inbounds %struct.ethhdr, ptr %40, i32 0, i32 2, !dbg !1923
  %42 = load i16, ptr %41, align 1, !dbg !1923, !tbaa !1924
  store i16 %42, ptr %13, align 2, !dbg !1926, !tbaa !1262
  store i32 0, ptr %14, align 4, !dbg !1927, !tbaa !755
  br label %43, !dbg !1929

43:                                               ; preds = %104, %28
  %44 = load i32, ptr %14, align 4, !dbg !1930, !tbaa !755
  %45 = icmp slt i32 %44, 2, !dbg !1932
  br i1 %45, label %46, label %107, !dbg !1933

46:                                               ; preds = %43
  %47 = load i16, ptr %13, align 2, !dbg !1934, !tbaa !1262
  %48 = call i32 @proto_is_vlan(i16 noundef zeroext %47), !dbg !1937
  %49 = icmp ne i32 %48, 0, !dbg !1937
  br i1 %49, label %51, label %50, !dbg !1938

50:                                               ; preds = %46
  br label %107, !dbg !1939

51:                                               ; preds = %46
  %52 = load ptr, ptr %12, align 8, !dbg !1940, !tbaa !399
  %53 = getelementptr inbounds %struct.vlan_hdr, ptr %52, i64 1, !dbg !1942
  %54 = load ptr, ptr %7, align 8, !dbg !1943, !tbaa !399
  %55 = icmp ugt ptr %53, %54, !dbg !1944
  br i1 %55, label %56, label %57, !dbg !1945

56:                                               ; preds = %51
  br label %107, !dbg !1946

57:                                               ; preds = %51
  %58 = load ptr, ptr %12, align 8, !dbg !1947, !tbaa !399
  %59 = getelementptr inbounds %struct.vlan_hdr, ptr %58, i32 0, i32 1, !dbg !1948
  %60 = load i16, ptr %59, align 2, !dbg !1948, !tbaa !1949
  store i16 %60, ptr %13, align 2, !dbg !1951, !tbaa !1262
  %61 = load ptr, ptr %9, align 8, !dbg !1952, !tbaa !399
  %62 = icmp ne ptr %61, null, !dbg !1952
  br i1 %62, label %63, label %101, !dbg !1954

63:                                               ; preds = %57
  %64 = load ptr, ptr %12, align 8, !dbg !1955, !tbaa !399
  %65 = getelementptr inbounds %struct.vlan_hdr, ptr %64, i32 0, i32 0, !dbg !1955
  %66 = load i16, ptr %65, align 2, !dbg !1955, !tbaa !1956
  %67 = call i1 @llvm.is.constant.i16(i16 %66), !dbg !1955
  br i1 %67, label %68, label %86, !dbg !1955

68:                                               ; preds = %63
  %69 = load ptr, ptr %12, align 8, !dbg !1955, !tbaa !399
  %70 = getelementptr inbounds %struct.vlan_hdr, ptr %69, i32 0, i32 0, !dbg !1955
  %71 = load i16, ptr %70, align 2, !dbg !1955, !tbaa !1956
  %72 = zext i16 %71 to i32, !dbg !1955
  %73 = shl i32 %72, 8, !dbg !1955
  %74 = ashr i32 %73, 8, !dbg !1955
  %75 = shl i32 %74, 8, !dbg !1955
  %76 = load ptr, ptr %12, align 8, !dbg !1955, !tbaa !399
  %77 = getelementptr inbounds %struct.vlan_hdr, ptr %76, i32 0, i32 0, !dbg !1955
  %78 = load i16, ptr %77, align 2, !dbg !1955, !tbaa !1956
  %79 = zext i16 %78 to i32, !dbg !1955
  %80 = shl i32 %79, 0, !dbg !1955
  %81 = ashr i32 %80, 8, !dbg !1955
  %82 = shl i32 %81, 0, !dbg !1955
  %83 = or i32 %75, %82, !dbg !1955
  %84 = trunc i32 %83 to i16, !dbg !1955
  %85 = zext i16 %84 to i32, !dbg !1955
  br label %92, !dbg !1955

86:                                               ; preds = %63
  %87 = load ptr, ptr %12, align 8, !dbg !1955, !tbaa !399
  %88 = getelementptr inbounds %struct.vlan_hdr, ptr %87, i32 0, i32 0, !dbg !1955
  %89 = load i16, ptr %88, align 2, !dbg !1955, !tbaa !1956
  %90 = call i16 @llvm.bswap.i16(i16 %89), !dbg !1955
  %91 = zext i16 %90 to i32, !dbg !1955
  br label %92, !dbg !1955

92:                                               ; preds = %86, %68
  %93 = phi i32 [ %85, %68 ], [ %91, %86 ], !dbg !1955
  %94 = and i32 %93, 4095, !dbg !1957
  %95 = trunc i32 %94 to i16, !dbg !1958
  %96 = load ptr, ptr %9, align 8, !dbg !1959, !tbaa !399
  %97 = getelementptr inbounds %struct.collect_vlans, ptr %96, i32 0, i32 0, !dbg !1960
  %98 = load i32, ptr %14, align 4, !dbg !1961, !tbaa !755
  %99 = sext i32 %98 to i64, !dbg !1959
  %100 = getelementptr inbounds [2 x i16], ptr %97, i64 0, i64 %99, !dbg !1959
  store i16 %95, ptr %100, align 2, !dbg !1962, !tbaa !1262
  br label %101, !dbg !1959

101:                                              ; preds = %92, %57
  %102 = load ptr, ptr %12, align 8, !dbg !1963, !tbaa !399
  %103 = getelementptr inbounds %struct.vlan_hdr, ptr %102, i32 1, !dbg !1963
  store ptr %103, ptr %12, align 8, !dbg !1963, !tbaa !399
  br label %104, !dbg !1964

104:                                              ; preds = %101
  %105 = load i32, ptr %14, align 4, !dbg !1965, !tbaa !755
  %106 = add nsw i32 %105, 1, !dbg !1965
  store i32 %106, ptr %14, align 4, !dbg !1965, !tbaa !755
  br label %43, !dbg !1966, !llvm.loop !1967

107:                                              ; preds = %56, %50, %43
  %108 = load ptr, ptr %12, align 8, !dbg !1971, !tbaa !399
  %109 = load ptr, ptr %6, align 8, !dbg !1972, !tbaa !399
  %110 = getelementptr inbounds %struct.hdr_cursor, ptr %109, i32 0, i32 0, !dbg !1973
  store ptr %108, ptr %110, align 8, !dbg !1974, !tbaa !427
  %111 = load i16, ptr %13, align 2, !dbg !1975, !tbaa !1262
  %112 = zext i16 %111 to i32, !dbg !1975
  store i32 %112, ptr %5, align 4, !dbg !1976
  store i32 1, ptr %15, align 4
  br label %113, !dbg !1976

113:                                              ; preds = %107, %27
  call void @llvm.lifetime.end.p0(i64 4, ptr %14) #7, !dbg !1977
  call void @llvm.lifetime.end.p0(i64 2, ptr %13) #7, !dbg !1977
  call void @llvm.lifetime.end.p0(i64 8, ptr %12) #7, !dbg !1977
  call void @llvm.lifetime.end.p0(i64 4, ptr %11) #7, !dbg !1977
  call void @llvm.lifetime.end.p0(i64 8, ptr %10) #7, !dbg !1977
  %114 = load i32, ptr %5, align 4, !dbg !1977
  ret i32 %114, !dbg !1977
}

; Function Attrs: alwaysinline nounwind
define internal i32 @proto_is_vlan(i16 noundef zeroext %0) #4 !dbg !1978 {
  %2 = alloca i16, align 2
  store i16 %0, ptr %2, align 2, !tbaa !1262
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1982, metadata !DIExpression()), !dbg !1983
  %3 = load i16, ptr %2, align 2, !dbg !1984, !tbaa !1262
  %4 = zext i16 %3 to i32, !dbg !1984
  %5 = icmp eq i32 %4, 129, !dbg !1985
  br i1 %5, label %10, label %6, !dbg !1986

6:                                                ; preds = %1
  %7 = load i16, ptr %2, align 2, !dbg !1987, !tbaa !1262
  %8 = zext i16 %7 to i32, !dbg !1987
  %9 = icmp eq i32 %8, 43144, !dbg !1988
  br label %10, !dbg !1986

10:                                               ; preds = %6, %1
  %11 = phi i1 [ true, %1 ], [ %9, %6 ]
  %12 = xor i1 %11, true, !dbg !1989
  %13 = xor i1 %12, true, !dbg !1990
  %14 = zext i1 %13 to i32, !dbg !1990
  ret i32 %14, !dbg !1991
}

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare i1 @llvm.is.constant.i16(i16) #6

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.bswap.i16(i16) #1

; Function Attrs: alwaysinline nounwind
define internal i32 @skip_ip6hdrext(ptr noundef %0, ptr noundef %1, i8 noundef zeroext %2) #4 !dbg !1992 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i8, align 1
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1996, metadata !DIExpression()), !dbg !2009
  store ptr %1, ptr %6, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1997, metadata !DIExpression()), !dbg !2010
  store i8 %2, ptr %7, align 1, !tbaa !883
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1998, metadata !DIExpression()), !dbg !2011
  call void @llvm.lifetime.start.p0(i64 4, ptr %8) #7, !dbg !2012
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1999, metadata !DIExpression()), !dbg !2013
  store i32 0, ptr %8, align 4, !dbg !2013, !tbaa !755
  br label %11, !dbg !2012

11:                                               ; preds = %72, %3
  %12 = load i32, ptr %8, align 4, !dbg !2014, !tbaa !755
  %13 = icmp slt i32 %12, 3, !dbg !2015
  br i1 %13, label %15, label %14, !dbg !2016

14:                                               ; preds = %11
  store i32 2, ptr %9, align 4
  br label %75, !dbg !2016

15:                                               ; preds = %11
  call void @llvm.lifetime.start.p0(i64 8, ptr %10) #7, !dbg !2017
  call void @llvm.dbg.declare(metadata ptr %10, metadata !2001, metadata !DIExpression()), !dbg !2018
  %16 = load ptr, ptr %5, align 8, !dbg !2019, !tbaa !399
  %17 = getelementptr inbounds %struct.hdr_cursor, ptr %16, i32 0, i32 0, !dbg !2020
  %18 = load ptr, ptr %17, align 8, !dbg !2020, !tbaa !427
  store ptr %18, ptr %10, align 8, !dbg !2018, !tbaa !399
  %19 = load ptr, ptr %10, align 8, !dbg !2021, !tbaa !399
  %20 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %19, i64 1, !dbg !2023
  %21 = load ptr, ptr %6, align 8, !dbg !2024, !tbaa !399
  %22 = icmp ugt ptr %20, %21, !dbg !2025
  br i1 %22, label %23, label %24, !dbg !2026

23:                                               ; preds = %15
  store i32 -1, ptr %4, align 4, !dbg !2027
  store i32 1, ptr %9, align 4
  br label %69, !dbg !2027

24:                                               ; preds = %15
  %25 = load i8, ptr %7, align 1, !dbg !2028, !tbaa !883
  %26 = zext i8 %25 to i32, !dbg !2028
  switch i32 %26, label %65 [
    i32 0, label %27
    i32 60, label %27
    i32 43, label %27
    i32 135, label %27
    i32 51, label %42
    i32 44, label %57
  ], !dbg !2029

27:                                               ; preds = %24, %24, %24, %24
  %28 = load ptr, ptr %10, align 8, !dbg !2030, !tbaa !399
  %29 = load ptr, ptr %10, align 8, !dbg !2032, !tbaa !399
  %30 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %29, i32 0, i32 1, !dbg !2033
  %31 = load i8, ptr %30, align 1, !dbg !2033, !tbaa !2034
  %32 = zext i8 %31 to i32, !dbg !2032
  %33 = add nsw i32 %32, 1, !dbg !2036
  %34 = mul nsw i32 %33, 8, !dbg !2037
  %35 = sext i32 %34 to i64, !dbg !2038
  %36 = getelementptr inbounds i8, ptr %28, i64 %35, !dbg !2038
  %37 = load ptr, ptr %5, align 8, !dbg !2039, !tbaa !399
  %38 = getelementptr inbounds %struct.hdr_cursor, ptr %37, i32 0, i32 0, !dbg !2040
  store ptr %36, ptr %38, align 8, !dbg !2041, !tbaa !427
  %39 = load ptr, ptr %10, align 8, !dbg !2042, !tbaa !399
  %40 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %39, i32 0, i32 0, !dbg !2043
  %41 = load i8, ptr %40, align 1, !dbg !2043, !tbaa !2044
  store i8 %41, ptr %7, align 1, !dbg !2045, !tbaa !883
  br label %68, !dbg !2046

42:                                               ; preds = %24
  %43 = load ptr, ptr %10, align 8, !dbg !2047, !tbaa !399
  %44 = load ptr, ptr %10, align 8, !dbg !2048, !tbaa !399
  %45 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %44, i32 0, i32 1, !dbg !2049
  %46 = load i8, ptr %45, align 1, !dbg !2049, !tbaa !2034
  %47 = zext i8 %46 to i32, !dbg !2048
  %48 = add nsw i32 %47, 2, !dbg !2050
  %49 = mul nsw i32 %48, 4, !dbg !2051
  %50 = sext i32 %49 to i64, !dbg !2052
  %51 = getelementptr inbounds i8, ptr %43, i64 %50, !dbg !2052
  %52 = load ptr, ptr %5, align 8, !dbg !2053, !tbaa !399
  %53 = getelementptr inbounds %struct.hdr_cursor, ptr %52, i32 0, i32 0, !dbg !2054
  store ptr %51, ptr %53, align 8, !dbg !2055, !tbaa !427
  %54 = load ptr, ptr %10, align 8, !dbg !2056, !tbaa !399
  %55 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %54, i32 0, i32 0, !dbg !2057
  %56 = load i8, ptr %55, align 1, !dbg !2057, !tbaa !2044
  store i8 %56, ptr %7, align 1, !dbg !2058, !tbaa !883
  br label %68, !dbg !2059

57:                                               ; preds = %24
  %58 = load ptr, ptr %10, align 8, !dbg !2060, !tbaa !399
  %59 = getelementptr inbounds i8, ptr %58, i64 8, !dbg !2061
  %60 = load ptr, ptr %5, align 8, !dbg !2062, !tbaa !399
  %61 = getelementptr inbounds %struct.hdr_cursor, ptr %60, i32 0, i32 0, !dbg !2063
  store ptr %59, ptr %61, align 8, !dbg !2064, !tbaa !427
  %62 = load ptr, ptr %10, align 8, !dbg !2065, !tbaa !399
  %63 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %62, i32 0, i32 0, !dbg !2066
  %64 = load i8, ptr %63, align 1, !dbg !2066, !tbaa !2044
  store i8 %64, ptr %7, align 1, !dbg !2067, !tbaa !883
  br label %68, !dbg !2068

65:                                               ; preds = %24
  %66 = load i8, ptr %7, align 1, !dbg !2069, !tbaa !883
  %67 = zext i8 %66 to i32, !dbg !2069
  store i32 %67, ptr %4, align 4, !dbg !2070
  store i32 1, ptr %9, align 4
  br label %69, !dbg !2070

68:                                               ; preds = %57, %42, %27
  store i32 0, ptr %9, align 4, !dbg !2071
  br label %69, !dbg !2071

69:                                               ; preds = %68, %65, %23
  call void @llvm.lifetime.end.p0(i64 8, ptr %10) #7, !dbg !2071
  %70 = load i32, ptr %9, align 4
  switch i32 %70, label %75 [
    i32 0, label %71
  ]

71:                                               ; preds = %69
  br label %72, !dbg !2072

72:                                               ; preds = %71
  %73 = load i32, ptr %8, align 4, !dbg !2073, !tbaa !755
  %74 = add nsw i32 %73, 1, !dbg !2073
  store i32 %74, ptr %8, align 4, !dbg !2073, !tbaa !755
  br label %11, !dbg !2074, !llvm.loop !2075

75:                                               ; preds = %69, %14
  call void @llvm.lifetime.end.p0(i64 4, ptr %8) #7, !dbg !2074
  %76 = load i32, ptr %9, align 4
  switch i32 %76, label %80 [
    i32 2, label %77
    i32 1, label %78
  ]

77:                                               ; preds = %75
  store i32 -1, ptr %4, align 4, !dbg !2077
  br label %78, !dbg !2077

78:                                               ; preds = %77, %75
  %79 = load i32, ptr %4, align 4, !dbg !2078
  ret i32 %79, !dbg !2078

80:                                               ; preds = %75
  unreachable
}

; Function Attrs: alwaysinline nounwind
define internal i32 @parse_tcphdr(ptr noundef %0, ptr noundef %1, ptr noundef %2) #4 !dbg !2079 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2084, metadata !DIExpression()), !dbg !2089
  store ptr %1, ptr %6, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2085, metadata !DIExpression()), !dbg !2090
  store ptr %2, ptr %7, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2086, metadata !DIExpression()), !dbg !2091
  call void @llvm.lifetime.start.p0(i64 4, ptr %8) #7, !dbg !2092
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2087, metadata !DIExpression()), !dbg !2093
  call void @llvm.lifetime.start.p0(i64 8, ptr %9) #7, !dbg !2094
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2088, metadata !DIExpression()), !dbg !2095
  %11 = load ptr, ptr %5, align 8, !dbg !2096, !tbaa !399
  %12 = getelementptr inbounds %struct.hdr_cursor, ptr %11, i32 0, i32 0, !dbg !2097
  %13 = load ptr, ptr %12, align 8, !dbg !2097, !tbaa !427
  store ptr %13, ptr %9, align 8, !dbg !2095, !tbaa !399
  %14 = load ptr, ptr %9, align 8, !dbg !2098, !tbaa !399
  %15 = getelementptr inbounds %struct.tcphdr, ptr %14, i64 1, !dbg !2100
  %16 = load ptr, ptr %6, align 8, !dbg !2101, !tbaa !399
  %17 = icmp ugt ptr %15, %16, !dbg !2102
  br i1 %17, label %18, label %19, !dbg !2103

18:                                               ; preds = %3
  store i32 -1, ptr %4, align 4, !dbg !2104
  store i32 1, ptr %10, align 4
  br label %51, !dbg !2104

19:                                               ; preds = %3
  %20 = load ptr, ptr %9, align 8, !dbg !2105, !tbaa !399
  %21 = getelementptr inbounds %struct.tcphdr, ptr %20, i32 0, i32 4, !dbg !2106
  %22 = load i16, ptr %21, align 4, !dbg !2106
  %23 = lshr i16 %22, 4, !dbg !2106
  %24 = and i16 %23, 15, !dbg !2106
  %25 = zext i16 %24 to i32, !dbg !2105
  %26 = mul nsw i32 %25, 4, !dbg !2107
  store i32 %26, ptr %8, align 4, !dbg !2108, !tbaa !755
  %27 = load i32, ptr %8, align 4, !dbg !2109, !tbaa !755
  %28 = sext i32 %27 to i64, !dbg !2109
  %29 = icmp ult i64 %28, 20, !dbg !2111
  br i1 %29, label %30, label %31, !dbg !2112

30:                                               ; preds = %19
  store i32 -1, ptr %4, align 4, !dbg !2113
  store i32 1, ptr %10, align 4
  br label %51, !dbg !2113

31:                                               ; preds = %19
  %32 = load ptr, ptr %5, align 8, !dbg !2114, !tbaa !399
  %33 = getelementptr inbounds %struct.hdr_cursor, ptr %32, i32 0, i32 0, !dbg !2116
  %34 = load ptr, ptr %33, align 8, !dbg !2116, !tbaa !427
  %35 = load i32, ptr %8, align 4, !dbg !2117, !tbaa !755
  %36 = sext i32 %35 to i64, !dbg !2118
  %37 = getelementptr i8, ptr %34, i64 %36, !dbg !2118
  %38 = load ptr, ptr %6, align 8, !dbg !2119, !tbaa !399
  %39 = icmp ugt ptr %37, %38, !dbg !2120
  br i1 %39, label %40, label %41, !dbg !2121

40:                                               ; preds = %31
  store i32 -1, ptr %4, align 4, !dbg !2122
  store i32 1, ptr %10, align 4
  br label %51, !dbg !2122

41:                                               ; preds = %31
  %42 = load i32, ptr %8, align 4, !dbg !2123, !tbaa !755
  %43 = load ptr, ptr %5, align 8, !dbg !2124, !tbaa !399
  %44 = getelementptr inbounds %struct.hdr_cursor, ptr %43, i32 0, i32 0, !dbg !2125
  %45 = load ptr, ptr %44, align 8, !dbg !2126, !tbaa !427
  %46 = sext i32 %42 to i64, !dbg !2126
  %47 = getelementptr i8, ptr %45, i64 %46, !dbg !2126
  store ptr %47, ptr %44, align 8, !dbg !2126, !tbaa !427
  %48 = load ptr, ptr %9, align 8, !dbg !2127, !tbaa !399
  %49 = load ptr, ptr %7, align 8, !dbg !2128, !tbaa !399
  store ptr %48, ptr %49, align 8, !dbg !2129, !tbaa !399
  %50 = load i32, ptr %8, align 4, !dbg !2130, !tbaa !755
  store i32 %50, ptr %4, align 4, !dbg !2131
  store i32 1, ptr %10, align 4
  br label %51, !dbg !2131

51:                                               ; preds = %41, %40, %30, %18
  call void @llvm.lifetime.end.p0(i64 8, ptr %9) #7, !dbg !2132
  call void @llvm.lifetime.end.p0(i64 4, ptr %8) #7, !dbg !2132
  %52 = load i32, ptr %4, align 4, !dbg !2132
  ret i32 %52, !dbg !2132
}

; Function Attrs: nounwind
define internal i32 @parse_tcp_ts(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 !dbg !2133 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i8, align 1
  %14 = alloca i8, align 1
  %15 = alloca i8, align 1
  %16 = alloca i32, align 4
  store ptr %0, ptr %6, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2137, metadata !DIExpression()), !dbg !2148
  store ptr %1, ptr %7, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2138, metadata !DIExpression()), !dbg !2149
  store ptr %2, ptr %8, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2139, metadata !DIExpression()), !dbg !2150
  store ptr %3, ptr %9, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2140, metadata !DIExpression()), !dbg !2151
  call void @llvm.lifetime.start.p0(i64 4, ptr %10) #7, !dbg !2152
  call void @llvm.dbg.declare(metadata ptr %10, metadata !2141, metadata !DIExpression()), !dbg !2153
  %17 = load ptr, ptr %6, align 8, !dbg !2154, !tbaa !399
  %18 = getelementptr inbounds %struct.tcphdr, ptr %17, i32 0, i32 4, !dbg !2155
  %19 = load i16, ptr %18, align 4, !dbg !2155
  %20 = lshr i16 %19, 4, !dbg !2155
  %21 = and i16 %20, 15, !dbg !2155
  %22 = zext i16 %21 to i32, !dbg !2154
  %23 = shl i32 %22, 2, !dbg !2156
  store i32 %23, ptr %10, align 4, !dbg !2153, !tbaa !755
  call void @llvm.lifetime.start.p0(i64 8, ptr %11) #7, !dbg !2157
  call void @llvm.dbg.declare(metadata ptr %11, metadata !2142, metadata !DIExpression()), !dbg !2158
  %24 = load ptr, ptr %6, align 8, !dbg !2159, !tbaa !399
  %25 = load i32, ptr %10, align 4, !dbg !2160, !tbaa !755
  %26 = sext i32 %25 to i64, !dbg !2161
  %27 = getelementptr i8, ptr %24, i64 %26, !dbg !2161
  store ptr %27, ptr %11, align 8, !dbg !2158, !tbaa !399
  call void @llvm.lifetime.start.p0(i64 8, ptr %12) #7, !dbg !2162
  call void @llvm.dbg.declare(metadata ptr %12, metadata !2143, metadata !DIExpression()), !dbg !2163
  %28 = load ptr, ptr %6, align 8, !dbg !2164, !tbaa !399
  %29 = getelementptr inbounds %struct.tcphdr, ptr %28, i64 1, !dbg !2165
  store ptr %29, ptr %12, align 8, !dbg !2163, !tbaa !399
  call void @llvm.lifetime.start.p0(i64 1, ptr %13) #7, !dbg !2166
  call void @llvm.dbg.declare(metadata ptr %13, metadata !2144, metadata !DIExpression()), !dbg !2167
  call void @llvm.lifetime.start.p0(i64 1, ptr %14) #7, !dbg !2166
  call void @llvm.dbg.declare(metadata ptr %14, metadata !2145, metadata !DIExpression()), !dbg !2168
  call void @llvm.lifetime.start.p0(i64 1, ptr %15) #7, !dbg !2169
  call void @llvm.dbg.declare(metadata ptr %15, metadata !2146, metadata !DIExpression()), !dbg !2170
  %30 = load ptr, ptr %6, align 8, !dbg !2171, !tbaa !399
  %31 = getelementptr inbounds %struct.tcphdr, ptr %30, i64 1, !dbg !2173
  %32 = load ptr, ptr %7, align 8, !dbg !2174, !tbaa !399
  %33 = icmp ugt ptr %31, %32, !dbg !2175
  br i1 %33, label %38, label %34, !dbg !2176

34:                                               ; preds = %4
  %35 = load i32, ptr %10, align 4, !dbg !2177, !tbaa !755
  %36 = sext i32 %35 to i64, !dbg !2177
  %37 = icmp ule i64 %36, 20, !dbg !2178
  br i1 %37, label %38, label %39, !dbg !2179

38:                                               ; preds = %34, %4
  store i32 -1, ptr %5, align 4, !dbg !2180
  store i32 1, ptr %16, align 4
  br label %126, !dbg !2180

39:                                               ; preds = %34
  store i8 0, ptr %13, align 1, !dbg !2181, !tbaa !883
  br label %40, !dbg !2183

40:                                               ; preds = %122, %39
  %41 = load i8, ptr %13, align 1, !dbg !2184, !tbaa !883
  %42 = zext i8 %41 to i32, !dbg !2184
  %43 = icmp slt i32 %42, 10, !dbg !2186
  br i1 %43, label %44, label %125, !dbg !2187

44:                                               ; preds = %40
  %45 = load ptr, ptr %12, align 8, !dbg !2188, !tbaa !399
  %46 = getelementptr inbounds i8, ptr %45, i64 1, !dbg !2191
  %47 = load ptr, ptr %11, align 8, !dbg !2192, !tbaa !399
  %48 = icmp ugt ptr %46, %47, !dbg !2193
  br i1 %48, label %54, label %49, !dbg !2194

49:                                               ; preds = %44
  %50 = load ptr, ptr %12, align 8, !dbg !2195, !tbaa !399
  %51 = getelementptr inbounds i8, ptr %50, i64 1, !dbg !2196
  %52 = load ptr, ptr %7, align 8, !dbg !2197, !tbaa !399
  %53 = icmp ugt ptr %51, %52, !dbg !2198
  br i1 %53, label %54, label %55, !dbg !2199

54:                                               ; preds = %49, %44
  store i32 -1, ptr %5, align 4, !dbg !2200
  store i32 1, ptr %16, align 4
  br label %126, !dbg !2200

55:                                               ; preds = %49
  %56 = load ptr, ptr %12, align 8, !dbg !2201, !tbaa !399
  %57 = load i8, ptr %56, align 1, !dbg !2202, !tbaa !883
  store i8 %57, ptr %14, align 1, !dbg !2203, !tbaa !883
  %58 = load i8, ptr %14, align 1, !dbg !2204, !tbaa !883
  %59 = zext i8 %58 to i32, !dbg !2204
  %60 = icmp eq i32 %59, 0, !dbg !2206
  br i1 %60, label %61, label %62, !dbg !2207

61:                                               ; preds = %55
  store i32 -1, ptr %5, align 4, !dbg !2208
  store i32 1, ptr %16, align 4
  br label %126, !dbg !2208

62:                                               ; preds = %55
  %63 = load i8, ptr %14, align 1, !dbg !2209, !tbaa !883
  %64 = zext i8 %63 to i32, !dbg !2209
  %65 = icmp eq i32 %64, 1, !dbg !2211
  br i1 %65, label %66, label %69, !dbg !2212

66:                                               ; preds = %62
  %67 = load ptr, ptr %12, align 8, !dbg !2213, !tbaa !399
  %68 = getelementptr inbounds i8, ptr %67, i32 1, !dbg !2213
  store ptr %68, ptr %12, align 8, !dbg !2213, !tbaa !399
  br label %122, !dbg !2215

69:                                               ; preds = %62
  %70 = load ptr, ptr %12, align 8, !dbg !2216, !tbaa !399
  %71 = getelementptr inbounds i8, ptr %70, i64 2, !dbg !2218
  %72 = load ptr, ptr %11, align 8, !dbg !2219, !tbaa !399
  %73 = icmp ugt ptr %71, %72, !dbg !2220
  br i1 %73, label %79, label %74, !dbg !2221

74:                                               ; preds = %69
  %75 = load ptr, ptr %12, align 8, !dbg !2222, !tbaa !399
  %76 = getelementptr inbounds i8, ptr %75, i64 2, !dbg !2223
  %77 = load ptr, ptr %7, align 8, !dbg !2224, !tbaa !399
  %78 = icmp ugt ptr %76, %77, !dbg !2225
  br i1 %78, label %79, label %80, !dbg !2226

79:                                               ; preds = %74, %69
  store i32 -1, ptr %5, align 4, !dbg !2227
  store i32 1, ptr %16, align 4
  br label %126, !dbg !2227

80:                                               ; preds = %74
  %81 = load ptr, ptr %12, align 8, !dbg !2228, !tbaa !399
  %82 = getelementptr inbounds i8, ptr %81, i64 1, !dbg !2229
  %83 = load i8, ptr %82, align 1, !dbg !2230, !tbaa !883
  store volatile i8 %83, ptr %15, align 1, !dbg !2231, !tbaa !883
  %84 = load volatile i8, ptr %15, align 1, !dbg !2232, !tbaa !883
  %85 = zext i8 %84 to i32, !dbg !2232
  %86 = icmp slt i32 %85, 2, !dbg !2234
  br i1 %86, label %87, label %88, !dbg !2235

87:                                               ; preds = %80
  store i32 -1, ptr %5, align 4, !dbg !2236
  store i32 1, ptr %16, align 4
  br label %126, !dbg !2236

88:                                               ; preds = %80
  %89 = load i8, ptr %14, align 1, !dbg !2237, !tbaa !883
  %90 = zext i8 %89 to i32, !dbg !2237
  %91 = icmp eq i32 %90, 8, !dbg !2239
  br i1 %91, label %92, label %116, !dbg !2240

92:                                               ; preds = %88
  %93 = load volatile i8, ptr %15, align 1, !dbg !2241, !tbaa !883
  %94 = zext i8 %93 to i32, !dbg !2241
  %95 = icmp eq i32 %94, 10, !dbg !2242
  br i1 %95, label %96, label %116, !dbg !2243

96:                                               ; preds = %92
  %97 = load ptr, ptr %12, align 8, !dbg !2244, !tbaa !399
  %98 = getelementptr inbounds i8, ptr %97, i64 10, !dbg !2247
  %99 = load ptr, ptr %11, align 8, !dbg !2248, !tbaa !399
  %100 = icmp ugt ptr %98, %99, !dbg !2249
  br i1 %100, label %106, label %101, !dbg !2250

101:                                              ; preds = %96
  %102 = load ptr, ptr %12, align 8, !dbg !2251, !tbaa !399
  %103 = getelementptr inbounds i8, ptr %102, i64 10, !dbg !2252
  %104 = load ptr, ptr %7, align 8, !dbg !2253, !tbaa !399
  %105 = icmp ugt ptr %103, %104, !dbg !2254
  br i1 %105, label %106, label %107, !dbg !2255

106:                                              ; preds = %101, %96
  store i32 -1, ptr %5, align 4, !dbg !2256
  store i32 1, ptr %16, align 4
  br label %126, !dbg !2256

107:                                              ; preds = %101
  %108 = load ptr, ptr %12, align 8, !dbg !2257, !tbaa !399
  %109 = getelementptr inbounds i8, ptr %108, i64 2, !dbg !2258
  %110 = load i32, ptr %109, align 4, !dbg !2259, !tbaa !755
  %111 = load ptr, ptr %8, align 8, !dbg !2260, !tbaa !399
  store i32 %110, ptr %111, align 4, !dbg !2261, !tbaa !755
  %112 = load ptr, ptr %12, align 8, !dbg !2262, !tbaa !399
  %113 = getelementptr inbounds i8, ptr %112, i64 6, !dbg !2263
  %114 = load i32, ptr %113, align 4, !dbg !2264, !tbaa !755
  %115 = load ptr, ptr %9, align 8, !dbg !2265, !tbaa !399
  store i32 %114, ptr %115, align 4, !dbg !2266, !tbaa !755
  store i32 0, ptr %5, align 4, !dbg !2267
  store i32 1, ptr %16, align 4
  br label %126, !dbg !2267

116:                                              ; preds = %92, %88
  %117 = load volatile i8, ptr %15, align 1, !dbg !2268, !tbaa !883
  %118 = zext i8 %117 to i32, !dbg !2268
  %119 = load ptr, ptr %12, align 8, !dbg !2269, !tbaa !399
  %120 = sext i32 %118 to i64, !dbg !2269
  %121 = getelementptr inbounds i8, ptr %119, i64 %120, !dbg !2269
  store ptr %121, ptr %12, align 8, !dbg !2269, !tbaa !399
  br label %122, !dbg !2270

122:                                              ; preds = %116, %66
  %123 = load i8, ptr %13, align 1, !dbg !2271, !tbaa !883
  %124 = add i8 %123, 1, !dbg !2271
  store i8 %124, ptr %13, align 1, !dbg !2271, !tbaa !883
  br label %40, !dbg !2272, !llvm.loop !2273

125:                                              ; preds = %40
  store i32 -1, ptr %5, align 4, !dbg !2275
  store i32 1, ptr %16, align 4
  br label %126, !dbg !2275

126:                                              ; preds = %125, %107, %106, %87, %79, %61, %54, %38
  call void @llvm.lifetime.end.p0(i64 1, ptr %15) #7, !dbg !2276
  call void @llvm.lifetime.end.p0(i64 1, ptr %14) #7, !dbg !2276
  call void @llvm.lifetime.end.p0(i64 1, ptr %13) #7, !dbg !2276
  call void @llvm.lifetime.end.p0(i64 8, ptr %12) #7, !dbg !2276
  call void @llvm.lifetime.end.p0(i64 8, ptr %11) #7, !dbg !2276
  call void @llvm.lifetime.end.p0(i64 4, ptr %10) #7, !dbg !2276
  %127 = load i32, ptr %5, align 4, !dbg !2276
  ret i32 %127, !dbg !2276
}

; Function Attrs: alwaysinline nounwind
define internal i32 @parse_icmp6hdr(ptr noundef %0, ptr noundef %1, ptr noundef %2) #4 !dbg !2277 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %5, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2282, metadata !DIExpression()), !dbg !2286
  store ptr %1, ptr %6, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2283, metadata !DIExpression()), !dbg !2287
  store ptr %2, ptr %7, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2284, metadata !DIExpression()), !dbg !2288
  call void @llvm.lifetime.start.p0(i64 8, ptr %8) #7, !dbg !2289
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2285, metadata !DIExpression()), !dbg !2290
  %10 = load ptr, ptr %5, align 8, !dbg !2291, !tbaa !399
  %11 = getelementptr inbounds %struct.hdr_cursor, ptr %10, i32 0, i32 0, !dbg !2292
  %12 = load ptr, ptr %11, align 8, !dbg !2292, !tbaa !427
  store ptr %12, ptr %8, align 8, !dbg !2290, !tbaa !399
  %13 = load ptr, ptr %8, align 8, !dbg !2293, !tbaa !399
  %14 = getelementptr inbounds %struct.icmp6hdr, ptr %13, i64 1, !dbg !2295
  %15 = load ptr, ptr %6, align 8, !dbg !2296, !tbaa !399
  %16 = icmp ugt ptr %14, %15, !dbg !2297
  br i1 %16, label %17, label %18, !dbg !2298

17:                                               ; preds = %3
  store i32 -1, ptr %4, align 4, !dbg !2299
  store i32 1, ptr %9, align 4
  br label %29, !dbg !2299

18:                                               ; preds = %3
  %19 = load ptr, ptr %8, align 8, !dbg !2300, !tbaa !399
  %20 = getelementptr inbounds %struct.icmp6hdr, ptr %19, i64 1, !dbg !2301
  %21 = load ptr, ptr %5, align 8, !dbg !2302, !tbaa !399
  %22 = getelementptr inbounds %struct.hdr_cursor, ptr %21, i32 0, i32 0, !dbg !2303
  store ptr %20, ptr %22, align 8, !dbg !2304, !tbaa !427
  %23 = load ptr, ptr %8, align 8, !dbg !2305, !tbaa !399
  %24 = load ptr, ptr %7, align 8, !dbg !2306, !tbaa !399
  store ptr %23, ptr %24, align 8, !dbg !2307, !tbaa !399
  %25 = load ptr, ptr %8, align 8, !dbg !2308, !tbaa !399
  %26 = getelementptr inbounds %struct.icmp6hdr, ptr %25, i32 0, i32 0, !dbg !2309
  %27 = load i8, ptr %26, align 4, !dbg !2309, !tbaa !1620
  %28 = zext i8 %27 to i32, !dbg !2308
  store i32 %28, ptr %4, align 4, !dbg !2310
  store i32 1, ptr %9, align 4
  br label %29, !dbg !2310

29:                                               ; preds = %18, %17
  call void @llvm.lifetime.end.p0(i64 8, ptr %8) #7, !dbg !2311
  %30 = load i32, ptr %4, align 4, !dbg !2311
  ret i32 %30, !dbg !2311
}

; Function Attrs: alwaysinline nounwind
define internal i32 @parse_icmphdr(ptr noundef %0, ptr noundef %1, ptr noundef %2) #4 !dbg !2312 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %5, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2317, metadata !DIExpression()), !dbg !2321
  store ptr %1, ptr %6, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2318, metadata !DIExpression()), !dbg !2322
  store ptr %2, ptr %7, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2319, metadata !DIExpression()), !dbg !2323
  call void @llvm.lifetime.start.p0(i64 8, ptr %8) #7, !dbg !2324
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2320, metadata !DIExpression()), !dbg !2325
  %10 = load ptr, ptr %5, align 8, !dbg !2326, !tbaa !399
  %11 = getelementptr inbounds %struct.hdr_cursor, ptr %10, i32 0, i32 0, !dbg !2327
  %12 = load ptr, ptr %11, align 8, !dbg !2327, !tbaa !427
  store ptr %12, ptr %8, align 8, !dbg !2325, !tbaa !399
  %13 = load ptr, ptr %8, align 8, !dbg !2328, !tbaa !399
  %14 = getelementptr inbounds %struct.icmphdr, ptr %13, i64 1, !dbg !2330
  %15 = load ptr, ptr %6, align 8, !dbg !2331, !tbaa !399
  %16 = icmp ugt ptr %14, %15, !dbg !2332
  br i1 %16, label %17, label %18, !dbg !2333

17:                                               ; preds = %3
  store i32 -1, ptr %4, align 4, !dbg !2334
  store i32 1, ptr %9, align 4
  br label %29, !dbg !2334

18:                                               ; preds = %3
  %19 = load ptr, ptr %8, align 8, !dbg !2335, !tbaa !399
  %20 = getelementptr inbounds %struct.icmphdr, ptr %19, i64 1, !dbg !2336
  %21 = load ptr, ptr %5, align 8, !dbg !2337, !tbaa !399
  %22 = getelementptr inbounds %struct.hdr_cursor, ptr %21, i32 0, i32 0, !dbg !2338
  store ptr %20, ptr %22, align 8, !dbg !2339, !tbaa !427
  %23 = load ptr, ptr %8, align 8, !dbg !2340, !tbaa !399
  %24 = load ptr, ptr %7, align 8, !dbg !2341, !tbaa !399
  store ptr %23, ptr %24, align 8, !dbg !2342, !tbaa !399
  %25 = load ptr, ptr %8, align 8, !dbg !2343, !tbaa !399
  %26 = getelementptr inbounds %struct.icmphdr, ptr %25, i32 0, i32 0, !dbg !2344
  %27 = load i8, ptr %26, align 4, !dbg !2344, !tbaa !1717
  %28 = zext i8 %27 to i32, !dbg !2343
  store i32 %28, ptr %4, align 4, !dbg !2345
  store i32 1, ptr %9, align 4
  br label %29, !dbg !2345

29:                                               ; preds = %18, %17
  call void @llvm.lifetime.end.p0(i64 8, ptr %8) #7, !dbg !2346
  %30 = load i32, ptr %4, align 4, !dbg !2346
  ret i32 %30, !dbg !2346
}

; Function Attrs: nounwind
define internal ptr @create_flow(ptr noundef %0, ptr noundef %1) #0 !dbg !2347 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca %struct.flow_state, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2349, metadata !DIExpression()), !dbg !2352
  store ptr %1, ptr %5, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2350, metadata !DIExpression()), !dbg !2353
  call void @llvm.lifetime.start.p0(i64 64, ptr %6) #7, !dbg !2354
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2351, metadata !DIExpression()), !dbg !2355
  call void @llvm.memset.p0.i64(ptr align 8 %6, i8 0, i64 64, i1 false), !dbg !2355
  %8 = load ptr, ptr %5, align 8, !dbg !2356, !tbaa !399
  %9 = getelementptr inbounds %struct.packet_info, ptr %8, i32 0, i32 2, !dbg !2357
  %10 = load i64, ptr %9, align 8, !dbg !2357, !tbaa !742
  %11 = getelementptr inbounds %struct.flow_state, ptr %6, i32 0, i32 2, !dbg !2358
  store i64 %10, ptr %11, align 8, !dbg !2359, !tbaa !1052
  %12 = load ptr, ptr %5, align 8, !dbg !2360, !tbaa !399
  %13 = getelementptr inbounds %struct.packet_info, ptr %12, i32 0, i32 8, !dbg !2361
  %14 = load i8, ptr %13, align 2, !dbg !2361, !tbaa !959
  %15 = zext i8 %14 to i32, !dbg !2360
  %16 = icmp eq i32 %15, 1, !dbg !2362
  br i1 %16, label %17, label %22, !dbg !2360

17:                                               ; preds = %2
  %18 = load ptr, ptr %5, align 8, !dbg !2363, !tbaa !399
  %19 = getelementptr inbounds %struct.packet_info, ptr %18, i32 0, i32 9, !dbg !2364
  %20 = load i8, ptr %19, align 1, !dbg !2364, !tbaa !1553
  %21 = zext i8 %20 to i32, !dbg !2363
  br label %23, !dbg !2360

22:                                               ; preds = %2
  br label %23, !dbg !2360

23:                                               ; preds = %22, %17
  %24 = phi i32 [ %21, %17 ], [ 2, %22 ], !dbg !2360
  %25 = trunc i32 %24 to i8, !dbg !2360
  %26 = getelementptr inbounds %struct.flow_state, ptr %6, i32 0, i32 9, !dbg !2365
  store i8 %25, ptr %26, align 1, !dbg !2366, !tbaa !2367
  %27 = load ptr, ptr @bpf_map_update_elem, align 8, !dbg !2368, !tbaa !399
  %28 = load ptr, ptr %5, align 8, !dbg !2370, !tbaa !399
  %29 = getelementptr inbounds %struct.packet_info, ptr %28, i32 0, i32 4, !dbg !2371
  %30 = getelementptr inbounds %struct.packet_id, ptr %29, i32 0, i32 0, !dbg !2372
  %31 = call i64 %27(ptr noundef @flow_state, ptr noundef %30, ptr noundef %6, i64 noundef 1), !dbg !2368
  %32 = icmp ne i64 %31, 0, !dbg !2373
  br i1 %32, label %33, label %36, !dbg !2374

33:                                               ; preds = %23
  %34 = load ptr, ptr %4, align 8, !dbg !2375, !tbaa !399
  %35 = load ptr, ptr %5, align 8, !dbg !2377, !tbaa !399
  call void @send_map_full_event(ptr noundef %34, ptr noundef %35, i8 noundef zeroext 0), !dbg !2378
  store ptr null, ptr %3, align 8, !dbg !2379
  store i32 1, ptr %7, align 4
  br label %42, !dbg !2379

36:                                               ; preds = %23
  %37 = load ptr, ptr @bpf_map_lookup_elem, align 8, !dbg !2380, !tbaa !399
  %38 = load ptr, ptr %5, align 8, !dbg !2381, !tbaa !399
  %39 = getelementptr inbounds %struct.packet_info, ptr %38, i32 0, i32 4, !dbg !2382
  %40 = getelementptr inbounds %struct.packet_id, ptr %39, i32 0, i32 0, !dbg !2383
  %41 = call ptr %37(ptr noundef @flow_state, ptr noundef %40), !dbg !2380
  store ptr %41, ptr %3, align 8, !dbg !2384
  store i32 1, ptr %7, align 4
  br label %42, !dbg !2384

42:                                               ; preds = %36, %33
  call void @llvm.lifetime.end.p0(i64 64, ptr %6) #7, !dbg !2385
  %43 = load ptr, ptr %3, align 8, !dbg !2385
  ret ptr %43, !dbg !2385
}

; Function Attrs: nounwind
define internal void @send_map_full_event(ptr noundef %0, ptr noundef %1, i8 noundef zeroext %2) #0 !dbg !2386 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i8, align 1
  %7 = alloca %struct.map_full_event, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2390, metadata !DIExpression()), !dbg !2401
  store ptr %1, ptr %5, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2391, metadata !DIExpression()), !dbg !2402
  store i8 %2, ptr %6, align 1, !tbaa !883
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2392, metadata !DIExpression()), !dbg !2403
  call void @llvm.lifetime.start.p0(i64 64, ptr %7) #7, !dbg !2404
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2393, metadata !DIExpression()), !dbg !2405
  %9 = load ptr, ptr %5, align 8, !dbg !2406, !tbaa !399
  %10 = getelementptr inbounds %struct.packet_info, ptr %9, i32 0, i32 2, !dbg !2408
  %11 = load i64, ptr %10, align 8, !dbg !2408, !tbaa !742
  %12 = load i8, ptr %6, align 1, !dbg !2409, !tbaa !883
  %13 = zext i8 %12 to i64, !dbg !2410
  %14 = getelementptr inbounds [2 x i64], ptr @last_warn_time, i64 0, i64 %13, !dbg !2410
  %15 = load volatile i64, ptr %14, align 8, !dbg !2410, !tbaa !1187
  %16 = icmp ult i64 %11, %15, !dbg !2411
  br i1 %16, label %27, label %17, !dbg !2412

17:                                               ; preds = %3
  %18 = load ptr, ptr %5, align 8, !dbg !2413, !tbaa !399
  %19 = getelementptr inbounds %struct.packet_info, ptr %18, i32 0, i32 2, !dbg !2414
  %20 = load i64, ptr %19, align 8, !dbg !2414, !tbaa !742
  %21 = load i8, ptr %6, align 1, !dbg !2415, !tbaa !883
  %22 = zext i8 %21 to i64, !dbg !2416
  %23 = getelementptr inbounds [2 x i64], ptr @last_warn_time, i64 0, i64 %22, !dbg !2416
  %24 = load volatile i64, ptr %23, align 8, !dbg !2416, !tbaa !1187
  %25 = sub i64 %20, %24, !dbg !2417
  %26 = icmp ult i64 %25, 1000000000, !dbg !2418
  br i1 %26, label %27, label %28, !dbg !2419

27:                                               ; preds = %17, %3
  store i32 1, ptr %8, align 4
  br label %49, !dbg !2420

28:                                               ; preds = %17
  %29 = load ptr, ptr %5, align 8, !dbg !2421, !tbaa !399
  %30 = getelementptr inbounds %struct.packet_info, ptr %29, i32 0, i32 2, !dbg !2422
  %31 = load i64, ptr %30, align 8, !dbg !2422, !tbaa !742
  %32 = load i8, ptr %6, align 1, !dbg !2423, !tbaa !883
  %33 = zext i8 %32 to i64, !dbg !2424
  %34 = getelementptr inbounds [2 x i64], ptr @last_warn_time, i64 0, i64 %33, !dbg !2424
  store volatile i64 %31, ptr %34, align 8, !dbg !2425, !tbaa !1187
  call void @llvm.memset.p0.i64(ptr align 8 %7, i8 0, i64 64, i1 false), !dbg !2426
  %35 = getelementptr inbounds %struct.map_full_event, ptr %7, i32 0, i32 0, !dbg !2427
  store i64 3, ptr %35, align 8, !dbg !2428, !tbaa !2429
  %36 = load ptr, ptr %5, align 8, !dbg !2431, !tbaa !399
  %37 = getelementptr inbounds %struct.packet_info, ptr %36, i32 0, i32 2, !dbg !2432
  %38 = load i64, ptr %37, align 8, !dbg !2432, !tbaa !742
  %39 = getelementptr inbounds %struct.map_full_event, ptr %7, i32 0, i32 1, !dbg !2433
  store i64 %38, ptr %39, align 8, !dbg !2434, !tbaa !2435
  %40 = getelementptr inbounds %struct.map_full_event, ptr %7, i32 0, i32 2, !dbg !2436
  %41 = load ptr, ptr %5, align 8, !dbg !2437, !tbaa !399
  %42 = getelementptr inbounds %struct.packet_info, ptr %41, i32 0, i32 4, !dbg !2438
  %43 = getelementptr inbounds %struct.packet_id, ptr %42, i32 0, i32 0, !dbg !2439
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %40, ptr align 4 %43, i64 44, i1 false), !dbg !2439, !tbaa.struct !1261
  %44 = load i8, ptr %6, align 1, !dbg !2440, !tbaa !883
  %45 = getelementptr inbounds %struct.map_full_event, ptr %7, i32 0, i32 3, !dbg !2441
  store i8 %44, ptr %45, align 4, !dbg !2442, !tbaa !2443
  %46 = load ptr, ptr @bpf_perf_event_output, align 8, !dbg !2444, !tbaa !399
  %47 = load ptr, ptr %4, align 8, !dbg !2445, !tbaa !399
  %48 = call i64 %46(ptr noundef %47, ptr noundef @events, i64 noundef 4294967295, ptr noundef %7, i64 noundef 64), !dbg !2444
  store i32 0, ptr %8, align 4, !dbg !2446
  br label %49, !dbg !2446

49:                                               ; preds = %28, %27
  call void @llvm.lifetime.end.p0(i64 64, ptr %7) #7, !dbg !2446
  %50 = load i32, ptr %8, align 4
  switch i32 %50, label %52 [
    i32 0, label %51
    i32 1, label %51
  ]

51:                                               ; preds = %49, %49
  ret void, !dbg !2446

52:                                               ; preds = %49
  unreachable
}

; Function Attrs: nounwind
define internal i1 @is_local_address(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !2447 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca %struct.bpf_fib_lookup, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2451, metadata !DIExpression()), !dbg !2461
  store ptr %1, ptr %5, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2452, metadata !DIExpression()), !dbg !2462
  store ptr %2, ptr %6, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2453, metadata !DIExpression()), !dbg !2463
  call void @llvm.lifetime.start.p0(i64 4, ptr %7) #7, !dbg !2464
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2454, metadata !DIExpression()), !dbg !2465
  call void @llvm.lifetime.start.p0(i64 64, ptr %8) #7, !dbg !2466
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2455, metadata !DIExpression()), !dbg !2467
  call void @llvm.memset.p0.i64(ptr align 4 %8, i8 0, i64 64, i1 false), !dbg !2468
  %11 = load ptr, ptr %6, align 8, !dbg !2469, !tbaa !399
  %12 = getelementptr inbounds %struct.parsing_context, ptr %11, i32 0, i32 4, !dbg !2470
  %13 = load i32, ptr %12, align 4, !dbg !2470, !tbaa !432
  %14 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %8, i32 0, i32 5, !dbg !2471
  store i32 %13, ptr %14, align 4, !dbg !2472, !tbaa !2473
  %15 = load ptr, ptr %4, align 8, !dbg !2475, !tbaa !399
  %16 = getelementptr inbounds %struct.packet_info, ptr %15, i32 0, i32 4, !dbg !2476
  %17 = getelementptr inbounds %struct.packet_id, ptr %16, i32 0, i32 0, !dbg !2477
  %18 = getelementptr inbounds %struct.network_tuple, ptr %17, i32 0, i32 3, !dbg !2478
  %19 = load i8, ptr %18, align 2, !dbg !2478, !tbaa !766
  %20 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %8, i32 0, i32 0, !dbg !2479
  store i8 %19, ptr %20, align 4, !dbg !2480, !tbaa !2481
  %21 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %8, i32 0, i32 0, !dbg !2482
  %22 = load i8, ptr %21, align 4, !dbg !2482, !tbaa !2481
  %23 = zext i8 %22 to i32, !dbg !2483
  %24 = icmp eq i32 %23, 2, !dbg !2484
  br i1 %24, label %25, label %86, !dbg !2485

25:                                               ; preds = %3
  %26 = load ptr, ptr %4, align 8, !dbg !2486, !tbaa !399
  %27 = getelementptr inbounds %struct.packet_info, ptr %26, i32 0, i32 0, !dbg !2488
  %28 = load ptr, ptr %27, align 8, !dbg !2488, !tbaa !883
  %29 = getelementptr inbounds %struct.iphdr, ptr %28, i32 0, i32 1, !dbg !2489
  %30 = load i8, ptr %29, align 1, !dbg !2489, !tbaa !2490
  %31 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %8, i32 0, i32 6, !dbg !2491
  store i8 %30, ptr %31, align 4, !dbg !2492, !tbaa !883
  %32 = load ptr, ptr %4, align 8, !dbg !2493, !tbaa !399
  %33 = getelementptr inbounds %struct.packet_info, ptr %32, i32 0, i32 0, !dbg !2493
  %34 = load ptr, ptr %33, align 8, !dbg !2493, !tbaa !883
  %35 = getelementptr inbounds %struct.iphdr, ptr %34, i32 0, i32 2, !dbg !2493
  %36 = load i16, ptr %35, align 2, !dbg !2493, !tbaa !2494
  %37 = call i1 @llvm.is.constant.i16(i16 %36), !dbg !2493
  br i1 %37, label %38, label %60, !dbg !2493

38:                                               ; preds = %25
  %39 = load ptr, ptr %4, align 8, !dbg !2493, !tbaa !399
  %40 = getelementptr inbounds %struct.packet_info, ptr %39, i32 0, i32 0, !dbg !2493
  %41 = load ptr, ptr %40, align 8, !dbg !2493, !tbaa !883
  %42 = getelementptr inbounds %struct.iphdr, ptr %41, i32 0, i32 2, !dbg !2493
  %43 = load i16, ptr %42, align 2, !dbg !2493, !tbaa !2494
  %44 = zext i16 %43 to i32, !dbg !2493
  %45 = shl i32 %44, 8, !dbg !2493
  %46 = ashr i32 %45, 8, !dbg !2493
  %47 = shl i32 %46, 8, !dbg !2493
  %48 = load ptr, ptr %4, align 8, !dbg !2493, !tbaa !399
  %49 = getelementptr inbounds %struct.packet_info, ptr %48, i32 0, i32 0, !dbg !2493
  %50 = load ptr, ptr %49, align 8, !dbg !2493, !tbaa !883
  %51 = getelementptr inbounds %struct.iphdr, ptr %50, i32 0, i32 2, !dbg !2493
  %52 = load i16, ptr %51, align 2, !dbg !2493, !tbaa !2494
  %53 = zext i16 %52 to i32, !dbg !2493
  %54 = shl i32 %53, 0, !dbg !2493
  %55 = ashr i32 %54, 8, !dbg !2493
  %56 = shl i32 %55, 0, !dbg !2493
  %57 = or i32 %47, %56, !dbg !2493
  %58 = trunc i32 %57 to i16, !dbg !2493
  %59 = zext i16 %58 to i32, !dbg !2493
  br label %68, !dbg !2493

60:                                               ; preds = %25
  %61 = load ptr, ptr %4, align 8, !dbg !2493, !tbaa !399
  %62 = getelementptr inbounds %struct.packet_info, ptr %61, i32 0, i32 0, !dbg !2493
  %63 = load ptr, ptr %62, align 8, !dbg !2493, !tbaa !883
  %64 = getelementptr inbounds %struct.iphdr, ptr %63, i32 0, i32 2, !dbg !2493
  %65 = load i16, ptr %64, align 2, !dbg !2493, !tbaa !2494
  %66 = call i16 @llvm.bswap.i16(i16 %65), !dbg !2493
  %67 = zext i16 %66 to i32, !dbg !2493
  br label %68, !dbg !2493

68:                                               ; preds = %60, %38
  %69 = phi i32 [ %59, %38 ], [ %67, %60 ], !dbg !2493
  %70 = trunc i32 %69 to i16, !dbg !2493
  %71 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %8, i32 0, i32 4, !dbg !2495
  store i16 %70, ptr %71, align 2, !dbg !2496, !tbaa !2497
  %72 = load ptr, ptr %4, align 8, !dbg !2498, !tbaa !399
  %73 = getelementptr inbounds %struct.packet_info, ptr %72, i32 0, i32 0, !dbg !2499
  %74 = load ptr, ptr %73, align 8, !dbg !2499, !tbaa !883
  %75 = getelementptr inbounds %struct.iphdr, ptr %74, i32 0, i32 8, !dbg !2500
  %76 = getelementptr inbounds %struct.anon.9, ptr %75, i32 0, i32 0, !dbg !2500
  %77 = load i32, ptr %76, align 4, !dbg !2500, !tbaa !883
  %78 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %8, i32 0, i32 7, !dbg !2501
  store i32 %77, ptr %78, align 4, !dbg !2502, !tbaa !883
  %79 = load ptr, ptr %4, align 8, !dbg !2503, !tbaa !399
  %80 = getelementptr inbounds %struct.packet_info, ptr %79, i32 0, i32 0, !dbg !2504
  %81 = load ptr, ptr %80, align 8, !dbg !2504, !tbaa !883
  %82 = getelementptr inbounds %struct.iphdr, ptr %81, i32 0, i32 8, !dbg !2505
  %83 = getelementptr inbounds %struct.anon.9, ptr %82, i32 0, i32 1, !dbg !2505
  %84 = load i32, ptr %83, align 4, !dbg !2505, !tbaa !883
  %85 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %8, i32 0, i32 8, !dbg !2506
  store i32 %84, ptr %85, align 4, !dbg !2507, !tbaa !883
  br label %155, !dbg !2508

86:                                               ; preds = %3
  %87 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %8, i32 0, i32 0, !dbg !2509
  %88 = load i8, ptr %87, align 4, !dbg !2509, !tbaa !2481
  %89 = zext i8 %88 to i32, !dbg !2510
  %90 = icmp eq i32 %89, 10, !dbg !2511
  br i1 %90, label %91, label %154, !dbg !2512

91:                                               ; preds = %86
  call void @llvm.lifetime.start.p0(i64 8, ptr %9) #7, !dbg !2513
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2456, metadata !DIExpression()), !dbg !2514
  %92 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %8, i32 0, i32 7, !dbg !2515
  %93 = getelementptr inbounds [4 x i32], ptr %92, i64 0, i64 0, !dbg !2516
  store ptr %93, ptr %9, align 8, !dbg !2514, !tbaa !399
  call void @llvm.lifetime.start.p0(i64 8, ptr %10) #7, !dbg !2517
  call void @llvm.dbg.declare(metadata ptr %10, metadata !2460, metadata !DIExpression()), !dbg !2518
  %94 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %8, i32 0, i32 8, !dbg !2519
  %95 = getelementptr inbounds [4 x i32], ptr %94, i64 0, i64 0, !dbg !2520
  store ptr %95, ptr %10, align 8, !dbg !2518, !tbaa !399
  %96 = load ptr, ptr %4, align 8, !dbg !2521, !tbaa !399
  %97 = getelementptr inbounds %struct.packet_info, ptr %96, i32 0, i32 0, !dbg !2522
  %98 = load ptr, ptr %97, align 8, !dbg !2522, !tbaa !883
  %99 = load i32, ptr %98, align 4, !dbg !2523, !tbaa !755
  %100 = and i32 %99, -241, !dbg !2524
  %101 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %8, i32 0, i32 6, !dbg !2525
  store i32 %100, ptr %101, align 4, !dbg !2526, !tbaa !883
  %102 = load ptr, ptr %4, align 8, !dbg !2527, !tbaa !399
  %103 = getelementptr inbounds %struct.packet_info, ptr %102, i32 0, i32 0, !dbg !2527
  %104 = load ptr, ptr %103, align 8, !dbg !2527, !tbaa !883
  %105 = getelementptr inbounds %struct.ipv6hdr, ptr %104, i32 0, i32 2, !dbg !2527
  %106 = load i16, ptr %105, align 4, !dbg !2527, !tbaa !2528
  %107 = call i1 @llvm.is.constant.i16(i16 %106), !dbg !2527
  br i1 %107, label %108, label %130, !dbg !2527

108:                                              ; preds = %91
  %109 = load ptr, ptr %4, align 8, !dbg !2527, !tbaa !399
  %110 = getelementptr inbounds %struct.packet_info, ptr %109, i32 0, i32 0, !dbg !2527
  %111 = load ptr, ptr %110, align 8, !dbg !2527, !tbaa !883
  %112 = getelementptr inbounds %struct.ipv6hdr, ptr %111, i32 0, i32 2, !dbg !2527
  %113 = load i16, ptr %112, align 4, !dbg !2527, !tbaa !2528
  %114 = zext i16 %113 to i32, !dbg !2527
  %115 = shl i32 %114, 8, !dbg !2527
  %116 = ashr i32 %115, 8, !dbg !2527
  %117 = shl i32 %116, 8, !dbg !2527
  %118 = load ptr, ptr %4, align 8, !dbg !2527, !tbaa !399
  %119 = getelementptr inbounds %struct.packet_info, ptr %118, i32 0, i32 0, !dbg !2527
  %120 = load ptr, ptr %119, align 8, !dbg !2527, !tbaa !883
  %121 = getelementptr inbounds %struct.ipv6hdr, ptr %120, i32 0, i32 2, !dbg !2527
  %122 = load i16, ptr %121, align 4, !dbg !2527, !tbaa !2528
  %123 = zext i16 %122 to i32, !dbg !2527
  %124 = shl i32 %123, 0, !dbg !2527
  %125 = ashr i32 %124, 8, !dbg !2527
  %126 = shl i32 %125, 0, !dbg !2527
  %127 = or i32 %117, %126, !dbg !2527
  %128 = trunc i32 %127 to i16, !dbg !2527
  %129 = zext i16 %128 to i32, !dbg !2527
  br label %138, !dbg !2527

130:                                              ; preds = %91
  %131 = load ptr, ptr %4, align 8, !dbg !2527, !tbaa !399
  %132 = getelementptr inbounds %struct.packet_info, ptr %131, i32 0, i32 0, !dbg !2527
  %133 = load ptr, ptr %132, align 8, !dbg !2527, !tbaa !883
  %134 = getelementptr inbounds %struct.ipv6hdr, ptr %133, i32 0, i32 2, !dbg !2527
  %135 = load i16, ptr %134, align 4, !dbg !2527, !tbaa !2528
  %136 = call i16 @llvm.bswap.i16(i16 %135), !dbg !2527
  %137 = zext i16 %136 to i32, !dbg !2527
  br label %138, !dbg !2527

138:                                              ; preds = %130, %108
  %139 = phi i32 [ %129, %108 ], [ %137, %130 ], !dbg !2527
  %140 = trunc i32 %139 to i16, !dbg !2527
  %141 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %8, i32 0, i32 4, !dbg !2529
  store i16 %140, ptr %141, align 2, !dbg !2530, !tbaa !2497
  %142 = load ptr, ptr %9, align 8, !dbg !2531, !tbaa !399
  %143 = load ptr, ptr %4, align 8, !dbg !2532, !tbaa !399
  %144 = getelementptr inbounds %struct.packet_info, ptr %143, i32 0, i32 4, !dbg !2533
  %145 = getelementptr inbounds %struct.packet_id, ptr %144, i32 0, i32 0, !dbg !2534
  %146 = getelementptr inbounds %struct.network_tuple, ptr %145, i32 0, i32 0, !dbg !2535
  %147 = getelementptr inbounds %struct.flow_address, ptr %146, i32 0, i32 0, !dbg !2536
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %142, ptr align 4 %147, i64 16, i1 false), !dbg !2536, !tbaa.struct !905
  %148 = load ptr, ptr %10, align 8, !dbg !2537, !tbaa !399
  %149 = load ptr, ptr %4, align 8, !dbg !2538, !tbaa !399
  %150 = getelementptr inbounds %struct.packet_info, ptr %149, i32 0, i32 4, !dbg !2539
  %151 = getelementptr inbounds %struct.packet_id, ptr %150, i32 0, i32 0, !dbg !2540
  %152 = getelementptr inbounds %struct.network_tuple, ptr %151, i32 0, i32 1, !dbg !2541
  %153 = getelementptr inbounds %struct.flow_address, ptr %152, i32 0, i32 0, !dbg !2542
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %148, ptr align 4 %153, i64 16, i1 false), !dbg !2542, !tbaa.struct !905
  call void @llvm.lifetime.end.p0(i64 8, ptr %10) #7, !dbg !2543
  call void @llvm.lifetime.end.p0(i64 8, ptr %9) #7, !dbg !2543
  br label %154, !dbg !2544

154:                                              ; preds = %138, %86
  br label %155

155:                                              ; preds = %154, %68
  %156 = load ptr, ptr %4, align 8, !dbg !2545, !tbaa !399
  %157 = getelementptr inbounds %struct.packet_info, ptr %156, i32 0, i32 4, !dbg !2546
  %158 = getelementptr inbounds %struct.packet_id, ptr %157, i32 0, i32 0, !dbg !2547
  %159 = getelementptr inbounds %struct.network_tuple, ptr %158, i32 0, i32 2, !dbg !2548
  %160 = load i16, ptr %159, align 4, !dbg !2548, !tbaa !779
  %161 = trunc i16 %160 to i8, !dbg !2545
  %162 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %8, i32 0, i32 1, !dbg !2549
  store i8 %161, ptr %162, align 1, !dbg !2550, !tbaa !2551
  %163 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %8, i32 0, i32 2, !dbg !2552
  store i16 0, ptr %163, align 2, !dbg !2553, !tbaa !2554
  %164 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %8, i32 0, i32 3, !dbg !2555
  store i16 0, ptr %164, align 4, !dbg !2556, !tbaa !2557
  %165 = load ptr, ptr @bpf_fib_lookup, align 8, !dbg !2558, !tbaa !399
  %166 = load ptr, ptr %5, align 8, !dbg !2559, !tbaa !399
  %167 = call i64 %165(ptr noundef %166, ptr noundef %8, i32 noundef 64, i32 noundef 0), !dbg !2558
  %168 = trunc i64 %167 to i32, !dbg !2558
  store i32 %168, ptr %7, align 4, !dbg !2560, !tbaa !755
  %169 = load i32, ptr %7, align 4, !dbg !2561, !tbaa !755
  %170 = icmp eq i32 %169, 4, !dbg !2562
  br i1 %170, label %174, label %171, !dbg !2563

171:                                              ; preds = %155
  %172 = load i32, ptr %7, align 4, !dbg !2564, !tbaa !755
  %173 = icmp eq i32 %172, 5, !dbg !2565
  br label %174, !dbg !2563

174:                                              ; preds = %171, %155
  %175 = phi i1 [ true, %155 ], [ %173, %171 ]
  call void @llvm.lifetime.end.p0(i64 64, ptr %8) #7, !dbg !2566
  call void @llvm.lifetime.end.p0(i64 4, ptr %7) #7, !dbg !2566
  ret i1 %175, !dbg !2567
}

; Function Attrs: nounwind
define internal i1 @is_rate_limited(i64 noundef %0, i64 noundef %1, i64 noundef %2) #0 !dbg !2568 {
  %4 = alloca i1, align 1
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store i64 %0, ptr %5, align 8, !tbaa !1187
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2572, metadata !DIExpression()), !dbg !2575
  store i64 %1, ptr %6, align 8, !tbaa !1187
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2573, metadata !DIExpression()), !dbg !2576
  store i64 %2, ptr %7, align 8, !tbaa !1187
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2574, metadata !DIExpression()), !dbg !2577
  %8 = load i64, ptr %5, align 8, !dbg !2578, !tbaa !1187
  %9 = load i64, ptr %6, align 8, !dbg !2580, !tbaa !1187
  %10 = icmp ult i64 %8, %9, !dbg !2581
  br i1 %10, label %11, label %12, !dbg !2582

11:                                               ; preds = %3
  store i1 true, ptr %4, align 1, !dbg !2583
  br label %33, !dbg !2583

12:                                               ; preds = %3
  %13 = load volatile i64, ptr getelementptr inbounds (%struct.bpf_config, ptr @config, i32 0, i32 1), align 8, !dbg !2584, !tbaa !2586
  %14 = icmp ne i64 %13, 0, !dbg !2587
  br i1 %14, label %15, label %27, !dbg !2588

15:                                               ; preds = %12
  %16 = load i64, ptr %7, align 8, !dbg !2589, !tbaa !1187
  %17 = icmp ne i64 %16, 0, !dbg !2589
  br i1 %17, label %18, label %27, !dbg !2590

18:                                               ; preds = %15
  %19 = load i64, ptr %5, align 8, !dbg !2591, !tbaa !1187
  %20 = load i64, ptr %6, align 8, !dbg !2592, !tbaa !1187
  %21 = sub i64 %19, %20, !dbg !2593
  %22 = load volatile i64, ptr getelementptr inbounds (%struct.bpf_config, ptr @config, i32 0, i32 1), align 8, !dbg !2594, !tbaa !2586
  %23 = load i64, ptr %7, align 8, !dbg !2594, !tbaa !1187
  %24 = mul i64 %22, %23, !dbg !2594
  %25 = lshr i64 %24, 16, !dbg !2594
  %26 = icmp ult i64 %21, %25, !dbg !2595
  store i1 %26, ptr %4, align 1, !dbg !2596
  br label %33, !dbg !2596

27:                                               ; preds = %15, %12
  %28 = load i64, ptr %5, align 8, !dbg !2597, !tbaa !1187
  %29 = load i64, ptr %6, align 8, !dbg !2598, !tbaa !1187
  %30 = sub i64 %28, %29, !dbg !2599
  %31 = load volatile i64, ptr @config, align 8, !dbg !2600, !tbaa !2601
  %32 = icmp ult i64 %30, %31, !dbg !2602
  store i1 %32, ptr %4, align 1, !dbg !2603
  br label %33, !dbg !2603

33:                                               ; preds = %27, %18, %11
  %34 = load i1, ptr %4, align 1, !dbg !2604
  ret i1 %34, !dbg !2604
}

; Function Attrs: nounwind
define internal void @send_flow_open_event(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !2605 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %struct.flow_event, align 8
  store ptr %0, ptr %4, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2609, metadata !DIExpression()), !dbg !2622
  store ptr %1, ptr %5, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2610, metadata !DIExpression()), !dbg !2623
  store ptr %2, ptr %6, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2611, metadata !DIExpression()), !dbg !2624
  call void @llvm.lifetime.start.p0(i64 64, ptr %7) #7, !dbg !2625
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2612, metadata !DIExpression()), !dbg !2626
  %8 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 0, !dbg !2627
  store i64 1, ptr %8, align 8, !dbg !2627, !tbaa !2628
  %9 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 1, !dbg !2627
  %10 = load ptr, ptr %6, align 8, !dbg !2630, !tbaa !399
  %11 = getelementptr inbounds %struct.flow_state, ptr %10, i32 0, i32 2, !dbg !2631
  %12 = load i64, ptr %11, align 8, !dbg !2631, !tbaa !1052
  store i64 %12, ptr %9, align 8, !dbg !2627, !tbaa !2632
  %13 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 2, !dbg !2627
  %14 = load ptr, ptr %5, align 8, !dbg !2633, !tbaa !399
  %15 = getelementptr inbounds %struct.packet_info, ptr %14, i32 0, i32 4, !dbg !2634
  %16 = getelementptr inbounds %struct.packet_id, ptr %15, i32 0, i32 0, !dbg !2635
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %13, ptr align 4 %16, i64 44, i1 false), !dbg !2635, !tbaa.struct !1261
  %17 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 3, !dbg !2627
  store i8 1, ptr %17, align 4, !dbg !2627, !tbaa !2636
  %18 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 4, !dbg !2627
  %19 = load ptr, ptr %6, align 8, !dbg !2637, !tbaa !399
  %20 = getelementptr inbounds %struct.flow_state, ptr %19, i32 0, i32 9, !dbg !2638
  %21 = load i8, ptr %20, align 1, !dbg !2638, !tbaa !2367
  store i8 %21, ptr %18, align 1, !dbg !2627, !tbaa !2639
  %22 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 5, !dbg !2627
  store i8 1, ptr %22, align 2, !dbg !2627, !tbaa !2640
  %23 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 6, !dbg !2627
  store i8 0, ptr %23, align 1, !dbg !2627, !tbaa !2641
  %24 = load ptr, ptr @bpf_perf_event_output, align 8, !dbg !2642, !tbaa !399
  %25 = load ptr, ptr %4, align 8, !dbg !2643, !tbaa !399
  %26 = call i64 %24(ptr noundef %25, ptr noundef @events, i64 noundef 4294967295, ptr noundef %7, i64 noundef 64), !dbg !2642
  call void @llvm.lifetime.end.p0(i64 64, ptr %7) #7, !dbg !2644
  ret void, !dbg !2644
}

; Function Attrs: nounwind
define internal i64 @calculate_srtt(i64 noundef %0, i64 noundef %1) #0 !dbg !2645 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store i64 %0, ptr %4, align 8, !tbaa !1187
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2649, metadata !DIExpression()), !dbg !2651
  store i64 %1, ptr %5, align 8, !tbaa !1187
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2650, metadata !DIExpression()), !dbg !2652
  %6 = load i64, ptr %4, align 8, !dbg !2653, !tbaa !1187
  %7 = icmp ne i64 %6, 0, !dbg !2653
  br i1 %7, label %10, label %8, !dbg !2655

8:                                                ; preds = %2
  %9 = load i64, ptr %5, align 8, !dbg !2656, !tbaa !1187
  store i64 %9, ptr %3, align 8, !dbg !2657
  br label %18, !dbg !2657

10:                                               ; preds = %2
  %11 = load i64, ptr %4, align 8, !dbg !2658, !tbaa !1187
  %12 = load i64, ptr %4, align 8, !dbg !2659, !tbaa !1187
  %13 = lshr i64 %12, 3, !dbg !2660
  %14 = sub i64 %11, %13, !dbg !2661
  %15 = load i64, ptr %5, align 8, !dbg !2662, !tbaa !1187
  %16 = lshr i64 %15, 3, !dbg !2663
  %17 = add i64 %14, %16, !dbg !2664
  store i64 %17, ptr %3, align 8, !dbg !2665
  br label %18, !dbg !2665

18:                                               ; preds = %10, %8
  %19 = load i64, ptr %3, align 8, !dbg !2666
  ret i64 %19, !dbg !2666
}

; Function Attrs: nounwind
define internal void @send_flow_event(ptr noundef %0, ptr noundef %1, i1 noundef zeroext %2) #0 !dbg !2667 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i8, align 1
  %7 = alloca %struct.flow_event, align 8
  store ptr %0, ptr %4, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2671, metadata !DIExpression()), !dbg !2675
  store ptr %1, ptr %5, align 8, !tbaa !399
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2672, metadata !DIExpression()), !dbg !2676
  %8 = zext i1 %2 to i8
  store i8 %8, ptr %6, align 1, !tbaa !627
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2673, metadata !DIExpression()), !dbg !2677
  call void @llvm.lifetime.start.p0(i64 64, ptr %7) #7, !dbg !2678
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2674, metadata !DIExpression()), !dbg !2679
  %9 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 0, !dbg !2680
  store i64 1, ptr %9, align 8, !dbg !2680, !tbaa !2628
  %10 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 1, !dbg !2680
  %11 = load ptr, ptr %5, align 8, !dbg !2681, !tbaa !399
  %12 = getelementptr inbounds %struct.packet_info, ptr %11, i32 0, i32 2, !dbg !2682
  %13 = load i64, ptr %12, align 8, !dbg !2682, !tbaa !742
  store i64 %13, ptr %10, align 8, !dbg !2680, !tbaa !2632
  %14 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 2, !dbg !2680
  call void @llvm.memset.p0.i64(ptr align 8 %14, i8 0, i64 44, i1 false), !dbg !2680
  %15 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 3, !dbg !2680
  %16 = load ptr, ptr %5, align 8, !dbg !2683, !tbaa !399
  %17 = getelementptr inbounds %struct.packet_info, ptr %16, i32 0, i32 8, !dbg !2684
  %18 = load i8, ptr %17, align 2, !dbg !2684, !tbaa !959
  store i8 %18, ptr %15, align 4, !dbg !2680, !tbaa !2636
  %19 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 4, !dbg !2680
  %20 = load ptr, ptr %5, align 8, !dbg !2685, !tbaa !399
  %21 = getelementptr inbounds %struct.packet_info, ptr %20, i32 0, i32 9, !dbg !2686
  %22 = load i8, ptr %21, align 1, !dbg !2686, !tbaa !1553
  store i8 %22, ptr %19, align 1, !dbg !2680, !tbaa !2639
  %23 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 5, !dbg !2680
  store i8 0, ptr %23, align 2, !dbg !2680, !tbaa !2640
  %24 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 6, !dbg !2680
  store i8 0, ptr %24, align 1, !dbg !2680, !tbaa !2641
  %25 = load i8, ptr %6, align 1, !dbg !2687, !tbaa !627, !range !628, !noundef !629
  %26 = trunc i8 %25 to i1, !dbg !2687
  br i1 %26, label %27, label %33, !dbg !2689

27:                                               ; preds = %3
  %28 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 2, !dbg !2690
  %29 = load ptr, ptr %5, align 8, !dbg !2692, !tbaa !399
  %30 = getelementptr inbounds %struct.packet_info, ptr %29, i32 0, i32 4, !dbg !2693
  %31 = getelementptr inbounds %struct.packet_id, ptr %30, i32 0, i32 0, !dbg !2694
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %28, ptr align 4 %31, i64 44, i1 false), !dbg !2694, !tbaa.struct !1261
  %32 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 5, !dbg !2695
  store i8 0, ptr %32, align 2, !dbg !2696, !tbaa !2640
  br label %39, !dbg !2697

33:                                               ; preds = %3
  %34 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 2, !dbg !2698
  %35 = load ptr, ptr %5, align 8, !dbg !2700, !tbaa !399
  %36 = getelementptr inbounds %struct.packet_info, ptr %35, i32 0, i32 5, !dbg !2701
  %37 = getelementptr inbounds %struct.packet_id, ptr %36, i32 0, i32 0, !dbg !2702
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %34, ptr align 4 %37, i64 44, i1 false), !dbg !2702, !tbaa.struct !1261
  %38 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 5, !dbg !2703
  store i8 1, ptr %38, align 2, !dbg !2704, !tbaa !2640
  br label %39

39:                                               ; preds = %33, %27
  %40 = load ptr, ptr @bpf_perf_event_output, align 8, !dbg !2705, !tbaa !399
  %41 = load ptr, ptr %4, align 8, !dbg !2706, !tbaa !399
  %42 = call i64 %40(ptr noundef %41, ptr noundef @events, i64 noundef 4294967295, ptr noundef %7, i64 noundef 64), !dbg !2705
  call void @llvm.lifetime.end.p0(i64 64, ptr %7) #7, !dbg !2707
  ret void, !dbg !2707
}

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #4 = { alwaysinline nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #5 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #6 = { convergent nocallback nofree nosync nounwind willreturn memory(none) }
attributes #7 = { nounwind }

!llvm.dbg.cu = !{!2}
!llvm.module.flags = !{!286, !287, !288, !289}
!llvm.ident = !{!290}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(name: "_license", scope: !2, file: !3, line: 82, type: !285, isLocal: false, isDefinition: true)
!2 = distinct !DICompileUnit(language: DW_LANG_C11, file: !3, producer: "clang version 16.0.0", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !4, retainedTypes: !93, globals: !128, splitDebugInlining: false, nameTableKind: None)
!3 = !DIFile(filename: "pping_kern.c", directory: "/home/demo/bpf-examples/pping", checksumkind: CSK_MD5, checksum: "ba8946e8e057f67fd5341ac949fe30c6")
!4 = !{!5, !14, !24, !30, !61, !67, !71, !77, !88}
!5 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !6, line: 4363, baseType: !7, size: 32, elements: !8)
!6 = !DIFile(filename: "../lib/../headers/linux/bpf.h", directory: "/home/demo/bpf-examples/pping", checksumkind: CSK_MD5, checksum: "686704d11802f5f210143bc29244c61a")
!7 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!8 = !{!9, !10, !11, !12, !13}
!9 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!10 = !DIEnumerator(name: "XDP_DROP", value: 1)
!11 = !DIEnumerator(name: "XDP_PASS", value: 2)
!12 = !DIEnumerator(name: "XDP_TX", value: 3)
!13 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!14 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "flow_event_reason", file: !15, line: 26, baseType: !16, size: 8, elements: !17)
!15 = !DIFile(filename: "./pping.h", directory: "/home/demo/bpf-examples/pping", checksumkind: CSK_MD5, checksum: "6a861e6a346893fa17ab178d912b413e")
!16 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!17 = !{!18, !19, !20, !21, !22, !23}
!18 = !DIEnumerator(name: "EVENT_REASON_SYN", value: 0)
!19 = !DIEnumerator(name: "EVENT_REASON_SYN_ACK", value: 1)
!20 = !DIEnumerator(name: "EVENT_REASON_FIRST_OBS_PCKT", value: 2)
!21 = !DIEnumerator(name: "EVENT_REASON_FIN", value: 3)
!22 = !DIEnumerator(name: "EVENT_REASON_RST", value: 4)
!23 = !DIEnumerator(name: "EVENT_REASON_FLOW_TIMEOUT", value: 5)
!24 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "flow_event_type", file: !15, line: 19, baseType: !16, size: 8, elements: !25)
!25 = !{!26, !27, !28, !29}
!26 = !DIEnumerator(name: "FLOW_EVENT_NONE", value: 0)
!27 = !DIEnumerator(name: "FLOW_EVENT_OPENING", value: 1)
!28 = !DIEnumerator(name: "FLOW_EVENT_CLOSING", value: 2)
!29 = !DIEnumerator(name: "FLOW_EVENT_CLOSING_BOTH", value: 3)
!30 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !31, line: 28, baseType: !7, size: 32, elements: !32)
!31 = !DIFile(filename: "/usr/include/linux/in.h", directory: "", checksumkind: CSK_MD5, checksum: "078a32220dc819f6a7e2ea3cecc4e133")
!32 = !{!33, !34, !35, !36, !37, !38, !39, !40, !41, !42, !43, !44, !45, !46, !47, !48, !49, !50, !51, !52, !53, !54, !55, !56, !57, !58, !59, !60}
!33 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!34 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!35 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!36 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!37 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!38 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!39 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!40 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!41 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!42 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!43 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!44 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!45 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!46 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!47 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!48 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!49 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!50 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!51 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!52 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!53 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!54 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!55 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!56 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!57 = !DIEnumerator(name: "IPPROTO_ETHERNET", value: 143)
!58 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!59 = !DIEnumerator(name: "IPPROTO_MPTCP", value: 262)
!60 = !DIEnumerator(name: "IPPROTO_MAX", value: 263)
!61 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 397, baseType: !7, size: 32, elements: !62)
!62 = !{!63, !64, !65, !66}
!63 = !DIEnumerator(name: "BPF_ANY", value: 0)
!64 = !DIEnumerator(name: "BPF_NOEXIST", value: 1)
!65 = !DIEnumerator(name: "BPF_EXIST", value: 2)
!66 = !DIEnumerator(name: "BPF_F_LOCK", value: 4)
!67 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "pping_map", file: !15, line: 41, baseType: !16, size: 8, elements: !68)
!68 = !{!69, !70}
!69 = !DIEnumerator(name: "PPING_MAP_FLOWSTATE", value: 0)
!70 = !DIEnumerator(name: "PPING_MAP_PACKETTS", value: 1)
!71 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 4063, baseType: !72, size: 64, elements: !73)
!72 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!73 = !{!74, !75, !76}
!74 = !DIEnumerator(name: "BPF_F_INDEX_MASK", value: 4294967295, isUnsigned: true)
!75 = !DIEnumerator(name: "BPF_F_CURRENT_CPU", value: 4294967295, isUnsigned: true)
!76 = !DIEnumerator(name: "BPF_F_CTXLEN_MASK", value: 4503595332403200, isUnsigned: true)
!77 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !6, line: 4955, baseType: !7, size: 32, elements: !78)
!78 = !{!79, !80, !81, !82, !83, !84, !85, !86, !87}
!79 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_SUCCESS", value: 0)
!80 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_BLACKHOLE", value: 1)
!81 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_UNREACHABLE", value: 2)
!82 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_PROHIBIT", value: 3)
!83 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_NOT_FWDED", value: 4)
!84 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_FWD_DISABLED", value: 5)
!85 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_UNSUPP_LWT", value: 6)
!86 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_NO_NEIGH", value: 7)
!87 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_FRAG_NEEDED", value: 8)
!88 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "flow_event_source", file: !15, line: 35, baseType: !16, size: 8, elements: !89)
!89 = !{!90, !91, !92}
!90 = !DIEnumerator(name: "EVENT_SOURCE_PKT_SRC", value: 0)
!91 = !DIEnumerator(name: "EVENT_SOURCE_PKT_DEST", value: 1)
!92 = !DIEnumerator(name: "EVENT_SOURCE_USERSPACE", value: 2)
!93 = !{!94, !95, !96, !99, !101, !103, !105, !127, !124, !104}
!94 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!95 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!96 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !97, line: 24, baseType: !98)
!97 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!98 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!99 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !100, size: 64)
!100 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!101 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !102, size: 64)
!102 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !97, line: 21, baseType: !16)
!103 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !104, size: 64)
!104 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !97, line: 27, baseType: !7)
!105 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !106, size: 64)
!106 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !107, line: 33, size: 128, elements: !108)
!107 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "", checksumkind: CSK_MD5, checksum: "fca1889f0274df066e49cf4d8db8011e")
!108 = !{!109}
!109 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !106, file: !107, line: 40, baseType: !110, size: 128)
!110 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !106, file: !107, line: 34, size: 128, elements: !111)
!111 = !{!112, !116, !122}
!112 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !110, file: !107, line: 35, baseType: !113, size: 128)
!113 = !DICompositeType(tag: DW_TAG_array_type, baseType: !102, size: 128, elements: !114)
!114 = !{!115}
!115 = !DISubrange(count: 16)
!116 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !110, file: !107, line: 37, baseType: !117, size: 128)
!117 = !DICompositeType(tag: DW_TAG_array_type, baseType: !118, size: 128, elements: !120)
!118 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !119, line: 25, baseType: !96)
!119 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "710687c858b58f42afb1bfdfe3f8dee9")
!120 = !{!121}
!121 = !DISubrange(count: 8)
!122 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !110, file: !107, line: 38, baseType: !123, size: 128)
!123 = !DICompositeType(tag: DW_TAG_array_type, baseType: !124, size: 128, elements: !125)
!124 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !119, line: 27, baseType: !104)
!125 = !{!126}
!126 = !DISubrange(count: 4)
!127 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !124, size: 64)
!128 = !{!0, !129, !166, !190, !199, !205, !219, !226, !231, !237, !242, !280}
!129 = !DIGlobalVariableExpression(var: !130, expr: !DIExpression())
!130 = distinct !DIGlobalVariable(name: "packet_ts", scope: !2, file: !3, line: 94, type: !131, isLocal: false, isDefinition: true)
!131 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 89, size: 256, elements: !132)
!132 = !{!133, !139, !157, !161}
!133 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !131, file: !3, line: 90, baseType: !134, size: 64)
!134 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !135, size: 64)
!135 = !DICompositeType(tag: DW_TAG_array_type, baseType: !136, size: 32, elements: !137)
!136 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!137 = !{!138}
!138 = !DISubrange(count: 1)
!139 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !131, file: !3, line: 91, baseType: !140, size: 64, offset: 64)
!140 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !141, size: 64)
!141 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "packet_id", file: !15, line: 96, size: 384, elements: !142)
!142 = !{!143, !156}
!143 = !DIDerivedType(tag: DW_TAG_member, name: "flow", scope: !141, file: !15, line: 97, baseType: !144, size: 352)
!144 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "network_tuple", file: !15, line: 74, size: 352, elements: !145)
!145 = !{!146, !152, !153, !154, !155}
!146 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !144, file: !15, line: 75, baseType: !147, size: 160)
!147 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "flow_address", file: !15, line: 61, size: 160, elements: !148)
!148 = !{!149, !150, !151}
!149 = !DIDerivedType(tag: DW_TAG_member, name: "ip", scope: !147, file: !15, line: 62, baseType: !106, size: 128)
!150 = !DIDerivedType(tag: DW_TAG_member, name: "port", scope: !147, file: !15, line: 63, baseType: !96, size: 16, offset: 128)
!151 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !147, file: !15, line: 64, baseType: !96, size: 16, offset: 144)
!152 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !144, file: !15, line: 76, baseType: !147, size: 160, offset: 160)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "proto", scope: !144, file: !15, line: 77, baseType: !96, size: 16, offset: 320)
!154 = !DIDerivedType(tag: DW_TAG_member, name: "ipv", scope: !144, file: !15, line: 78, baseType: !102, size: 8, offset: 336)
!155 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !144, file: !15, line: 79, baseType: !102, size: 8, offset: 344)
!156 = !DIDerivedType(tag: DW_TAG_member, name: "identifier", scope: !141, file: !15, line: 98, baseType: !104, size: 32, offset: 352)
!157 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !131, file: !3, line: 92, baseType: !158, size: 64, offset: 128)
!158 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !159, size: 64)
!159 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !97, line: 31, baseType: !160)
!160 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!161 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !131, file: !3, line: 93, baseType: !162, size: 64, offset: 192)
!162 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !163, size: 64)
!163 = !DICompositeType(tag: DW_TAG_array_type, baseType: !136, size: 524288, elements: !164)
!164 = !{!165}
!165 = !DISubrange(count: 16384)
!166 = !DIGlobalVariableExpression(var: !167, expr: !DIExpression())
!167 = distinct !DIGlobalVariable(name: "flow_state", scope: !2, file: !3, line: 101, type: !168, isLocal: false, isDefinition: true)
!168 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 96, size: 256, elements: !169)
!169 = !{!170, !171, !173, !189}
!170 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !168, file: !3, line: 97, baseType: !134, size: 64)
!171 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !168, file: !3, line: 98, baseType: !172, size: 64, offset: 64)
!172 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !144, size: 64)
!173 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !168, file: !3, line: 99, baseType: !174, size: 64, offset: 128)
!174 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !175, size: 64)
!175 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "flow_state", file: !15, line: 82, size: 512, elements: !176)
!176 = !{!177, !178, !179, !180, !181, !182, !183, !184, !185, !187, !188}
!177 = !DIDerivedType(tag: DW_TAG_member, name: "min_rtt", scope: !175, file: !15, line: 83, baseType: !159, size: 64)
!178 = !DIDerivedType(tag: DW_TAG_member, name: "srtt", scope: !175, file: !15, line: 84, baseType: !159, size: 64, offset: 64)
!179 = !DIDerivedType(tag: DW_TAG_member, name: "last_timestamp", scope: !175, file: !15, line: 85, baseType: !159, size: 64, offset: 128)
!180 = !DIDerivedType(tag: DW_TAG_member, name: "sent_pkts", scope: !175, file: !15, line: 86, baseType: !159, size: 64, offset: 192)
!181 = !DIDerivedType(tag: DW_TAG_member, name: "sent_bytes", scope: !175, file: !15, line: 87, baseType: !159, size: 64, offset: 256)
!182 = !DIDerivedType(tag: DW_TAG_member, name: "rec_pkts", scope: !175, file: !15, line: 88, baseType: !159, size: 64, offset: 320)
!183 = !DIDerivedType(tag: DW_TAG_member, name: "rec_bytes", scope: !175, file: !15, line: 89, baseType: !159, size: 64, offset: 384)
!184 = !DIDerivedType(tag: DW_TAG_member, name: "last_id", scope: !175, file: !15, line: 90, baseType: !104, size: 32, offset: 448)
!185 = !DIDerivedType(tag: DW_TAG_member, name: "has_opened", scope: !175, file: !15, line: 91, baseType: !186, size: 8, offset: 480)
!186 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!187 = !DIDerivedType(tag: DW_TAG_member, name: "opening_reason", scope: !175, file: !15, line: 92, baseType: !14, size: 8, offset: 488)
!188 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !175, file: !15, line: 93, baseType: !96, size: 16, offset: 496)
!189 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !168, file: !3, line: 100, baseType: !162, size: 64, offset: 192)
!190 = !DIGlobalVariableExpression(var: !191, expr: !DIExpression())
!191 = distinct !DIGlobalVariable(name: "events", scope: !2, file: !3, line: 107, type: !192, isLocal: false, isDefinition: true)
!192 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !3, line: 103, size: 192, elements: !193)
!193 = !{!194, !197, !198}
!194 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !192, file: !3, line: 104, baseType: !195, size: 64)
!195 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !196, size: 64)
!196 = !DICompositeType(tag: DW_TAG_array_type, baseType: !136, size: 128, elements: !125)
!197 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !192, file: !3, line: 105, baseType: !195, size: 64, offset: 64)
!198 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !192, file: !3, line: 106, baseType: !195, size: 64, offset: 128)
!199 = !DIGlobalVariableExpression(var: !200, expr: !DIExpression())
!200 = distinct !DIGlobalVariable(name: "bpf_ktime_get_ns", scope: !2, file: !201, line: 109, type: !202, isLocal: true, isDefinition: true)
!201 = !DIFile(filename: "../lib/libbpf-install/usr/include/bpf/bpf_helper_defs.h", directory: "/home/demo/bpf-examples/pping", checksumkind: CSK_MD5, checksum: "52f02fca464a4053efa2721be82f1a3e")
!202 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !203, size: 64)
!203 = !DISubroutineType(types: !204)
!204 = !{!159}
!205 = !DIGlobalVariableExpression(var: !206, expr: !DIExpression())
!206 = distinct !DIGlobalVariable(name: "config", scope: !2, file: !3, line: 84, type: !207, isLocal: true, isDefinition: true)
!207 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !208)
!208 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !209)
!209 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_config", file: !15, line: 46, size: 192, elements: !210)
!210 = !{!211, !212, !214, !215, !216, !217, !218}
!211 = !DIDerivedType(tag: DW_TAG_member, name: "rate_limit", scope: !209, file: !15, line: 47, baseType: !159, size: 64)
!212 = !DIDerivedType(tag: DW_TAG_member, name: "rtt_rate", scope: !209, file: !15, line: 48, baseType: !213, size: 64, offset: 64)
!213 = !DIDerivedType(tag: DW_TAG_typedef, name: "fixpoint64", file: !15, line: 9, baseType: !159)
!214 = !DIDerivedType(tag: DW_TAG_member, name: "use_srtt", scope: !209, file: !15, line: 49, baseType: !186, size: 8, offset: 128)
!215 = !DIDerivedType(tag: DW_TAG_member, name: "track_tcp", scope: !209, file: !15, line: 50, baseType: !186, size: 8, offset: 136)
!216 = !DIDerivedType(tag: DW_TAG_member, name: "track_icmp", scope: !209, file: !15, line: 51, baseType: !186, size: 8, offset: 144)
!217 = !DIDerivedType(tag: DW_TAG_member, name: "localfilt", scope: !209, file: !15, line: 52, baseType: !186, size: 8, offset: 152)
!218 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !209, file: !15, line: 53, baseType: !104, size: 32, offset: 160)
!219 = !DIGlobalVariableExpression(var: !220, expr: !DIExpression())
!220 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !2, file: !201, line: 51, type: !221, isLocal: true, isDefinition: true)
!221 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !222, size: 64)
!222 = !DISubroutineType(types: !223)
!223 = !{!94, !94, !224}
!224 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !225, size: 64)
!225 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!226 = !DIGlobalVariableExpression(var: !227, expr: !DIExpression())
!227 = distinct !DIGlobalVariable(name: "bpf_map_update_elem", scope: !2, file: !201, line: 73, type: !228, isLocal: true, isDefinition: true)
!228 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !229, size: 64)
!229 = !DISubroutineType(types: !230)
!230 = !{!95, !94, !224, !224, !159}
!231 = !DIGlobalVariableExpression(var: !232, expr: !DIExpression())
!232 = distinct !DIGlobalVariable(name: "last_warn_time", scope: !2, file: !3, line: 85, type: !233, isLocal: true, isDefinition: true)
!233 = !DICompositeType(tag: DW_TAG_array_type, baseType: !234, size: 128, elements: !235)
!234 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !159)
!235 = !{!236}
!236 = !DISubrange(count: 2)
!237 = !DIGlobalVariableExpression(var: !238, expr: !DIExpression())
!238 = distinct !DIGlobalVariable(name: "bpf_perf_event_output", scope: !2, file: !201, line: 686, type: !239, isLocal: true, isDefinition: true)
!239 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !240, size: 64)
!240 = !DISubroutineType(types: !241)
!241 = !{!95, !94, !94, !159, !94, !159}
!242 = !DIGlobalVariableExpression(var: !243, expr: !DIExpression())
!243 = distinct !DIGlobalVariable(name: "bpf_fib_lookup", scope: !2, file: !201, line: 1816, type: !244, isLocal: true, isDefinition: true)
!244 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !245, size: 64)
!245 = !DISubroutineType(types: !246)
!246 = !{!95, !94, !247, !136, !104}
!247 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !248, size: 64)
!248 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_fib_lookup", file: !6, line: 4967, size: 512, elements: !249)
!249 = !{!250, !251, !252, !253, !254, !255, !256, !262, !268, !273, !274, !275, !279}
!250 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !248, file: !6, line: 4971, baseType: !102, size: 8)
!251 = !DIDerivedType(tag: DW_TAG_member, name: "l4_protocol", scope: !248, file: !6, line: 4974, baseType: !102, size: 8, offset: 8)
!252 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !248, file: !6, line: 4975, baseType: !118, size: 16, offset: 16)
!253 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !248, file: !6, line: 4976, baseType: !118, size: 16, offset: 32)
!254 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !248, file: !6, line: 4979, baseType: !96, size: 16, offset: 48)
!255 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !248, file: !6, line: 4984, baseType: !104, size: 32, offset: 64)
!256 = !DIDerivedType(tag: DW_TAG_member, scope: !248, file: !6, line: 4986, baseType: !257, size: 32, offset: 96)
!257 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !248, file: !6, line: 4986, size: 32, elements: !258)
!258 = !{!259, !260, !261}
!259 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !257, file: !6, line: 4988, baseType: !102, size: 8)
!260 = !DIDerivedType(tag: DW_TAG_member, name: "flowinfo", scope: !257, file: !6, line: 4989, baseType: !124, size: 32)
!261 = !DIDerivedType(tag: DW_TAG_member, name: "rt_metric", scope: !257, file: !6, line: 4992, baseType: !104, size: 32)
!262 = !DIDerivedType(tag: DW_TAG_member, scope: !248, file: !6, line: 4995, baseType: !263, size: 128, offset: 128)
!263 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !248, file: !6, line: 4995, size: 128, elements: !264)
!264 = !{!265, !266}
!265 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !263, file: !6, line: 4996, baseType: !124, size: 32)
!266 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !263, file: !6, line: 4997, baseType: !267, size: 128)
!267 = !DICompositeType(tag: DW_TAG_array_type, baseType: !104, size: 128, elements: !125)
!268 = !DIDerivedType(tag: DW_TAG_member, scope: !248, file: !6, line: 5004, baseType: !269, size: 128, offset: 256)
!269 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !248, file: !6, line: 5004, size: 128, elements: !270)
!270 = !{!271, !272}
!271 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !269, file: !6, line: 5005, baseType: !124, size: 32)
!272 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !269, file: !6, line: 5006, baseType: !267, size: 128)
!273 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_proto", scope: !248, file: !6, line: 5010, baseType: !118, size: 16, offset: 384)
!274 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !248, file: !6, line: 5011, baseType: !118, size: 16, offset: 400)
!275 = !DIDerivedType(tag: DW_TAG_member, name: "smac", scope: !248, file: !6, line: 5012, baseType: !276, size: 48, offset: 416)
!276 = !DICompositeType(tag: DW_TAG_array_type, baseType: !102, size: 48, elements: !277)
!277 = !{!278}
!278 = !DISubrange(count: 6)
!279 = !DIDerivedType(tag: DW_TAG_member, name: "dmac", scope: !248, file: !6, line: 5013, baseType: !276, size: 48, offset: 464)
!280 = !DIGlobalVariableExpression(var: !281, expr: !DIExpression())
!281 = distinct !DIGlobalVariable(name: "bpf_map_delete_elem", scope: !2, file: !201, line: 83, type: !282, isLocal: true, isDefinition: true)
!282 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !283, size: 64)
!283 = !DISubroutineType(types: !284)
!284 = !{!95, !94, !224}
!285 = !DICompositeType(tag: DW_TAG_array_type, baseType: !100, size: 32, elements: !125)
!286 = !{i32 7, !"Dwarf Version", i32 5}
!287 = !{i32 2, !"Debug Info Version", i32 3}
!288 = !{i32 1, !"wchar_size", i32 4}
!289 = !{i32 7, !"frame-pointer", i32 2}
!290 = !{!"clang version 16.0.0"}
!291 = distinct !DISubprogram(name: "pping_tc_egress", scope: !3, file: !3, line: 715, type: !292, scopeLine: 716, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !384)
!292 = !DISubroutineType(types: !293)
!293 = !{!136, !294}
!294 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !295, size: 64)
!295 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sk_buff", file: !6, line: 4183, size: 1472, elements: !296)
!296 = !{!297, !298, !299, !300, !301, !302, !303, !304, !305, !306, !307, !308, !309, !313, !314, !315, !316, !317, !318, !319, !320, !321, !322, !323, !324, !325, !326, !358, !359, !360, !361, !383}
!297 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !295, file: !6, line: 4184, baseType: !104, size: 32)
!298 = !DIDerivedType(tag: DW_TAG_member, name: "pkt_type", scope: !295, file: !6, line: 4185, baseType: !104, size: 32, offset: 32)
!299 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !295, file: !6, line: 4186, baseType: !104, size: 32, offset: 64)
!300 = !DIDerivedType(tag: DW_TAG_member, name: "queue_mapping", scope: !295, file: !6, line: 4187, baseType: !104, size: 32, offset: 96)
!301 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !295, file: !6, line: 4188, baseType: !104, size: 32, offset: 128)
!302 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_present", scope: !295, file: !6, line: 4189, baseType: !104, size: 32, offset: 160)
!303 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_tci", scope: !295, file: !6, line: 4190, baseType: !104, size: 32, offset: 192)
!304 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_proto", scope: !295, file: !6, line: 4191, baseType: !104, size: 32, offset: 224)
!305 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !295, file: !6, line: 4192, baseType: !104, size: 32, offset: 256)
!306 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !295, file: !6, line: 4193, baseType: !104, size: 32, offset: 288)
!307 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !295, file: !6, line: 4194, baseType: !104, size: 32, offset: 320)
!308 = !DIDerivedType(tag: DW_TAG_member, name: "tc_index", scope: !295, file: !6, line: 4195, baseType: !104, size: 32, offset: 352)
!309 = !DIDerivedType(tag: DW_TAG_member, name: "cb", scope: !295, file: !6, line: 4196, baseType: !310, size: 160, offset: 384)
!310 = !DICompositeType(tag: DW_TAG_array_type, baseType: !104, size: 160, elements: !311)
!311 = !{!312}
!312 = !DISubrange(count: 5)
!313 = !DIDerivedType(tag: DW_TAG_member, name: "hash", scope: !295, file: !6, line: 4197, baseType: !104, size: 32, offset: 544)
!314 = !DIDerivedType(tag: DW_TAG_member, name: "tc_classid", scope: !295, file: !6, line: 4198, baseType: !104, size: 32, offset: 576)
!315 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !295, file: !6, line: 4199, baseType: !104, size: 32, offset: 608)
!316 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !295, file: !6, line: 4200, baseType: !104, size: 32, offset: 640)
!317 = !DIDerivedType(tag: DW_TAG_member, name: "napi_id", scope: !295, file: !6, line: 4201, baseType: !104, size: 32, offset: 672)
!318 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !295, file: !6, line: 4204, baseType: !104, size: 32, offset: 704)
!319 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip4", scope: !295, file: !6, line: 4205, baseType: !104, size: 32, offset: 736)
!320 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip4", scope: !295, file: !6, line: 4206, baseType: !104, size: 32, offset: 768)
!321 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip6", scope: !295, file: !6, line: 4207, baseType: !267, size: 128, offset: 800)
!322 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip6", scope: !295, file: !6, line: 4208, baseType: !267, size: 128, offset: 928)
!323 = !DIDerivedType(tag: DW_TAG_member, name: "remote_port", scope: !295, file: !6, line: 4209, baseType: !104, size: 32, offset: 1056)
!324 = !DIDerivedType(tag: DW_TAG_member, name: "local_port", scope: !295, file: !6, line: 4210, baseType: !104, size: 32, offset: 1088)
!325 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !295, file: !6, line: 4213, baseType: !104, size: 32, offset: 1120)
!326 = !DIDerivedType(tag: DW_TAG_member, scope: !295, file: !6, line: 4214, baseType: !327, size: 64, align: 64, offset: 1152)
!327 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !295, file: !6, line: 4214, size: 64, align: 64, elements: !328)
!328 = !{!329}
!329 = !DIDerivedType(tag: DW_TAG_member, name: "flow_keys", scope: !327, file: !6, line: 4214, baseType: !330, size: 64)
!330 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !331, size: 64)
!331 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_flow_keys", file: !6, line: 5041, size: 448, elements: !332)
!332 = !{!333, !334, !335, !336, !337, !338, !339, !340, !341, !342, !343, !356, !357}
!333 = !DIDerivedType(tag: DW_TAG_member, name: "nhoff", scope: !331, file: !6, line: 5042, baseType: !96, size: 16)
!334 = !DIDerivedType(tag: DW_TAG_member, name: "thoff", scope: !331, file: !6, line: 5043, baseType: !96, size: 16, offset: 16)
!335 = !DIDerivedType(tag: DW_TAG_member, name: "addr_proto", scope: !331, file: !6, line: 5044, baseType: !96, size: 16, offset: 32)
!336 = !DIDerivedType(tag: DW_TAG_member, name: "is_frag", scope: !331, file: !6, line: 5045, baseType: !102, size: 8, offset: 48)
!337 = !DIDerivedType(tag: DW_TAG_member, name: "is_first_frag", scope: !331, file: !6, line: 5046, baseType: !102, size: 8, offset: 56)
!338 = !DIDerivedType(tag: DW_TAG_member, name: "is_encap", scope: !331, file: !6, line: 5047, baseType: !102, size: 8, offset: 64)
!339 = !DIDerivedType(tag: DW_TAG_member, name: "ip_proto", scope: !331, file: !6, line: 5048, baseType: !102, size: 8, offset: 72)
!340 = !DIDerivedType(tag: DW_TAG_member, name: "n_proto", scope: !331, file: !6, line: 5049, baseType: !118, size: 16, offset: 80)
!341 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !331, file: !6, line: 5050, baseType: !118, size: 16, offset: 96)
!342 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !331, file: !6, line: 5051, baseType: !118, size: 16, offset: 112)
!343 = !DIDerivedType(tag: DW_TAG_member, scope: !331, file: !6, line: 5052, baseType: !344, size: 256, offset: 128)
!344 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !331, file: !6, line: 5052, size: 256, elements: !345)
!345 = !{!346, !351}
!346 = !DIDerivedType(tag: DW_TAG_member, scope: !344, file: !6, line: 5053, baseType: !347, size: 64)
!347 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !344, file: !6, line: 5053, size: 64, elements: !348)
!348 = !{!349, !350}
!349 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !347, file: !6, line: 5054, baseType: !124, size: 32)
!350 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !347, file: !6, line: 5055, baseType: !124, size: 32, offset: 32)
!351 = !DIDerivedType(tag: DW_TAG_member, scope: !344, file: !6, line: 5057, baseType: !352, size: 256)
!352 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !344, file: !6, line: 5057, size: 256, elements: !353)
!353 = !{!354, !355}
!354 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !352, file: !6, line: 5058, baseType: !267, size: 128)
!355 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !352, file: !6, line: 5059, baseType: !267, size: 128, offset: 128)
!356 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !331, file: !6, line: 5062, baseType: !104, size: 32, offset: 384)
!357 = !DIDerivedType(tag: DW_TAG_member, name: "flow_label", scope: !331, file: !6, line: 5063, baseType: !124, size: 32, offset: 416)
!358 = !DIDerivedType(tag: DW_TAG_member, name: "tstamp", scope: !295, file: !6, line: 4215, baseType: !159, size: 64, offset: 1216)
!359 = !DIDerivedType(tag: DW_TAG_member, name: "wire_len", scope: !295, file: !6, line: 4216, baseType: !104, size: 32, offset: 1280)
!360 = !DIDerivedType(tag: DW_TAG_member, name: "gso_segs", scope: !295, file: !6, line: 4217, baseType: !104, size: 32, offset: 1312)
!361 = !DIDerivedType(tag: DW_TAG_member, scope: !295, file: !6, line: 4218, baseType: !362, size: 64, align: 64, offset: 1344)
!362 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !295, file: !6, line: 4218, size: 64, align: 64, elements: !363)
!363 = !{!364}
!364 = !DIDerivedType(tag: DW_TAG_member, name: "sk", scope: !362, file: !6, line: 4218, baseType: !365, size: 64)
!365 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !366, size: 64)
!366 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_sock", file: !6, line: 4272, size: 640, elements: !367)
!367 = !{!368, !369, !370, !371, !372, !373, !374, !375, !376, !377, !378, !379, !380, !381}
!368 = !DIDerivedType(tag: DW_TAG_member, name: "bound_dev_if", scope: !366, file: !6, line: 4273, baseType: !104, size: 32)
!369 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !366, file: !6, line: 4274, baseType: !104, size: 32, offset: 32)
!370 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !366, file: !6, line: 4275, baseType: !104, size: 32, offset: 64)
!371 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !366, file: !6, line: 4276, baseType: !104, size: 32, offset: 96)
!372 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !366, file: !6, line: 4277, baseType: !104, size: 32, offset: 128)
!373 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !366, file: !6, line: 4278, baseType: !104, size: 32, offset: 160)
!374 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip4", scope: !366, file: !6, line: 4280, baseType: !104, size: 32, offset: 192)
!375 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip6", scope: !366, file: !6, line: 4281, baseType: !267, size: 128, offset: 224)
!376 = !DIDerivedType(tag: DW_TAG_member, name: "src_port", scope: !366, file: !6, line: 4282, baseType: !104, size: 32, offset: 352)
!377 = !DIDerivedType(tag: DW_TAG_member, name: "dst_port", scope: !366, file: !6, line: 4283, baseType: !104, size: 32, offset: 384)
!378 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip4", scope: !366, file: !6, line: 4284, baseType: !104, size: 32, offset: 416)
!379 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip6", scope: !366, file: !6, line: 4285, baseType: !267, size: 128, offset: 448)
!380 = !DIDerivedType(tag: DW_TAG_member, name: "state", scope: !366, file: !6, line: 4286, baseType: !104, size: 32, offset: 576)
!381 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_mapping", scope: !366, file: !6, line: 4287, baseType: !382, size: 32, offset: 608)
!382 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s32", file: !97, line: 26, baseType: !136)
!383 = !DIDerivedType(tag: DW_TAG_member, name: "gso_size", scope: !295, file: !6, line: 4219, baseType: !104, size: 32, offset: 1408)
!384 = !{!385, !386}
!385 = !DILocalVariable(name: "skb", arg: 1, scope: !291, file: !3, line: 715, type: !294)
!386 = !DILocalVariable(name: "pctx", scope: !291, file: !3, line: 717, type: !387)
!387 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "parsing_context", file: !3, line: 42, size: 320, elements: !388)
!388 = !{!389, !390, !391, !396, !397, !398}
!389 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !387, file: !3, line: 43, baseType: !94, size: 64)
!390 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !387, file: !3, line: 44, baseType: !94, size: 64, offset: 64)
!391 = !DIDerivedType(tag: DW_TAG_member, name: "nh", scope: !387, file: !3, line: 45, baseType: !392, size: 64, offset: 128)
!392 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !393, line: 35, size: 64, elements: !394)
!393 = !DIFile(filename: "../lib/../include/xdp/parsing_helpers.h", directory: "/home/demo/bpf-examples/pping", checksumkind: CSK_MD5, checksum: "e41ee3c44bb7300a1b081f0ef073eeff")
!394 = !{!395}
!395 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !392, file: !393, line: 36, baseType: !94, size: 64)
!396 = !DIDerivedType(tag: DW_TAG_member, name: "pkt_len", scope: !387, file: !3, line: 46, baseType: !104, size: 32, offset: 192)
!397 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !387, file: !3, line: 47, baseType: !104, size: 32, offset: 224)
!398 = !DIDerivedType(tag: DW_TAG_member, name: "is_egress", scope: !387, file: !3, line: 48, baseType: !186, size: 8, offset: 256)
!399 = !{!400, !400, i64 0}
!400 = !{!"any pointer", !401, i64 0}
!401 = !{!"omnipotent char", !402, i64 0}
!402 = !{!"Simple C/C++ TBAA"}
!403 = !DILocation(line: 715, column: 39, scope: !291)
!404 = !DILocation(line: 717, column: 2, scope: !291)
!405 = !DILocation(line: 717, column: 25, scope: !291)
!406 = !DILocation(line: 717, column: 32, scope: !291)
!407 = !DILocation(line: 718, column: 25, scope: !291)
!408 = !DILocation(line: 718, column: 30, scope: !291)
!409 = !{!410, !411, i64 76}
!410 = !{!"__sk_buff", !411, i64 0, !411, i64 4, !411, i64 8, !411, i64 12, !411, i64 16, !411, i64 20, !411, i64 24, !411, i64 28, !411, i64 32, !411, i64 36, !411, i64 40, !411, i64 44, !401, i64 48, !411, i64 68, !411, i64 72, !411, i64 76, !411, i64 80, !411, i64 84, !411, i64 88, !411, i64 92, !411, i64 96, !401, i64 100, !401, i64 116, !411, i64 132, !411, i64 136, !411, i64 140, !401, i64 144, !412, i64 152, !411, i64 160, !411, i64 164, !401, i64 168, !411, i64 176}
!411 = !{!"int", !401, i64 0}
!412 = !{!"long long", !401, i64 0}
!413 = !DILocation(line: 718, column: 19, scope: !291)
!414 = !DILocation(line: 718, column: 11, scope: !291)
!415 = !{!416, !400, i64 0}
!416 = !{!"parsing_context", !400, i64 0, !400, i64 8, !417, i64 16, !411, i64 24, !411, i64 28, !418, i64 32}
!417 = !{!"hdr_cursor", !400, i64 0}
!418 = !{!"_Bool", !401, i64 0}
!419 = !DILocation(line: 719, column: 29, scope: !291)
!420 = !DILocation(line: 719, column: 34, scope: !291)
!421 = !{!410, !411, i64 80}
!422 = !DILocation(line: 719, column: 23, scope: !291)
!423 = !DILocation(line: 719, column: 15, scope: !291)
!424 = !{!416, !400, i64 8}
!425 = !DILocation(line: 721, column: 9, scope: !291)
!426 = !DILocation(line: 721, column: 23, scope: !291)
!427 = !{!417, !400, i64 0}
!428 = !DILocation(line: 720, column: 14, scope: !291)
!429 = !DILocation(line: 720, column: 19, scope: !291)
!430 = !{!410, !411, i64 0}
!431 = !{!416, !411, i64 24}
!432 = !{!416, !411, i64 28}
!433 = !{!416, !418, i64 32}
!434 = !DILocation(line: 725, column: 8, scope: !291)
!435 = !DILocation(line: 725, column: 2, scope: !291)
!436 = !DILocation(line: 728, column: 1, scope: !291)
!437 = !DILocation(line: 727, column: 2, scope: !291)
!438 = distinct !DISubprogram(name: "pping", scope: !3, file: !3, line: 692, type: !439, scopeLine: 693, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !442)
!439 = !DISubroutineType(types: !440)
!440 = !{null, !94, !441}
!441 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !387, size: 64)
!442 = !{!443, !444, !445, !602, !603, !604}
!443 = !DILocalVariable(name: "ctx", arg: 1, scope: !438, file: !3, line: 692, type: !94)
!444 = !DILocalVariable(name: "pctx", arg: 2, scope: !438, file: !3, line: 692, type: !441)
!445 = !DILocalVariable(name: "p_info", scope: !438, file: !3, line: 694, type: !446)
!446 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "packet_info", file: !3, line: 62, size: 1024, elements: !447)
!447 = !{!448, !506, !594, !595, !596, !597, !598, !599, !600, !601}
!448 = !DIDerivedType(tag: DW_TAG_member, scope: !446, file: !3, line: 63, baseType: !449, size: 64)
!449 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !446, file: !3, line: 63, size: 64, elements: !450)
!450 = !{!451, !479}
!451 = !DIDerivedType(tag: DW_TAG_member, name: "iph", scope: !449, file: !3, line: 64, baseType: !452, size: 64)
!452 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !453, size: 64)
!453 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !454, line: 87, size: 160, elements: !455)
!454 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "042b09a58768855e3578a0a8eba49be7")
!455 = !{!456, !457, !458, !459, !460, !461, !462, !463, !464, !466}
!456 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !453, file: !454, line: 89, baseType: !102, size: 4, flags: DIFlagBitField, extraData: i64 0)
!457 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !453, file: !454, line: 90, baseType: !102, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!458 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !453, file: !454, line: 97, baseType: !102, size: 8, offset: 8)
!459 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !453, file: !454, line: 98, baseType: !118, size: 16, offset: 16)
!460 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !453, file: !454, line: 99, baseType: !118, size: 16, offset: 32)
!461 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !453, file: !454, line: 100, baseType: !118, size: 16, offset: 48)
!462 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !453, file: !454, line: 101, baseType: !102, size: 8, offset: 64)
!463 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !453, file: !454, line: 102, baseType: !102, size: 8, offset: 72)
!464 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !453, file: !454, line: 103, baseType: !465, size: 16, offset: 80)
!465 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !119, line: 31, baseType: !96)
!466 = !DIDerivedType(tag: DW_TAG_member, scope: !453, file: !454, line: 104, baseType: !467, size: 64, offset: 96)
!467 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !453, file: !454, line: 104, size: 64, elements: !468)
!468 = !{!469, !474}
!469 = !DIDerivedType(tag: DW_TAG_member, scope: !467, file: !454, line: 104, baseType: !470, size: 64)
!470 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !467, file: !454, line: 104, size: 64, elements: !471)
!471 = !{!472, !473}
!472 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !470, file: !454, line: 104, baseType: !124, size: 32)
!473 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !470, file: !454, line: 104, baseType: !124, size: 32, offset: 32)
!474 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !467, file: !454, line: 104, baseType: !475, size: 64)
!475 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !467, file: !454, line: 104, size: 64, elements: !476)
!476 = !{!477, !478}
!477 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !475, file: !454, line: 104, baseType: !124, size: 32)
!478 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !475, file: !454, line: 104, baseType: !124, size: 32, offset: 32)
!479 = !DIDerivedType(tag: DW_TAG_member, name: "ip6h", scope: !449, file: !3, line: 65, baseType: !480, size: 64)
!480 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !481, size: 64)
!481 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !482, line: 118, size: 320, elements: !483)
!482 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "", checksumkind: CSK_MD5, checksum: "9926d49458ea1e0cc4651362e733e03e")
!483 = !{!484, !485, !486, !490, !491, !492, !493}
!484 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !481, file: !482, line: 120, baseType: !102, size: 4, flags: DIFlagBitField, extraData: i64 0)
!485 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !481, file: !482, line: 121, baseType: !102, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!486 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !481, file: !482, line: 128, baseType: !487, size: 24, offset: 8)
!487 = !DICompositeType(tag: DW_TAG_array_type, baseType: !102, size: 24, elements: !488)
!488 = !{!489}
!489 = !DISubrange(count: 3)
!490 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !481, file: !482, line: 130, baseType: !118, size: 16, offset: 32)
!491 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !481, file: !482, line: 131, baseType: !102, size: 8, offset: 48)
!492 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !481, file: !482, line: 132, baseType: !102, size: 8, offset: 56)
!493 = !DIDerivedType(tag: DW_TAG_member, scope: !481, file: !482, line: 134, baseType: !494, size: 256, offset: 64)
!494 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !481, file: !482, line: 134, size: 256, elements: !495)
!495 = !{!496, !501}
!496 = !DIDerivedType(tag: DW_TAG_member, scope: !494, file: !482, line: 134, baseType: !497, size: 256)
!497 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !494, file: !482, line: 134, size: 256, elements: !498)
!498 = !{!499, !500}
!499 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !497, file: !482, line: 134, baseType: !106, size: 128)
!500 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !497, file: !482, line: 134, baseType: !106, size: 128, offset: 128)
!501 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !494, file: !482, line: 134, baseType: !502, size: 256)
!502 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !494, file: !482, line: 134, size: 256, elements: !503)
!503 = !{!504, !505}
!504 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !502, file: !482, line: 134, baseType: !106, size: 128)
!505 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !502, file: !482, line: 134, baseType: !106, size: 128, offset: 128)
!506 = !DIDerivedType(tag: DW_TAG_member, scope: !446, file: !3, line: 67, baseType: !507, size: 64, offset: 64)
!507 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !446, file: !3, line: 67, size: 64, elements: !508)
!508 = !{!509, !533, !572}
!509 = !DIDerivedType(tag: DW_TAG_member, name: "icmph", scope: !507, file: !3, line: 68, baseType: !510, size: 64)
!510 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !511, size: 64)
!511 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmphdr", file: !512, line: 89, size: 64, elements: !513)
!512 = !DIFile(filename: "/usr/include/linux/icmp.h", directory: "", checksumkind: CSK_MD5, checksum: "a505632898dce546638b3344627d334b")
!513 = !{!514, !515, !516, !517}
!514 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !511, file: !512, line: 90, baseType: !102, size: 8)
!515 = !DIDerivedType(tag: DW_TAG_member, name: "code", scope: !511, file: !512, line: 91, baseType: !102, size: 8, offset: 8)
!516 = !DIDerivedType(tag: DW_TAG_member, name: "checksum", scope: !511, file: !512, line: 92, baseType: !465, size: 16, offset: 16)
!517 = !DIDerivedType(tag: DW_TAG_member, name: "un", scope: !511, file: !512, line: 104, baseType: !518, size: 32, offset: 32)
!518 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !511, file: !512, line: 93, size: 32, elements: !519)
!519 = !{!520, !525, !526, !531}
!520 = !DIDerivedType(tag: DW_TAG_member, name: "echo", scope: !518, file: !512, line: 97, baseType: !521, size: 32)
!521 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !518, file: !512, line: 94, size: 32, elements: !522)
!522 = !{!523, !524}
!523 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !521, file: !512, line: 95, baseType: !118, size: 16)
!524 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !521, file: !512, line: 96, baseType: !118, size: 16, offset: 16)
!525 = !DIDerivedType(tag: DW_TAG_member, name: "gateway", scope: !518, file: !512, line: 98, baseType: !124, size: 32)
!526 = !DIDerivedType(tag: DW_TAG_member, name: "frag", scope: !518, file: !512, line: 102, baseType: !527, size: 32)
!527 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !518, file: !512, line: 99, size: 32, elements: !528)
!528 = !{!529, !530}
!529 = !DIDerivedType(tag: DW_TAG_member, name: "__unused", scope: !527, file: !512, line: 100, baseType: !118, size: 16)
!530 = !DIDerivedType(tag: DW_TAG_member, name: "mtu", scope: !527, file: !512, line: 101, baseType: !118, size: 16, offset: 16)
!531 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !518, file: !512, line: 103, baseType: !532, size: 32)
!532 = !DICompositeType(tag: DW_TAG_array_type, baseType: !102, size: 32, elements: !125)
!533 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6h", scope: !507, file: !3, line: 69, baseType: !534, size: 64)
!534 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !535, size: 64)
!535 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmp6hdr", file: !536, line: 8, size: 64, elements: !537)
!536 = !DIFile(filename: "/usr/include/linux/icmpv6.h", directory: "", checksumkind: CSK_MD5, checksum: "0310ca5584e6f44f6eea6cf040ee84b9")
!537 = !{!538, !539, !540, !541}
!538 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_type", scope: !535, file: !536, line: 10, baseType: !102, size: 8)
!539 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_code", scope: !535, file: !536, line: 11, baseType: !102, size: 8, offset: 8)
!540 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_cksum", scope: !535, file: !536, line: 12, baseType: !465, size: 16, offset: 16)
!541 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_dataun", scope: !535, file: !536, line: 63, baseType: !542, size: 32, offset: 32)
!542 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !535, file: !536, line: 15, size: 32, elements: !543)
!543 = !{!544, !546, !548, !549, !554, !562}
!544 = !DIDerivedType(tag: DW_TAG_member, name: "un_data32", scope: !542, file: !536, line: 16, baseType: !545, size: 32)
!545 = !DICompositeType(tag: DW_TAG_array_type, baseType: !124, size: 32, elements: !137)
!546 = !DIDerivedType(tag: DW_TAG_member, name: "un_data16", scope: !542, file: !536, line: 17, baseType: !547, size: 32)
!547 = !DICompositeType(tag: DW_TAG_array_type, baseType: !118, size: 32, elements: !235)
!548 = !DIDerivedType(tag: DW_TAG_member, name: "un_data8", scope: !542, file: !536, line: 18, baseType: !532, size: 32)
!549 = !DIDerivedType(tag: DW_TAG_member, name: "u_echo", scope: !542, file: !536, line: 23, baseType: !550, size: 32)
!550 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_echo", file: !536, line: 20, size: 32, elements: !551)
!551 = !{!552, !553}
!552 = !DIDerivedType(tag: DW_TAG_member, name: "identifier", scope: !550, file: !536, line: 21, baseType: !118, size: 16)
!553 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !550, file: !536, line: 22, baseType: !118, size: 16, offset: 16)
!554 = !DIDerivedType(tag: DW_TAG_member, name: "u_nd_advt", scope: !542, file: !536, line: 40, baseType: !555, size: 32)
!555 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_nd_advt", file: !536, line: 25, size: 32, elements: !556)
!556 = !{!557, !558, !559, !560, !561}
!557 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !555, file: !536, line: 27, baseType: !104, size: 5, flags: DIFlagBitField, extraData: i64 0)
!558 = !DIDerivedType(tag: DW_TAG_member, name: "override", scope: !555, file: !536, line: 28, baseType: !104, size: 1, offset: 5, flags: DIFlagBitField, extraData: i64 0)
!559 = !DIDerivedType(tag: DW_TAG_member, name: "solicited", scope: !555, file: !536, line: 29, baseType: !104, size: 1, offset: 6, flags: DIFlagBitField, extraData: i64 0)
!560 = !DIDerivedType(tag: DW_TAG_member, name: "router", scope: !555, file: !536, line: 30, baseType: !104, size: 1, offset: 7, flags: DIFlagBitField, extraData: i64 0)
!561 = !DIDerivedType(tag: DW_TAG_member, name: "reserved2", scope: !555, file: !536, line: 31, baseType: !104, size: 24, offset: 8, flags: DIFlagBitField, extraData: i64 0)
!562 = !DIDerivedType(tag: DW_TAG_member, name: "u_nd_ra", scope: !542, file: !536, line: 61, baseType: !563, size: 32)
!563 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_nd_ra", file: !536, line: 42, size: 32, elements: !564)
!564 = !{!565, !566, !567, !568, !569, !570, !571}
!565 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !563, file: !536, line: 43, baseType: !102, size: 8)
!566 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !563, file: !536, line: 45, baseType: !102, size: 3, offset: 8, flags: DIFlagBitField, extraData: i64 8)
!567 = !DIDerivedType(tag: DW_TAG_member, name: "router_pref", scope: !563, file: !536, line: 46, baseType: !102, size: 2, offset: 11, flags: DIFlagBitField, extraData: i64 8)
!568 = !DIDerivedType(tag: DW_TAG_member, name: "home_agent", scope: !563, file: !536, line: 47, baseType: !102, size: 1, offset: 13, flags: DIFlagBitField, extraData: i64 8)
!569 = !DIDerivedType(tag: DW_TAG_member, name: "other", scope: !563, file: !536, line: 48, baseType: !102, size: 1, offset: 14, flags: DIFlagBitField, extraData: i64 8)
!570 = !DIDerivedType(tag: DW_TAG_member, name: "managed", scope: !563, file: !536, line: 49, baseType: !102, size: 1, offset: 15, flags: DIFlagBitField, extraData: i64 8)
!571 = !DIDerivedType(tag: DW_TAG_member, name: "rt_lifetime", scope: !563, file: !536, line: 60, baseType: !118, size: 16, offset: 16)
!572 = !DIDerivedType(tag: DW_TAG_member, name: "tcph", scope: !507, file: !3, line: 70, baseType: !573, size: 64)
!573 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !574, size: 64)
!574 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tcphdr", file: !575, line: 25, size: 160, elements: !576)
!575 = !DIFile(filename: "/usr/include/linux/tcp.h", directory: "", checksumkind: CSK_MD5, checksum: "8d74bf2133e7b3dab885994b9916aa13")
!576 = !{!577, !578, !579, !580, !581, !582, !583, !584, !585, !586, !587, !588, !589, !590, !591, !592, !593}
!577 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !574, file: !575, line: 26, baseType: !118, size: 16)
!578 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !574, file: !575, line: 27, baseType: !118, size: 16, offset: 16)
!579 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !574, file: !575, line: 28, baseType: !124, size: 32, offset: 32)
!580 = !DIDerivedType(tag: DW_TAG_member, name: "ack_seq", scope: !574, file: !575, line: 29, baseType: !124, size: 32, offset: 64)
!581 = !DIDerivedType(tag: DW_TAG_member, name: "res1", scope: !574, file: !575, line: 31, baseType: !96, size: 4, offset: 96, flags: DIFlagBitField, extraData: i64 96)
!582 = !DIDerivedType(tag: DW_TAG_member, name: "doff", scope: !574, file: !575, line: 32, baseType: !96, size: 4, offset: 100, flags: DIFlagBitField, extraData: i64 96)
!583 = !DIDerivedType(tag: DW_TAG_member, name: "fin", scope: !574, file: !575, line: 33, baseType: !96, size: 1, offset: 104, flags: DIFlagBitField, extraData: i64 96)
!584 = !DIDerivedType(tag: DW_TAG_member, name: "syn", scope: !574, file: !575, line: 34, baseType: !96, size: 1, offset: 105, flags: DIFlagBitField, extraData: i64 96)
!585 = !DIDerivedType(tag: DW_TAG_member, name: "rst", scope: !574, file: !575, line: 35, baseType: !96, size: 1, offset: 106, flags: DIFlagBitField, extraData: i64 96)
!586 = !DIDerivedType(tag: DW_TAG_member, name: "psh", scope: !574, file: !575, line: 36, baseType: !96, size: 1, offset: 107, flags: DIFlagBitField, extraData: i64 96)
!587 = !DIDerivedType(tag: DW_TAG_member, name: "ack", scope: !574, file: !575, line: 37, baseType: !96, size: 1, offset: 108, flags: DIFlagBitField, extraData: i64 96)
!588 = !DIDerivedType(tag: DW_TAG_member, name: "urg", scope: !574, file: !575, line: 38, baseType: !96, size: 1, offset: 109, flags: DIFlagBitField, extraData: i64 96)
!589 = !DIDerivedType(tag: DW_TAG_member, name: "ece", scope: !574, file: !575, line: 39, baseType: !96, size: 1, offset: 110, flags: DIFlagBitField, extraData: i64 96)
!590 = !DIDerivedType(tag: DW_TAG_member, name: "cwr", scope: !574, file: !575, line: 40, baseType: !96, size: 1, offset: 111, flags: DIFlagBitField, extraData: i64 96)
!591 = !DIDerivedType(tag: DW_TAG_member, name: "window", scope: !574, file: !575, line: 55, baseType: !118, size: 16, offset: 112)
!592 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !574, file: !575, line: 56, baseType: !465, size: 16, offset: 128)
!593 = !DIDerivedType(tag: DW_TAG_member, name: "urg_ptr", scope: !574, file: !575, line: 57, baseType: !118, size: 16, offset: 144)
!594 = !DIDerivedType(tag: DW_TAG_member, name: "time", scope: !446, file: !3, line: 72, baseType: !159, size: 64, offset: 128)
!595 = !DIDerivedType(tag: DW_TAG_member, name: "payload", scope: !446, file: !3, line: 73, baseType: !104, size: 32, offset: 192)
!596 = !DIDerivedType(tag: DW_TAG_member, name: "pid", scope: !446, file: !3, line: 74, baseType: !141, size: 384, offset: 224)
!597 = !DIDerivedType(tag: DW_TAG_member, name: "reply_pid", scope: !446, file: !3, line: 75, baseType: !141, size: 384, offset: 608)
!598 = !DIDerivedType(tag: DW_TAG_member, name: "pid_valid", scope: !446, file: !3, line: 76, baseType: !186, size: 8, offset: 992)
!599 = !DIDerivedType(tag: DW_TAG_member, name: "reply_pid_valid", scope: !446, file: !3, line: 77, baseType: !186, size: 8, offset: 1000)
!600 = !DIDerivedType(tag: DW_TAG_member, name: "event_type", scope: !446, file: !3, line: 78, baseType: !24, size: 8, offset: 1008)
!601 = !DIDerivedType(tag: DW_TAG_member, name: "event_reason", scope: !446, file: !3, line: 79, baseType: !14, size: 8, offset: 1016)
!602 = !DILocalVariable(name: "flow", scope: !438, file: !3, line: 695, type: !174)
!603 = !DILocalVariable(name: "rev_flow", scope: !438, file: !3, line: 695, type: !174)
!604 = !DILocalVariable(name: "new_flow", scope: !438, file: !3, line: 696, type: !186)
!605 = !DILocation(line: 692, column: 25, scope: !438)
!606 = !DILocation(line: 692, column: 54, scope: !438)
!607 = !DILocation(line: 694, column: 2, scope: !438)
!608 = !DILocation(line: 694, column: 21, scope: !438)
!609 = !DILocation(line: 695, column: 2, scope: !438)
!610 = !DILocation(line: 695, column: 21, scope: !438)
!611 = !DILocation(line: 695, column: 28, scope: !438)
!612 = !DILocation(line: 696, column: 2, scope: !438)
!613 = !DILocation(line: 696, column: 7, scope: !438)
!614 = !DILocation(line: 698, column: 31, scope: !615)
!615 = distinct !DILexicalBlock(scope: !438, file: !3, line: 698, column: 7)
!616 = !DILocation(line: 698, column: 7, scope: !615)
!617 = !DILocation(line: 698, column: 46, scope: !615)
!618 = !DILocation(line: 698, column: 7, scope: !438)
!619 = !DILocation(line: 699, column: 3, scope: !615)
!620 = !DILocation(line: 701, column: 21, scope: !438)
!621 = !DILocation(line: 701, column: 9, scope: !438)
!622 = !DILocation(line: 701, column: 7, scope: !438)
!623 = !DILocation(line: 702, column: 25, scope: !438)
!624 = !DILocation(line: 702, column: 31, scope: !438)
!625 = !DILocation(line: 702, column: 36, scope: !438)
!626 = !DILocation(line: 702, column: 51, scope: !438)
!627 = !{!418, !418, i64 0}
!628 = !{i8 0, i8 2}
!629 = !{}
!630 = !DILocation(line: 702, column: 2, scope: !438)
!631 = !DILocation(line: 704, column: 29, scope: !438)
!632 = !DILocation(line: 704, column: 13, scope: !438)
!633 = !DILocation(line: 704, column: 11, scope: !438)
!634 = !DILocation(line: 705, column: 21, scope: !438)
!635 = !DILocation(line: 705, column: 31, scope: !438)
!636 = !DILocation(line: 705, column: 36, scope: !438)
!637 = !DILocation(line: 705, column: 2, scope: !438)
!638 = !DILocation(line: 707, column: 22, scope: !438)
!639 = !DILocation(line: 707, column: 36, scope: !438)
!640 = !DILocation(line: 707, column: 42, scope: !438)
!641 = !DILocation(line: 707, column: 2, scope: !438)
!642 = !DILocation(line: 709, column: 1, scope: !438)
!643 = distinct !DISubprogram(name: "pping_tc_ingress", scope: !3, file: !3, line: 732, type: !292, scopeLine: 733, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !644)
!644 = !{!645, !646}
!645 = !DILocalVariable(name: "skb", arg: 1, scope: !643, file: !3, line: 732, type: !294)
!646 = !DILocalVariable(name: "pctx", scope: !643, file: !3, line: 734, type: !387)
!647 = !DILocation(line: 732, column: 40, scope: !643)
!648 = !DILocation(line: 734, column: 2, scope: !643)
!649 = !DILocation(line: 734, column: 25, scope: !643)
!650 = !DILocation(line: 734, column: 32, scope: !643)
!651 = !DILocation(line: 735, column: 25, scope: !643)
!652 = !DILocation(line: 735, column: 30, scope: !643)
!653 = !DILocation(line: 735, column: 19, scope: !643)
!654 = !DILocation(line: 735, column: 11, scope: !643)
!655 = !DILocation(line: 736, column: 29, scope: !643)
!656 = !DILocation(line: 736, column: 34, scope: !643)
!657 = !DILocation(line: 736, column: 23, scope: !643)
!658 = !DILocation(line: 736, column: 15, scope: !643)
!659 = !DILocation(line: 738, column: 9, scope: !643)
!660 = !DILocation(line: 738, column: 23, scope: !643)
!661 = !DILocation(line: 737, column: 14, scope: !643)
!662 = !DILocation(line: 737, column: 19, scope: !643)
!663 = !DILocation(line: 739, column: 22, scope: !643)
!664 = !DILocation(line: 739, column: 27, scope: !643)
!665 = !{!410, !411, i64 36}
!666 = !DILocation(line: 743, column: 8, scope: !643)
!667 = !DILocation(line: 743, column: 2, scope: !643)
!668 = !DILocation(line: 746, column: 1, scope: !643)
!669 = !DILocation(line: 745, column: 2, scope: !643)
!670 = distinct !DISubprogram(name: "pping_xdp_ingress", scope: !3, file: !3, line: 750, type: !671, scopeLine: 751, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !682)
!671 = !DISubroutineType(types: !672)
!672 = !{!136, !673}
!673 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !674, size: 64)
!674 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !6, line: 4374, size: 192, elements: !675)
!675 = !{!676, !677, !678, !679, !680, !681}
!676 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !674, file: !6, line: 4375, baseType: !104, size: 32)
!677 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !674, file: !6, line: 4376, baseType: !104, size: 32, offset: 32)
!678 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !674, file: !6, line: 4377, baseType: !104, size: 32, offset: 64)
!679 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !674, file: !6, line: 4379, baseType: !104, size: 32, offset: 96)
!680 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !674, file: !6, line: 4380, baseType: !104, size: 32, offset: 128)
!681 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !674, file: !6, line: 4382, baseType: !104, size: 32, offset: 160)
!682 = !{!683, !684}
!683 = !DILocalVariable(name: "ctx", arg: 1, scope: !670, file: !3, line: 750, type: !673)
!684 = !DILocalVariable(name: "pctx", scope: !670, file: !3, line: 752, type: !387)
!685 = !DILocation(line: 750, column: 38, scope: !670)
!686 = !DILocation(line: 752, column: 2, scope: !670)
!687 = !DILocation(line: 752, column: 25, scope: !670)
!688 = !DILocation(line: 752, column: 32, scope: !670)
!689 = !DILocation(line: 753, column: 25, scope: !670)
!690 = !DILocation(line: 753, column: 30, scope: !670)
!691 = !{!692, !411, i64 0}
!692 = !{!"xdp_md", !411, i64 0, !411, i64 4, !411, i64 8, !411, i64 12, !411, i64 16, !411, i64 20}
!693 = !DILocation(line: 753, column: 19, scope: !670)
!694 = !DILocation(line: 753, column: 11, scope: !670)
!695 = !DILocation(line: 754, column: 29, scope: !670)
!696 = !DILocation(line: 754, column: 34, scope: !670)
!697 = !{!692, !411, i64 4}
!698 = !DILocation(line: 754, column: 23, scope: !670)
!699 = !DILocation(line: 754, column: 15, scope: !670)
!700 = !DILocation(line: 756, column: 9, scope: !670)
!701 = !DILocation(line: 756, column: 23, scope: !670)
!702 = !DILocation(line: 755, column: 19, scope: !670)
!703 = !DILocation(line: 755, column: 35, scope: !670)
!704 = !DILocation(line: 755, column: 28, scope: !670)
!705 = !DILocation(line: 755, column: 14, scope: !670)
!706 = !DILocation(line: 757, column: 22, scope: !670)
!707 = !DILocation(line: 757, column: 27, scope: !670)
!708 = !{!692, !411, i64 12}
!709 = !DILocation(line: 761, column: 8, scope: !670)
!710 = !DILocation(line: 761, column: 2, scope: !670)
!711 = !DILocation(line: 764, column: 1, scope: !670)
!712 = !DILocation(line: 763, column: 2, scope: !670)
!713 = distinct !DISubprogram(name: "parse_packet_identifier", scope: !3, file: !3, line: 318, type: !714, scopeLine: 320, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !717)
!714 = !DISubroutineType(types: !715)
!715 = !{!136, !441, !716}
!716 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !446, size: 64)
!717 = !{!718, !719, !720, !721, !722}
!718 = !DILocalVariable(name: "pctx", arg: 1, scope: !713, file: !3, line: 318, type: !441)
!719 = !DILocalVariable(name: "p_info", arg: 2, scope: !713, file: !3, line: 319, type: !716)
!720 = !DILocalVariable(name: "proto", scope: !713, file: !3, line: 321, type: !136)
!721 = !DILocalVariable(name: "err", scope: !713, file: !3, line: 321, type: !136)
!722 = !DILocalVariable(name: "eth", scope: !713, file: !3, line: 322, type: !723)
!723 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !724, size: 64)
!724 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !725, line: 168, size: 112, elements: !726)
!725 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "ab0320da726e75d904811ce344979934")
!726 = !{!727, !729, !730}
!727 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !724, file: !725, line: 169, baseType: !728, size: 48)
!728 = !DICompositeType(tag: DW_TAG_array_type, baseType: !16, size: 48, elements: !277)
!729 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !724, file: !725, line: 170, baseType: !728, size: 48, offset: 48)
!730 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !724, file: !725, line: 171, baseType: !118, size: 16, offset: 96)
!731 = !DILocation(line: 318, column: 60, scope: !713)
!732 = !DILocation(line: 319, column: 28, scope: !713)
!733 = !DILocation(line: 321, column: 2, scope: !713)
!734 = !DILocation(line: 321, column: 6, scope: !713)
!735 = !DILocation(line: 321, column: 13, scope: !713)
!736 = !DILocation(line: 322, column: 2, scope: !713)
!737 = !DILocation(line: 322, column: 17, scope: !713)
!738 = !DILocation(line: 324, column: 17, scope: !713)
!739 = !DILocation(line: 324, column: 2, scope: !713)
!740 = !DILocation(line: 324, column: 10, scope: !713)
!741 = !DILocation(line: 324, column: 15, scope: !713)
!742 = !{!743, !412, i64 16}
!743 = !{!"packet_info", !401, i64 0, !401, i64 8, !412, i64 16, !411, i64 24, !744, i64 28, !744, i64 76, !418, i64 124, !418, i64 125, !401, i64 126, !401, i64 127}
!744 = !{!"packet_id", !745, i64 0, !411, i64 44}
!745 = !{!"network_tuple", !746, i64 0, !746, i64 20, !748, i64 40, !401, i64 42, !401, i64 43}
!746 = !{!"flow_address", !747, i64 0, !748, i64 16, !748, i64 18}
!747 = !{!"in6_addr", !401, i64 0}
!748 = !{!"short", !401, i64 0}
!749 = !DILocation(line: 325, column: 24, scope: !713)
!750 = !DILocation(line: 325, column: 30, scope: !713)
!751 = !DILocation(line: 325, column: 34, scope: !713)
!752 = !DILocation(line: 325, column: 40, scope: !713)
!753 = !DILocation(line: 325, column: 10, scope: !713)
!754 = !DILocation(line: 325, column: 8, scope: !713)
!755 = !{!411, !411, i64 0}
!756 = !DILocation(line: 328, column: 6, scope: !757)
!757 = distinct !DILexicalBlock(scope: !713, file: !3, line: 328, column: 6)
!758 = !DILocation(line: 328, column: 12, scope: !757)
!759 = !DILocation(line: 328, column: 6, scope: !713)
!760 = !DILocation(line: 329, column: 3, scope: !761)
!761 = distinct !DILexicalBlock(scope: !757, file: !3, line: 328, column: 36)
!762 = !DILocation(line: 329, column: 11, scope: !761)
!763 = !DILocation(line: 329, column: 15, scope: !761)
!764 = !DILocation(line: 329, column: 20, scope: !761)
!765 = !DILocation(line: 329, column: 24, scope: !761)
!766 = !{!743, !401, i64 70}
!767 = !DILocation(line: 331, column: 17, scope: !761)
!768 = !DILocation(line: 331, column: 23, scope: !761)
!769 = !DILocation(line: 331, column: 27, scope: !761)
!770 = !DILocation(line: 331, column: 33, scope: !761)
!771 = !DILocation(line: 331, column: 44, scope: !761)
!772 = !DILocation(line: 331, column: 52, scope: !761)
!773 = !DILocation(line: 331, column: 4, scope: !761)
!774 = !DILocation(line: 330, column: 3, scope: !761)
!775 = !DILocation(line: 330, column: 11, scope: !761)
!776 = !DILocation(line: 330, column: 15, scope: !761)
!777 = !DILocation(line: 330, column: 20, scope: !761)
!778 = !DILocation(line: 330, column: 26, scope: !761)
!779 = !{!743, !748, i64 68}
!780 = !DILocation(line: 332, column: 2, scope: !761)
!781 = !DILocation(line: 332, column: 13, scope: !782)
!782 = distinct !DILexicalBlock(scope: !757, file: !3, line: 332, column: 13)
!783 = !DILocation(line: 332, column: 19, scope: !782)
!784 = !DILocation(line: 332, column: 13, scope: !757)
!785 = !DILocation(line: 333, column: 3, scope: !786)
!786 = distinct !DILexicalBlock(scope: !782, file: !3, line: 332, column: 45)
!787 = !DILocation(line: 333, column: 11, scope: !786)
!788 = !DILocation(line: 333, column: 15, scope: !786)
!789 = !DILocation(line: 333, column: 20, scope: !786)
!790 = !DILocation(line: 333, column: 24, scope: !786)
!791 = !DILocation(line: 335, column: 18, scope: !786)
!792 = !DILocation(line: 335, column: 24, scope: !786)
!793 = !DILocation(line: 335, column: 28, scope: !786)
!794 = !DILocation(line: 335, column: 34, scope: !786)
!795 = !DILocation(line: 335, column: 45, scope: !786)
!796 = !DILocation(line: 335, column: 53, scope: !786)
!797 = !DILocation(line: 335, column: 4, scope: !786)
!798 = !DILocation(line: 334, column: 3, scope: !786)
!799 = !DILocation(line: 334, column: 11, scope: !786)
!800 = !DILocation(line: 334, column: 15, scope: !786)
!801 = !DILocation(line: 334, column: 20, scope: !786)
!802 = !DILocation(line: 334, column: 26, scope: !786)
!803 = !DILocation(line: 336, column: 2, scope: !786)
!804 = !DILocation(line: 337, column: 3, scope: !805)
!805 = distinct !DILexicalBlock(scope: !782, file: !3, line: 336, column: 9)
!806 = !DILocation(line: 341, column: 13, scope: !807)
!807 = distinct !DILexicalBlock(scope: !713, file: !3, line: 341, column: 6)
!808 = !{!809, !418, i64 17}
!809 = !{!"bpf_config", !412, i64 0, !412, i64 8, !418, i64 16, !418, i64 17, !418, i64 18, !418, i64 19, !411, i64 20}
!810 = !DILocation(line: 341, column: 23, scope: !807)
!811 = !DILocation(line: 341, column: 26, scope: !807)
!812 = !DILocation(line: 341, column: 34, scope: !807)
!813 = !DILocation(line: 341, column: 38, scope: !807)
!814 = !DILocation(line: 341, column: 43, scope: !807)
!815 = !DILocation(line: 341, column: 49, scope: !807)
!816 = !DILocation(line: 341, column: 6, scope: !713)
!817 = !DILocation(line: 342, column: 30, scope: !807)
!818 = !DILocation(line: 342, column: 36, scope: !807)
!819 = !DILocation(line: 342, column: 9, scope: !807)
!820 = !DILocation(line: 342, column: 7, scope: !807)
!821 = !DILocation(line: 342, column: 3, scope: !807)
!822 = !DILocation(line: 343, column: 18, scope: !823)
!823 = distinct !DILexicalBlock(scope: !807, file: !3, line: 343, column: 11)
!824 = !{!809, !418, i64 18}
!825 = !DILocation(line: 343, column: 29, scope: !823)
!826 = !DILocation(line: 344, column: 4, scope: !823)
!827 = !DILocation(line: 344, column: 12, scope: !823)
!828 = !DILocation(line: 344, column: 16, scope: !823)
!829 = !DILocation(line: 344, column: 21, scope: !823)
!830 = !DILocation(line: 344, column: 27, scope: !823)
!831 = !DILocation(line: 344, column: 45, scope: !823)
!832 = !DILocation(line: 345, column: 4, scope: !823)
!833 = !DILocation(line: 345, column: 12, scope: !823)
!834 = !DILocation(line: 345, column: 16, scope: !823)
!835 = !DILocation(line: 345, column: 21, scope: !823)
!836 = !DILocation(line: 345, column: 25, scope: !823)
!837 = !DILocation(line: 343, column: 11, scope: !807)
!838 = !DILocation(line: 346, column: 32, scope: !823)
!839 = !DILocation(line: 346, column: 38, scope: !823)
!840 = !DILocation(line: 346, column: 9, scope: !823)
!841 = !DILocation(line: 346, column: 7, scope: !823)
!842 = !DILocation(line: 346, column: 3, scope: !823)
!843 = !DILocation(line: 347, column: 18, scope: !844)
!844 = distinct !DILexicalBlock(scope: !823, file: !3, line: 347, column: 11)
!845 = !DILocation(line: 347, column: 29, scope: !844)
!846 = !DILocation(line: 347, column: 32, scope: !844)
!847 = !DILocation(line: 347, column: 40, scope: !844)
!848 = !DILocation(line: 347, column: 44, scope: !844)
!849 = !DILocation(line: 347, column: 49, scope: !844)
!850 = !DILocation(line: 347, column: 55, scope: !844)
!851 = !DILocation(line: 347, column: 71, scope: !844)
!852 = !DILocation(line: 348, column: 4, scope: !844)
!853 = !DILocation(line: 348, column: 12, scope: !844)
!854 = !DILocation(line: 348, column: 16, scope: !844)
!855 = !DILocation(line: 348, column: 21, scope: !844)
!856 = !DILocation(line: 348, column: 25, scope: !844)
!857 = !DILocation(line: 347, column: 11, scope: !823)
!858 = !DILocation(line: 349, column: 31, scope: !844)
!859 = !DILocation(line: 349, column: 37, scope: !844)
!860 = !DILocation(line: 349, column: 9, scope: !844)
!861 = !DILocation(line: 349, column: 7, scope: !844)
!862 = !DILocation(line: 349, column: 3, scope: !844)
!863 = !DILocation(line: 351, column: 3, scope: !844)
!864 = !DILocation(line: 352, column: 6, scope: !865)
!865 = distinct !DILexicalBlock(scope: !713, file: !3, line: 352, column: 6)
!866 = !DILocation(line: 352, column: 6, scope: !713)
!867 = !DILocation(line: 353, column: 3, scope: !865)
!868 = !DILocation(line: 356, column: 6, scope: !869)
!869 = distinct !DILexicalBlock(scope: !713, file: !3, line: 356, column: 6)
!870 = !DILocation(line: 356, column: 14, scope: !869)
!871 = !DILocation(line: 356, column: 18, scope: !869)
!872 = !DILocation(line: 356, column: 23, scope: !869)
!873 = !DILocation(line: 356, column: 27, scope: !869)
!874 = !DILocation(line: 356, column: 6, scope: !713)
!875 = !DILocation(line: 357, column: 21, scope: !876)
!876 = distinct !DILexicalBlock(scope: !869, file: !3, line: 356, column: 39)
!877 = !DILocation(line: 357, column: 29, scope: !876)
!878 = !DILocation(line: 357, column: 33, scope: !876)
!879 = !DILocation(line: 357, column: 38, scope: !876)
!880 = !DILocation(line: 357, column: 44, scope: !876)
!881 = !DILocation(line: 358, column: 6, scope: !876)
!882 = !DILocation(line: 358, column: 14, scope: !876)
!883 = !{!401, !401, i64 0}
!884 = !DILocation(line: 358, column: 19, scope: !876)
!885 = !DILocation(line: 357, column: 3, scope: !876)
!886 = !DILocation(line: 359, column: 21, scope: !876)
!887 = !DILocation(line: 359, column: 29, scope: !876)
!888 = !DILocation(line: 359, column: 33, scope: !876)
!889 = !DILocation(line: 359, column: 38, scope: !876)
!890 = !DILocation(line: 359, column: 44, scope: !876)
!891 = !DILocation(line: 360, column: 6, scope: !876)
!892 = !DILocation(line: 360, column: 14, scope: !876)
!893 = !DILocation(line: 360, column: 19, scope: !876)
!894 = !DILocation(line: 359, column: 3, scope: !876)
!895 = !DILocation(line: 361, column: 2, scope: !876)
!896 = !DILocation(line: 362, column: 3, scope: !897)
!897 = distinct !DILexicalBlock(scope: !869, file: !3, line: 361, column: 9)
!898 = !DILocation(line: 362, column: 11, scope: !897)
!899 = !DILocation(line: 362, column: 15, scope: !897)
!900 = !DILocation(line: 362, column: 20, scope: !897)
!901 = !DILocation(line: 362, column: 26, scope: !897)
!902 = !DILocation(line: 362, column: 31, scope: !897)
!903 = !DILocation(line: 362, column: 39, scope: !897)
!904 = !DILocation(line: 362, column: 45, scope: !897)
!905 = !{i64 0, i64 16, !883, i64 0, i64 16, !883, i64 0, i64 16, !883}
!906 = !DILocation(line: 363, column: 3, scope: !897)
!907 = !DILocation(line: 363, column: 11, scope: !897)
!908 = !DILocation(line: 363, column: 15, scope: !897)
!909 = !DILocation(line: 363, column: 20, scope: !897)
!910 = !DILocation(line: 363, column: 26, scope: !897)
!911 = !DILocation(line: 363, column: 31, scope: !897)
!912 = !DILocation(line: 363, column: 39, scope: !897)
!913 = !DILocation(line: 363, column: 45, scope: !897)
!914 = !DILocation(line: 366, column: 16, scope: !713)
!915 = !DILocation(line: 366, column: 24, scope: !713)
!916 = !DILocation(line: 366, column: 34, scope: !713)
!917 = !DILocation(line: 366, column: 41, scope: !713)
!918 = !DILocation(line: 366, column: 49, scope: !713)
!919 = !DILocation(line: 366, column: 53, scope: !713)
!920 = !DILocation(line: 366, column: 2, scope: !713)
!921 = !DILocation(line: 367, column: 42, scope: !713)
!922 = !DILocation(line: 367, column: 20, scope: !713)
!923 = !DILocation(line: 367, column: 2, scope: !713)
!924 = !DILocation(line: 367, column: 10, scope: !713)
!925 = !DILocation(line: 367, column: 18, scope: !713)
!926 = !{!743, !411, i64 24}
!927 = !DILocation(line: 369, column: 2, scope: !713)
!928 = !DILocation(line: 370, column: 1, scope: !713)
!929 = distinct !DISubprogram(name: "update_flow", scope: !3, file: !3, line: 496, type: !930, scopeLine: 498, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !933)
!930 = !DISubroutineType(types: !931)
!931 = !{!174, !94, !716, !932}
!932 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !186, size: 64)
!933 = !{!934, !935, !936, !937}
!934 = !DILocalVariable(name: "ctx", arg: 1, scope: !929, file: !3, line: 496, type: !94)
!935 = !DILocalVariable(name: "p_info", arg: 2, scope: !929, file: !3, line: 496, type: !716)
!936 = !DILocalVariable(name: "new_flow", arg: 3, scope: !929, file: !3, line: 497, type: !932)
!937 = !DILocalVariable(name: "f_state", scope: !929, file: !3, line: 499, type: !174)
!938 = !DILocation(line: 496, column: 45, scope: !929)
!939 = !DILocation(line: 496, column: 70, scope: !929)
!940 = !DILocation(line: 497, column: 17, scope: !929)
!941 = !DILocation(line: 499, column: 2, scope: !929)
!942 = !DILocation(line: 499, column: 21, scope: !929)
!943 = !DILocation(line: 500, column: 3, scope: !929)
!944 = !DILocation(line: 500, column: 12, scope: !929)
!945 = !DILocation(line: 502, column: 12, scope: !929)
!946 = !DILocation(line: 502, column: 46, scope: !929)
!947 = !DILocation(line: 502, column: 54, scope: !929)
!948 = !DILocation(line: 502, column: 58, scope: !929)
!949 = !DILocation(line: 502, column: 10, scope: !929)
!950 = !DILocation(line: 505, column: 7, scope: !951)
!951 = distinct !DILexicalBlock(scope: !929, file: !3, line: 505, column: 6)
!952 = !DILocation(line: 505, column: 15, scope: !951)
!953 = !DILocation(line: 505, column: 18, scope: !951)
!954 = !DILocation(line: 505, column: 26, scope: !951)
!955 = !{!743, !418, i64 124}
!956 = !DILocation(line: 505, column: 36, scope: !951)
!957 = !DILocation(line: 506, column: 8, scope: !951)
!958 = !DILocation(line: 506, column: 16, scope: !951)
!959 = !{!743, !401, i64 126}
!960 = !DILocation(line: 506, column: 27, scope: !951)
!961 = !DILocation(line: 506, column: 49, scope: !951)
!962 = !DILocation(line: 507, column: 8, scope: !951)
!963 = !DILocation(line: 507, column: 16, scope: !951)
!964 = !DILocation(line: 507, column: 27, scope: !951)
!965 = !DILocation(line: 505, column: 6, scope: !929)
!966 = !DILocation(line: 508, column: 4, scope: !967)
!967 = distinct !DILexicalBlock(scope: !951, file: !3, line: 507, column: 56)
!968 = !DILocation(line: 508, column: 13, scope: !967)
!969 = !DILocation(line: 509, column: 25, scope: !967)
!970 = !DILocation(line: 509, column: 30, scope: !967)
!971 = !DILocation(line: 509, column: 13, scope: !967)
!972 = !DILocation(line: 509, column: 11, scope: !967)
!973 = !DILocation(line: 510, column: 2, scope: !967)
!974 = !DILocation(line: 512, column: 7, scope: !975)
!975 = distinct !DILexicalBlock(scope: !929, file: !3, line: 512, column: 6)
!976 = !DILocation(line: 512, column: 6, scope: !929)
!977 = !DILocation(line: 513, column: 3, scope: !975)
!978 = !DILocation(line: 516, column: 2, scope: !929)
!979 = !DILocation(line: 516, column: 11, scope: !929)
!980 = !DILocation(line: 516, column: 20, scope: !929)
!981 = !{!982, !412, i64 24}
!982 = !{!"flow_state", !412, i64 0, !412, i64 8, !412, i64 16, !412, i64 24, !412, i64 32, !412, i64 40, !412, i64 48, !411, i64 56, !418, i64 60, !401, i64 61, !748, i64 62}
!983 = !DILocation(line: 517, column: 25, scope: !929)
!984 = !DILocation(line: 517, column: 33, scope: !929)
!985 = !DILocation(line: 517, column: 2, scope: !929)
!986 = !DILocation(line: 517, column: 11, scope: !929)
!987 = !DILocation(line: 517, column: 22, scope: !929)
!988 = !{!982, !412, i64 32}
!989 = !DILocation(line: 519, column: 9, scope: !929)
!990 = !DILocation(line: 519, column: 2, scope: !929)
!991 = !DILocation(line: 520, column: 1, scope: !929)
!992 = distinct !DISubprogram(name: "pping_timestamp_packet", scope: !3, file: !3, line: 615, type: !993, scopeLine: 618, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !995)
!993 = !DISubroutineType(types: !994)
!994 = !{null, !174, !94, !441, !716, !186}
!995 = !{!996, !997, !998, !999, !1000}
!996 = !DILocalVariable(name: "f_state", arg: 1, scope: !992, file: !3, line: 615, type: !174)
!997 = !DILocalVariable(name: "ctx", arg: 2, scope: !992, file: !3, line: 615, type: !94)
!998 = !DILocalVariable(name: "pctx", arg: 3, scope: !992, file: !3, line: 616, type: !441)
!999 = !DILocalVariable(name: "p_info", arg: 4, scope: !992, file: !3, line: 617, type: !716)
!1000 = !DILocalVariable(name: "new_flow", arg: 5, scope: !992, file: !3, line: 617, type: !186)
!1001 = !DILocation(line: 615, column: 55, scope: !992)
!1002 = !DILocation(line: 615, column: 70, scope: !992)
!1003 = !DILocation(line: 616, column: 32, scope: !992)
!1004 = !DILocation(line: 617, column: 28, scope: !992)
!1005 = !DILocation(line: 617, column: 41, scope: !992)
!1006 = !DILocation(line: 619, column: 7, scope: !1007)
!1007 = distinct !DILexicalBlock(scope: !992, file: !3, line: 619, column: 6)
!1008 = !DILocation(line: 619, column: 15, scope: !1007)
!1009 = !DILocation(line: 619, column: 19, scope: !1007)
!1010 = !DILocation(line: 619, column: 27, scope: !1007)
!1011 = !DILocation(line: 619, column: 6, scope: !992)
!1012 = !DILocation(line: 620, column: 3, scope: !1007)
!1013 = !DILocation(line: 622, column: 13, scope: !1014)
!1014 = distinct !DILexicalBlock(scope: !992, file: !3, line: 622, column: 6)
!1015 = !{!809, !418, i64 19}
!1016 = !DILocation(line: 622, column: 23, scope: !1014)
!1017 = !DILocation(line: 622, column: 27, scope: !1014)
!1018 = !DILocation(line: 622, column: 33, scope: !1014)
!1019 = !DILocation(line: 622, column: 43, scope: !1014)
!1020 = !DILocation(line: 623, column: 23, scope: !1014)
!1021 = !DILocation(line: 623, column: 31, scope: !1014)
!1022 = !DILocation(line: 623, column: 36, scope: !1014)
!1023 = !DILocation(line: 623, column: 6, scope: !1014)
!1024 = !DILocation(line: 622, column: 6, scope: !992)
!1025 = !DILocation(line: 624, column: 3, scope: !1014)
!1026 = !DILocation(line: 627, column: 7, scope: !1027)
!1027 = distinct !DILexicalBlock(scope: !992, file: !3, line: 627, column: 6)
!1028 = !DILocation(line: 627, column: 16, scope: !1027)
!1029 = !DILocation(line: 627, column: 19, scope: !1027)
!1030 = !DILocation(line: 627, column: 28, scope: !1027)
!1031 = !{!982, !411, i64 56}
!1032 = !DILocation(line: 627, column: 39, scope: !1027)
!1033 = !DILocation(line: 627, column: 47, scope: !1027)
!1034 = !DILocation(line: 627, column: 51, scope: !1027)
!1035 = !{!743, !411, i64 72}
!1036 = !DILocation(line: 627, column: 36, scope: !1027)
!1037 = !DILocation(line: 627, column: 6, scope: !992)
!1038 = !DILocation(line: 628, column: 3, scope: !1027)
!1039 = !DILocation(line: 629, column: 21, scope: !992)
!1040 = !DILocation(line: 629, column: 29, scope: !992)
!1041 = !DILocation(line: 629, column: 33, scope: !992)
!1042 = !DILocation(line: 629, column: 2, scope: !992)
!1043 = !DILocation(line: 629, column: 11, scope: !992)
!1044 = !DILocation(line: 629, column: 19, scope: !992)
!1045 = !DILocation(line: 632, column: 7, scope: !1046)
!1046 = distinct !DILexicalBlock(scope: !992, file: !3, line: 632, column: 6)
!1047 = !DILocation(line: 632, column: 16, scope: !1046)
!1048 = !DILocation(line: 633, column: 22, scope: !1046)
!1049 = !DILocation(line: 633, column: 30, scope: !1046)
!1050 = !DILocation(line: 633, column: 36, scope: !1046)
!1051 = !DILocation(line: 633, column: 45, scope: !1046)
!1052 = !{!982, !412, i64 16}
!1053 = !DILocation(line: 634, column: 15, scope: !1046)
!1054 = !{!809, !418, i64 16}
!1055 = !DILocation(line: 634, column: 8, scope: !1046)
!1056 = !DILocation(line: 634, column: 26, scope: !1046)
!1057 = !DILocation(line: 634, column: 35, scope: !1046)
!1058 = !{!982, !412, i64 8}
!1059 = !DILocation(line: 634, column: 42, scope: !1046)
!1060 = !DILocation(line: 634, column: 51, scope: !1046)
!1061 = !{!982, !412, i64 0}
!1062 = !DILocation(line: 633, column: 6, scope: !1046)
!1063 = !DILocation(line: 632, column: 6, scope: !992)
!1064 = !DILocation(line: 635, column: 3, scope: !1046)
!1065 = !DILocation(line: 643, column: 28, scope: !992)
!1066 = !DILocation(line: 643, column: 36, scope: !992)
!1067 = !DILocation(line: 643, column: 2, scope: !992)
!1068 = !DILocation(line: 643, column: 11, scope: !992)
!1069 = !DILocation(line: 643, column: 26, scope: !992)
!1070 = !DILocation(line: 645, column: 6, scope: !1071)
!1071 = distinct !DILexicalBlock(scope: !992, file: !3, line: 645, column: 6)
!1072 = !DILocation(line: 645, column: 39, scope: !1071)
!1073 = !DILocation(line: 645, column: 47, scope: !1071)
!1074 = !DILocation(line: 645, column: 53, scope: !1071)
!1075 = !DILocation(line: 645, column: 61, scope: !1071)
!1076 = !DILocation(line: 646, column: 18, scope: !1071)
!1077 = !DILocation(line: 645, column: 6, scope: !992)
!1078 = !DILocation(line: 647, column: 23, scope: !1071)
!1079 = !DILocation(line: 647, column: 28, scope: !1071)
!1080 = !DILocation(line: 647, column: 3, scope: !1071)
!1081 = !DILocation(line: 648, column: 1, scope: !992)
!1082 = distinct !DISubprogram(name: "update_rev_flow", scope: !3, file: !3, line: 522, type: !1083, scopeLine: 523, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1085)
!1083 = !DISubroutineType(types: !1084)
!1084 = !{!174, !94, !716}
!1085 = !{!1086, !1087, !1088}
!1086 = !DILocalVariable(name: "ctx", arg: 1, scope: !1082, file: !3, line: 522, type: !94)
!1087 = !DILocalVariable(name: "p_info", arg: 2, scope: !1082, file: !3, line: 522, type: !716)
!1088 = !DILocalVariable(name: "f_state", scope: !1082, file: !3, line: 524, type: !174)
!1089 = !DILocation(line: 522, column: 49, scope: !1082)
!1090 = !DILocation(line: 522, column: 74, scope: !1082)
!1091 = !DILocation(line: 524, column: 2, scope: !1082)
!1092 = !DILocation(line: 524, column: 21, scope: !1082)
!1093 = !DILocation(line: 526, column: 12, scope: !1082)
!1094 = !DILocation(line: 526, column: 46, scope: !1082)
!1095 = !DILocation(line: 526, column: 54, scope: !1082)
!1096 = !DILocation(line: 526, column: 64, scope: !1082)
!1097 = !DILocation(line: 526, column: 10, scope: !1082)
!1098 = !DILocation(line: 527, column: 7, scope: !1099)
!1099 = distinct !DILexicalBlock(scope: !1082, file: !3, line: 527, column: 6)
!1100 = !DILocation(line: 527, column: 6, scope: !1082)
!1101 = !DILocation(line: 528, column: 3, scope: !1099)
!1102 = !DILocation(line: 531, column: 7, scope: !1103)
!1103 = distinct !DILexicalBlock(scope: !1082, file: !3, line: 531, column: 6)
!1104 = !DILocation(line: 531, column: 16, scope: !1103)
!1105 = !{!982, !418, i64 60}
!1106 = !DILocation(line: 531, column: 27, scope: !1103)
!1107 = !DILocation(line: 532, column: 6, scope: !1103)
!1108 = !DILocation(line: 532, column: 14, scope: !1103)
!1109 = !DILocation(line: 532, column: 25, scope: !1103)
!1110 = !DILocation(line: 531, column: 6, scope: !1082)
!1111 = !DILocation(line: 533, column: 3, scope: !1112)
!1112 = distinct !DILexicalBlock(scope: !1103, file: !3, line: 532, column: 53)
!1113 = !DILocation(line: 533, column: 12, scope: !1112)
!1114 = !DILocation(line: 533, column: 23, scope: !1112)
!1115 = !DILocation(line: 534, column: 24, scope: !1112)
!1116 = !DILocation(line: 534, column: 29, scope: !1112)
!1117 = !DILocation(line: 534, column: 37, scope: !1112)
!1118 = !DILocation(line: 534, column: 3, scope: !1112)
!1119 = !DILocation(line: 535, column: 2, scope: !1112)
!1120 = !DILocation(line: 538, column: 2, scope: !1082)
!1121 = !DILocation(line: 538, column: 11, scope: !1082)
!1122 = !DILocation(line: 538, column: 19, scope: !1082)
!1123 = !{!982, !412, i64 40}
!1124 = !DILocation(line: 539, column: 24, scope: !1082)
!1125 = !DILocation(line: 539, column: 32, scope: !1082)
!1126 = !DILocation(line: 539, column: 2, scope: !1082)
!1127 = !DILocation(line: 539, column: 11, scope: !1082)
!1128 = !DILocation(line: 539, column: 21, scope: !1082)
!1129 = !{!982, !412, i64 48}
!1130 = !DILocation(line: 541, column: 9, scope: !1082)
!1131 = !DILocation(line: 541, column: 2, scope: !1082)
!1132 = !DILocation(line: 542, column: 1, scope: !1082)
!1133 = distinct !DISubprogram(name: "pping_match_packet", scope: !3, file: !3, line: 653, type: !1134, scopeLine: 656, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1136)
!1134 = !DISubroutineType(types: !1135)
!1135 = !{null, !174, !94, !441, !716}
!1136 = !{!1137, !1138, !1139, !1140, !1141, !1159}
!1137 = !DILocalVariable(name: "f_state", arg: 1, scope: !1133, file: !3, line: 653, type: !174)
!1138 = !DILocalVariable(name: "ctx", arg: 2, scope: !1133, file: !3, line: 653, type: !94)
!1139 = !DILocalVariable(name: "pctx", arg: 3, scope: !1133, file: !3, line: 654, type: !441)
!1140 = !DILocalVariable(name: "p_info", arg: 4, scope: !1133, file: !3, line: 655, type: !716)
!1141 = !DILocalVariable(name: "re", scope: !1133, file: !3, line: 657, type: !1142)
!1142 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rtt_event", file: !15, line: 114, size: 960, elements: !1143)
!1143 = !{!1144, !1145, !1146, !1147, !1148, !1149, !1150, !1151, !1152, !1153, !1154, !1155}
!1144 = !DIDerivedType(tag: DW_TAG_member, name: "event_type", scope: !1142, file: !15, line: 115, baseType: !159, size: 64)
!1145 = !DIDerivedType(tag: DW_TAG_member, name: "timestamp", scope: !1142, file: !15, line: 116, baseType: !159, size: 64, offset: 64)
!1146 = !DIDerivedType(tag: DW_TAG_member, name: "flow", scope: !1142, file: !15, line: 117, baseType: !144, size: 352, offset: 128)
!1147 = !DIDerivedType(tag: DW_TAG_member, name: "padding", scope: !1142, file: !15, line: 118, baseType: !104, size: 32, offset: 480)
!1148 = !DIDerivedType(tag: DW_TAG_member, name: "rtt", scope: !1142, file: !15, line: 119, baseType: !159, size: 64, offset: 512)
!1149 = !DIDerivedType(tag: DW_TAG_member, name: "min_rtt", scope: !1142, file: !15, line: 120, baseType: !159, size: 64, offset: 576)
!1150 = !DIDerivedType(tag: DW_TAG_member, name: "sent_pkts", scope: !1142, file: !15, line: 121, baseType: !159, size: 64, offset: 640)
!1151 = !DIDerivedType(tag: DW_TAG_member, name: "sent_bytes", scope: !1142, file: !15, line: 122, baseType: !159, size: 64, offset: 704)
!1152 = !DIDerivedType(tag: DW_TAG_member, name: "rec_pkts", scope: !1142, file: !15, line: 123, baseType: !159, size: 64, offset: 768)
!1153 = !DIDerivedType(tag: DW_TAG_member, name: "rec_bytes", scope: !1142, file: !15, line: 124, baseType: !159, size: 64, offset: 832)
!1154 = !DIDerivedType(tag: DW_TAG_member, name: "match_on_egress", scope: !1142, file: !15, line: 125, baseType: !186, size: 8, offset: 896)
!1155 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !1142, file: !15, line: 126, baseType: !1156, size: 56, offset: 904)
!1156 = !DICompositeType(tag: DW_TAG_array_type, baseType: !102, size: 56, elements: !1157)
!1157 = !{!1158}
!1158 = !DISubrange(count: 7)
!1159 = !DILocalVariable(name: "p_ts", scope: !1133, file: !3, line: 658, type: !158)
!1160 = !DILocation(line: 653, column: 51, scope: !1133)
!1161 = !DILocation(line: 653, column: 66, scope: !1133)
!1162 = !DILocation(line: 654, column: 35, scope: !1133)
!1163 = !DILocation(line: 655, column: 31, scope: !1133)
!1164 = !DILocation(line: 657, column: 2, scope: !1133)
!1165 = !DILocation(line: 657, column: 19, scope: !1133)
!1166 = !DILocation(line: 658, column: 2, scope: !1133)
!1167 = !DILocation(line: 658, column: 9, scope: !1133)
!1168 = !DILocation(line: 660, column: 7, scope: !1169)
!1169 = distinct !DILexicalBlock(scope: !1133, file: !3, line: 660, column: 6)
!1170 = !DILocation(line: 660, column: 15, scope: !1169)
!1171 = !DILocation(line: 660, column: 19, scope: !1169)
!1172 = !DILocation(line: 660, column: 27, scope: !1169)
!1173 = !{!743, !418, i64 125}
!1174 = !DILocation(line: 660, column: 6, scope: !1133)
!1175 = !DILocation(line: 661, column: 3, scope: !1169)
!1176 = !DILocation(line: 663, column: 9, scope: !1133)
!1177 = !DILocation(line: 663, column: 42, scope: !1133)
!1178 = !DILocation(line: 663, column: 50, scope: !1133)
!1179 = !DILocation(line: 663, column: 7, scope: !1133)
!1180 = !DILocation(line: 664, column: 7, scope: !1181)
!1181 = distinct !DILexicalBlock(scope: !1133, file: !3, line: 664, column: 6)
!1182 = !DILocation(line: 664, column: 12, scope: !1181)
!1183 = !DILocation(line: 664, column: 15, scope: !1181)
!1184 = !DILocation(line: 664, column: 23, scope: !1181)
!1185 = !DILocation(line: 664, column: 31, scope: !1181)
!1186 = !DILocation(line: 664, column: 30, scope: !1181)
!1187 = !{!412, !412, i64 0}
!1188 = !DILocation(line: 664, column: 28, scope: !1181)
!1189 = !DILocation(line: 664, column: 6, scope: !1133)
!1190 = !DILocation(line: 665, column: 3, scope: !1181)
!1191 = !DILocation(line: 667, column: 11, scope: !1133)
!1192 = !DILocation(line: 667, column: 19, scope: !1133)
!1193 = !DILocation(line: 667, column: 27, scope: !1133)
!1194 = !DILocation(line: 667, column: 26, scope: !1133)
!1195 = !DILocation(line: 667, column: 24, scope: !1133)
!1196 = !DILocation(line: 667, column: 5, scope: !1133)
!1197 = !DILocation(line: 667, column: 9, scope: !1133)
!1198 = !{!1199, !412, i64 64}
!1199 = !{!"rtt_event", !412, i64 0, !412, i64 8, !745, i64 16, !411, i64 60, !412, i64 64, !412, i64 72, !412, i64 80, !412, i64 88, !412, i64 96, !412, i64 104, !418, i64 112, !401, i64 113}
!1200 = !DILocation(line: 669, column: 2, scope: !1133)
!1201 = !DILocation(line: 669, column: 35, scope: !1133)
!1202 = !DILocation(line: 669, column: 43, scope: !1133)
!1203 = !DILocation(line: 671, column: 6, scope: !1204)
!1204 = distinct !DILexicalBlock(scope: !1133, file: !3, line: 671, column: 6)
!1205 = !DILocation(line: 671, column: 15, scope: !1204)
!1206 = !DILocation(line: 671, column: 23, scope: !1204)
!1207 = !DILocation(line: 671, column: 28, scope: !1204)
!1208 = !DILocation(line: 671, column: 34, scope: !1204)
!1209 = !DILocation(line: 671, column: 40, scope: !1204)
!1210 = !DILocation(line: 671, column: 49, scope: !1204)
!1211 = !DILocation(line: 671, column: 38, scope: !1204)
!1212 = !DILocation(line: 671, column: 6, scope: !1133)
!1213 = !DILocation(line: 672, column: 25, scope: !1204)
!1214 = !DILocation(line: 672, column: 3, scope: !1204)
!1215 = !DILocation(line: 672, column: 12, scope: !1204)
!1216 = !DILocation(line: 672, column: 20, scope: !1204)
!1217 = !DILocation(line: 673, column: 33, scope: !1133)
!1218 = !DILocation(line: 673, column: 42, scope: !1133)
!1219 = !DILocation(line: 673, column: 51, scope: !1133)
!1220 = !DILocation(line: 673, column: 18, scope: !1133)
!1221 = !DILocation(line: 673, column: 2, scope: !1133)
!1222 = !DILocation(line: 673, column: 11, scope: !1133)
!1223 = !DILocation(line: 673, column: 16, scope: !1133)
!1224 = !DILocation(line: 676, column: 5, scope: !1133)
!1225 = !DILocation(line: 676, column: 16, scope: !1133)
!1226 = !{!1199, !412, i64 0}
!1227 = !DILocation(line: 677, column: 17, scope: !1133)
!1228 = !DILocation(line: 677, column: 25, scope: !1133)
!1229 = !DILocation(line: 677, column: 5, scope: !1133)
!1230 = !DILocation(line: 677, column: 15, scope: !1133)
!1231 = !{!1199, !412, i64 8}
!1232 = !DILocation(line: 678, column: 15, scope: !1133)
!1233 = !DILocation(line: 678, column: 24, scope: !1133)
!1234 = !DILocation(line: 678, column: 5, scope: !1133)
!1235 = !DILocation(line: 678, column: 13, scope: !1133)
!1236 = !{!1199, !412, i64 72}
!1237 = !DILocation(line: 679, column: 17, scope: !1133)
!1238 = !DILocation(line: 679, column: 26, scope: !1133)
!1239 = !DILocation(line: 679, column: 5, scope: !1133)
!1240 = !DILocation(line: 679, column: 15, scope: !1133)
!1241 = !{!1199, !412, i64 80}
!1242 = !DILocation(line: 680, column: 18, scope: !1133)
!1243 = !DILocation(line: 680, column: 27, scope: !1133)
!1244 = !DILocation(line: 680, column: 5, scope: !1133)
!1245 = !DILocation(line: 680, column: 16, scope: !1133)
!1246 = !{!1199, !412, i64 88}
!1247 = !DILocation(line: 681, column: 16, scope: !1133)
!1248 = !DILocation(line: 681, column: 25, scope: !1133)
!1249 = !DILocation(line: 681, column: 5, scope: !1133)
!1250 = !DILocation(line: 681, column: 14, scope: !1133)
!1251 = !{!1199, !412, i64 96}
!1252 = !DILocation(line: 682, column: 17, scope: !1133)
!1253 = !DILocation(line: 682, column: 26, scope: !1133)
!1254 = !DILocation(line: 682, column: 5, scope: !1133)
!1255 = !DILocation(line: 682, column: 15, scope: !1133)
!1256 = !{!1199, !412, i64 104}
!1257 = !DILocation(line: 683, column: 5, scope: !1133)
!1258 = !DILocation(line: 683, column: 12, scope: !1133)
!1259 = !DILocation(line: 683, column: 20, scope: !1133)
!1260 = !DILocation(line: 683, column: 24, scope: !1133)
!1261 = !{i64 0, i64 16, !883, i64 0, i64 16, !883, i64 0, i64 16, !883, i64 16, i64 2, !1262, i64 18, i64 2, !1262, i64 20, i64 16, !883, i64 20, i64 16, !883, i64 20, i64 16, !883, i64 36, i64 2, !1262, i64 38, i64 2, !1262, i64 40, i64 2, !1262, i64 42, i64 1, !883, i64 43, i64 1, !883}
!1262 = !{!748, !748, i64 0}
!1263 = !DILocation(line: 684, column: 23, scope: !1133)
!1264 = !DILocation(line: 684, column: 29, scope: !1133)
!1265 = !DILocation(line: 684, column: 5, scope: !1133)
!1266 = !DILocation(line: 684, column: 21, scope: !1133)
!1267 = !{!1199, !418, i64 112}
!1268 = !DILocation(line: 685, column: 2, scope: !1133)
!1269 = !DILocation(line: 685, column: 24, scope: !1133)
!1270 = !DILocation(line: 686, column: 1, scope: !1133)
!1271 = distinct !DISubprogram(name: "delete_closed_flows", scope: !3, file: !3, line: 544, type: !1272, scopeLine: 547, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1274)
!1272 = !DISubroutineType(types: !1273)
!1273 = !{null, !94, !716, !174, !174}
!1274 = !{!1275, !1276, !1277, !1278, !1279}
!1275 = !DILocalVariable(name: "ctx", arg: 1, scope: !1271, file: !3, line: 544, type: !94)
!1276 = !DILocalVariable(name: "p_info", arg: 2, scope: !1271, file: !3, line: 544, type: !716)
!1277 = !DILocalVariable(name: "flow", arg: 3, scope: !1271, file: !3, line: 545, type: !174)
!1278 = !DILocalVariable(name: "rev_flow", arg: 4, scope: !1271, file: !3, line: 546, type: !174)
!1279 = !DILocalVariable(name: "has_opened", scope: !1271, file: !3, line: 548, type: !186)
!1280 = !DILocation(line: 544, column: 39, scope: !1271)
!1281 = !DILocation(line: 544, column: 64, scope: !1271)
!1282 = !DILocation(line: 545, column: 24, scope: !1271)
!1283 = !DILocation(line: 546, column: 24, scope: !1271)
!1284 = !DILocation(line: 548, column: 2, scope: !1271)
!1285 = !DILocation(line: 548, column: 7, scope: !1271)
!1286 = !DILocation(line: 551, column: 6, scope: !1287)
!1287 = distinct !DILexicalBlock(scope: !1271, file: !3, line: 551, column: 6)
!1288 = !DILocation(line: 551, column: 11, scope: !1287)
!1289 = !DILocation(line: 551, column: 15, scope: !1287)
!1290 = !DILocation(line: 551, column: 23, scope: !1287)
!1291 = !DILocation(line: 551, column: 34, scope: !1287)
!1292 = !DILocation(line: 551, column: 56, scope: !1287)
!1293 = !DILocation(line: 552, column: 8, scope: !1287)
!1294 = !DILocation(line: 552, column: 16, scope: !1287)
!1295 = !DILocation(line: 552, column: 27, scope: !1287)
!1296 = !DILocation(line: 551, column: 6, scope: !1271)
!1297 = !DILocation(line: 553, column: 16, scope: !1298)
!1298 = distinct !DILexicalBlock(scope: !1287, file: !3, line: 552, column: 56)
!1299 = !DILocation(line: 553, column: 22, scope: !1298)
!1300 = !DILocation(line: 553, column: 14, scope: !1298)
!1301 = !DILocation(line: 554, column: 8, scope: !1302)
!1302 = distinct !DILexicalBlock(scope: !1298, file: !3, line: 554, column: 7)
!1303 = !DILocation(line: 554, column: 42, scope: !1302)
!1304 = !DILocation(line: 554, column: 50, scope: !1302)
!1305 = !DILocation(line: 554, column: 54, scope: !1302)
!1306 = !DILocation(line: 554, column: 60, scope: !1302)
!1307 = !DILocation(line: 555, column: 7, scope: !1302)
!1308 = !DILocation(line: 554, column: 7, scope: !1298)
!1309 = !DILocation(line: 556, column: 20, scope: !1302)
!1310 = !DILocation(line: 556, column: 25, scope: !1302)
!1311 = !DILocation(line: 556, column: 4, scope: !1302)
!1312 = !DILocation(line: 557, column: 2, scope: !1298)
!1313 = !DILocation(line: 560, column: 6, scope: !1314)
!1314 = distinct !DILexicalBlock(scope: !1271, file: !3, line: 560, column: 6)
!1315 = !DILocation(line: 560, column: 15, scope: !1314)
!1316 = !DILocation(line: 560, column: 18, scope: !1314)
!1317 = !DILocation(line: 560, column: 26, scope: !1314)
!1318 = !DILocation(line: 560, column: 37, scope: !1314)
!1319 = !DILocation(line: 560, column: 6, scope: !1271)
!1320 = !DILocation(line: 561, column: 16, scope: !1321)
!1321 = distinct !DILexicalBlock(scope: !1314, file: !3, line: 560, column: 65)
!1322 = !DILocation(line: 561, column: 26, scope: !1321)
!1323 = !DILocation(line: 561, column: 14, scope: !1321)
!1324 = !DILocation(line: 562, column: 8, scope: !1325)
!1325 = distinct !DILexicalBlock(scope: !1321, file: !3, line: 562, column: 7)
!1326 = !DILocation(line: 563, column: 8, scope: !1325)
!1327 = !DILocation(line: 563, column: 16, scope: !1325)
!1328 = !DILocation(line: 563, column: 26, scope: !1325)
!1329 = !DILocation(line: 563, column: 32, scope: !1325)
!1330 = !DILocation(line: 564, column: 7, scope: !1325)
!1331 = !DILocation(line: 562, column: 7, scope: !1321)
!1332 = !DILocation(line: 565, column: 20, scope: !1325)
!1333 = !DILocation(line: 565, column: 25, scope: !1325)
!1334 = !DILocation(line: 565, column: 4, scope: !1325)
!1335 = !DILocation(line: 566, column: 2, scope: !1321)
!1336 = !DILocation(line: 567, column: 1, scope: !1271)
!1337 = distinct !DISubprogram(name: "parse_ethhdr", scope: !393, file: !393, line: 131, type: !1338, scopeLine: 134, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1342)
!1338 = !DISubroutineType(types: !1339)
!1339 = !{!136, !1340, !94, !1341}
!1340 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !392, size: 64)
!1341 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !723, size: 64)
!1342 = !{!1343, !1344, !1345}
!1343 = !DILocalVariable(name: "nh", arg: 1, scope: !1337, file: !393, line: 131, type: !1340)
!1344 = !DILocalVariable(name: "data_end", arg: 2, scope: !1337, file: !393, line: 132, type: !94)
!1345 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !1337, file: !393, line: 133, type: !1341)
!1346 = !DILocation(line: 131, column: 60, scope: !1337)
!1347 = !DILocation(line: 132, column: 12, scope: !1337)
!1348 = !DILocation(line: 133, column: 22, scope: !1337)
!1349 = !DILocation(line: 136, column: 27, scope: !1337)
!1350 = !DILocation(line: 136, column: 31, scope: !1337)
!1351 = !DILocation(line: 136, column: 41, scope: !1337)
!1352 = !DILocation(line: 136, column: 9, scope: !1337)
!1353 = !DILocation(line: 136, column: 2, scope: !1337)
!1354 = distinct !DISubprogram(name: "parse_iphdr", scope: !393, file: !393, line: 196, type: !1355, scopeLine: 199, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1358)
!1355 = !DISubroutineType(types: !1356)
!1356 = !{!136, !1340, !94, !1357}
!1357 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !452, size: 64)
!1358 = !{!1359, !1360, !1361, !1362, !1363}
!1359 = !DILocalVariable(name: "nh", arg: 1, scope: !1354, file: !393, line: 196, type: !1340)
!1360 = !DILocalVariable(name: "data_end", arg: 2, scope: !1354, file: !393, line: 197, type: !94)
!1361 = !DILocalVariable(name: "iphdr", arg: 3, scope: !1354, file: !393, line: 198, type: !1357)
!1362 = !DILocalVariable(name: "iph", scope: !1354, file: !393, line: 200, type: !452)
!1363 = !DILocalVariable(name: "hdrsize", scope: !1354, file: !393, line: 201, type: !136)
!1364 = !DILocation(line: 196, column: 59, scope: !1354)
!1365 = !DILocation(line: 197, column: 18, scope: !1354)
!1366 = !DILocation(line: 198, column: 27, scope: !1354)
!1367 = !DILocation(line: 200, column: 2, scope: !1354)
!1368 = !DILocation(line: 200, column: 16, scope: !1354)
!1369 = !DILocation(line: 200, column: 22, scope: !1354)
!1370 = !DILocation(line: 200, column: 26, scope: !1354)
!1371 = !DILocation(line: 201, column: 2, scope: !1354)
!1372 = !DILocation(line: 201, column: 6, scope: !1354)
!1373 = !DILocation(line: 203, column: 6, scope: !1374)
!1374 = distinct !DILexicalBlock(scope: !1354, file: !393, line: 203, column: 6)
!1375 = !DILocation(line: 203, column: 10, scope: !1374)
!1376 = !DILocation(line: 203, column: 16, scope: !1374)
!1377 = !DILocation(line: 203, column: 14, scope: !1374)
!1378 = !DILocation(line: 203, column: 6, scope: !1354)
!1379 = !DILocation(line: 204, column: 3, scope: !1374)
!1380 = !DILocation(line: 206, column: 6, scope: !1381)
!1381 = distinct !DILexicalBlock(scope: !1354, file: !393, line: 206, column: 6)
!1382 = !DILocation(line: 206, column: 11, scope: !1381)
!1383 = !DILocation(line: 206, column: 19, scope: !1381)
!1384 = !DILocation(line: 206, column: 6, scope: !1354)
!1385 = !DILocation(line: 207, column: 3, scope: !1381)
!1386 = !DILocation(line: 209, column: 12, scope: !1354)
!1387 = !DILocation(line: 209, column: 17, scope: !1354)
!1388 = !DILocation(line: 209, column: 21, scope: !1354)
!1389 = !DILocation(line: 209, column: 10, scope: !1354)
!1390 = !DILocation(line: 211, column: 5, scope: !1391)
!1391 = distinct !DILexicalBlock(scope: !1354, file: !393, line: 211, column: 5)
!1392 = !DILocation(line: 211, column: 13, scope: !1391)
!1393 = !DILocation(line: 211, column: 5, scope: !1354)
!1394 = !DILocation(line: 212, column: 3, scope: !1391)
!1395 = !DILocation(line: 215, column: 6, scope: !1396)
!1396 = distinct !DILexicalBlock(scope: !1354, file: !393, line: 215, column: 6)
!1397 = !DILocation(line: 215, column: 10, scope: !1396)
!1398 = !DILocation(line: 215, column: 16, scope: !1396)
!1399 = !DILocation(line: 215, column: 14, scope: !1396)
!1400 = !DILocation(line: 215, column: 26, scope: !1396)
!1401 = !DILocation(line: 215, column: 24, scope: !1396)
!1402 = !DILocation(line: 215, column: 6, scope: !1354)
!1403 = !DILocation(line: 216, column: 3, scope: !1396)
!1404 = !DILocation(line: 218, column: 13, scope: !1354)
!1405 = !DILocation(line: 218, column: 2, scope: !1354)
!1406 = !DILocation(line: 218, column: 6, scope: !1354)
!1407 = !DILocation(line: 218, column: 10, scope: !1354)
!1408 = !DILocation(line: 219, column: 11, scope: !1354)
!1409 = !DILocation(line: 219, column: 3, scope: !1354)
!1410 = !DILocation(line: 219, column: 9, scope: !1354)
!1411 = !DILocation(line: 221, column: 9, scope: !1354)
!1412 = !DILocation(line: 221, column: 14, scope: !1354)
!1413 = !{!1414, !401, i64 9}
!1414 = !{!"iphdr", !401, i64 0, !401, i64 0, !401, i64 1, !748, i64 2, !748, i64 4, !748, i64 6, !401, i64 8, !401, i64 9, !748, i64 10, !401, i64 12}
!1415 = !DILocation(line: 221, column: 2, scope: !1354)
!1416 = !DILocation(line: 222, column: 1, scope: !1354)
!1417 = distinct !DISubprogram(name: "parse_ip6hdr", scope: !393, file: !393, line: 174, type: !1418, scopeLine: 177, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1421)
!1418 = !DISubroutineType(types: !1419)
!1419 = !{!136, !1340, !94, !1420}
!1420 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !480, size: 64)
!1421 = !{!1422, !1423, !1424, !1425}
!1422 = !DILocalVariable(name: "nh", arg: 1, scope: !1417, file: !393, line: 174, type: !1340)
!1423 = !DILocalVariable(name: "data_end", arg: 2, scope: !1417, file: !393, line: 175, type: !94)
!1424 = !DILocalVariable(name: "ip6hdr", arg: 3, scope: !1417, file: !393, line: 176, type: !1420)
!1425 = !DILocalVariable(name: "ip6h", scope: !1417, file: !393, line: 178, type: !480)
!1426 = !DILocation(line: 174, column: 60, scope: !1417)
!1427 = !DILocation(line: 175, column: 12, scope: !1417)
!1428 = !DILocation(line: 176, column: 23, scope: !1417)
!1429 = !DILocation(line: 178, column: 2, scope: !1417)
!1430 = !DILocation(line: 178, column: 18, scope: !1417)
!1431 = !DILocation(line: 178, column: 25, scope: !1417)
!1432 = !DILocation(line: 178, column: 29, scope: !1417)
!1433 = !DILocation(line: 184, column: 6, scope: !1434)
!1434 = distinct !DILexicalBlock(scope: !1417, file: !393, line: 184, column: 6)
!1435 = !DILocation(line: 184, column: 11, scope: !1434)
!1436 = !DILocation(line: 184, column: 17, scope: !1434)
!1437 = !DILocation(line: 184, column: 15, scope: !1434)
!1438 = !DILocation(line: 184, column: 6, scope: !1417)
!1439 = !DILocation(line: 185, column: 3, scope: !1434)
!1440 = !DILocation(line: 187, column: 6, scope: !1441)
!1441 = distinct !DILexicalBlock(scope: !1417, file: !393, line: 187, column: 6)
!1442 = !DILocation(line: 187, column: 12, scope: !1441)
!1443 = !DILocation(line: 187, column: 20, scope: !1441)
!1444 = !DILocation(line: 187, column: 6, scope: !1417)
!1445 = !DILocation(line: 188, column: 3, scope: !1441)
!1446 = !DILocation(line: 190, column: 12, scope: !1417)
!1447 = !DILocation(line: 190, column: 17, scope: !1417)
!1448 = !DILocation(line: 190, column: 2, scope: !1417)
!1449 = !DILocation(line: 190, column: 6, scope: !1417)
!1450 = !DILocation(line: 190, column: 10, scope: !1417)
!1451 = !DILocation(line: 191, column: 12, scope: !1417)
!1452 = !DILocation(line: 191, column: 3, scope: !1417)
!1453 = !DILocation(line: 191, column: 10, scope: !1417)
!1454 = !DILocation(line: 193, column: 24, scope: !1417)
!1455 = !DILocation(line: 193, column: 28, scope: !1417)
!1456 = !DILocation(line: 193, column: 38, scope: !1417)
!1457 = !DILocation(line: 193, column: 44, scope: !1417)
!1458 = !{!1459, !401, i64 6}
!1459 = !{!"ipv6hdr", !401, i64 0, !401, i64 0, !401, i64 1, !748, i64 4, !401, i64 6, !401, i64 7, !401, i64 8}
!1460 = !DILocation(line: 193, column: 9, scope: !1417)
!1461 = !DILocation(line: 193, column: 2, scope: !1417)
!1462 = !DILocation(line: 194, column: 1, scope: !1417)
!1463 = distinct !DISubprogram(name: "parse_tcp_identifier", scope: !3, file: !3, line: 198, type: !714, scopeLine: 200, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1464)
!1464 = !{!1465, !1466}
!1465 = !DILocalVariable(name: "pctx", arg: 1, scope: !1463, file: !3, line: 198, type: !441)
!1466 = !DILocalVariable(name: "p_info", arg: 2, scope: !1463, file: !3, line: 199, type: !716)
!1467 = !DILocation(line: 198, column: 57, scope: !1463)
!1468 = !DILocation(line: 199, column: 25, scope: !1463)
!1469 = !DILocation(line: 201, column: 20, scope: !1470)
!1470 = distinct !DILexicalBlock(scope: !1463, file: !3, line: 201, column: 6)
!1471 = !DILocation(line: 201, column: 26, scope: !1470)
!1472 = !DILocation(line: 201, column: 30, scope: !1470)
!1473 = !DILocation(line: 201, column: 36, scope: !1470)
!1474 = !DILocation(line: 201, column: 47, scope: !1470)
!1475 = !DILocation(line: 201, column: 55, scope: !1470)
!1476 = !DILocation(line: 201, column: 6, scope: !1470)
!1477 = !DILocation(line: 201, column: 61, scope: !1470)
!1478 = !DILocation(line: 201, column: 6, scope: !1463)
!1479 = !DILocation(line: 202, column: 3, scope: !1470)
!1480 = !DILocation(line: 204, column: 19, scope: !1481)
!1481 = distinct !DILexicalBlock(scope: !1463, file: !3, line: 204, column: 6)
!1482 = !DILocation(line: 204, column: 27, scope: !1481)
!1483 = !DILocation(line: 204, column: 33, scope: !1481)
!1484 = !DILocation(line: 204, column: 39, scope: !1481)
!1485 = !DILocation(line: 204, column: 50, scope: !1481)
!1486 = !DILocation(line: 204, column: 58, scope: !1481)
!1487 = !DILocation(line: 204, column: 62, scope: !1481)
!1488 = !DILocation(line: 205, column: 6, scope: !1481)
!1489 = !DILocation(line: 205, column: 14, scope: !1481)
!1490 = !DILocation(line: 205, column: 24, scope: !1481)
!1491 = !DILocation(line: 204, column: 6, scope: !1481)
!1492 = !DILocation(line: 205, column: 36, scope: !1481)
!1493 = !DILocation(line: 204, column: 6, scope: !1463)
!1494 = !DILocation(line: 206, column: 3, scope: !1481)
!1495 = !DILocation(line: 208, column: 32, scope: !1463)
!1496 = !DILocation(line: 208, column: 40, scope: !1463)
!1497 = !DILocation(line: 208, column: 46, scope: !1463)
!1498 = !{!1499, !748, i64 0}
!1499 = !{!"tcphdr", !748, i64 0, !748, i64 2, !411, i64 4, !411, i64 8, !748, i64 12, !748, i64 12, !748, i64 13, !748, i64 13, !748, i64 13, !748, i64 13, !748, i64 13, !748, i64 13, !748, i64 13, !748, i64 13, !748, i64 14, !748, i64 16, !748, i64 18}
!1500 = !DILocation(line: 208, column: 2, scope: !1463)
!1501 = !DILocation(line: 208, column: 10, scope: !1463)
!1502 = !DILocation(line: 208, column: 14, scope: !1463)
!1503 = !DILocation(line: 208, column: 19, scope: !1463)
!1504 = !DILocation(line: 208, column: 25, scope: !1463)
!1505 = !DILocation(line: 208, column: 30, scope: !1463)
!1506 = !{!743, !748, i64 44}
!1507 = !DILocation(line: 209, column: 32, scope: !1463)
!1508 = !DILocation(line: 209, column: 40, scope: !1463)
!1509 = !DILocation(line: 209, column: 46, scope: !1463)
!1510 = !{!1499, !748, i64 2}
!1511 = !DILocation(line: 209, column: 2, scope: !1463)
!1512 = !DILocation(line: 209, column: 10, scope: !1463)
!1513 = !DILocation(line: 209, column: 14, scope: !1463)
!1514 = !DILocation(line: 209, column: 19, scope: !1463)
!1515 = !DILocation(line: 209, column: 25, scope: !1463)
!1516 = !DILocation(line: 209, column: 30, scope: !1463)
!1517 = !{!743, !748, i64 64}
!1518 = !DILocation(line: 213, column: 3, scope: !1463)
!1519 = !DILocation(line: 213, column: 9, scope: !1463)
!1520 = !DILocation(line: 213, column: 12, scope: !1463)
!1521 = !{!416, !400, i64 16}
!1522 = !DILocation(line: 213, column: 18, scope: !1463)
!1523 = !DILocation(line: 213, column: 24, scope: !1463)
!1524 = !DILocation(line: 213, column: 16, scope: !1463)
!1525 = !DILocation(line: 213, column: 31, scope: !1463)
!1526 = !DILocation(line: 213, column: 37, scope: !1463)
!1527 = !DILocation(line: 213, column: 29, scope: !1463)
!1528 = !DILocation(line: 213, column: 45, scope: !1463)
!1529 = !DILocation(line: 213, column: 48, scope: !1463)
!1530 = !DILocation(line: 213, column: 56, scope: !1463)
!1531 = !DILocation(line: 213, column: 62, scope: !1463)
!1532 = !DILocation(line: 212, column: 2, scope: !1463)
!1533 = !DILocation(line: 212, column: 10, scope: !1463)
!1534 = !DILocation(line: 212, column: 20, scope: !1463)
!1535 = !DILocation(line: 216, column: 28, scope: !1463)
!1536 = !DILocation(line: 216, column: 36, scope: !1463)
!1537 = !DILocation(line: 216, column: 42, scope: !1463)
!1538 = !DILocation(line: 216, column: 2, scope: !1463)
!1539 = !DILocation(line: 216, column: 10, scope: !1463)
!1540 = !DILocation(line: 216, column: 26, scope: !1463)
!1541 = !DILocation(line: 219, column: 6, scope: !1542)
!1542 = distinct !DILexicalBlock(scope: !1463, file: !3, line: 219, column: 6)
!1543 = !DILocation(line: 219, column: 14, scope: !1542)
!1544 = !DILocation(line: 219, column: 20, scope: !1542)
!1545 = !DILocation(line: 219, column: 6, scope: !1463)
!1546 = !DILocation(line: 220, column: 3, scope: !1547)
!1547 = distinct !DILexicalBlock(scope: !1542, file: !3, line: 219, column: 25)
!1548 = !DILocation(line: 220, column: 11, scope: !1547)
!1549 = !DILocation(line: 220, column: 22, scope: !1547)
!1550 = !DILocation(line: 221, column: 3, scope: !1547)
!1551 = !DILocation(line: 221, column: 11, scope: !1547)
!1552 = !DILocation(line: 221, column: 24, scope: !1547)
!1553 = !{!743, !401, i64 127}
!1554 = !DILocation(line: 222, column: 2, scope: !1547)
!1555 = !DILocation(line: 222, column: 13, scope: !1556)
!1556 = distinct !DILexicalBlock(scope: !1542, file: !3, line: 222, column: 13)
!1557 = !DILocation(line: 222, column: 21, scope: !1556)
!1558 = !DILocation(line: 222, column: 27, scope: !1556)
!1559 = !DILocation(line: 222, column: 13, scope: !1542)
!1560 = !DILocation(line: 223, column: 3, scope: !1561)
!1561 = distinct !DILexicalBlock(scope: !1556, file: !3, line: 222, column: 32)
!1562 = !DILocation(line: 223, column: 11, scope: !1561)
!1563 = !DILocation(line: 223, column: 22, scope: !1561)
!1564 = !DILocation(line: 224, column: 3, scope: !1561)
!1565 = !DILocation(line: 224, column: 11, scope: !1561)
!1566 = !DILocation(line: 224, column: 24, scope: !1561)
!1567 = !DILocation(line: 225, column: 2, scope: !1561)
!1568 = !DILocation(line: 225, column: 13, scope: !1569)
!1569 = distinct !DILexicalBlock(scope: !1556, file: !3, line: 225, column: 13)
!1570 = !DILocation(line: 225, column: 21, scope: !1569)
!1571 = !DILocation(line: 225, column: 27, scope: !1569)
!1572 = !DILocation(line: 225, column: 13, scope: !1556)
!1573 = !DILocation(line: 226, column: 3, scope: !1574)
!1574 = distinct !DILexicalBlock(scope: !1569, file: !3, line: 225, column: 32)
!1575 = !DILocation(line: 226, column: 11, scope: !1574)
!1576 = !DILocation(line: 226, column: 22, scope: !1574)
!1577 = !DILocation(line: 227, column: 26, scope: !1574)
!1578 = !DILocation(line: 227, column: 34, scope: !1574)
!1579 = !DILocation(line: 227, column: 40, scope: !1574)
!1580 = !DILocation(line: 227, column: 3, scope: !1574)
!1581 = !DILocation(line: 227, column: 11, scope: !1574)
!1582 = !DILocation(line: 227, column: 24, scope: !1574)
!1583 = !DILocation(line: 230, column: 2, scope: !1574)
!1584 = !DILocation(line: 231, column: 3, scope: !1585)
!1585 = distinct !DILexicalBlock(scope: !1569, file: !3, line: 230, column: 9)
!1586 = !DILocation(line: 231, column: 11, scope: !1585)
!1587 = !DILocation(line: 231, column: 22, scope: !1585)
!1588 = !DILocation(line: 234, column: 2, scope: !1463)
!1589 = !DILocation(line: 235, column: 1, scope: !1463)
!1590 = distinct !DISubprogram(name: "parse_icmp6_identifier", scope: !3, file: !3, line: 253, type: !714, scopeLine: 255, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1591)
!1591 = !{!1592, !1593}
!1592 = !DILocalVariable(name: "pctx", arg: 1, scope: !1590, file: !3, line: 253, type: !441)
!1593 = !DILocalVariable(name: "p_info", arg: 2, scope: !1590, file: !3, line: 254, type: !716)
!1594 = !DILocation(line: 253, column: 59, scope: !1590)
!1595 = !DILocation(line: 254, column: 27, scope: !1590)
!1596 = !DILocation(line: 256, column: 22, scope: !1597)
!1597 = distinct !DILexicalBlock(scope: !1590, file: !3, line: 256, column: 6)
!1598 = !DILocation(line: 256, column: 28, scope: !1597)
!1599 = !DILocation(line: 256, column: 32, scope: !1597)
!1600 = !DILocation(line: 256, column: 38, scope: !1597)
!1601 = !DILocation(line: 256, column: 49, scope: !1597)
!1602 = !DILocation(line: 256, column: 57, scope: !1597)
!1603 = !DILocation(line: 256, column: 6, scope: !1597)
!1604 = !DILocation(line: 256, column: 65, scope: !1597)
!1605 = !DILocation(line: 256, column: 6, scope: !1590)
!1606 = !DILocation(line: 257, column: 3, scope: !1597)
!1607 = !DILocation(line: 259, column: 6, scope: !1608)
!1608 = distinct !DILexicalBlock(scope: !1590, file: !3, line: 259, column: 6)
!1609 = !DILocation(line: 259, column: 14, scope: !1608)
!1610 = !DILocation(line: 259, column: 22, scope: !1608)
!1611 = !{!1612, !401, i64 1}
!1612 = !{!"icmp6hdr", !401, i64 0, !401, i64 1, !748, i64 2, !401, i64 4}
!1613 = !DILocation(line: 259, column: 33, scope: !1608)
!1614 = !DILocation(line: 259, column: 6, scope: !1590)
!1615 = !DILocation(line: 260, column: 3, scope: !1608)
!1616 = !DILocation(line: 262, column: 6, scope: !1617)
!1617 = distinct !DILexicalBlock(scope: !1590, file: !3, line: 262, column: 6)
!1618 = !DILocation(line: 262, column: 14, scope: !1617)
!1619 = !DILocation(line: 262, column: 22, scope: !1617)
!1620 = !{!1612, !401, i64 0}
!1621 = !DILocation(line: 262, column: 33, scope: !1617)
!1622 = !DILocation(line: 262, column: 6, scope: !1590)
!1623 = !DILocation(line: 263, column: 28, scope: !1624)
!1624 = distinct !DILexicalBlock(scope: !1617, file: !3, line: 262, column: 57)
!1625 = !DILocation(line: 263, column: 36, scope: !1624)
!1626 = !DILocation(line: 263, column: 44, scope: !1624)
!1627 = !DILocation(line: 263, column: 3, scope: !1624)
!1628 = !DILocation(line: 263, column: 11, scope: !1624)
!1629 = !DILocation(line: 263, column: 15, scope: !1624)
!1630 = !DILocation(line: 263, column: 26, scope: !1624)
!1631 = !DILocation(line: 264, column: 3, scope: !1624)
!1632 = !DILocation(line: 264, column: 11, scope: !1624)
!1633 = !DILocation(line: 264, column: 21, scope: !1624)
!1634 = !DILocation(line: 265, column: 3, scope: !1624)
!1635 = !DILocation(line: 265, column: 11, scope: !1624)
!1636 = !DILocation(line: 265, column: 27, scope: !1624)
!1637 = !DILocation(line: 266, column: 2, scope: !1624)
!1638 = !DILocation(line: 266, column: 13, scope: !1639)
!1639 = distinct !DILexicalBlock(scope: !1617, file: !3, line: 266, column: 13)
!1640 = !DILocation(line: 266, column: 21, scope: !1639)
!1641 = !DILocation(line: 266, column: 29, scope: !1639)
!1642 = !DILocation(line: 266, column: 40, scope: !1639)
!1643 = !DILocation(line: 266, column: 13, scope: !1617)
!1644 = !DILocation(line: 267, column: 34, scope: !1645)
!1645 = distinct !DILexicalBlock(scope: !1639, file: !3, line: 266, column: 62)
!1646 = !DILocation(line: 267, column: 42, scope: !1645)
!1647 = !DILocation(line: 267, column: 50, scope: !1645)
!1648 = !DILocation(line: 267, column: 3, scope: !1645)
!1649 = !DILocation(line: 267, column: 11, scope: !1645)
!1650 = !DILocation(line: 267, column: 21, scope: !1645)
!1651 = !DILocation(line: 267, column: 32, scope: !1645)
!1652 = !{!743, !411, i64 120}
!1653 = !DILocation(line: 268, column: 3, scope: !1645)
!1654 = !DILocation(line: 268, column: 11, scope: !1645)
!1655 = !DILocation(line: 268, column: 27, scope: !1645)
!1656 = !DILocation(line: 269, column: 3, scope: !1645)
!1657 = !DILocation(line: 269, column: 11, scope: !1645)
!1658 = !DILocation(line: 269, column: 21, scope: !1645)
!1659 = !DILocation(line: 270, column: 2, scope: !1645)
!1660 = !DILocation(line: 271, column: 3, scope: !1661)
!1661 = distinct !DILexicalBlock(scope: !1639, file: !3, line: 270, column: 9)
!1662 = !DILocation(line: 274, column: 2, scope: !1590)
!1663 = !DILocation(line: 274, column: 10, scope: !1590)
!1664 = !DILocation(line: 274, column: 21, scope: !1590)
!1665 = !DILocation(line: 275, column: 32, scope: !1590)
!1666 = !DILocation(line: 275, column: 40, scope: !1590)
!1667 = !DILocation(line: 275, column: 48, scope: !1590)
!1668 = !DILocation(line: 275, column: 2, scope: !1590)
!1669 = !DILocation(line: 275, column: 10, scope: !1590)
!1670 = !DILocation(line: 275, column: 14, scope: !1590)
!1671 = !DILocation(line: 275, column: 19, scope: !1590)
!1672 = !DILocation(line: 275, column: 25, scope: !1590)
!1673 = !DILocation(line: 275, column: 30, scope: !1590)
!1674 = !DILocation(line: 276, column: 32, scope: !1590)
!1675 = !DILocation(line: 276, column: 40, scope: !1590)
!1676 = !DILocation(line: 276, column: 44, scope: !1590)
!1677 = !DILocation(line: 276, column: 49, scope: !1590)
!1678 = !DILocation(line: 276, column: 55, scope: !1590)
!1679 = !DILocation(line: 276, column: 2, scope: !1590)
!1680 = !DILocation(line: 276, column: 10, scope: !1590)
!1681 = !DILocation(line: 276, column: 14, scope: !1590)
!1682 = !DILocation(line: 276, column: 19, scope: !1590)
!1683 = !DILocation(line: 276, column: 25, scope: !1590)
!1684 = !DILocation(line: 276, column: 30, scope: !1590)
!1685 = !DILocation(line: 277, column: 2, scope: !1590)
!1686 = !DILocation(line: 278, column: 1, scope: !1590)
!1687 = distinct !DISubprogram(name: "parse_icmp_identifier", scope: !3, file: !3, line: 283, type: !714, scopeLine: 285, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1688)
!1688 = !{!1689, !1690}
!1689 = !DILocalVariable(name: "pctx", arg: 1, scope: !1687, file: !3, line: 283, type: !441)
!1690 = !DILocalVariable(name: "p_info", arg: 2, scope: !1687, file: !3, line: 284, type: !716)
!1691 = !DILocation(line: 283, column: 58, scope: !1687)
!1692 = !DILocation(line: 284, column: 26, scope: !1687)
!1693 = !DILocation(line: 286, column: 21, scope: !1694)
!1694 = distinct !DILexicalBlock(scope: !1687, file: !3, line: 286, column: 6)
!1695 = !DILocation(line: 286, column: 27, scope: !1694)
!1696 = !DILocation(line: 286, column: 31, scope: !1694)
!1697 = !DILocation(line: 286, column: 37, scope: !1694)
!1698 = !DILocation(line: 286, column: 48, scope: !1694)
!1699 = !DILocation(line: 286, column: 56, scope: !1694)
!1700 = !DILocation(line: 286, column: 6, scope: !1694)
!1701 = !DILocation(line: 286, column: 63, scope: !1694)
!1702 = !DILocation(line: 286, column: 6, scope: !1687)
!1703 = !DILocation(line: 287, column: 3, scope: !1694)
!1704 = !DILocation(line: 289, column: 6, scope: !1705)
!1705 = distinct !DILexicalBlock(scope: !1687, file: !3, line: 289, column: 6)
!1706 = !DILocation(line: 289, column: 14, scope: !1705)
!1707 = !DILocation(line: 289, column: 21, scope: !1705)
!1708 = !{!1709, !401, i64 1}
!1709 = !{!"icmphdr", !401, i64 0, !401, i64 1, !748, i64 2, !401, i64 4}
!1710 = !DILocation(line: 289, column: 26, scope: !1705)
!1711 = !DILocation(line: 289, column: 6, scope: !1687)
!1712 = !DILocation(line: 290, column: 3, scope: !1705)
!1713 = !DILocation(line: 292, column: 6, scope: !1714)
!1714 = distinct !DILexicalBlock(scope: !1687, file: !3, line: 292, column: 6)
!1715 = !DILocation(line: 292, column: 14, scope: !1714)
!1716 = !DILocation(line: 292, column: 21, scope: !1714)
!1717 = !{!1709, !401, i64 0}
!1718 = !DILocation(line: 292, column: 26, scope: !1714)
!1719 = !DILocation(line: 292, column: 6, scope: !1687)
!1720 = !DILocation(line: 293, column: 28, scope: !1721)
!1721 = distinct !DILexicalBlock(scope: !1714, file: !3, line: 292, column: 40)
!1722 = !DILocation(line: 293, column: 36, scope: !1721)
!1723 = !DILocation(line: 293, column: 43, scope: !1721)
!1724 = !DILocation(line: 293, column: 51, scope: !1721)
!1725 = !DILocation(line: 293, column: 3, scope: !1721)
!1726 = !DILocation(line: 293, column: 11, scope: !1721)
!1727 = !DILocation(line: 293, column: 15, scope: !1721)
!1728 = !DILocation(line: 293, column: 26, scope: !1721)
!1729 = !DILocation(line: 294, column: 3, scope: !1721)
!1730 = !DILocation(line: 294, column: 11, scope: !1721)
!1731 = !DILocation(line: 294, column: 21, scope: !1721)
!1732 = !DILocation(line: 295, column: 3, scope: !1721)
!1733 = !DILocation(line: 295, column: 11, scope: !1721)
!1734 = !DILocation(line: 295, column: 27, scope: !1721)
!1735 = !DILocation(line: 296, column: 2, scope: !1721)
!1736 = !DILocation(line: 296, column: 13, scope: !1737)
!1737 = distinct !DILexicalBlock(scope: !1714, file: !3, line: 296, column: 13)
!1738 = !DILocation(line: 296, column: 21, scope: !1737)
!1739 = !DILocation(line: 296, column: 28, scope: !1737)
!1740 = !DILocation(line: 296, column: 33, scope: !1737)
!1741 = !DILocation(line: 296, column: 13, scope: !1714)
!1742 = !DILocation(line: 297, column: 34, scope: !1743)
!1743 = distinct !DILexicalBlock(scope: !1737, file: !3, line: 296, column: 52)
!1744 = !DILocation(line: 297, column: 42, scope: !1743)
!1745 = !DILocation(line: 297, column: 49, scope: !1743)
!1746 = !DILocation(line: 297, column: 57, scope: !1743)
!1747 = !DILocation(line: 297, column: 3, scope: !1743)
!1748 = !DILocation(line: 297, column: 11, scope: !1743)
!1749 = !DILocation(line: 297, column: 21, scope: !1743)
!1750 = !DILocation(line: 297, column: 32, scope: !1743)
!1751 = !DILocation(line: 298, column: 3, scope: !1743)
!1752 = !DILocation(line: 298, column: 11, scope: !1743)
!1753 = !DILocation(line: 298, column: 27, scope: !1743)
!1754 = !DILocation(line: 299, column: 3, scope: !1743)
!1755 = !DILocation(line: 299, column: 11, scope: !1743)
!1756 = !DILocation(line: 299, column: 21, scope: !1743)
!1757 = !DILocation(line: 300, column: 2, scope: !1743)
!1758 = !DILocation(line: 301, column: 3, scope: !1759)
!1759 = distinct !DILexicalBlock(scope: !1737, file: !3, line: 300, column: 9)
!1760 = !DILocation(line: 304, column: 2, scope: !1687)
!1761 = !DILocation(line: 304, column: 10, scope: !1687)
!1762 = !DILocation(line: 304, column: 21, scope: !1687)
!1763 = !DILocation(line: 305, column: 32, scope: !1687)
!1764 = !DILocation(line: 305, column: 40, scope: !1687)
!1765 = !DILocation(line: 305, column: 47, scope: !1687)
!1766 = !DILocation(line: 305, column: 55, scope: !1687)
!1767 = !DILocation(line: 305, column: 2, scope: !1687)
!1768 = !DILocation(line: 305, column: 10, scope: !1687)
!1769 = !DILocation(line: 305, column: 14, scope: !1687)
!1770 = !DILocation(line: 305, column: 19, scope: !1687)
!1771 = !DILocation(line: 305, column: 25, scope: !1687)
!1772 = !DILocation(line: 305, column: 30, scope: !1687)
!1773 = !DILocation(line: 306, column: 32, scope: !1687)
!1774 = !DILocation(line: 306, column: 40, scope: !1687)
!1775 = !DILocation(line: 306, column: 44, scope: !1687)
!1776 = !DILocation(line: 306, column: 49, scope: !1687)
!1777 = !DILocation(line: 306, column: 55, scope: !1687)
!1778 = !DILocation(line: 306, column: 2, scope: !1687)
!1779 = !DILocation(line: 306, column: 10, scope: !1687)
!1780 = !DILocation(line: 306, column: 14, scope: !1687)
!1781 = !DILocation(line: 306, column: 19, scope: !1687)
!1782 = !DILocation(line: 306, column: 25, scope: !1687)
!1783 = !DILocation(line: 306, column: 30, scope: !1687)
!1784 = !DILocation(line: 307, column: 2, scope: !1687)
!1785 = !DILocation(line: 308, column: 1, scope: !1687)
!1786 = distinct !DISubprogram(name: "map_ipv4_to_ipv6", scope: !3, file: !3, line: 114, type: !1787, scopeLine: 115, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1789)
!1787 = !DISubroutineType(types: !1788)
!1788 = !{null, !105, !124}
!1789 = !{!1790, !1791}
!1790 = !DILocalVariable(name: "ipv6", arg: 1, scope: !1786, file: !3, line: 114, type: !105)
!1791 = !DILocalVariable(name: "ipv4", arg: 2, scope: !1786, file: !3, line: 114, type: !124)
!1792 = !DILocation(line: 114, column: 47, scope: !1786)
!1793 = !DILocation(line: 114, column: 60, scope: !1786)
!1794 = !DILocation(line: 116, column: 20, scope: !1786)
!1795 = !DILocation(line: 116, column: 26, scope: !1786)
!1796 = !DILocation(line: 116, column: 2, scope: !1786)
!1797 = !DILocation(line: 117, column: 20, scope: !1786)
!1798 = !DILocation(line: 117, column: 26, scope: !1786)
!1799 = !DILocation(line: 117, column: 2, scope: !1786)
!1800 = !DILocation(line: 118, column: 29, scope: !1786)
!1801 = !DILocation(line: 118, column: 2, scope: !1786)
!1802 = !DILocation(line: 118, column: 8, scope: !1786)
!1803 = !DILocation(line: 118, column: 27, scope: !1786)
!1804 = !DILocation(line: 119, column: 1, scope: !1786)
!1805 = distinct !DISubprogram(name: "reverse_flow", scope: !15, file: !15, line: 167, type: !1806, scopeLine: 168, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1808)
!1806 = !DISubroutineType(types: !1807)
!1807 = !{null, !172, !172}
!1808 = !{!1809, !1810}
!1809 = !DILocalVariable(name: "dest", arg: 1, scope: !1805, file: !15, line: 167, type: !172)
!1810 = !DILocalVariable(name: "src", arg: 2, scope: !1805, file: !15, line: 167, type: !172)
!1811 = !DILocation(line: 167, column: 48, scope: !1805)
!1812 = !DILocation(line: 167, column: 76, scope: !1805)
!1813 = !DILocation(line: 169, column: 14, scope: !1805)
!1814 = !DILocation(line: 169, column: 19, scope: !1805)
!1815 = !{!745, !401, i64 42}
!1816 = !DILocation(line: 169, column: 2, scope: !1805)
!1817 = !DILocation(line: 169, column: 8, scope: !1805)
!1818 = !DILocation(line: 169, column: 12, scope: !1805)
!1819 = !DILocation(line: 170, column: 16, scope: !1805)
!1820 = !DILocation(line: 170, column: 21, scope: !1805)
!1821 = !{!745, !748, i64 40}
!1822 = !DILocation(line: 170, column: 2, scope: !1805)
!1823 = !DILocation(line: 170, column: 8, scope: !1805)
!1824 = !DILocation(line: 170, column: 14, scope: !1805)
!1825 = !DILocation(line: 171, column: 2, scope: !1805)
!1826 = !DILocation(line: 171, column: 8, scope: !1805)
!1827 = !DILocation(line: 171, column: 16, scope: !1805)
!1828 = !DILocation(line: 171, column: 21, scope: !1805)
!1829 = !{i64 0, i64 16, !883, i64 0, i64 16, !883, i64 0, i64 16, !883, i64 16, i64 2, !1262, i64 18, i64 2, !1262}
!1830 = !DILocation(line: 172, column: 2, scope: !1805)
!1831 = !DILocation(line: 172, column: 8, scope: !1805)
!1832 = !DILocation(line: 172, column: 16, scope: !1805)
!1833 = !DILocation(line: 172, column: 21, scope: !1805)
!1834 = !DILocation(line: 173, column: 2, scope: !1805)
!1835 = !DILocation(line: 173, column: 8, scope: !1805)
!1836 = !DILocation(line: 173, column: 17, scope: !1805)
!1837 = !{!745, !401, i64 43}
!1838 = !DILocation(line: 174, column: 1, scope: !1805)
!1839 = distinct !DISubprogram(name: "remaining_pkt_payload", scope: !3, file: !3, line: 124, type: !1840, scopeLine: 125, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1842)
!1840 = !DISubroutineType(types: !1841)
!1841 = !{!104, !441}
!1842 = !{!1843, !1844}
!1843 = !DILocalVariable(name: "ctx", arg: 1, scope: !1839, file: !3, line: 124, type: !441)
!1844 = !DILocalVariable(name: "parsed_bytes", scope: !1839, file: !3, line: 128, type: !104)
!1845 = !DILocation(line: 124, column: 60, scope: !1839)
!1846 = !DILocation(line: 128, column: 2, scope: !1839)
!1847 = !DILocation(line: 128, column: 8, scope: !1839)
!1848 = !DILocation(line: 128, column: 23, scope: !1839)
!1849 = !DILocation(line: 128, column: 28, scope: !1839)
!1850 = !DILocation(line: 128, column: 31, scope: !1839)
!1851 = !DILocation(line: 128, column: 37, scope: !1839)
!1852 = !DILocation(line: 128, column: 42, scope: !1839)
!1853 = !DILocation(line: 128, column: 35, scope: !1839)
!1854 = !DILocation(line: 129, column: 9, scope: !1839)
!1855 = !DILocation(line: 129, column: 24, scope: !1839)
!1856 = !DILocation(line: 129, column: 29, scope: !1839)
!1857 = !DILocation(line: 129, column: 22, scope: !1839)
!1858 = !DILocation(line: 129, column: 39, scope: !1839)
!1859 = !DILocation(line: 129, column: 44, scope: !1839)
!1860 = !DILocation(line: 129, column: 54, scope: !1839)
!1861 = !DILocation(line: 129, column: 52, scope: !1839)
!1862 = !DILocation(line: 130, column: 1, scope: !1839)
!1863 = !DILocation(line: 129, column: 2, scope: !1839)
!1864 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !393, file: !393, line: 86, type: !1865, scopeLine: 90, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1872)
!1865 = !DISubroutineType(types: !1866)
!1866 = !{!136, !1340, !94, !1341, !1867}
!1867 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1868, size: 64)
!1868 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !393, line: 71, size: 32, elements: !1869)
!1869 = !{!1870}
!1870 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !1868, file: !393, line: 72, baseType: !1871, size: 32)
!1871 = !DICompositeType(tag: DW_TAG_array_type, baseType: !96, size: 32, elements: !235)
!1872 = !{!1873, !1874, !1875, !1876, !1877, !1878, !1879, !1885, !1886}
!1873 = !DILocalVariable(name: "nh", arg: 1, scope: !1864, file: !393, line: 86, type: !1340)
!1874 = !DILocalVariable(name: "data_end", arg: 2, scope: !1864, file: !393, line: 87, type: !94)
!1875 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !1864, file: !393, line: 88, type: !1341)
!1876 = !DILocalVariable(name: "vlans", arg: 4, scope: !1864, file: !393, line: 89, type: !1867)
!1877 = !DILocalVariable(name: "eth", scope: !1864, file: !393, line: 91, type: !723)
!1878 = !DILocalVariable(name: "hdrsize", scope: !1864, file: !393, line: 92, type: !136)
!1879 = !DILocalVariable(name: "vlh", scope: !1864, file: !393, line: 93, type: !1880)
!1880 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1881, size: 64)
!1881 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !393, line: 44, size: 32, elements: !1882)
!1882 = !{!1883, !1884}
!1883 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !1881, file: !393, line: 45, baseType: !118, size: 16)
!1884 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !1881, file: !393, line: 46, baseType: !118, size: 16, offset: 16)
!1885 = !DILocalVariable(name: "h_proto", scope: !1864, file: !393, line: 94, type: !96)
!1886 = !DILocalVariable(name: "i", scope: !1864, file: !393, line: 95, type: !136)
!1887 = !DILocation(line: 86, column: 65, scope: !1864)
!1888 = !DILocation(line: 87, column: 17, scope: !1864)
!1889 = !DILocation(line: 88, column: 27, scope: !1864)
!1890 = !DILocation(line: 89, column: 33, scope: !1864)
!1891 = !DILocation(line: 91, column: 2, scope: !1864)
!1892 = !DILocation(line: 91, column: 17, scope: !1864)
!1893 = !DILocation(line: 91, column: 23, scope: !1864)
!1894 = !DILocation(line: 91, column: 27, scope: !1864)
!1895 = !DILocation(line: 92, column: 2, scope: !1864)
!1896 = !DILocation(line: 92, column: 6, scope: !1864)
!1897 = !DILocation(line: 93, column: 2, scope: !1864)
!1898 = !DILocation(line: 93, column: 19, scope: !1864)
!1899 = !DILocation(line: 94, column: 2, scope: !1864)
!1900 = !DILocation(line: 94, column: 8, scope: !1864)
!1901 = !DILocation(line: 95, column: 2, scope: !1864)
!1902 = !DILocation(line: 95, column: 6, scope: !1864)
!1903 = !DILocation(line: 100, column: 6, scope: !1904)
!1904 = distinct !DILexicalBlock(scope: !1864, file: !393, line: 100, column: 6)
!1905 = !DILocation(line: 100, column: 10, scope: !1904)
!1906 = !DILocation(line: 100, column: 16, scope: !1904)
!1907 = !DILocation(line: 100, column: 14, scope: !1904)
!1908 = !DILocation(line: 100, column: 26, scope: !1904)
!1909 = !DILocation(line: 100, column: 24, scope: !1904)
!1910 = !DILocation(line: 100, column: 6, scope: !1864)
!1911 = !DILocation(line: 101, column: 3, scope: !1904)
!1912 = !DILocation(line: 103, column: 13, scope: !1864)
!1913 = !DILocation(line: 103, column: 2, scope: !1864)
!1914 = !DILocation(line: 103, column: 6, scope: !1864)
!1915 = !DILocation(line: 103, column: 10, scope: !1864)
!1916 = !DILocation(line: 104, column: 12, scope: !1864)
!1917 = !DILocation(line: 104, column: 3, scope: !1864)
!1918 = !DILocation(line: 104, column: 10, scope: !1864)
!1919 = !DILocation(line: 105, column: 8, scope: !1864)
!1920 = !DILocation(line: 105, column: 12, scope: !1864)
!1921 = !DILocation(line: 105, column: 6, scope: !1864)
!1922 = !DILocation(line: 106, column: 12, scope: !1864)
!1923 = !DILocation(line: 106, column: 17, scope: !1864)
!1924 = !{!1925, !748, i64 12}
!1925 = !{!"ethhdr", !401, i64 0, !401, i64 6, !748, i64 12}
!1926 = !DILocation(line: 106, column: 10, scope: !1864)
!1927 = !DILocation(line: 112, column: 9, scope: !1928)
!1928 = distinct !DILexicalBlock(scope: !1864, file: !393, line: 112, column: 2)
!1929 = !DILocation(line: 112, column: 7, scope: !1928)
!1930 = !DILocation(line: 112, column: 14, scope: !1931)
!1931 = distinct !DILexicalBlock(scope: !1928, file: !393, line: 112, column: 2)
!1932 = !DILocation(line: 112, column: 16, scope: !1931)
!1933 = !DILocation(line: 112, column: 2, scope: !1928)
!1934 = !DILocation(line: 113, column: 22, scope: !1935)
!1935 = distinct !DILexicalBlock(scope: !1936, file: !393, line: 113, column: 7)
!1936 = distinct !DILexicalBlock(scope: !1931, file: !393, line: 112, column: 39)
!1937 = !DILocation(line: 113, column: 8, scope: !1935)
!1938 = !DILocation(line: 113, column: 7, scope: !1936)
!1939 = !DILocation(line: 114, column: 4, scope: !1935)
!1940 = !DILocation(line: 116, column: 7, scope: !1941)
!1941 = distinct !DILexicalBlock(scope: !1936, file: !393, line: 116, column: 7)
!1942 = !DILocation(line: 116, column: 11, scope: !1941)
!1943 = !DILocation(line: 116, column: 17, scope: !1941)
!1944 = !DILocation(line: 116, column: 15, scope: !1941)
!1945 = !DILocation(line: 116, column: 7, scope: !1936)
!1946 = !DILocation(line: 117, column: 4, scope: !1941)
!1947 = !DILocation(line: 119, column: 13, scope: !1936)
!1948 = !DILocation(line: 119, column: 18, scope: !1936)
!1949 = !{!1950, !748, i64 2}
!1950 = !{!"vlan_hdr", !748, i64 0, !748, i64 2}
!1951 = !DILocation(line: 119, column: 11, scope: !1936)
!1952 = !DILocation(line: 120, column: 7, scope: !1953)
!1953 = distinct !DILexicalBlock(scope: !1936, file: !393, line: 120, column: 7)
!1954 = !DILocation(line: 120, column: 7, scope: !1936)
!1955 = !DILocation(line: 122, column: 6, scope: !1953)
!1956 = !{!1950, !748, i64 0}
!1957 = !DILocation(line: 122, column: 33, scope: !1953)
!1958 = !DILocation(line: 122, column: 5, scope: !1953)
!1959 = !DILocation(line: 121, column: 4, scope: !1953)
!1960 = !DILocation(line: 121, column: 11, scope: !1953)
!1961 = !DILocation(line: 121, column: 14, scope: !1953)
!1962 = !DILocation(line: 121, column: 17, scope: !1953)
!1963 = !DILocation(line: 124, column: 6, scope: !1936)
!1964 = !DILocation(line: 125, column: 2, scope: !1936)
!1965 = !DILocation(line: 112, column: 35, scope: !1931)
!1966 = !DILocation(line: 112, column: 2, scope: !1931)
!1967 = distinct !{!1967, !1933, !1968, !1969, !1970}
!1968 = !DILocation(line: 125, column: 2, scope: !1928)
!1969 = !{!"llvm.loop.mustprogress"}
!1970 = !{!"llvm.loop.unroll.enable"}
!1971 = !DILocation(line: 127, column: 12, scope: !1864)
!1972 = !DILocation(line: 127, column: 2, scope: !1864)
!1973 = !DILocation(line: 127, column: 6, scope: !1864)
!1974 = !DILocation(line: 127, column: 10, scope: !1864)
!1975 = !DILocation(line: 128, column: 9, scope: !1864)
!1976 = !DILocation(line: 128, column: 2, scope: !1864)
!1977 = !DILocation(line: 129, column: 1, scope: !1864)
!1978 = distinct !DISubprogram(name: "proto_is_vlan", scope: !393, file: !393, line: 75, type: !1979, scopeLine: 76, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1981)
!1979 = !DISubroutineType(types: !1980)
!1980 = !{!136, !96}
!1981 = !{!1982}
!1982 = !DILocalVariable(name: "h_proto", arg: 1, scope: !1978, file: !393, line: 75, type: !96)
!1983 = !DILocation(line: 75, column: 48, scope: !1978)
!1984 = !DILocation(line: 77, column: 12, scope: !1978)
!1985 = !DILocation(line: 77, column: 20, scope: !1978)
!1986 = !DILocation(line: 77, column: 46, scope: !1978)
!1987 = !DILocation(line: 78, column: 5, scope: !1978)
!1988 = !DILocation(line: 78, column: 13, scope: !1978)
!1989 = !DILocation(line: 77, column: 10, scope: !1978)
!1990 = !DILocation(line: 77, column: 9, scope: !1978)
!1991 = !DILocation(line: 77, column: 2, scope: !1978)
!1992 = distinct !DISubprogram(name: "skip_ip6hdrext", scope: !393, file: !393, line: 139, type: !1993, scopeLine: 142, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !1995)
!1993 = !DISubroutineType(types: !1994)
!1994 = !{!136, !1340, !94, !102}
!1995 = !{!1996, !1997, !1998, !1999, !2001}
!1996 = !DILocalVariable(name: "nh", arg: 1, scope: !1992, file: !393, line: 139, type: !1340)
!1997 = !DILocalVariable(name: "data_end", arg: 2, scope: !1992, file: !393, line: 140, type: !94)
!1998 = !DILocalVariable(name: "next_hdr_type", arg: 3, scope: !1992, file: !393, line: 141, type: !102)
!1999 = !DILocalVariable(name: "i", scope: !2000, file: !393, line: 143, type: !136)
!2000 = distinct !DILexicalBlock(scope: !1992, file: !393, line: 143, column: 2)
!2001 = !DILocalVariable(name: "hdr", scope: !2002, file: !393, line: 144, type: !2004)
!2002 = distinct !DILexicalBlock(scope: !2003, file: !393, line: 143, column: 47)
!2003 = distinct !DILexicalBlock(scope: !2000, file: !393, line: 143, column: 2)
!2004 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2005, size: 64)
!2005 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6_opt_hdr", file: !482, line: 63, size: 16, elements: !2006)
!2006 = !{!2007, !2008}
!2007 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !2005, file: !482, line: 64, baseType: !102, size: 8)
!2008 = !DIDerivedType(tag: DW_TAG_member, name: "hdrlen", scope: !2005, file: !482, line: 65, baseType: !102, size: 8, offset: 8)
!2009 = !DILocation(line: 139, column: 62, scope: !1992)
!2010 = !DILocation(line: 140, column: 14, scope: !1992)
!2011 = !DILocation(line: 141, column: 13, scope: !1992)
!2012 = !DILocation(line: 143, column: 7, scope: !2000)
!2013 = !DILocation(line: 143, column: 11, scope: !2000)
!2014 = !DILocation(line: 143, column: 18, scope: !2003)
!2015 = !DILocation(line: 143, column: 20, scope: !2003)
!2016 = !DILocation(line: 143, column: 2, scope: !2000)
!2017 = !DILocation(line: 144, column: 3, scope: !2002)
!2018 = !DILocation(line: 144, column: 24, scope: !2002)
!2019 = !DILocation(line: 144, column: 30, scope: !2002)
!2020 = !DILocation(line: 144, column: 34, scope: !2002)
!2021 = !DILocation(line: 146, column: 7, scope: !2022)
!2022 = distinct !DILexicalBlock(scope: !2002, file: !393, line: 146, column: 7)
!2023 = !DILocation(line: 146, column: 11, scope: !2022)
!2024 = !DILocation(line: 146, column: 17, scope: !2022)
!2025 = !DILocation(line: 146, column: 15, scope: !2022)
!2026 = !DILocation(line: 146, column: 7, scope: !2002)
!2027 = !DILocation(line: 147, column: 4, scope: !2022)
!2028 = !DILocation(line: 149, column: 11, scope: !2002)
!2029 = !DILocation(line: 149, column: 3, scope: !2002)
!2030 = !DILocation(line: 154, column: 22, scope: !2031)
!2031 = distinct !DILexicalBlock(scope: !2002, file: !393, line: 149, column: 26)
!2032 = !DILocation(line: 154, column: 29, scope: !2031)
!2033 = !DILocation(line: 154, column: 34, scope: !2031)
!2034 = !{!2035, !401, i64 1}
!2035 = !{!"ipv6_opt_hdr", !401, i64 0, !401, i64 1}
!2036 = !DILocation(line: 154, column: 41, scope: !2031)
!2037 = !DILocation(line: 154, column: 46, scope: !2031)
!2038 = !DILocation(line: 154, column: 26, scope: !2031)
!2039 = !DILocation(line: 154, column: 4, scope: !2031)
!2040 = !DILocation(line: 154, column: 8, scope: !2031)
!2041 = !DILocation(line: 154, column: 12, scope: !2031)
!2042 = !DILocation(line: 155, column: 20, scope: !2031)
!2043 = !DILocation(line: 155, column: 25, scope: !2031)
!2044 = !{!2035, !401, i64 0}
!2045 = !DILocation(line: 155, column: 18, scope: !2031)
!2046 = !DILocation(line: 156, column: 4, scope: !2031)
!2047 = !DILocation(line: 158, column: 22, scope: !2031)
!2048 = !DILocation(line: 158, column: 29, scope: !2031)
!2049 = !DILocation(line: 158, column: 34, scope: !2031)
!2050 = !DILocation(line: 158, column: 41, scope: !2031)
!2051 = !DILocation(line: 158, column: 46, scope: !2031)
!2052 = !DILocation(line: 158, column: 26, scope: !2031)
!2053 = !DILocation(line: 158, column: 4, scope: !2031)
!2054 = !DILocation(line: 158, column: 8, scope: !2031)
!2055 = !DILocation(line: 158, column: 12, scope: !2031)
!2056 = !DILocation(line: 159, column: 20, scope: !2031)
!2057 = !DILocation(line: 159, column: 25, scope: !2031)
!2058 = !DILocation(line: 159, column: 18, scope: !2031)
!2059 = !DILocation(line: 160, column: 4, scope: !2031)
!2060 = !DILocation(line: 162, column: 22, scope: !2031)
!2061 = !DILocation(line: 162, column: 26, scope: !2031)
!2062 = !DILocation(line: 162, column: 4, scope: !2031)
!2063 = !DILocation(line: 162, column: 8, scope: !2031)
!2064 = !DILocation(line: 162, column: 12, scope: !2031)
!2065 = !DILocation(line: 163, column: 20, scope: !2031)
!2066 = !DILocation(line: 163, column: 25, scope: !2031)
!2067 = !DILocation(line: 163, column: 18, scope: !2031)
!2068 = !DILocation(line: 164, column: 4, scope: !2031)
!2069 = !DILocation(line: 167, column: 11, scope: !2031)
!2070 = !DILocation(line: 167, column: 4, scope: !2031)
!2071 = !DILocation(line: 169, column: 2, scope: !2003)
!2072 = !DILocation(line: 169, column: 2, scope: !2002)
!2073 = !DILocation(line: 143, column: 42, scope: !2003)
!2074 = !DILocation(line: 143, column: 2, scope: !2003)
!2075 = distinct !{!2075, !2016, !2076, !1969}
!2076 = !DILocation(line: 169, column: 2, scope: !2000)
!2077 = !DILocation(line: 171, column: 2, scope: !1992)
!2078 = !DILocation(line: 172, column: 1, scope: !1992)
!2079 = distinct !DISubprogram(name: "parse_tcphdr", scope: !393, file: !393, line: 295, type: !2080, scopeLine: 298, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2083)
!2080 = !DISubroutineType(types: !2081)
!2081 = !{!136, !1340, !94, !2082}
!2082 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !573, size: 64)
!2083 = !{!2084, !2085, !2086, !2087, !2088}
!2084 = !DILocalVariable(name: "nh", arg: 1, scope: !2079, file: !393, line: 295, type: !1340)
!2085 = !DILocalVariable(name: "data_end", arg: 2, scope: !2079, file: !393, line: 296, type: !94)
!2086 = !DILocalVariable(name: "tcphdr", arg: 3, scope: !2079, file: !393, line: 297, type: !2082)
!2087 = !DILocalVariable(name: "len", scope: !2079, file: !393, line: 299, type: !136)
!2088 = !DILocalVariable(name: "h", scope: !2079, file: !393, line: 300, type: !573)
!2089 = !DILocation(line: 295, column: 60, scope: !2079)
!2090 = !DILocation(line: 296, column: 12, scope: !2079)
!2091 = !DILocation(line: 297, column: 22, scope: !2079)
!2092 = !DILocation(line: 299, column: 2, scope: !2079)
!2093 = !DILocation(line: 299, column: 6, scope: !2079)
!2094 = !DILocation(line: 300, column: 2, scope: !2079)
!2095 = !DILocation(line: 300, column: 17, scope: !2079)
!2096 = !DILocation(line: 300, column: 21, scope: !2079)
!2097 = !DILocation(line: 300, column: 25, scope: !2079)
!2098 = !DILocation(line: 302, column: 6, scope: !2099)
!2099 = distinct !DILexicalBlock(scope: !2079, file: !393, line: 302, column: 6)
!2100 = !DILocation(line: 302, column: 8, scope: !2099)
!2101 = !DILocation(line: 302, column: 14, scope: !2099)
!2102 = !DILocation(line: 302, column: 12, scope: !2099)
!2103 = !DILocation(line: 302, column: 6, scope: !2079)
!2104 = !DILocation(line: 303, column: 3, scope: !2099)
!2105 = !DILocation(line: 305, column: 8, scope: !2079)
!2106 = !DILocation(line: 305, column: 11, scope: !2079)
!2107 = !DILocation(line: 305, column: 16, scope: !2079)
!2108 = !DILocation(line: 305, column: 6, scope: !2079)
!2109 = !DILocation(line: 307, column: 5, scope: !2110)
!2110 = distinct !DILexicalBlock(scope: !2079, file: !393, line: 307, column: 5)
!2111 = !DILocation(line: 307, column: 9, scope: !2110)
!2112 = !DILocation(line: 307, column: 5, scope: !2079)
!2113 = !DILocation(line: 308, column: 3, scope: !2110)
!2114 = !DILocation(line: 311, column: 6, scope: !2115)
!2115 = distinct !DILexicalBlock(scope: !2079, file: !393, line: 311, column: 6)
!2116 = !DILocation(line: 311, column: 10, scope: !2115)
!2117 = !DILocation(line: 311, column: 16, scope: !2115)
!2118 = !DILocation(line: 311, column: 14, scope: !2115)
!2119 = !DILocation(line: 311, column: 22, scope: !2115)
!2120 = !DILocation(line: 311, column: 20, scope: !2115)
!2121 = !DILocation(line: 311, column: 6, scope: !2079)
!2122 = !DILocation(line: 312, column: 3, scope: !2115)
!2123 = !DILocation(line: 314, column: 13, scope: !2079)
!2124 = !DILocation(line: 314, column: 2, scope: !2079)
!2125 = !DILocation(line: 314, column: 6, scope: !2079)
!2126 = !DILocation(line: 314, column: 10, scope: !2079)
!2127 = !DILocation(line: 315, column: 12, scope: !2079)
!2128 = !DILocation(line: 315, column: 3, scope: !2079)
!2129 = !DILocation(line: 315, column: 10, scope: !2079)
!2130 = !DILocation(line: 317, column: 9, scope: !2079)
!2131 = !DILocation(line: 317, column: 2, scope: !2079)
!2132 = !DILocation(line: 318, column: 1, scope: !2079)
!2133 = distinct !DISubprogram(name: "parse_tcp_ts", scope: !3, file: !3, line: 138, type: !2134, scopeLine: 140, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2136)
!2134 = !DISubroutineType(types: !2135)
!2135 = !{!136, !573, !94, !103, !103}
!2136 = !{!2137, !2138, !2139, !2140, !2141, !2142, !2143, !2144, !2145, !2146}
!2137 = !DILocalVariable(name: "tcph", arg: 1, scope: !2133, file: !3, line: 138, type: !573)
!2138 = !DILocalVariable(name: "data_end", arg: 2, scope: !2133, file: !3, line: 138, type: !94)
!2139 = !DILocalVariable(name: "tsval", arg: 3, scope: !2133, file: !3, line: 138, type: !103)
!2140 = !DILocalVariable(name: "tsecr", arg: 4, scope: !2133, file: !3, line: 139, type: !103)
!2141 = !DILocalVariable(name: "len", scope: !2133, file: !3, line: 141, type: !136)
!2142 = !DILocalVariable(name: "opt_end", scope: !2133, file: !3, line: 142, type: !94)
!2143 = !DILocalVariable(name: "pos", scope: !2133, file: !3, line: 143, type: !101)
!2144 = !DILocalVariable(name: "i", scope: !2133, file: !3, line: 144, type: !102)
!2145 = !DILocalVariable(name: "opt", scope: !2133, file: !3, line: 144, type: !102)
!2146 = !DILocalVariable(name: "opt_size", scope: !2133, file: !3, line: 146, type: !2147)
!2147 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !102)
!2148 = !DILocation(line: 138, column: 40, scope: !2133)
!2149 = !DILocation(line: 138, column: 52, scope: !2133)
!2150 = !DILocation(line: 138, column: 69, scope: !2133)
!2151 = !DILocation(line: 139, column: 11, scope: !2133)
!2152 = !DILocation(line: 141, column: 2, scope: !2133)
!2153 = !DILocation(line: 141, column: 6, scope: !2133)
!2154 = !DILocation(line: 141, column: 12, scope: !2133)
!2155 = !DILocation(line: 141, column: 18, scope: !2133)
!2156 = !DILocation(line: 141, column: 23, scope: !2133)
!2157 = !DILocation(line: 142, column: 2, scope: !2133)
!2158 = !DILocation(line: 142, column: 8, scope: !2133)
!2159 = !DILocation(line: 142, column: 26, scope: !2133)
!2160 = !DILocation(line: 142, column: 33, scope: !2133)
!2161 = !DILocation(line: 142, column: 31, scope: !2133)
!2162 = !DILocation(line: 143, column: 2, scope: !2133)
!2163 = !DILocation(line: 143, column: 8, scope: !2133)
!2164 = !DILocation(line: 143, column: 23, scope: !2133)
!2165 = !DILocation(line: 143, column: 28, scope: !2133)
!2166 = !DILocation(line: 144, column: 2, scope: !2133)
!2167 = !DILocation(line: 144, column: 7, scope: !2133)
!2168 = !DILocation(line: 144, column: 10, scope: !2133)
!2169 = !DILocation(line: 145, column: 2, scope: !2133)
!2170 = !DILocation(line: 146, column: 3, scope: !2133)
!2171 = !DILocation(line: 148, column: 6, scope: !2172)
!2172 = distinct !DILexicalBlock(scope: !2133, file: !3, line: 148, column: 6)
!2173 = !DILocation(line: 148, column: 11, scope: !2172)
!2174 = !DILocation(line: 148, column: 17, scope: !2172)
!2175 = !DILocation(line: 148, column: 15, scope: !2172)
!2176 = !DILocation(line: 148, column: 26, scope: !2172)
!2177 = !DILocation(line: 148, column: 29, scope: !2172)
!2178 = !DILocation(line: 148, column: 33, scope: !2172)
!2179 = !DILocation(line: 148, column: 6, scope: !2133)
!2180 = !DILocation(line: 149, column: 3, scope: !2172)
!2181 = !DILocation(line: 151, column: 9, scope: !2182)
!2182 = distinct !DILexicalBlock(scope: !2133, file: !3, line: 151, column: 2)
!2183 = !DILocation(line: 151, column: 7, scope: !2182)
!2184 = !DILocation(line: 151, column: 14, scope: !2185)
!2185 = distinct !DILexicalBlock(scope: !2182, file: !3, line: 151, column: 2)
!2186 = !DILocation(line: 151, column: 16, scope: !2185)
!2187 = !DILocation(line: 151, column: 2, scope: !2182)
!2188 = !DILocation(line: 152, column: 7, scope: !2189)
!2189 = distinct !DILexicalBlock(scope: !2190, file: !3, line: 152, column: 7)
!2190 = distinct !DILexicalBlock(scope: !2185, file: !3, line: 151, column: 40)
!2191 = !DILocation(line: 152, column: 11, scope: !2189)
!2192 = !DILocation(line: 152, column: 17, scope: !2189)
!2193 = !DILocation(line: 152, column: 15, scope: !2189)
!2194 = !DILocation(line: 152, column: 25, scope: !2189)
!2195 = !DILocation(line: 152, column: 28, scope: !2189)
!2196 = !DILocation(line: 152, column: 32, scope: !2189)
!2197 = !DILocation(line: 152, column: 38, scope: !2189)
!2198 = !DILocation(line: 152, column: 36, scope: !2189)
!2199 = !DILocation(line: 152, column: 7, scope: !2190)
!2200 = !DILocation(line: 153, column: 4, scope: !2189)
!2201 = !DILocation(line: 155, column: 10, scope: !2190)
!2202 = !DILocation(line: 155, column: 9, scope: !2190)
!2203 = !DILocation(line: 155, column: 7, scope: !2190)
!2204 = !DILocation(line: 156, column: 7, scope: !2205)
!2205 = distinct !DILexicalBlock(scope: !2190, file: !3, line: 156, column: 7)
!2206 = !DILocation(line: 156, column: 11, scope: !2205)
!2207 = !DILocation(line: 156, column: 7, scope: !2190)
!2208 = !DILocation(line: 157, column: 4, scope: !2205)
!2209 = !DILocation(line: 159, column: 7, scope: !2210)
!2210 = distinct !DILexicalBlock(scope: !2190, file: !3, line: 159, column: 7)
!2211 = !DILocation(line: 159, column: 11, scope: !2210)
!2212 = !DILocation(line: 159, column: 7, scope: !2190)
!2213 = !DILocation(line: 160, column: 7, scope: !2214)
!2214 = distinct !DILexicalBlock(scope: !2210, file: !3, line: 159, column: 17)
!2215 = !DILocation(line: 161, column: 4, scope: !2214)
!2216 = !DILocation(line: 165, column: 7, scope: !2217)
!2217 = distinct !DILexicalBlock(scope: !2190, file: !3, line: 165, column: 7)
!2218 = !DILocation(line: 165, column: 11, scope: !2217)
!2219 = !DILocation(line: 165, column: 17, scope: !2217)
!2220 = !DILocation(line: 165, column: 15, scope: !2217)
!2221 = !DILocation(line: 165, column: 25, scope: !2217)
!2222 = !DILocation(line: 165, column: 28, scope: !2217)
!2223 = !DILocation(line: 165, column: 32, scope: !2217)
!2224 = !DILocation(line: 165, column: 38, scope: !2217)
!2225 = !DILocation(line: 165, column: 36, scope: !2217)
!2226 = !DILocation(line: 165, column: 7, scope: !2190)
!2227 = !DILocation(line: 166, column: 4, scope: !2217)
!2228 = !DILocation(line: 167, column: 16, scope: !2190)
!2229 = !DILocation(line: 167, column: 20, scope: !2190)
!2230 = !DILocation(line: 167, column: 14, scope: !2190)
!2231 = !DILocation(line: 167, column: 12, scope: !2190)
!2232 = !DILocation(line: 168, column: 7, scope: !2233)
!2233 = distinct !DILexicalBlock(scope: !2190, file: !3, line: 168, column: 7)
!2234 = !DILocation(line: 168, column: 16, scope: !2233)
!2235 = !DILocation(line: 168, column: 7, scope: !2190)
!2236 = !DILocation(line: 169, column: 4, scope: !2233)
!2237 = !DILocation(line: 172, column: 7, scope: !2238)
!2238 = distinct !DILexicalBlock(scope: !2190, file: !3, line: 172, column: 7)
!2239 = !DILocation(line: 172, column: 11, scope: !2238)
!2240 = !DILocation(line: 172, column: 16, scope: !2238)
!2241 = !DILocation(line: 172, column: 19, scope: !2238)
!2242 = !DILocation(line: 172, column: 28, scope: !2238)
!2243 = !DILocation(line: 172, column: 7, scope: !2190)
!2244 = !DILocation(line: 173, column: 8, scope: !2245)
!2245 = distinct !DILexicalBlock(scope: !2246, file: !3, line: 173, column: 8)
!2246 = distinct !DILexicalBlock(scope: !2238, file: !3, line: 172, column: 35)
!2247 = !DILocation(line: 173, column: 12, scope: !2245)
!2248 = !DILocation(line: 173, column: 19, scope: !2245)
!2249 = !DILocation(line: 173, column: 17, scope: !2245)
!2250 = !DILocation(line: 173, column: 27, scope: !2245)
!2251 = !DILocation(line: 173, column: 30, scope: !2245)
!2252 = !DILocation(line: 173, column: 34, scope: !2245)
!2253 = !DILocation(line: 173, column: 41, scope: !2245)
!2254 = !DILocation(line: 173, column: 39, scope: !2245)
!2255 = !DILocation(line: 173, column: 8, scope: !2246)
!2256 = !DILocation(line: 174, column: 5, scope: !2245)
!2257 = !DILocation(line: 175, column: 24, scope: !2246)
!2258 = !DILocation(line: 175, column: 28, scope: !2246)
!2259 = !DILocation(line: 175, column: 13, scope: !2246)
!2260 = !DILocation(line: 175, column: 5, scope: !2246)
!2261 = !DILocation(line: 175, column: 11, scope: !2246)
!2262 = !DILocation(line: 176, column: 24, scope: !2246)
!2263 = !DILocation(line: 176, column: 28, scope: !2246)
!2264 = !DILocation(line: 176, column: 13, scope: !2246)
!2265 = !DILocation(line: 176, column: 5, scope: !2246)
!2266 = !DILocation(line: 176, column: 11, scope: !2246)
!2267 = !DILocation(line: 177, column: 4, scope: !2246)
!2268 = !DILocation(line: 181, column: 10, scope: !2190)
!2269 = !DILocation(line: 181, column: 7, scope: !2190)
!2270 = !DILocation(line: 182, column: 2, scope: !2190)
!2271 = !DILocation(line: 151, column: 36, scope: !2185)
!2272 = !DILocation(line: 151, column: 2, scope: !2185)
!2273 = distinct !{!2273, !2187, !2274, !1969, !1970}
!2274 = !DILocation(line: 182, column: 2, scope: !2182)
!2275 = !DILocation(line: 183, column: 2, scope: !2133)
!2276 = !DILocation(line: 184, column: 1, scope: !2133)
!2277 = distinct !DISubprogram(name: "parse_icmp6hdr", scope: !393, file: !393, line: 224, type: !2278, scopeLine: 227, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2281)
!2278 = !DISubroutineType(types: !2279)
!2279 = !{!136, !1340, !94, !2280}
!2280 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !534, size: 64)
!2281 = !{!2282, !2283, !2284, !2285}
!2282 = !DILocalVariable(name: "nh", arg: 1, scope: !2277, file: !393, line: 224, type: !1340)
!2283 = !DILocalVariable(name: "data_end", arg: 2, scope: !2277, file: !393, line: 225, type: !94)
!2284 = !DILocalVariable(name: "icmp6hdr", arg: 3, scope: !2277, file: !393, line: 226, type: !2280)
!2285 = !DILocalVariable(name: "icmp6h", scope: !2277, file: !393, line: 228, type: !534)
!2286 = !DILocation(line: 224, column: 62, scope: !2277)
!2287 = !DILocation(line: 225, column: 14, scope: !2277)
!2288 = !DILocation(line: 226, column: 26, scope: !2277)
!2289 = !DILocation(line: 228, column: 2, scope: !2277)
!2290 = !DILocation(line: 228, column: 19, scope: !2277)
!2291 = !DILocation(line: 228, column: 28, scope: !2277)
!2292 = !DILocation(line: 228, column: 32, scope: !2277)
!2293 = !DILocation(line: 230, column: 6, scope: !2294)
!2294 = distinct !DILexicalBlock(scope: !2277, file: !393, line: 230, column: 6)
!2295 = !DILocation(line: 230, column: 13, scope: !2294)
!2296 = !DILocation(line: 230, column: 19, scope: !2294)
!2297 = !DILocation(line: 230, column: 17, scope: !2294)
!2298 = !DILocation(line: 230, column: 6, scope: !2277)
!2299 = !DILocation(line: 231, column: 3, scope: !2294)
!2300 = !DILocation(line: 233, column: 14, scope: !2277)
!2301 = !DILocation(line: 233, column: 21, scope: !2277)
!2302 = !DILocation(line: 233, column: 2, scope: !2277)
!2303 = !DILocation(line: 233, column: 6, scope: !2277)
!2304 = !DILocation(line: 233, column: 12, scope: !2277)
!2305 = !DILocation(line: 234, column: 14, scope: !2277)
!2306 = !DILocation(line: 234, column: 3, scope: !2277)
!2307 = !DILocation(line: 234, column: 12, scope: !2277)
!2308 = !DILocation(line: 236, column: 9, scope: !2277)
!2309 = !DILocation(line: 236, column: 17, scope: !2277)
!2310 = !DILocation(line: 236, column: 2, scope: !2277)
!2311 = !DILocation(line: 237, column: 1, scope: !2277)
!2312 = distinct !DISubprogram(name: "parse_icmphdr", scope: !393, file: !393, line: 239, type: !2313, scopeLine: 242, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2316)
!2313 = !DISubroutineType(types: !2314)
!2314 = !{!136, !1340, !94, !2315}
!2315 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !510, size: 64)
!2316 = !{!2317, !2318, !2319, !2320}
!2317 = !DILocalVariable(name: "nh", arg: 1, scope: !2312, file: !393, line: 239, type: !1340)
!2318 = !DILocalVariable(name: "data_end", arg: 2, scope: !2312, file: !393, line: 240, type: !94)
!2319 = !DILocalVariable(name: "icmphdr", arg: 3, scope: !2312, file: !393, line: 241, type: !2315)
!2320 = !DILocalVariable(name: "icmph", scope: !2312, file: !393, line: 243, type: !510)
!2321 = !DILocation(line: 239, column: 61, scope: !2312)
!2322 = !DILocation(line: 240, column: 13, scope: !2312)
!2323 = !DILocation(line: 241, column: 24, scope: !2312)
!2324 = !DILocation(line: 243, column: 2, scope: !2312)
!2325 = !DILocation(line: 243, column: 18, scope: !2312)
!2326 = !DILocation(line: 243, column: 26, scope: !2312)
!2327 = !DILocation(line: 243, column: 30, scope: !2312)
!2328 = !DILocation(line: 245, column: 6, scope: !2329)
!2329 = distinct !DILexicalBlock(scope: !2312, file: !393, line: 245, column: 6)
!2330 = !DILocation(line: 245, column: 12, scope: !2329)
!2331 = !DILocation(line: 245, column: 18, scope: !2329)
!2332 = !DILocation(line: 245, column: 16, scope: !2329)
!2333 = !DILocation(line: 245, column: 6, scope: !2312)
!2334 = !DILocation(line: 246, column: 3, scope: !2329)
!2335 = !DILocation(line: 248, column: 13, scope: !2312)
!2336 = !DILocation(line: 248, column: 19, scope: !2312)
!2337 = !DILocation(line: 248, column: 2, scope: !2312)
!2338 = !DILocation(line: 248, column: 6, scope: !2312)
!2339 = !DILocation(line: 248, column: 11, scope: !2312)
!2340 = !DILocation(line: 249, column: 13, scope: !2312)
!2341 = !DILocation(line: 249, column: 3, scope: !2312)
!2342 = !DILocation(line: 249, column: 11, scope: !2312)
!2343 = !DILocation(line: 251, column: 9, scope: !2312)
!2344 = !DILocation(line: 251, column: 16, scope: !2312)
!2345 = !DILocation(line: 251, column: 2, scope: !2312)
!2346 = !DILocation(line: 252, column: 1, scope: !2312)
!2347 = distinct !DISubprogram(name: "create_flow", scope: !3, file: !3, line: 478, type: !1083, scopeLine: 479, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2348)
!2348 = !{!2349, !2350, !2351}
!2349 = !DILocalVariable(name: "ctx", arg: 1, scope: !2347, file: !3, line: 478, type: !94)
!2350 = !DILocalVariable(name: "p_info", arg: 2, scope: !2347, file: !3, line: 478, type: !716)
!2351 = !DILocalVariable(name: "new_state", scope: !2347, file: !3, line: 480, type: !175)
!2352 = !DILocation(line: 478, column: 45, scope: !2347)
!2353 = !DILocation(line: 478, column: 70, scope: !2347)
!2354 = !DILocation(line: 480, column: 2, scope: !2347)
!2355 = !DILocation(line: 480, column: 20, scope: !2347)
!2356 = !DILocation(line: 482, column: 29, scope: !2347)
!2357 = !DILocation(line: 482, column: 37, scope: !2347)
!2358 = !DILocation(line: 482, column: 12, scope: !2347)
!2359 = !DILocation(line: 482, column: 27, scope: !2347)
!2360 = !DILocation(line: 483, column: 29, scope: !2347)
!2361 = !DILocation(line: 483, column: 37, scope: !2347)
!2362 = !DILocation(line: 483, column: 48, scope: !2347)
!2363 = !DILocation(line: 484, column: 13, scope: !2347)
!2364 = !DILocation(line: 484, column: 21, scope: !2347)
!2365 = !DILocation(line: 483, column: 12, scope: !2347)
!2366 = !DILocation(line: 483, column: 27, scope: !2347)
!2367 = !{!982, !401, i64 61}
!2368 = !DILocation(line: 487, column: 6, scope: !2369)
!2369 = distinct !DILexicalBlock(scope: !2347, file: !3, line: 487, column: 6)
!2370 = !DILocation(line: 487, column: 40, scope: !2369)
!2371 = !DILocation(line: 487, column: 48, scope: !2369)
!2372 = !DILocation(line: 487, column: 52, scope: !2369)
!2373 = !DILocation(line: 488, column: 18, scope: !2369)
!2374 = !DILocation(line: 487, column: 6, scope: !2347)
!2375 = !DILocation(line: 489, column: 23, scope: !2376)
!2376 = distinct !DILexicalBlock(scope: !2369, file: !3, line: 488, column: 24)
!2377 = !DILocation(line: 489, column: 28, scope: !2376)
!2378 = !DILocation(line: 489, column: 3, scope: !2376)
!2379 = !DILocation(line: 490, column: 3, scope: !2376)
!2380 = !DILocation(line: 493, column: 9, scope: !2347)
!2381 = !DILocation(line: 493, column: 43, scope: !2347)
!2382 = !DILocation(line: 493, column: 51, scope: !2347)
!2383 = !DILocation(line: 493, column: 55, scope: !2347)
!2384 = !DILocation(line: 493, column: 2, scope: !2347)
!2385 = !DILocation(line: 494, column: 1, scope: !2347)
!2386 = distinct !DISubprogram(name: "send_map_full_event", scope: !3, file: !3, line: 454, type: !2387, scopeLine: 456, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2389)
!2387 = !DISubroutineType(types: !2388)
!2388 = !{null, !94, !716, !67}
!2389 = !{!2390, !2391, !2392, !2393}
!2390 = !DILocalVariable(name: "ctx", arg: 1, scope: !2386, file: !3, line: 454, type: !94)
!2391 = !DILocalVariable(name: "p_info", arg: 2, scope: !2386, file: !3, line: 454, type: !716)
!2392 = !DILocalVariable(name: "map", arg: 3, scope: !2386, file: !3, line: 455, type: !67)
!2393 = !DILocalVariable(name: "me", scope: !2386, file: !3, line: 457, type: !2394)
!2394 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "map_full_event", file: !15, line: 146, size: 512, elements: !2395)
!2395 = !{!2396, !2397, !2398, !2399, !2400}
!2396 = !DIDerivedType(tag: DW_TAG_member, name: "event_type", scope: !2394, file: !15, line: 147, baseType: !159, size: 64)
!2397 = !DIDerivedType(tag: DW_TAG_member, name: "timestamp", scope: !2394, file: !15, line: 148, baseType: !159, size: 64, offset: 64)
!2398 = !DIDerivedType(tag: DW_TAG_member, name: "flow", scope: !2394, file: !15, line: 149, baseType: !144, size: 352, offset: 128)
!2399 = !DIDerivedType(tag: DW_TAG_member, name: "map", scope: !2394, file: !15, line: 150, baseType: !67, size: 8, offset: 480)
!2400 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !2394, file: !15, line: 151, baseType: !487, size: 24, offset: 488)
!2401 = !DILocation(line: 454, column: 39, scope: !2386)
!2402 = !DILocation(line: 454, column: 64, scope: !2386)
!2403 = !DILocation(line: 455, column: 20, scope: !2386)
!2404 = !DILocation(line: 457, column: 2, scope: !2386)
!2405 = !DILocation(line: 457, column: 24, scope: !2386)
!2406 = !DILocation(line: 459, column: 6, scope: !2407)
!2407 = distinct !DILexicalBlock(scope: !2386, file: !3, line: 459, column: 6)
!2408 = !DILocation(line: 459, column: 14, scope: !2407)
!2409 = !DILocation(line: 459, column: 36, scope: !2407)
!2410 = !DILocation(line: 459, column: 21, scope: !2407)
!2411 = !DILocation(line: 459, column: 19, scope: !2407)
!2412 = !DILocation(line: 459, column: 41, scope: !2407)
!2413 = !DILocation(line: 460, column: 6, scope: !2407)
!2414 = !DILocation(line: 460, column: 14, scope: !2407)
!2415 = !DILocation(line: 460, column: 36, scope: !2407)
!2416 = !DILocation(line: 460, column: 21, scope: !2407)
!2417 = !DILocation(line: 460, column: 19, scope: !2407)
!2418 = !DILocation(line: 460, column: 41, scope: !2407)
!2419 = !DILocation(line: 459, column: 6, scope: !2386)
!2420 = !DILocation(line: 461, column: 3, scope: !2407)
!2421 = !DILocation(line: 463, column: 24, scope: !2386)
!2422 = !DILocation(line: 463, column: 32, scope: !2386)
!2423 = !DILocation(line: 463, column: 17, scope: !2386)
!2424 = !DILocation(line: 463, column: 2, scope: !2386)
!2425 = !DILocation(line: 463, column: 22, scope: !2386)
!2426 = !DILocation(line: 465, column: 2, scope: !2386)
!2427 = !DILocation(line: 466, column: 5, scope: !2386)
!2428 = !DILocation(line: 466, column: 16, scope: !2386)
!2429 = !{!2430, !412, i64 0}
!2430 = !{!"map_full_event", !412, i64 0, !412, i64 8, !745, i64 16, !401, i64 60, !401, i64 61}
!2431 = !DILocation(line: 467, column: 17, scope: !2386)
!2432 = !DILocation(line: 467, column: 25, scope: !2386)
!2433 = !DILocation(line: 467, column: 5, scope: !2386)
!2434 = !DILocation(line: 467, column: 15, scope: !2386)
!2435 = !{!2430, !412, i64 8}
!2436 = !DILocation(line: 468, column: 5, scope: !2386)
!2437 = !DILocation(line: 468, column: 12, scope: !2386)
!2438 = !DILocation(line: 468, column: 20, scope: !2386)
!2439 = !DILocation(line: 468, column: 24, scope: !2386)
!2440 = !DILocation(line: 469, column: 11, scope: !2386)
!2441 = !DILocation(line: 469, column: 5, scope: !2386)
!2442 = !DILocation(line: 469, column: 9, scope: !2386)
!2443 = !{!2430, !401, i64 60}
!2444 = !DILocation(line: 471, column: 2, scope: !2386)
!2445 = !DILocation(line: 471, column: 24, scope: !2386)
!2446 = !DILocation(line: 472, column: 1, scope: !2386)
!2447 = distinct !DISubprogram(name: "is_local_address", scope: !3, file: !3, line: 577, type: !2448, scopeLine: 579, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2450)
!2448 = !DISubroutineType(types: !2449)
!2449 = !{!186, !716, !94, !441}
!2450 = !{!2451, !2452, !2453, !2454, !2455, !2456, !2460}
!2451 = !DILocalVariable(name: "p_info", arg: 1, scope: !2447, file: !3, line: 577, type: !716)
!2452 = !DILocalVariable(name: "ctx", arg: 2, scope: !2447, file: !3, line: 577, type: !94)
!2453 = !DILocalVariable(name: "pctx", arg: 3, scope: !2447, file: !3, line: 578, type: !441)
!2454 = !DILocalVariable(name: "ret", scope: !2447, file: !3, line: 580, type: !136)
!2455 = !DILocalVariable(name: "lookup", scope: !2447, file: !3, line: 581, type: !248)
!2456 = !DILocalVariable(name: "src", scope: !2457, file: !3, line: 593, type: !105)
!2457 = distinct !DILexicalBlock(scope: !2458, file: !3, line: 592, column: 40)
!2458 = distinct !DILexicalBlock(scope: !2459, file: !3, line: 592, column: 13)
!2459 = distinct !DILexicalBlock(scope: !2447, file: !3, line: 587, column: 6)
!2460 = !DILocalVariable(name: "dst", scope: !2457, file: !3, line: 594, type: !105)
!2461 = !DILocation(line: 577, column: 50, scope: !2447)
!2462 = !DILocation(line: 577, column: 64, scope: !2447)
!2463 = !DILocation(line: 578, column: 33, scope: !2447)
!2464 = !DILocation(line: 580, column: 2, scope: !2447)
!2465 = !DILocation(line: 580, column: 6, scope: !2447)
!2466 = !DILocation(line: 581, column: 2, scope: !2447)
!2467 = !DILocation(line: 581, column: 24, scope: !2447)
!2468 = !DILocation(line: 582, column: 2, scope: !2447)
!2469 = !DILocation(line: 584, column: 19, scope: !2447)
!2470 = !DILocation(line: 584, column: 25, scope: !2447)
!2471 = !DILocation(line: 584, column: 9, scope: !2447)
!2472 = !DILocation(line: 584, column: 17, scope: !2447)
!2473 = !{!2474, !411, i64 8}
!2474 = !{!"bpf_fib_lookup", !401, i64 0, !401, i64 1, !748, i64 2, !748, i64 4, !748, i64 6, !411, i64 8, !401, i64 12, !401, i64 16, !401, i64 32, !748, i64 48, !748, i64 50, !401, i64 52, !401, i64 58}
!2475 = !DILocation(line: 585, column: 18, scope: !2447)
!2476 = !DILocation(line: 585, column: 26, scope: !2447)
!2477 = !DILocation(line: 585, column: 30, scope: !2447)
!2478 = !DILocation(line: 585, column: 35, scope: !2447)
!2479 = !DILocation(line: 585, column: 9, scope: !2447)
!2480 = !DILocation(line: 585, column: 16, scope: !2447)
!2481 = !{!2474, !401, i64 0}
!2482 = !DILocation(line: 587, column: 13, scope: !2459)
!2483 = !DILocation(line: 587, column: 6, scope: !2459)
!2484 = !DILocation(line: 587, column: 20, scope: !2459)
!2485 = !DILocation(line: 587, column: 6, scope: !2447)
!2486 = !DILocation(line: 588, column: 16, scope: !2487)
!2487 = distinct !DILexicalBlock(scope: !2459, file: !3, line: 587, column: 32)
!2488 = !DILocation(line: 588, column: 24, scope: !2487)
!2489 = !DILocation(line: 588, column: 29, scope: !2487)
!2490 = !{!1414, !401, i64 1}
!2491 = !DILocation(line: 588, column: 10, scope: !2487)
!2492 = !DILocation(line: 588, column: 14, scope: !2487)
!2493 = !DILocation(line: 589, column: 20, scope: !2487)
!2494 = !{!1414, !748, i64 2}
!2495 = !DILocation(line: 589, column: 10, scope: !2487)
!2496 = !DILocation(line: 589, column: 18, scope: !2487)
!2497 = !{!2474, !748, i64 6}
!2498 = !DILocation(line: 590, column: 21, scope: !2487)
!2499 = !DILocation(line: 590, column: 29, scope: !2487)
!2500 = !DILocation(line: 590, column: 34, scope: !2487)
!2501 = !DILocation(line: 590, column: 10, scope: !2487)
!2502 = !DILocation(line: 590, column: 19, scope: !2487)
!2503 = !DILocation(line: 591, column: 21, scope: !2487)
!2504 = !DILocation(line: 591, column: 29, scope: !2487)
!2505 = !DILocation(line: 591, column: 34, scope: !2487)
!2506 = !DILocation(line: 591, column: 10, scope: !2487)
!2507 = !DILocation(line: 591, column: 19, scope: !2487)
!2508 = !DILocation(line: 592, column: 2, scope: !2487)
!2509 = !DILocation(line: 592, column: 20, scope: !2458)
!2510 = !DILocation(line: 592, column: 13, scope: !2458)
!2511 = !DILocation(line: 592, column: 27, scope: !2458)
!2512 = !DILocation(line: 592, column: 13, scope: !2459)
!2513 = !DILocation(line: 593, column: 3, scope: !2457)
!2514 = !DILocation(line: 593, column: 20, scope: !2457)
!2515 = !DILocation(line: 593, column: 52, scope: !2457)
!2516 = !DILocation(line: 593, column: 45, scope: !2457)
!2517 = !DILocation(line: 594, column: 3, scope: !2457)
!2518 = !DILocation(line: 594, column: 20, scope: !2457)
!2519 = !DILocation(line: 594, column: 52, scope: !2457)
!2520 = !DILocation(line: 594, column: 45, scope: !2457)
!2521 = !DILocation(line: 596, column: 32, scope: !2457)
!2522 = !DILocation(line: 596, column: 40, scope: !2457)
!2523 = !DILocation(line: 596, column: 21, scope: !2457)
!2524 = !DILocation(line: 596, column: 45, scope: !2457)
!2525 = !DILocation(line: 596, column: 10, scope: !2457)
!2526 = !DILocation(line: 596, column: 19, scope: !2457)
!2527 = !DILocation(line: 597, column: 20, scope: !2457)
!2528 = !{!1459, !748, i64 4}
!2529 = !DILocation(line: 597, column: 10, scope: !2457)
!2530 = !DILocation(line: 597, column: 18, scope: !2457)
!2531 = !DILocation(line: 598, column: 4, scope: !2457)
!2532 = !DILocation(line: 598, column: 10, scope: !2457)
!2533 = !DILocation(line: 598, column: 18, scope: !2457)
!2534 = !DILocation(line: 598, column: 22, scope: !2457)
!2535 = !DILocation(line: 598, column: 27, scope: !2457)
!2536 = !DILocation(line: 598, column: 33, scope: !2457)
!2537 = !DILocation(line: 599, column: 4, scope: !2457)
!2538 = !DILocation(line: 599, column: 10, scope: !2457)
!2539 = !DILocation(line: 599, column: 18, scope: !2457)
!2540 = !DILocation(line: 599, column: 22, scope: !2457)
!2541 = !DILocation(line: 599, column: 27, scope: !2457)
!2542 = !DILocation(line: 599, column: 33, scope: !2457)
!2543 = !DILocation(line: 600, column: 2, scope: !2458)
!2544 = !DILocation(line: 600, column: 2, scope: !2457)
!2545 = !DILocation(line: 602, column: 23, scope: !2447)
!2546 = !DILocation(line: 602, column: 31, scope: !2447)
!2547 = !DILocation(line: 602, column: 35, scope: !2447)
!2548 = !DILocation(line: 602, column: 40, scope: !2447)
!2549 = !DILocation(line: 602, column: 9, scope: !2447)
!2550 = !DILocation(line: 602, column: 21, scope: !2447)
!2551 = !{!2474, !401, i64 1}
!2552 = !DILocation(line: 603, column: 9, scope: !2447)
!2553 = !DILocation(line: 603, column: 15, scope: !2447)
!2554 = !{!2474, !748, i64 2}
!2555 = !DILocation(line: 604, column: 9, scope: !2447)
!2556 = !DILocation(line: 604, column: 15, scope: !2447)
!2557 = !{!2474, !748, i64 4}
!2558 = !DILocation(line: 606, column: 8, scope: !2447)
!2559 = !DILocation(line: 606, column: 23, scope: !2447)
!2560 = !DILocation(line: 606, column: 6, scope: !2447)
!2561 = !DILocation(line: 608, column: 9, scope: !2447)
!2562 = !DILocation(line: 608, column: 13, scope: !2447)
!2563 = !DILocation(line: 608, column: 43, scope: !2447)
!2564 = !DILocation(line: 609, column: 9, scope: !2447)
!2565 = !DILocation(line: 609, column: 13, scope: !2447)
!2566 = !DILocation(line: 610, column: 1, scope: !2447)
!2567 = !DILocation(line: 608, column: 2, scope: !2447)
!2568 = distinct !DISubprogram(name: "is_rate_limited", scope: !3, file: !3, line: 386, type: !2569, scopeLine: 387, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2571)
!2569 = !DISubroutineType(types: !2570)
!2570 = !{!186, !159, !159, !159}
!2571 = !{!2572, !2573, !2574}
!2572 = !DILocalVariable(name: "now", arg: 1, scope: !2568, file: !3, line: 386, type: !159)
!2573 = !DILocalVariable(name: "last_ts", arg: 2, scope: !2568, file: !3, line: 386, type: !159)
!2574 = !DILocalVariable(name: "rtt", arg: 3, scope: !2568, file: !3, line: 386, type: !159)
!2575 = !DILocation(line: 386, column: 35, scope: !2568)
!2576 = !DILocation(line: 386, column: 46, scope: !2568)
!2577 = !DILocation(line: 386, column: 61, scope: !2568)
!2578 = !DILocation(line: 388, column: 6, scope: !2579)
!2579 = distinct !DILexicalBlock(scope: !2568, file: !3, line: 388, column: 6)
!2580 = !DILocation(line: 388, column: 12, scope: !2579)
!2581 = !DILocation(line: 388, column: 10, scope: !2579)
!2582 = !DILocation(line: 388, column: 6, scope: !2568)
!2583 = !DILocation(line: 389, column: 3, scope: !2579)
!2584 = !DILocation(line: 392, column: 13, scope: !2585)
!2585 = distinct !DILexicalBlock(scope: !2568, file: !3, line: 392, column: 6)
!2586 = !{!809, !412, i64 8}
!2587 = !DILocation(line: 392, column: 6, scope: !2585)
!2588 = !DILocation(line: 392, column: 22, scope: !2585)
!2589 = !DILocation(line: 392, column: 25, scope: !2585)
!2590 = !DILocation(line: 392, column: 6, scope: !2568)
!2591 = !DILocation(line: 393, column: 10, scope: !2585)
!2592 = !DILocation(line: 393, column: 16, scope: !2585)
!2593 = !DILocation(line: 393, column: 14, scope: !2585)
!2594 = !DILocation(line: 393, column: 26, scope: !2585)
!2595 = !DILocation(line: 393, column: 24, scope: !2585)
!2596 = !DILocation(line: 393, column: 3, scope: !2585)
!2597 = !DILocation(line: 396, column: 9, scope: !2568)
!2598 = !DILocation(line: 396, column: 15, scope: !2568)
!2599 = !DILocation(line: 396, column: 13, scope: !2568)
!2600 = !DILocation(line: 396, column: 32, scope: !2568)
!2601 = !{!809, !412, i64 0}
!2602 = !DILocation(line: 396, column: 23, scope: !2568)
!2603 = !DILocation(line: 396, column: 2, scope: !2568)
!2604 = !DILocation(line: 397, column: 1, scope: !2568)
!2605 = distinct !DISubprogram(name: "send_flow_open_event", scope: !3, file: !3, line: 405, type: !2606, scopeLine: 407, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2608)
!2606 = !DISubroutineType(types: !2607)
!2607 = !{null, !94, !716, !174}
!2608 = !{!2609, !2610, !2611, !2612}
!2609 = !DILocalVariable(name: "ctx", arg: 1, scope: !2605, file: !3, line: 405, type: !94)
!2610 = !DILocalVariable(name: "p_info", arg: 2, scope: !2605, file: !3, line: 405, type: !716)
!2611 = !DILocalVariable(name: "rev_flow", arg: 3, scope: !2605, file: !3, line: 406, type: !174)
!2612 = !DILocalVariable(name: "fe", scope: !2605, file: !3, line: 408, type: !2613)
!2613 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "flow_event", file: !15, line: 132, size: 512, elements: !2614)
!2614 = !{!2615, !2616, !2617, !2618, !2619, !2620, !2621}
!2615 = !DIDerivedType(tag: DW_TAG_member, name: "event_type", scope: !2613, file: !15, line: 133, baseType: !159, size: 64)
!2616 = !DIDerivedType(tag: DW_TAG_member, name: "timestamp", scope: !2613, file: !15, line: 134, baseType: !159, size: 64, offset: 64)
!2617 = !DIDerivedType(tag: DW_TAG_member, name: "flow", scope: !2613, file: !15, line: 135, baseType: !144, size: 352, offset: 128)
!2618 = !DIDerivedType(tag: DW_TAG_member, name: "flow_event_type", scope: !2613, file: !15, line: 136, baseType: !24, size: 8, offset: 480)
!2619 = !DIDerivedType(tag: DW_TAG_member, name: "reason", scope: !2613, file: !15, line: 137, baseType: !14, size: 8, offset: 488)
!2620 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !2613, file: !15, line: 138, baseType: !88, size: 8, offset: 496)
!2621 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !2613, file: !15, line: 139, baseType: !102, size: 8, offset: 504)
!2622 = !DILocation(line: 405, column: 40, scope: !2605)
!2623 = !DILocation(line: 405, column: 65, scope: !2605)
!2624 = !DILocation(line: 406, column: 25, scope: !2605)
!2625 = !DILocation(line: 408, column: 2, scope: !2605)
!2626 = !DILocation(line: 408, column: 20, scope: !2605)
!2627 = !DILocation(line: 408, column: 25, scope: !2605)
!2628 = !{!2629, !412, i64 0}
!2629 = !{!"flow_event", !412, i64 0, !412, i64 8, !745, i64 16, !401, i64 60, !401, i64 61, !401, i64 62, !401, i64 63}
!2630 = !DILocation(line: 414, column: 16, scope: !2605)
!2631 = !DILocation(line: 414, column: 26, scope: !2605)
!2632 = !{!2629, !412, i64 8}
!2633 = !DILocation(line: 412, column: 11, scope: !2605)
!2634 = !DILocation(line: 412, column: 19, scope: !2605)
!2635 = !DILocation(line: 412, column: 23, scope: !2605)
!2636 = !{!2629, !401, i64 60}
!2637 = !DILocation(line: 413, column: 13, scope: !2605)
!2638 = !DILocation(line: 413, column: 23, scope: !2605)
!2639 = !{!2629, !401, i64 61}
!2640 = !{!2629, !401, i64 62}
!2641 = !{!2629, !401, i64 63}
!2642 = !DILocation(line: 418, column: 2, scope: !2605)
!2643 = !DILocation(line: 418, column: 24, scope: !2605)
!2644 = !DILocation(line: 419, column: 1, scope: !2605)
!2645 = distinct !DISubprogram(name: "calculate_srtt", scope: !3, file: !3, line: 378, type: !2646, scopeLine: 379, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2648)
!2646 = !DISubroutineType(types: !2647)
!2647 = !{!159, !159, !159}
!2648 = !{!2649, !2650}
!2649 = !DILocalVariable(name: "prev_srtt", arg: 1, scope: !2645, file: !3, line: 378, type: !159)
!2650 = !DILocalVariable(name: "rtt", arg: 2, scope: !2645, file: !3, line: 378, type: !159)
!2651 = !DILocation(line: 378, column: 35, scope: !2645)
!2652 = !DILocation(line: 378, column: 52, scope: !2645)
!2653 = !DILocation(line: 380, column: 7, scope: !2654)
!2654 = distinct !DILexicalBlock(scope: !2645, file: !3, line: 380, column: 6)
!2655 = !DILocation(line: 380, column: 6, scope: !2645)
!2656 = !DILocation(line: 381, column: 10, scope: !2654)
!2657 = !DILocation(line: 381, column: 3, scope: !2654)
!2658 = !DILocation(line: 383, column: 9, scope: !2645)
!2659 = !DILocation(line: 383, column: 22, scope: !2645)
!2660 = !DILocation(line: 383, column: 32, scope: !2645)
!2661 = !DILocation(line: 383, column: 19, scope: !2645)
!2662 = !DILocation(line: 383, column: 41, scope: !2645)
!2663 = !DILocation(line: 383, column: 45, scope: !2645)
!2664 = !DILocation(line: 383, column: 38, scope: !2645)
!2665 = !DILocation(line: 383, column: 2, scope: !2645)
!2666 = !DILocation(line: 384, column: 1, scope: !2645)
!2667 = distinct !DISubprogram(name: "send_flow_event", scope: !3, file: !3, line: 428, type: !2668, scopeLine: 430, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !2, retainedNodes: !2670)
!2668 = !DISubroutineType(types: !2669)
!2669 = !{null, !94, !716, !186}
!2670 = !{!2671, !2672, !2673, !2674}
!2671 = !DILocalVariable(name: "ctx", arg: 1, scope: !2667, file: !3, line: 428, type: !94)
!2672 = !DILocalVariable(name: "p_info", arg: 2, scope: !2667, file: !3, line: 428, type: !716)
!2673 = !DILocalVariable(name: "rev_flow", arg: 3, scope: !2667, file: !3, line: 429, type: !186)
!2674 = !DILocalVariable(name: "fe", scope: !2667, file: !3, line: 431, type: !2613)
!2675 = !DILocation(line: 428, column: 35, scope: !2667)
!2676 = !DILocation(line: 428, column: 60, scope: !2667)
!2677 = !DILocation(line: 429, column: 13, scope: !2667)
!2678 = !DILocation(line: 431, column: 2, scope: !2667)
!2679 = !DILocation(line: 431, column: 20, scope: !2667)
!2680 = !DILocation(line: 431, column: 25, scope: !2667)
!2681 = !DILocation(line: 435, column: 16, scope: !2667)
!2682 = !DILocation(line: 435, column: 24, scope: !2667)
!2683 = !DILocation(line: 433, column: 22, scope: !2667)
!2684 = !DILocation(line: 433, column: 30, scope: !2667)
!2685 = !DILocation(line: 434, column: 13, scope: !2667)
!2686 = !DILocation(line: 434, column: 21, scope: !2667)
!2687 = !DILocation(line: 439, column: 6, scope: !2688)
!2688 = distinct !DILexicalBlock(scope: !2667, file: !3, line: 439, column: 6)
!2689 = !DILocation(line: 439, column: 6, scope: !2667)
!2690 = !DILocation(line: 440, column: 6, scope: !2691)
!2691 = distinct !DILexicalBlock(scope: !2688, file: !3, line: 439, column: 16)
!2692 = !DILocation(line: 440, column: 13, scope: !2691)
!2693 = !DILocation(line: 440, column: 21, scope: !2691)
!2694 = !DILocation(line: 440, column: 25, scope: !2691)
!2695 = !DILocation(line: 441, column: 6, scope: !2691)
!2696 = !DILocation(line: 441, column: 13, scope: !2691)
!2697 = !DILocation(line: 442, column: 2, scope: !2691)
!2698 = !DILocation(line: 443, column: 6, scope: !2699)
!2699 = distinct !DILexicalBlock(scope: !2688, file: !3, line: 442, column: 9)
!2700 = !DILocation(line: 443, column: 13, scope: !2699)
!2701 = !DILocation(line: 443, column: 21, scope: !2699)
!2702 = !DILocation(line: 443, column: 31, scope: !2699)
!2703 = !DILocation(line: 444, column: 6, scope: !2699)
!2704 = !DILocation(line: 444, column: 13, scope: !2699)
!2705 = !DILocation(line: 447, column: 2, scope: !2667)
!2706 = !DILocation(line: 447, column: 24, scope: !2667)
!2707 = !DILocation(line: 448, column: 1, scope: !2667)
