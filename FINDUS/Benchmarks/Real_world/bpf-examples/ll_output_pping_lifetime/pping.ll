; ModuleID = 'pping.c'
source_filename = "pping.c"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.option = type { ptr, i32, ptr, i32 }
%struct.pping_config = type { %struct.bpf_config, %struct.bpf_tc_opts, %struct.bpf_tc_opts, i64, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i32, i32, [16 x i8], i32, i8, i8 }
%struct.bpf_config = type { i64, i64, i8, i8, i8, i8, i32 }
%struct.bpf_tc_opts = type { i64, i32, i32, i32, i32, i32 }
%struct.rlimit = type { i64, i64 }
%struct.rtt_event = type { i64, i64, %struct.network_tuple, i32, i64, i64, i64, i64, i64, i64, i8, [7 x i8] }
%struct.network_tuple = type { %struct.flow_address, %struct.flow_address, i16, i8, i8 }
%struct.flow_address = type { %struct.in6_addr, i16, i16 }
%struct.in6_addr = type { %union.anon }
%union.anon = type { [4 x i32] }
%struct.flow_event = type { i64, i64, %struct.network_tuple, i8, i8, i8, i8 }
%struct.map_cleanup_args = type { i64, i32, i32 }
%struct.bpf_tc_hook = type { i64, i32, i32, i32 }
%struct.timespec = type { i64, i64 }
%struct.flow_state = type { i64, i64, i64, i64, i64, i64, i64, i32, i8, i8, i16 }
%struct.map_full_event = type { i64, i64, %struct.network_tuple, i8, [3 x i8] }

@.str = private unnamed_addr constant [10 x i8] c"TCP, ICMP\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [4 x i8] c"TCP\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [5 x i8] c"ICMP\00", align 1, !dbg !12
@.str.3 = private unnamed_addr constant [9 x i8] c"standard\00", align 1, !dbg !17
@.str.4 = private unnamed_addr constant [5 x i8] c"json\00", align 1, !dbg !22
@.str.5 = private unnamed_addr constant [6 x i8] c"ppviz\00", align 1, !dbg !24
@.str.6 = private unnamed_addr constant [14 x i8] c"unkown format\00", align 1, !dbg !29
@keep_running = internal global i32 1, align 4, !dbg !34
@.str.7 = private unnamed_addr constant [13 x i8] c"pping_kern.o\00", align 1, !dbg !230
@.str.8 = private unnamed_addr constant [18 x i8] c"pping_xdp_ingress\00", align 1, !dbg !235
@.str.9 = private unnamed_addr constant [16 x i8] c"pping_tc_egress\00", align 1, !dbg !240
@.str.10 = private unnamed_addr constant [10 x i8] c"packet_ts\00", align 1, !dbg !243
@.str.11 = private unnamed_addr constant [11 x i8] c"flow_state\00", align 1, !dbg !245
@.str.12 = private unnamed_addr constant [7 x i8] c"events\00", align 1, !dbg !250
@.str.13 = private unnamed_addr constant [35 x i8] c"This program must be run as root.\0A\00", align 1, !dbg !253
@stderr = external dso_local global ptr, align 8, !dbg !367
@.str.14 = private unnamed_addr constant [38 x i8] c"Could not set rlimit to infinity: %s\0A\00", align 1, !dbg !258
@.str.15 = private unnamed_addr constant [31 x i8] c"Failed parsing arguments:  %s\0A\00", align 1, !dbg !263
@.str.16 = private unnamed_addr constant [97 x i8] c"Warning: ppviz format mainly intended for TCP traffic, but may now include ICMP traffic as well\0A\00", align 1, !dbg !268
@print_event_func = internal global ptr null, align 8, !dbg !576
@.str.17 = private unnamed_addr constant [46 x i8] c"Starting ePPing in %s mode tracking %s on %s\0A\00", align 1, !dbg !273
@.str.18 = private unnamed_addr constant [49 x i8] c"Failed loading and attaching BPF programs in %s\0A\00", align 1, !dbg !278
@.str.19 = private unnamed_addr constant [36 x i8] c"Failed setting up map cleaning: %s\0A\00", align 1, !dbg !283
@.str.20 = private unnamed_addr constant [35 x i8] c"Failed to open perf buffer %s: %s\0A\00", align 1, !dbg !288
@.str.21 = private unnamed_addr constant [31 x i8] c"Error polling perf buffer: %s\0A\00", align 1, !dbg !290
@json_ctx = internal global ptr null, align 8, !dbg !684
@.str.22 = private unnamed_addr constant [55 x i8] c"Failed removing ingress program from interface %s: %s\0A\00", align 1, !dbg !292
@.str.23 = private unnamed_addr constant [54 x i8] c"Failed removing egress program from interface %s: %s\0A\00", align 1, !dbg !297
@stdin = external dso_local global ptr, align 8, !dbg !302
@stdout = external dso_local global ptr, align 8, !dbg !365
@optarg = external dso_local global ptr, align 8, !dbg !369
@optind = external dso_local global i32, align 4, !dbg !372
@get_libbpf_strerror.buf = internal global [200 x i8] zeroinitializer, align 1, !dbg !374
@.str.24 = private unnamed_addr constant [20 x i8] c"hflTCi:r:R:t:c:F:I:\00", align 1, !dbg !386
@long_options = internal constant [13 x %struct.option] [%struct.option { ptr @.str.41, i32 0, ptr null, i32 104 }, %struct.option { ptr @.str.42, i32 1, ptr null, i32 105 }, %struct.option { ptr @.str.27, i32 1, ptr null, i32 114 }, %struct.option { ptr @.str.28, i32 1, ptr null, i32 82 }, %struct.option { ptr @.str.43, i32 1, ptr null, i32 116 }, %struct.option { ptr @.str.44, i32 0, ptr null, i32 102 }, %struct.option { ptr @.str.32, i32 1, ptr null, i32 99 }, %struct.option { ptr @.str.45, i32 1, ptr null, i32 70 }, %struct.option { ptr @.str.46, i32 1, ptr null, i32 73 }, %struct.option { ptr @.str.47, i32 0, ptr null, i32 84 }, %struct.option { ptr @.str.48, i32 0, ptr null, i32 67 }, %struct.option { ptr @.str.49, i32 0, ptr null, i32 108 }, %struct.option zeroinitializer], align 8, !dbg !454
@.str.25 = private unnamed_addr constant [25 x i8] c"interface name too long\0A\00", align 1, !dbg !388
@.str.26 = private unnamed_addr constant [41 x i8] c"Could not get index of interface %s: %s\0A\00", align 1, !dbg !393
@.str.27 = private unnamed_addr constant [11 x i8] c"rate-limit\00", align 1, !dbg !398
@.str.28 = private unnamed_addr constant [9 x i8] c"rtt-rate\00", align 1, !dbg !400
@.str.29 = private unnamed_addr constant [4 x i8] c"min\00", align 1, !dbg !402
@.str.30 = private unnamed_addr constant [9 x i8] c"smoothed\00", align 1, !dbg !404
@.str.31 = private unnamed_addr constant [38 x i8] c"rtt-type must be \22min\22 or \22smoothed\22\0A\00", align 1, !dbg !406
@.str.32 = private unnamed_addr constant [17 x i8] c"cleanup-interval\00", align 1, !dbg !408
@.str.33 = private unnamed_addr constant [46 x i8] c"format must be \22standard\22, \22json\22 or \22ppviz\22\0A\00", align 1, !dbg !413
@.str.34 = private unnamed_addr constant [4 x i8] c"xdp\00", align 1, !dbg !415
@.str.35 = private unnamed_addr constant [3 x i8] c"tc\00", align 1, !dbg !417
@.str.36 = private unnamed_addr constant [17 x i8] c"pping_tc_ingress\00", align 1, !dbg !420
@.str.37 = private unnamed_addr constant [36 x i8] c"ingress-hook must be \22xdp\22 or \22tc\22\0A\00", align 1, !dbg !422
@.str.38 = private unnamed_addr constant [7 x i8] c"HELP:\0A\00", align 1, !dbg !424
@.str.39 = private unnamed_addr constant [19 x i8] c"Unknown option %s\0A\00", align 1, !dbg !426
@.str.40 = private unnamed_addr constant [51 x i8] c"An interface (-i or --interface) must be provided\0A\00", align 1, !dbg !431
@.str.41 = private unnamed_addr constant [5 x i8] c"help\00", align 1, !dbg !436
@.str.42 = private unnamed_addr constant [10 x i8] c"interface\00", align 1, !dbg !438
@.str.43 = private unnamed_addr constant [9 x i8] c"rtt-type\00", align 1, !dbg !440
@.str.44 = private unnamed_addr constant [6 x i8] c"force\00", align 1, !dbg !442
@.str.45 = private unnamed_addr constant [7 x i8] c"format\00", align 1, !dbg !444
@.str.46 = private unnamed_addr constant [13 x i8] c"ingress-hook\00", align 1, !dbg !446
@.str.47 = private unnamed_addr constant [4 x i8] c"tcp\00", align 1, !dbg !448
@.str.48 = private unnamed_addr constant [5 x i8] c"icmp\00", align 1, !dbg !450
@.str.49 = private unnamed_addr constant [14 x i8] c"include-local\00", align 1, !dbg !452
@.str.50 = private unnamed_addr constant [29 x i8] c"%s %s is not a valid number\0A\00", align 1, !dbg !466
@.str.51 = private unnamed_addr constant [27 x i8] c"%s must in range [%g, %g]\0A\00", align 1, !dbg !471
@.str.52 = private unnamed_addr constant [20 x i8] c"\0ADOCUMENTATION:\0A%s\0A\00", align 1, !dbg !476
@__doc__ = internal global ptr @.str.59, align 8, !dbg !504
@.str.53 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1, !dbg !478
@.str.54 = private unnamed_addr constant [32 x i8] c" Usage: %s (options-see-below)\0A\00", align 1, !dbg !483
@.str.55 = private unnamed_addr constant [19 x i8] c" Listing options:\0A\00", align 1, !dbg !488
@.str.56 = private unnamed_addr constant [9 x i8] c" --%-12s\00", align 1, !dbg !490
@.str.57 = private unnamed_addr constant [26 x i8] c" flag (internal value:%d)\00", align 1, !dbg !492
@.str.58 = private unnamed_addr constant [19 x i8] c" short-option: -%c\00", align 1, !dbg !497
@.str.59 = private unnamed_addr constant [59 x i8] c"Passive Ping - monitor flow RTT based on header inspection\00", align 1, !dbg !499
@.str.60 = private unnamed_addr constant [35 x i8] c" %llu.%06llu ms %llu.%06llu ms %s \00", align 1, !dbg !506
@.str.61 = private unnamed_addr constant [5 x i8] c" %s \00", align 1, !dbg !508
@.str.62 = private unnamed_addr constant [23 x i8] c" %s due to %s from %s\0A\00", align 1, !dbg !510
@.str.63 = private unnamed_addr constant [9 x i8] c"%H:%M:%S\00", align 1, !dbg !515
@.str.64 = private unnamed_addr constant [10 x i8] c"%s.%09llu\00", align 1, !dbg !517
@convert_monotonic_to_realtime.offset = internal global i64 0, align 8, !dbg !519
@convert_monotonic_to_realtime.offset_updated = internal global i64 0, align 8, !dbg !528
@proto_to_str.buf = internal global [8 x i8] zeroinitializer, align 1, !dbg !530
@.str.65 = private unnamed_addr constant [7 x i8] c"ICMPv6\00", align 1, !dbg !538
@.str.66 = private unnamed_addr constant [3 x i8] c"%d\00", align 1, !dbg !540
@.str.67 = private unnamed_addr constant [12 x i8] c"%s:%d+%s:%d\00", align 1, !dbg !542
@.str.68 = private unnamed_addr constant [5 x i8] c"none\00", align 1, !dbg !547
@.str.69 = private unnamed_addr constant [8 x i8] c"opening\00", align 1, !dbg !549
@.str.70 = private unnamed_addr constant [8 x i8] c"closing\00", align 1, !dbg !551
@.str.71 = private unnamed_addr constant [8 x i8] c"unknown\00", align 1, !dbg !553
@.str.72 = private unnamed_addr constant [4 x i8] c"SYN\00", align 1, !dbg !555
@.str.73 = private unnamed_addr constant [8 x i8] c"SYN-ACK\00", align 1, !dbg !557
@.str.74 = private unnamed_addr constant [22 x i8] c"first observed packet\00", align 1, !dbg !559
@.str.75 = private unnamed_addr constant [4 x i8] c"FIN\00", align 1, !dbg !564
@.str.76 = private unnamed_addr constant [4 x i8] c"RST\00", align 1, !dbg !566
@.str.77 = private unnamed_addr constant [13 x i8] c"flow timeout\00", align 1, !dbg !568
@.str.78 = private unnamed_addr constant [4 x i8] c"src\00", align 1, !dbg !570
@.str.79 = private unnamed_addr constant [5 x i8] c"dest\00", align 1, !dbg !572
@.str.80 = private unnamed_addr constant [18 x i8] c"userspace-cleanup\00", align 1, !dbg !574
@.str.81 = private unnamed_addr constant [10 x i8] c"timestamp\00", align 1, !dbg !583
@.str.82 = private unnamed_addr constant [7 x i8] c"src_ip\00", align 1, !dbg !585
@.str.83 = private unnamed_addr constant [9 x i8] c"src_port\00", align 1, !dbg !587
@.str.84 = private unnamed_addr constant [8 x i8] c"dest_ip\00", align 1, !dbg !589
@.str.85 = private unnamed_addr constant [10 x i8] c"dest_port\00", align 1, !dbg !591
@.str.86 = private unnamed_addr constant [9 x i8] c"protocol\00", align 1, !dbg !593
@.str.87 = private unnamed_addr constant [4 x i8] c"rtt\00", align 1, !dbg !595
@.str.88 = private unnamed_addr constant [8 x i8] c"min_rtt\00", align 1, !dbg !597
@.str.89 = private unnamed_addr constant [13 x i8] c"sent_packets\00", align 1, !dbg !599
@.str.90 = private unnamed_addr constant [11 x i8] c"sent_bytes\00", align 1, !dbg !601
@.str.91 = private unnamed_addr constant [12 x i8] c"rec_packets\00", align 1, !dbg !603
@.str.92 = private unnamed_addr constant [10 x i8] c"rec_bytes\00", align 1, !dbg !605
@.str.93 = private unnamed_addr constant [16 x i8] c"match_on_egress\00", align 1, !dbg !607
@.str.94 = private unnamed_addr constant [11 x i8] c"flow_event\00", align 1, !dbg !609
@.str.95 = private unnamed_addr constant [7 x i8] c"reason\00", align 1, !dbg !611
@.str.96 = private unnamed_addr constant [13 x i8] c"triggered_by\00", align 1, !dbg !613
@.str.97 = private unnamed_addr constant [37 x i8] c"%llu.%09llu %llu.%09llu %llu.%09llu \00", align 1, !dbg !615
@.str.98 = private unnamed_addr constant [35 x i8] c"Failed opening object file %s: %s\0A\00", align 1, !dbg !620
@.str.99 = private unnamed_addr constant [44 x i8] c"Failed pushing user-configration to %s: %s\0A\00", align 1, !dbg !622
@.str.100 = private unnamed_addr constant [39 x i8] c"Failed loading bpf programs in %s: %s\0A\00", align 1, !dbg !627
@.str.101 = private unnamed_addr constant [57 x i8] c"Failed attaching egress BPF program on interface %s: %s\0A\00", align 1, !dbg !632
@.str.102 = private unnamed_addr constant [58 x i8] c"Failed attaching ingress BPF program on interface %s: %s\0A\00", align 1, !dbg !637
@.str.103 = private unnamed_addr constant [41 x i8] c"Failed detaching tc program from %s: %s\0A\00", align 1, !dbg !642
@.str.104 = private unnamed_addr constant [8 x i8] c".rodata\00", align 1, !dbg !644
@.str.105 = private unnamed_addr constant [64 x i8] c"Hint: XDP already loaded on device use --force to swap/replace\0A\00", align 1, !dbg !646
@.str.106 = private unnamed_addr constant [32 x i8] c"Hint: Native-XDP not supported\0A\00", align 1, !dbg !651
@.str.107 = private unnamed_addr constant [31 x i8] c"Periodic map cleanup disabled\0A\00", align 1, !dbg !653
@.str.108 = private unnamed_addr constant [45 x i8] c"Could not get file descriptor of map %s: %s\0A\00", align 1, !dbg !655
@.str.109 = private unnamed_addr constant [60 x i8] c"Failed starting thread to perform periodic map cleanup: %s\0A\00", align 1, !dbg !660
@.str.110 = private unnamed_addr constant [69 x i8] c"%d: Gone through %d entries and removed %d of them in %llu.%09llu s\0A\00", align 1, !dbg !665
@.str.111 = private unnamed_addr constant [34 x i8] c"Warning: Unknown event type %llu\0A\00", align 1, !dbg !670
@.str.112 = private unnamed_addr constant [46 x i8] c" Warning: Unable to create %s entry for flow \00", align 1, !dbg !675
@.str.113 = private unnamed_addr constant [5 x i8] c"flow\00", align 1, !dbg !677
@.str.114 = private unnamed_addr constant [28 x i8] c"Lost %llu events on CPU %d\0A\00", align 1, !dbg !679

; Function Attrs: nounwind
define dso_local ptr @tracked_protocols_to_str(ptr noundef %0) #0 !dbg !696 {
  %2 = alloca ptr, align 8
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  store ptr %0, ptr %2, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %2, metadata !738, metadata !DIExpression()), !dbg !745
  call void @llvm.lifetime.start.p0(i64 1, ptr %3) #12, !dbg !746
  call void @llvm.dbg.declare(metadata ptr %3, metadata !739, metadata !DIExpression()), !dbg !747
  %5 = load ptr, ptr %2, align 8, !dbg !748, !tbaa !741
  %6 = getelementptr inbounds %struct.pping_config, ptr %5, i32 0, i32 0, !dbg !749
  %7 = getelementptr inbounds %struct.bpf_config, ptr %6, i32 0, i32 3, !dbg !750
  %8 = load i8, ptr %7, align 1, !dbg !750, !tbaa !751, !range !759, !noundef !760
  %9 = trunc i8 %8 to i1, !dbg !750
  %10 = zext i1 %9 to i8, !dbg !747
  store i8 %10, ptr %3, align 1, !dbg !747, !tbaa !761
  call void @llvm.lifetime.start.p0(i64 1, ptr %4) #12, !dbg !762
  call void @llvm.dbg.declare(metadata ptr %4, metadata !740, metadata !DIExpression()), !dbg !763
  %11 = load ptr, ptr %2, align 8, !dbg !764, !tbaa !741
  %12 = getelementptr inbounds %struct.pping_config, ptr %11, i32 0, i32 0, !dbg !765
  %13 = getelementptr inbounds %struct.bpf_config, ptr %12, i32 0, i32 4, !dbg !766
  %14 = load i8, ptr %13, align 2, !dbg !766, !tbaa !767, !range !759, !noundef !760
  %15 = trunc i8 %14 to i1, !dbg !766
  %16 = zext i1 %15 to i8, !dbg !763
  store i8 %16, ptr %4, align 1, !dbg !763, !tbaa !761
  %17 = load i8, ptr %3, align 1, !dbg !768, !tbaa !761, !range !759, !noundef !760
  %18 = trunc i8 %17 to i1, !dbg !768
  br i1 %18, label %19, label %23, !dbg !769

19:                                               ; preds = %1
  %20 = load i8, ptr %4, align 1, !dbg !770, !tbaa !761, !range !759, !noundef !760
  %21 = trunc i8 %20 to i1, !dbg !770
  br i1 %21, label %22, label %23, !dbg !768

22:                                               ; preds = %19
  br label %28, !dbg !768

23:                                               ; preds = %19, %1
  %24 = load i8, ptr %3, align 1, !dbg !771, !tbaa !761, !range !759, !noundef !760
  %25 = trunc i8 %24 to i1, !dbg !771
  %26 = zext i1 %25 to i64, !dbg !771
  %27 = select i1 %25, ptr @.str.1, ptr @.str.2, !dbg !771
  br label %28, !dbg !768

28:                                               ; preds = %23, %22
  %29 = phi ptr [ @.str, %22 ], [ %27, %23 ], !dbg !768
  call void @llvm.lifetime.end.p0(i64 1, ptr %4) #12, !dbg !772
  call void @llvm.lifetime.end.p0(i64 1, ptr %3) #12, !dbg !772
  ret ptr %29, !dbg !773
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nounwind
define dso_local ptr @output_format_to_str(i32 noundef %0) #0 !dbg !774 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4, !tbaa !779
  call void @llvm.dbg.declare(metadata ptr %3, metadata !778, metadata !DIExpression()), !dbg !780
  %4 = load i32, ptr %3, align 4, !dbg !781, !tbaa !779
  switch i32 %4, label %8 [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %7
  ], !dbg !782

5:                                                ; preds = %1
  store ptr @.str.3, ptr %2, align 8, !dbg !783
  br label %9, !dbg !783

6:                                                ; preds = %1
  store ptr @.str.4, ptr %2, align 8, !dbg !785
  br label %9, !dbg !785

7:                                                ; preds = %1
  store ptr @.str.5, ptr %2, align 8, !dbg !786
  br label %9, !dbg !786

8:                                                ; preds = %1
  store ptr @.str.6, ptr %2, align 8, !dbg !787
  br label %9, !dbg !787

9:                                                ; preds = %8, %7, %6, %5
  %10 = load ptr, ptr %2, align 8, !dbg !788
  ret ptr %10, !dbg !788
}

; Function Attrs: nounwind
define dso_local void @abort_program(i32 noundef %0) #0 !dbg !789 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4, !tbaa !794
  call void @llvm.dbg.declare(metadata ptr %2, metadata !793, metadata !DIExpression()), !dbg !795
  store volatile i32 0, ptr @keep_running, align 4, !dbg !796, !tbaa !794
  ret void, !dbg !797
}

; Function Attrs: nounwind
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !798 {
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca %struct.bpf_tc_opts, align 8
  %11 = alloca %struct.bpf_tc_opts, align 8
  %12 = alloca %struct.pping_config, align 8
  %13 = alloca i32, align 4
  store i32 0, ptr %3, align 4
  store i32 %0, ptr %4, align 4, !tbaa !794
  call void @llvm.dbg.declare(metadata ptr %4, metadata !803, metadata !DIExpression()), !dbg !817
  store ptr %1, ptr %5, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %5, metadata !804, metadata !DIExpression()), !dbg !818
  call void @llvm.lifetime.start.p0(i64 4, ptr %6) #12, !dbg !819
  call void @llvm.dbg.declare(metadata ptr %6, metadata !805, metadata !DIExpression()), !dbg !820
  store i32 0, ptr %6, align 4, !dbg !820, !tbaa !794
  call void @llvm.lifetime.start.p0(i64 4, ptr %7) #12, !dbg !819
  call void @llvm.dbg.declare(metadata ptr %7, metadata !806, metadata !DIExpression()), !dbg !821
  call void @llvm.lifetime.start.p0(i64 8, ptr %8) #12, !dbg !822
  call void @llvm.dbg.declare(metadata ptr %8, metadata !807, metadata !DIExpression()), !dbg !823
  store ptr null, ptr %8, align 8, !dbg !823, !tbaa !741
  call void @llvm.lifetime.start.p0(i64 8, ptr %9) #12, !dbg !824
  call void @llvm.dbg.declare(metadata ptr %9, metadata !810, metadata !DIExpression()), !dbg !825
  store ptr null, ptr %9, align 8, !dbg !825, !tbaa !741
  call void @llvm.lifetime.start.p0(i64 32, ptr %10) #12, !dbg !826
  call void @llvm.dbg.declare(metadata ptr %10, metadata !813, metadata !DIExpression()), !dbg !826
  call void @llvm.memset.p0.i64(ptr align 8 %10, i8 0, i64 32, i1 false), !dbg !827
  call void @llvm.memset.p0.i64(ptr align 8 %10, i8 0, i64 32, i1 false), !dbg !827
  %14 = getelementptr inbounds %struct.bpf_tc_opts, ptr %10, i32 0, i32 0, !dbg !827
  store i64 32, ptr %14, align 8, !dbg !827, !tbaa !829
  call void @llvm.lifetime.start.p0(i64 32, ptr %11) #12, !dbg !830
  call void @llvm.dbg.declare(metadata ptr %11, metadata !814, metadata !DIExpression()), !dbg !830
  call void @llvm.memset.p0.i64(ptr align 8 %11, i8 0, i64 32, i1 false), !dbg !831
  call void @llvm.memset.p0.i64(ptr align 8 %11, i8 0, i64 32, i1 false), !dbg !831
  %15 = getelementptr inbounds %struct.bpf_tc_opts, ptr %11, i32 0, i32 0, !dbg !831
  store i64 32, ptr %15, align 8, !dbg !831, !tbaa !829
  call void @llvm.lifetime.start.p0(i64 184, ptr %12) #12, !dbg !833
  call void @llvm.dbg.declare(metadata ptr %12, metadata !815, metadata !DIExpression()), !dbg !834
  %16 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 0, !dbg !835
  %17 = getelementptr inbounds %struct.bpf_config, ptr %16, i32 0, i32 0, !dbg !836
  store i64 100000000, ptr %17, align 8, !dbg !836, !tbaa !837
  %18 = getelementptr inbounds %struct.bpf_config, ptr %16, i32 0, i32 1, !dbg !836
  store i64 0, ptr %18, align 8, !dbg !836, !tbaa !838
  %19 = getelementptr inbounds %struct.bpf_config, ptr %16, i32 0, i32 2, !dbg !836
  store i8 0, ptr %19, align 8, !dbg !836, !tbaa !839
  %20 = getelementptr inbounds %struct.bpf_config, ptr %16, i32 0, i32 3, !dbg !836
  store i8 0, ptr %20, align 1, !dbg !836, !tbaa !840
  %21 = getelementptr inbounds %struct.bpf_config, ptr %16, i32 0, i32 4, !dbg !836
  store i8 0, ptr %21, align 2, !dbg !836, !tbaa !841
  %22 = getelementptr inbounds %struct.bpf_config, ptr %16, i32 0, i32 5, !dbg !836
  store i8 0, ptr %22, align 1, !dbg !836, !tbaa !842
  %23 = getelementptr inbounds %struct.bpf_config, ptr %16, i32 0, i32 6, !dbg !836
  store i32 0, ptr %23, align 4, !dbg !836, !tbaa !843
  %24 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 1, !dbg !835
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %24, ptr align 8 %10, i64 32, i1 false), !dbg !844, !tbaa.struct !845
  %25 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 2, !dbg !835
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %25, ptr align 8 %11, i64 32, i1 false), !dbg !847, !tbaa.struct !845
  %26 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 3, !dbg !835
  store i64 1000000000, ptr %26, align 8, !dbg !835, !tbaa !848
  %27 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 4, !dbg !835
  store ptr @.str.7, ptr %27, align 8, !dbg !835, !tbaa !849
  %28 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 5, !dbg !835
  store ptr @.str.8, ptr %28, align 8, !dbg !835, !tbaa !850
  %29 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 6, !dbg !835
  store ptr @.str.9, ptr %29, align 8, !dbg !835, !tbaa !851
  %30 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 7, !dbg !835
  store ptr @.str.10, ptr %30, align 8, !dbg !835, !tbaa !852
  %31 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 8, !dbg !835
  store ptr @.str.11, ptr %31, align 8, !dbg !835, !tbaa !853
  %32 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 9, !dbg !835
  store ptr @.str.12, ptr %32, align 8, !dbg !835, !tbaa !854
  %33 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 10, !dbg !835
  store i32 1, ptr %33, align 8, !dbg !835, !tbaa !855
  %34 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 11, !dbg !835
  store i32 0, ptr %34, align 4, !dbg !835, !tbaa !856
  %35 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 12, !dbg !835
  store i32 0, ptr %35, align 8, !dbg !835, !tbaa !857
  %36 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 13, !dbg !835
  store i32 0, ptr %36, align 4, !dbg !835, !tbaa !858
  %37 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 14, !dbg !835
  call void @llvm.memset.p0.i64(ptr align 8 %37, i8 0, i64 16, i1 false), !dbg !835
  %38 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 15, !dbg !835
  store i32 0, ptr %38, align 8, !dbg !835, !tbaa !859
  %39 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 16, !dbg !835
  store i8 0, ptr %39, align 4, !dbg !835, !tbaa !860
  %40 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 17, !dbg !835
  store i8 0, ptr %40, align 1, !dbg !835, !tbaa !861
  %41 = call i32 @geteuid() #12, !dbg !862
  %42 = icmp ne i32 %41, 0, !dbg !864
  br i1 %42, label %43, label %45, !dbg !865

43:                                               ; preds = %2
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.13), !dbg !866
  store i32 1, ptr %3, align 4, !dbg !868
  store i32 1, ptr %13, align 4
  br label %237, !dbg !868

45:                                               ; preds = %2
  %46 = call i32 @set_rlimit(i64 noundef -1), !dbg !869
  store i32 %46, ptr %6, align 4, !dbg !870, !tbaa !794
  %47 = load i32, ptr %6, align 4, !dbg !871, !tbaa !794
  %48 = icmp ne i32 %47, 0, !dbg !871
  br i1 %48, label %49, label %54, !dbg !873

49:                                               ; preds = %45
  %50 = load ptr, ptr @stderr, align 8, !dbg !874, !tbaa !741
  %51 = load i32, ptr %6, align 4, !dbg !876, !tbaa !794
  %52 = call ptr @get_libbpf_strerror(i32 noundef %51), !dbg !877
  %53 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %50, ptr noundef @.str.14, ptr noundef %52), !dbg !878
  store i32 1, ptr %3, align 4, !dbg !879
  store i32 1, ptr %13, align 4
  br label %237, !dbg !879

54:                                               ; preds = %45
  %55 = load i32, ptr %4, align 4, !dbg !880, !tbaa !794
  %56 = load ptr, ptr %5, align 8, !dbg !881, !tbaa !741
  %57 = call i32 @parse_arguments(i32 noundef %55, ptr noundef %56, ptr noundef %12), !dbg !882
  store i32 %57, ptr %6, align 4, !dbg !883, !tbaa !794
  %58 = load i32, ptr %6, align 4, !dbg !884, !tbaa !794
  %59 = icmp ne i32 %58, 0, !dbg !884
  br i1 %59, label %60, label %66, !dbg !886

60:                                               ; preds = %54
  %61 = load ptr, ptr @stderr, align 8, !dbg !887, !tbaa !741
  %62 = load i32, ptr %6, align 4, !dbg !889, !tbaa !794
  %63 = call ptr @get_libbpf_strerror(i32 noundef %62), !dbg !890
  %64 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %61, ptr noundef @.str.15, ptr noundef %63), !dbg !891
  %65 = load ptr, ptr %5, align 8, !dbg !892, !tbaa !741
  call void @print_usage(ptr noundef %65), !dbg !893
  store i32 1, ptr %3, align 4, !dbg !894
  store i32 1, ptr %13, align 4
  br label %237, !dbg !894

66:                                               ; preds = %54
  %67 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 0, !dbg !895
  %68 = getelementptr inbounds %struct.bpf_config, ptr %67, i32 0, i32 3, !dbg !897
  %69 = load i8, ptr %68, align 1, !dbg !897, !tbaa !751, !range !759, !noundef !760
  %70 = trunc i8 %69 to i1, !dbg !897
  br i1 %70, label %79, label %71, !dbg !898

71:                                               ; preds = %66
  %72 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 0, !dbg !899
  %73 = getelementptr inbounds %struct.bpf_config, ptr %72, i32 0, i32 4, !dbg !900
  %74 = load i8, ptr %73, align 2, !dbg !900, !tbaa !767, !range !759, !noundef !760
  %75 = trunc i8 %74 to i1, !dbg !900
  br i1 %75, label %79, label %76, !dbg !901

76:                                               ; preds = %71
  %77 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 0, !dbg !902
  %78 = getelementptr inbounds %struct.bpf_config, ptr %77, i32 0, i32 3, !dbg !903
  store i8 1, ptr %78, align 1, !dbg !904, !tbaa !751
  br label %79, !dbg !905

79:                                               ; preds = %76, %71, %66
  %80 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 0, !dbg !906
  %81 = getelementptr inbounds %struct.bpf_config, ptr %80, i32 0, i32 4, !dbg !908
  %82 = load i8, ptr %81, align 2, !dbg !908, !tbaa !767, !range !759, !noundef !760
  %83 = trunc i8 %82 to i1, !dbg !908
  br i1 %83, label %84, label %91, !dbg !909

84:                                               ; preds = %79
  %85 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 15, !dbg !910
  %86 = load i32, ptr %85, align 8, !dbg !910, !tbaa !859
  %87 = icmp eq i32 %86, 2, !dbg !911
  br i1 %87, label %88, label %91, !dbg !912

88:                                               ; preds = %84
  %89 = load ptr, ptr @stderr, align 8, !dbg !913, !tbaa !741
  %90 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %89, ptr noundef @.str.16), !dbg !914
  br label %91, !dbg !914

91:                                               ; preds = %88, %84, %79
  %92 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 15, !dbg !915
  %93 = load i32, ptr %92, align 8, !dbg !915, !tbaa !859
  switch i32 %93, label %97 [
    i32 0, label %94
    i32 1, label %95
    i32 2, label %96
  ], !dbg !916

94:                                               ; preds = %91
  store ptr @print_event_standard, ptr @print_event_func, align 8, !dbg !917, !tbaa !741
  br label %97, !dbg !919

95:                                               ; preds = %91
  store ptr @print_event_json, ptr @print_event_func, align 8, !dbg !920, !tbaa !741
  br label %97, !dbg !921

96:                                               ; preds = %91
  store ptr @print_event_ppviz, ptr @print_event_func, align 8, !dbg !922, !tbaa !741
  br label %97, !dbg !923

97:                                               ; preds = %91, %96, %95, %94
  %98 = load ptr, ptr @stderr, align 8, !dbg !924, !tbaa !741
  %99 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 15, !dbg !925
  %100 = load i32, ptr %99, align 8, !dbg !925, !tbaa !859
  %101 = call ptr @output_format_to_str(i32 noundef %100), !dbg !926
  %102 = call ptr @tracked_protocols_to_str(ptr noundef %12), !dbg !927
  %103 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 14, !dbg !928
  %104 = getelementptr inbounds [16 x i8], ptr %103, i64 0, i64 0, !dbg !929
  %105 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %98, ptr noundef @.str.17, ptr noundef %101, ptr noundef %102, ptr noundef %104), !dbg !930
  %106 = call i32 @load_attach_bpfprogs(ptr noundef %8, ptr noundef %12), !dbg !931
  store i32 %106, ptr %6, align 4, !dbg !932, !tbaa !794
  %107 = load i32, ptr %6, align 4, !dbg !933, !tbaa !794
  %108 = icmp ne i32 %107, 0, !dbg !933
  br i1 %108, label %109, label %114, !dbg !935

109:                                              ; preds = %97
  %110 = load ptr, ptr @stderr, align 8, !dbg !936, !tbaa !741
  %111 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 4, !dbg !938
  %112 = load ptr, ptr %111, align 8, !dbg !938, !tbaa !849
  %113 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %110, ptr noundef @.str.18, ptr noundef %112), !dbg !939
  store i32 1, ptr %3, align 4, !dbg !940
  store i32 1, ptr %13, align 4
  br label %237, !dbg !940

114:                                              ; preds = %97
  %115 = load ptr, ptr %8, align 8, !dbg !941, !tbaa !741
  %116 = call i32 @setup_periodical_map_cleaning(ptr noundef %115, ptr noundef %12), !dbg !942
  store i32 %116, ptr %6, align 4, !dbg !943, !tbaa !794
  %117 = load i32, ptr %6, align 4, !dbg !944, !tbaa !794
  %118 = icmp ne i32 %117, 0, !dbg !944
  br i1 %118, label %119, label %124, !dbg !946

119:                                              ; preds = %114
  %120 = load ptr, ptr @stderr, align 8, !dbg !947, !tbaa !741
  %121 = load i32, ptr %6, align 4, !dbg !949, !tbaa !794
  %122 = call ptr @get_libbpf_strerror(i32 noundef %121), !dbg !950
  %123 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %120, ptr noundef @.str.19, ptr noundef %122), !dbg !951
  br label %174, !dbg !952

124:                                              ; preds = %114
  %125 = load ptr, ptr %8, align 8, !dbg !953, !tbaa !741
  %126 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 9, !dbg !953
  %127 = load ptr, ptr %126, align 8, !dbg !953, !tbaa !854
  %128 = call i32 @bpf_object__find_map_fd_by_name(ptr noundef %125, ptr noundef %127), !dbg !953
  %129 = call ptr @perf_buffer__new(i32 noundef %128, i64 noundef 64, ptr noundef @handle_event, ptr noundef @handle_missed_events, ptr noundef null, ptr noundef null), !dbg !953
  store ptr %129, ptr %9, align 8, !dbg !954, !tbaa !741
  %130 = load ptr, ptr %9, align 8, !dbg !955, !tbaa !741
  %131 = call i64 @libbpf_get_error(ptr noundef %130), !dbg !956
  %132 = trunc i64 %131 to i32, !dbg !956
  store i32 %132, ptr %6, align 4, !dbg !957, !tbaa !794
  %133 = load i32, ptr %6, align 4, !dbg !958, !tbaa !794
  %134 = icmp ne i32 %133, 0, !dbg !958
  br i1 %134, label %135, label %142, !dbg !960

135:                                              ; preds = %124
  %136 = load ptr, ptr @stderr, align 8, !dbg !961, !tbaa !741
  %137 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 9, !dbg !963
  %138 = load ptr, ptr %137, align 8, !dbg !963, !tbaa !854
  %139 = load i32, ptr %6, align 4, !dbg !964, !tbaa !794
  %140 = call ptr @get_libbpf_strerror(i32 noundef %139), !dbg !965
  %141 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %136, ptr noundef @.str.20, ptr noundef %138, ptr noundef %140), !dbg !966
  br label %174, !dbg !967

142:                                              ; preds = %124
  %143 = call ptr @signal(i32 noundef 2, ptr noundef @abort_program) #12, !dbg !968
  %144 = call ptr @signal(i32 noundef 15, ptr noundef @abort_program) #12, !dbg !969
  br label %145, !dbg !970

145:                                              ; preds = %162, %142
  %146 = load volatile i32, ptr @keep_running, align 4, !dbg !971, !tbaa !794
  %147 = icmp ne i32 %146, 0, !dbg !970
  br i1 %147, label %148, label %163, !dbg !970

148:                                              ; preds = %145
  %149 = load ptr, ptr %9, align 8, !dbg !972, !tbaa !741
  %150 = call i32 @perf_buffer__poll(ptr noundef %149, i32 noundef 100), !dbg !975
  store i32 %150, ptr %6, align 4, !dbg !976, !tbaa !794
  %151 = icmp slt i32 %150, 0, !dbg !977
  br i1 %151, label %152, label %162, !dbg !978

152:                                              ; preds = %148
  %153 = load volatile i32, ptr @keep_running, align 4, !dbg !979, !tbaa !794
  %154 = icmp ne i32 %153, 0, !dbg !979
  br i1 %154, label %155, label %161, !dbg !982

155:                                              ; preds = %152
  %156 = load ptr, ptr @stderr, align 8, !dbg !983, !tbaa !741
  %157 = load i32, ptr %6, align 4, !dbg !984, !tbaa !794
  %158 = sub nsw i32 0, %157, !dbg !985
  %159 = call ptr @get_libbpf_strerror(i32 noundef %158), !dbg !986
  %160 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %156, ptr noundef @.str.21, ptr noundef %159), !dbg !987
  br label %161, !dbg !987

161:                                              ; preds = %155, %152
  br label %163, !dbg !988

162:                                              ; preds = %148
  br label %145, !dbg !970, !llvm.loop !989

163:                                              ; preds = %161, %145
  %164 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 15, !dbg !992
  %165 = load i32, ptr %164, align 8, !dbg !992, !tbaa !859
  %166 = icmp eq i32 %165, 1, !dbg !994
  br i1 %166, label %167, label %172, !dbg !995

167:                                              ; preds = %163
  %168 = load ptr, ptr @json_ctx, align 8, !dbg !996, !tbaa !741
  %169 = icmp ne ptr %168, null, !dbg !996
  br i1 %169, label %170, label %172, !dbg !997

170:                                              ; preds = %167
  %171 = load ptr, ptr @json_ctx, align 8, !dbg !998, !tbaa !741
  call void @jsonw_end_array(ptr noundef %171), !dbg !1000
  call void @jsonw_destroy(ptr noundef @json_ctx), !dbg !1001
  br label %172, !dbg !1002

172:                                              ; preds = %170, %167, %163
  %173 = load ptr, ptr %9, align 8, !dbg !1003, !tbaa !741
  call void @perf_buffer__free(ptr noundef %173), !dbg !1004
  br label %174, !dbg !1004

174:                                              ; preds = %172, %135, %119
  call void @llvm.dbg.label(metadata !816), !dbg !1005
  %175 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 5, !dbg !1006
  %176 = load ptr, ptr %175, align 8, !dbg !1006, !tbaa !850
  %177 = call i32 @strcmp(ptr noundef %176, ptr noundef @.str.8) #13, !dbg !1008
  %178 = icmp eq i32 %177, 0, !dbg !1009
  br i1 %178, label %179, label %187, !dbg !1010

179:                                              ; preds = %174
  %180 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 11, !dbg !1011
  %181 = load i32, ptr %180, align 4, !dbg !1011, !tbaa !856
  %182 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 10, !dbg !1012
  %183 = load i32, ptr %182, align 8, !dbg !1012, !tbaa !855
  %184 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 12, !dbg !1013
  %185 = load i32, ptr %184, align 8, !dbg !1013, !tbaa !857
  %186 = call i32 @xdp_detach(i32 noundef %181, i32 noundef %183, i32 noundef %185), !dbg !1014
  store i32 %186, ptr %7, align 4, !dbg !1015, !tbaa !794
  br label %192, !dbg !1016

187:                                              ; preds = %174
  %188 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 11, !dbg !1017
  %189 = load i32, ptr %188, align 4, !dbg !1017, !tbaa !856
  %190 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 1, !dbg !1018
  %191 = call i32 @tc_detach(i32 noundef %189, i32 noundef 1, ptr noundef %190, i1 noundef zeroext false), !dbg !1019
  store i32 %191, ptr %7, align 4, !dbg !1020, !tbaa !794
  br label %192

192:                                              ; preds = %187, %179
  %193 = load i32, ptr %7, align 4, !dbg !1021, !tbaa !794
  %194 = icmp ne i32 %193, 0, !dbg !1021
  br i1 %194, label %195, label %202, !dbg !1023

195:                                              ; preds = %192
  %196 = load ptr, ptr @stderr, align 8, !dbg !1024, !tbaa !741
  %197 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 14, !dbg !1025
  %198 = getelementptr inbounds [16 x i8], ptr %197, i64 0, i64 0, !dbg !1026
  %199 = load i32, ptr %7, align 4, !dbg !1027, !tbaa !794
  %200 = call ptr @get_libbpf_strerror(i32 noundef %199), !dbg !1028
  %201 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %196, ptr noundef @.str.22, ptr noundef %198, ptr noundef %200), !dbg !1029
  br label %202, !dbg !1029

202:                                              ; preds = %195, %192
  %203 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 11, !dbg !1030
  %204 = load i32, ptr %203, align 4, !dbg !1030, !tbaa !856
  %205 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 2, !dbg !1031
  %206 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 16, !dbg !1032
  %207 = load i8, ptr %206, align 4, !dbg !1032, !tbaa !860, !range !759, !noundef !760
  %208 = trunc i8 %207 to i1, !dbg !1032
  br i1 %208, label %209, label %213, !dbg !1033

209:                                              ; preds = %202
  %210 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 17, !dbg !1034
  %211 = load i8, ptr %210, align 1, !dbg !1034, !tbaa !861, !range !759, !noundef !760
  %212 = trunc i8 %211 to i1, !dbg !1034
  br label %213

213:                                              ; preds = %209, %202
  %214 = phi i1 [ false, %202 ], [ %212, %209 ], !dbg !1035
  %215 = call i32 @tc_detach(i32 noundef %204, i32 noundef 2, ptr noundef %205, i1 noundef zeroext %214), !dbg !1036
  store i32 %215, ptr %7, align 4, !dbg !1037, !tbaa !794
  %216 = load i32, ptr %7, align 4, !dbg !1038, !tbaa !794
  %217 = icmp ne i32 %216, 0, !dbg !1038
  br i1 %217, label %218, label %225, !dbg !1040

218:                                              ; preds = %213
  %219 = load ptr, ptr @stderr, align 8, !dbg !1041, !tbaa !741
  %220 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 14, !dbg !1042
  %221 = getelementptr inbounds [16 x i8], ptr %220, i64 0, i64 0, !dbg !1043
  %222 = load i32, ptr %7, align 4, !dbg !1044, !tbaa !794
  %223 = call ptr @get_libbpf_strerror(i32 noundef %222), !dbg !1045
  %224 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %219, ptr noundef @.str.23, ptr noundef %221, ptr noundef %223), !dbg !1046
  br label %225, !dbg !1046

225:                                              ; preds = %218, %213
  %226 = load i32, ptr %6, align 4, !dbg !1047, !tbaa !794
  %227 = icmp ne i32 %226, 0, !dbg !1048
  br i1 %227, label %228, label %231, !dbg !1049

228:                                              ; preds = %225
  %229 = load volatile i32, ptr @keep_running, align 4, !dbg !1050, !tbaa !794
  %230 = icmp ne i32 %229, 0, !dbg !1050
  br i1 %230, label %234, label %231, !dbg !1051

231:                                              ; preds = %228, %225
  %232 = load i32, ptr %7, align 4, !dbg !1052, !tbaa !794
  %233 = icmp ne i32 %232, 0, !dbg !1053
  br label %234, !dbg !1051

234:                                              ; preds = %231, %228
  %235 = phi i1 [ true, %228 ], [ %233, %231 ]
  %236 = zext i1 %235 to i32, !dbg !1051
  store i32 %236, ptr %3, align 4, !dbg !1054
  store i32 1, ptr %13, align 4
  br label %237, !dbg !1054

237:                                              ; preds = %234, %109, %60, %49, %43
  call void @llvm.lifetime.end.p0(i64 184, ptr %12) #12, !dbg !1055
  call void @llvm.lifetime.end.p0(i64 32, ptr %11) #12, !dbg !1055
  call void @llvm.lifetime.end.p0(i64 32, ptr %10) #12, !dbg !1055
  call void @llvm.lifetime.end.p0(i64 8, ptr %9) #12, !dbg !1055
  call void @llvm.lifetime.end.p0(i64 8, ptr %8) #12, !dbg !1055
  call void @llvm.lifetime.end.p0(i64 4, ptr %7) #12, !dbg !1055
  call void @llvm.lifetime.end.p0(i64 4, ptr %6) #12, !dbg !1055
  %238 = load i32, ptr %3, align 4, !dbg !1055
  ret i32 %238, !dbg !1055
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare !dbg !1056 dso_local i32 @geteuid() #0

declare !dbg !1061 dso_local i32 @printf(ptr noundef, ...) #5

; Function Attrs: nounwind
define internal i32 @set_rlimit(i64 noundef %0) #0 !dbg !1066 {
  %2 = alloca i64, align 8
  %3 = alloca %struct.rlimit, align 8
  store i64 %0, ptr %2, align 8, !tbaa !846
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1070, metadata !DIExpression()), !dbg !1077
  call void @llvm.lifetime.start.p0(i64 16, ptr %3) #12, !dbg !1078
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1071, metadata !DIExpression()), !dbg !1079
  %4 = getelementptr inbounds %struct.rlimit, ptr %3, i32 0, i32 0, !dbg !1080
  %5 = load i64, ptr %2, align 8, !dbg !1081, !tbaa !846
  store i64 %5, ptr %4, align 8, !dbg !1080, !tbaa !1082
  %6 = getelementptr inbounds %struct.rlimit, ptr %3, i32 0, i32 1, !dbg !1080
  %7 = load i64, ptr %2, align 8, !dbg !1084, !tbaa !846
  store i64 %7, ptr %6, align 8, !dbg !1080, !tbaa !1085
  %8 = call i32 @setrlimit(i32 noundef 8, ptr noundef %3) #12, !dbg !1086
  %9 = icmp ne i32 %8, 0, !dbg !1086
  br i1 %9, label %11, label %10, !dbg !1087

10:                                               ; preds = %1
  br label %15, !dbg !1087

11:                                               ; preds = %1
  %12 = call ptr @__errno_location() #14, !dbg !1088
  %13 = load i32, ptr %12, align 4, !dbg !1088, !tbaa !794
  %14 = sub nsw i32 0, %13, !dbg !1089
  br label %15, !dbg !1087

15:                                               ; preds = %11, %10
  %16 = phi i32 [ 0, %10 ], [ %14, %11 ], !dbg !1087
  call void @llvm.lifetime.end.p0(i64 16, ptr %3) #12, !dbg !1090
  ret i32 %16, !dbg !1091
}

declare !dbg !1092 dso_local i32 @fprintf(ptr noundef, ptr noundef, ...) #5

; Function Attrs: nounwind
define internal ptr @get_libbpf_strerror(i32 noundef %0) #0 !dbg !376 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4, !tbaa !794
  call void @llvm.dbg.declare(metadata ptr %2, metadata !382, metadata !DIExpression()), !dbg !1098
  %3 = load i32, ptr %2, align 4, !dbg !1099, !tbaa !794
  %4 = call i32 @libbpf_strerror(i32 noundef %3, ptr noundef @get_libbpf_strerror.buf, i64 noundef 200), !dbg !1100
  ret ptr @get_libbpf_strerror.buf, !dbg !1101
}

; Function Attrs: nounwind
define internal i32 @parse_arguments(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !1102 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  %13 = alloca i32, align 4
  store i32 %0, ptr %5, align 4, !tbaa !794
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1106, metadata !DIExpression()), !dbg !1115
  store ptr %1, ptr %6, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1107, metadata !DIExpression()), !dbg !1116
  store ptr %2, ptr %7, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1108, metadata !DIExpression()), !dbg !1117
  call void @llvm.lifetime.start.p0(i64 4, ptr %8) #12, !dbg !1118
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1109, metadata !DIExpression()), !dbg !1119
  call void @llvm.lifetime.start.p0(i64 4, ptr %9) #12, !dbg !1118
  call void @llvm.dbg.declare(metadata ptr %9, metadata !1110, metadata !DIExpression()), !dbg !1120
  call void @llvm.lifetime.start.p0(i64 8, ptr %10) #12, !dbg !1121
  call void @llvm.dbg.declare(metadata ptr %10, metadata !1111, metadata !DIExpression()), !dbg !1122
  call void @llvm.lifetime.start.p0(i64 8, ptr %11) #12, !dbg !1121
  call void @llvm.dbg.declare(metadata ptr %11, metadata !1113, metadata !DIExpression()), !dbg !1123
  call void @llvm.lifetime.start.p0(i64 8, ptr %12) #12, !dbg !1121
  call void @llvm.dbg.declare(metadata ptr %12, metadata !1114, metadata !DIExpression()), !dbg !1124
  %14 = load ptr, ptr %7, align 8, !dbg !1125, !tbaa !741
  %15 = getelementptr inbounds %struct.pping_config, ptr %14, i32 0, i32 11, !dbg !1126
  store i32 0, ptr %15, align 4, !dbg !1127, !tbaa !856
  %16 = load ptr, ptr %7, align 8, !dbg !1128, !tbaa !741
  %17 = getelementptr inbounds %struct.pping_config, ptr %16, i32 0, i32 0, !dbg !1129
  %18 = getelementptr inbounds %struct.bpf_config, ptr %17, i32 0, i32 5, !dbg !1130
  store i8 1, ptr %18, align 1, !dbg !1131, !tbaa !1132
  %19 = load ptr, ptr %7, align 8, !dbg !1133, !tbaa !741
  %20 = getelementptr inbounds %struct.pping_config, ptr %19, i32 0, i32 16, !dbg !1134
  store i8 0, ptr %20, align 4, !dbg !1135, !tbaa !860
  %21 = load ptr, ptr %7, align 8, !dbg !1136, !tbaa !741
  %22 = getelementptr inbounds %struct.pping_config, ptr %21, i32 0, i32 0, !dbg !1137
  %23 = getelementptr inbounds %struct.bpf_config, ptr %22, i32 0, i32 3, !dbg !1138
  store i8 0, ptr %23, align 1, !dbg !1139, !tbaa !751
  %24 = load ptr, ptr %7, align 8, !dbg !1140, !tbaa !741
  %25 = getelementptr inbounds %struct.pping_config, ptr %24, i32 0, i32 0, !dbg !1141
  %26 = getelementptr inbounds %struct.bpf_config, ptr %25, i32 0, i32 4, !dbg !1142
  store i8 0, ptr %26, align 2, !dbg !1143, !tbaa !767
  br label %27, !dbg !1144

27:                                               ; preds = %205, %3
  %28 = load i32, ptr %5, align 4, !dbg !1145, !tbaa !794
  %29 = load ptr, ptr %6, align 8, !dbg !1146, !tbaa !741
  %30 = call i32 @getopt_long(i32 noundef %28, ptr noundef %29, ptr noundef @.str.24, ptr noundef @long_options, ptr noundef null) #12, !dbg !1147
  store i32 %30, ptr %9, align 4, !dbg !1148, !tbaa !794
  %31 = icmp ne i32 %30, -1, !dbg !1149
  br i1 %31, label %32, label %206, !dbg !1144

32:                                               ; preds = %27
  %33 = load i32, ptr %9, align 4, !dbg !1150, !tbaa !794
  switch i32 %33, label %197 [
    i32 105, label %34
    i32 114, label %70
    i32 82, label %83
    i32 116, label %96
    i32 99, label %117
    i32 70, label %129
    i32 73, label %156
    i32 108, label %175
    i32 102, label %179
    i32 84, label %186
    i32 67, label %190
    i32 104, label %194
  ], !dbg !1152

34:                                               ; preds = %32
  %35 = load ptr, ptr @optarg, align 8, !dbg !1153, !tbaa !741
  %36 = call i64 @strlen(ptr noundef %35) #13, !dbg !1156
  %37 = icmp ugt i64 %36, 16, !dbg !1157
  br i1 %37, label %38, label %41, !dbg !1158

38:                                               ; preds = %34
  %39 = load ptr, ptr @stderr, align 8, !dbg !1159, !tbaa !741
  %40 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %39, ptr noundef @.str.25), !dbg !1161
  store i32 -22, ptr %4, align 4, !dbg !1162
  store i32 1, ptr %13, align 4
  br label %215, !dbg !1162

41:                                               ; preds = %34
  %42 = load ptr, ptr %7, align 8, !dbg !1163, !tbaa !741
  %43 = getelementptr inbounds %struct.pping_config, ptr %42, i32 0, i32 14, !dbg !1164
  %44 = getelementptr inbounds [16 x i8], ptr %43, i64 0, i64 0, !dbg !1163
  %45 = load ptr, ptr @optarg, align 8, !dbg !1165, !tbaa !741
  %46 = call ptr @strncpy(ptr noundef %44, ptr noundef %45, i64 noundef 16) #12, !dbg !1166
  %47 = load ptr, ptr %7, align 8, !dbg !1167, !tbaa !741
  %48 = getelementptr inbounds %struct.pping_config, ptr %47, i32 0, i32 14, !dbg !1168
  %49 = getelementptr inbounds [16 x i8], ptr %48, i64 0, i64 0, !dbg !1167
  %50 = call i32 @if_nametoindex(ptr noundef %49) #12, !dbg !1169
  %51 = load ptr, ptr %7, align 8, !dbg !1170, !tbaa !741
  %52 = getelementptr inbounds %struct.pping_config, ptr %51, i32 0, i32 11, !dbg !1171
  store i32 %50, ptr %52, align 4, !dbg !1172, !tbaa !856
  %53 = load ptr, ptr %7, align 8, !dbg !1173, !tbaa !741
  %54 = getelementptr inbounds %struct.pping_config, ptr %53, i32 0, i32 11, !dbg !1175
  %55 = load i32, ptr %54, align 4, !dbg !1175, !tbaa !856
  %56 = icmp eq i32 %55, 0, !dbg !1176
  br i1 %56, label %57, label %69, !dbg !1177

57:                                               ; preds = %41
  %58 = call ptr @__errno_location() #14, !dbg !1178
  %59 = load i32, ptr %58, align 4, !dbg !1178, !tbaa !794
  %60 = sub nsw i32 0, %59, !dbg !1180
  store i32 %60, ptr %8, align 4, !dbg !1181, !tbaa !794
  %61 = load ptr, ptr @stderr, align 8, !dbg !1182, !tbaa !741
  %62 = load ptr, ptr %7, align 8, !dbg !1183, !tbaa !741
  %63 = getelementptr inbounds %struct.pping_config, ptr %62, i32 0, i32 14, !dbg !1184
  %64 = getelementptr inbounds [16 x i8], ptr %63, i64 0, i64 0, !dbg !1183
  %65 = load i32, ptr %8, align 4, !dbg !1185, !tbaa !794
  %66 = call ptr @get_libbpf_strerror(i32 noundef %65), !dbg !1186
  %67 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %61, ptr noundef @.str.26, ptr noundef %64, ptr noundef %66), !dbg !1187
  %68 = load i32, ptr %8, align 4, !dbg !1188, !tbaa !794
  store i32 %68, ptr %4, align 4, !dbg !1189
  store i32 1, ptr %13, align 4
  br label %215, !dbg !1189

69:                                               ; preds = %41
  br label %205, !dbg !1190

70:                                               ; preds = %32
  %71 = load ptr, ptr @optarg, align 8, !dbg !1191, !tbaa !741
  %72 = call i32 @parse_bounded_double(ptr noundef %10, ptr noundef %71, double noundef 0.000000e+00, double noundef 6.048000e+08, ptr noundef @.str.27), !dbg !1192
  store i32 %72, ptr %8, align 4, !dbg !1193, !tbaa !794
  %73 = load i32, ptr %8, align 4, !dbg !1194, !tbaa !794
  %74 = icmp ne i32 %73, 0, !dbg !1194
  br i1 %74, label %75, label %76, !dbg !1196

75:                                               ; preds = %70
  store i32 -22, ptr %4, align 4, !dbg !1197
  store i32 1, ptr %13, align 4
  br label %215, !dbg !1197

76:                                               ; preds = %70
  %77 = load double, ptr %10, align 8, !dbg !1198, !tbaa !1199
  %78 = fmul double %77, 1.000000e+06, !dbg !1201
  %79 = fptoui double %78 to i64, !dbg !1198
  %80 = load ptr, ptr %7, align 8, !dbg !1202, !tbaa !741
  %81 = getelementptr inbounds %struct.pping_config, ptr %80, i32 0, i32 0, !dbg !1203
  %82 = getelementptr inbounds %struct.bpf_config, ptr %81, i32 0, i32 0, !dbg !1204
  store i64 %79, ptr %82, align 8, !dbg !1205, !tbaa !1206
  br label %205, !dbg !1207

83:                                               ; preds = %32
  %84 = load ptr, ptr @optarg, align 8, !dbg !1208, !tbaa !741
  %85 = call i32 @parse_bounded_double(ptr noundef %12, ptr noundef %84, double noundef 0.000000e+00, double noundef 1.000000e+04, ptr noundef @.str.28), !dbg !1209
  store i32 %85, ptr %8, align 4, !dbg !1210, !tbaa !794
  %86 = load i32, ptr %8, align 4, !dbg !1211, !tbaa !794
  %87 = icmp ne i32 %86, 0, !dbg !1211
  br i1 %87, label %88, label %89, !dbg !1213

88:                                               ; preds = %83
  store i32 -22, ptr %4, align 4, !dbg !1214
  store i32 1, ptr %13, align 4
  br label %215, !dbg !1214

89:                                               ; preds = %83
  %90 = load double, ptr %12, align 8, !dbg !1215, !tbaa !1199
  %91 = fmul double %90, 6.553600e+04, !dbg !1215
  %92 = fptoui double %91 to i64, !dbg !1215
  %93 = load ptr, ptr %7, align 8, !dbg !1216, !tbaa !741
  %94 = getelementptr inbounds %struct.pping_config, ptr %93, i32 0, i32 0, !dbg !1217
  %95 = getelementptr inbounds %struct.bpf_config, ptr %94, i32 0, i32 1, !dbg !1218
  store i64 %92, ptr %95, align 8, !dbg !1219, !tbaa !1220
  br label %205, !dbg !1221

96:                                               ; preds = %32
  %97 = load ptr, ptr @optarg, align 8, !dbg !1222, !tbaa !741
  %98 = call i32 @strcmp(ptr noundef %97, ptr noundef @.str.29) #13, !dbg !1224
  %99 = icmp eq i32 %98, 0, !dbg !1225
  br i1 %99, label %100, label %104, !dbg !1226

100:                                              ; preds = %96
  %101 = load ptr, ptr %7, align 8, !dbg !1227, !tbaa !741
  %102 = getelementptr inbounds %struct.pping_config, ptr %101, i32 0, i32 0, !dbg !1229
  %103 = getelementptr inbounds %struct.bpf_config, ptr %102, i32 0, i32 2, !dbg !1230
  store i8 0, ptr %103, align 8, !dbg !1231, !tbaa !1232
  br label %116, !dbg !1233

104:                                              ; preds = %96
  %105 = load ptr, ptr @optarg, align 8, !dbg !1234, !tbaa !741
  %106 = call i32 @strcmp(ptr noundef %105, ptr noundef @.str.30) #13, !dbg !1236
  %107 = icmp eq i32 %106, 0, !dbg !1237
  br i1 %107, label %108, label %112, !dbg !1238

108:                                              ; preds = %104
  %109 = load ptr, ptr %7, align 8, !dbg !1239, !tbaa !741
  %110 = getelementptr inbounds %struct.pping_config, ptr %109, i32 0, i32 0, !dbg !1241
  %111 = getelementptr inbounds %struct.bpf_config, ptr %110, i32 0, i32 2, !dbg !1242
  store i8 1, ptr %111, align 8, !dbg !1243, !tbaa !1232
  br label %115, !dbg !1244

112:                                              ; preds = %104
  %113 = load ptr, ptr @stderr, align 8, !dbg !1245, !tbaa !741
  %114 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %113, ptr noundef @.str.31), !dbg !1247
  store i32 -22, ptr %4, align 4, !dbg !1248
  store i32 1, ptr %13, align 4
  br label %215, !dbg !1248

115:                                              ; preds = %108
  br label %116

116:                                              ; preds = %115, %100
  br label %205, !dbg !1249

117:                                              ; preds = %32
  %118 = load ptr, ptr @optarg, align 8, !dbg !1250, !tbaa !741
  %119 = call i32 @parse_bounded_double(ptr noundef %11, ptr noundef %118, double noundef 0.000000e+00, double noundef 6.048000e+05, ptr noundef @.str.32), !dbg !1251
  store i32 %119, ptr %8, align 4, !dbg !1252, !tbaa !794
  %120 = load i32, ptr %8, align 4, !dbg !1253, !tbaa !794
  %121 = icmp ne i32 %120, 0, !dbg !1253
  br i1 %121, label %122, label %123, !dbg !1255

122:                                              ; preds = %117
  store i32 -22, ptr %4, align 4, !dbg !1256
  store i32 1, ptr %13, align 4
  br label %215, !dbg !1256

123:                                              ; preds = %117
  %124 = load double, ptr %11, align 8, !dbg !1257, !tbaa !1199
  %125 = fmul double %124, 1.000000e+09, !dbg !1258
  %126 = fptoui double %125 to i64, !dbg !1257
  %127 = load ptr, ptr %7, align 8, !dbg !1259, !tbaa !741
  %128 = getelementptr inbounds %struct.pping_config, ptr %127, i32 0, i32 3, !dbg !1260
  store i64 %126, ptr %128, align 8, !dbg !1261, !tbaa !848
  br label %205, !dbg !1262

129:                                              ; preds = %32
  %130 = load ptr, ptr @optarg, align 8, !dbg !1263, !tbaa !741
  %131 = call i32 @strcmp(ptr noundef %130, ptr noundef @.str.3) #13, !dbg !1265
  %132 = icmp eq i32 %131, 0, !dbg !1266
  br i1 %132, label %133, label %136, !dbg !1267

133:                                              ; preds = %129
  %134 = load ptr, ptr %7, align 8, !dbg !1268, !tbaa !741
  %135 = getelementptr inbounds %struct.pping_config, ptr %134, i32 0, i32 15, !dbg !1270
  store i32 0, ptr %135, align 8, !dbg !1271, !tbaa !859
  br label %155, !dbg !1272

136:                                              ; preds = %129
  %137 = load ptr, ptr @optarg, align 8, !dbg !1273, !tbaa !741
  %138 = call i32 @strcmp(ptr noundef %137, ptr noundef @.str.4) #13, !dbg !1275
  %139 = icmp eq i32 %138, 0, !dbg !1276
  br i1 %139, label %140, label %143, !dbg !1277

140:                                              ; preds = %136
  %141 = load ptr, ptr %7, align 8, !dbg !1278, !tbaa !741
  %142 = getelementptr inbounds %struct.pping_config, ptr %141, i32 0, i32 15, !dbg !1280
  store i32 1, ptr %142, align 8, !dbg !1281, !tbaa !859
  br label %154, !dbg !1282

143:                                              ; preds = %136
  %144 = load ptr, ptr @optarg, align 8, !dbg !1283, !tbaa !741
  %145 = call i32 @strcmp(ptr noundef %144, ptr noundef @.str.5) #13, !dbg !1285
  %146 = icmp eq i32 %145, 0, !dbg !1286
  br i1 %146, label %147, label %150, !dbg !1287

147:                                              ; preds = %143
  %148 = load ptr, ptr %7, align 8, !dbg !1288, !tbaa !741
  %149 = getelementptr inbounds %struct.pping_config, ptr %148, i32 0, i32 15, !dbg !1290
  store i32 2, ptr %149, align 8, !dbg !1291, !tbaa !859
  br label %153, !dbg !1292

150:                                              ; preds = %143
  %151 = load ptr, ptr @stderr, align 8, !dbg !1293, !tbaa !741
  %152 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %151, ptr noundef @.str.33), !dbg !1295
  store i32 -22, ptr %4, align 4, !dbg !1296
  store i32 1, ptr %13, align 4
  br label %215, !dbg !1296

153:                                              ; preds = %147
  br label %154

154:                                              ; preds = %153, %140
  br label %155

155:                                              ; preds = %154, %133
  br label %205, !dbg !1297

156:                                              ; preds = %32
  %157 = load ptr, ptr @optarg, align 8, !dbg !1298, !tbaa !741
  %158 = call i32 @strcmp(ptr noundef %157, ptr noundef @.str.34) #13, !dbg !1300
  %159 = icmp eq i32 %158, 0, !dbg !1301
  br i1 %159, label %160, label %163, !dbg !1302

160:                                              ; preds = %156
  %161 = load ptr, ptr %7, align 8, !dbg !1303, !tbaa !741
  %162 = getelementptr inbounds %struct.pping_config, ptr %161, i32 0, i32 5, !dbg !1305
  store ptr @.str.8, ptr %162, align 8, !dbg !1306, !tbaa !850
  br label %174, !dbg !1307

163:                                              ; preds = %156
  %164 = load ptr, ptr @optarg, align 8, !dbg !1308, !tbaa !741
  %165 = call i32 @strcmp(ptr noundef %164, ptr noundef @.str.35) #13, !dbg !1310
  %166 = icmp eq i32 %165, 0, !dbg !1311
  br i1 %166, label %167, label %170, !dbg !1312

167:                                              ; preds = %163
  %168 = load ptr, ptr %7, align 8, !dbg !1313, !tbaa !741
  %169 = getelementptr inbounds %struct.pping_config, ptr %168, i32 0, i32 5, !dbg !1315
  store ptr @.str.36, ptr %169, align 8, !dbg !1316, !tbaa !850
  br label %173, !dbg !1317

170:                                              ; preds = %163
  %171 = load ptr, ptr @stderr, align 8, !dbg !1318, !tbaa !741
  %172 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %171, ptr noundef @.str.37), !dbg !1320
  store i32 -22, ptr %4, align 4, !dbg !1321
  store i32 1, ptr %13, align 4
  br label %215, !dbg !1321

173:                                              ; preds = %167
  br label %174

174:                                              ; preds = %173, %160
  br label %205, !dbg !1322

175:                                              ; preds = %32
  %176 = load ptr, ptr %7, align 8, !dbg !1323, !tbaa !741
  %177 = getelementptr inbounds %struct.pping_config, ptr %176, i32 0, i32 0, !dbg !1324
  %178 = getelementptr inbounds %struct.bpf_config, ptr %177, i32 0, i32 5, !dbg !1325
  store i8 0, ptr %178, align 1, !dbg !1326, !tbaa !1132
  br label %205, !dbg !1327

179:                                              ; preds = %32
  %180 = load ptr, ptr %7, align 8, !dbg !1328, !tbaa !741
  %181 = getelementptr inbounds %struct.pping_config, ptr %180, i32 0, i32 16, !dbg !1329
  store i8 1, ptr %181, align 4, !dbg !1330, !tbaa !860
  %182 = load ptr, ptr %7, align 8, !dbg !1331, !tbaa !741
  %183 = getelementptr inbounds %struct.pping_config, ptr %182, i32 0, i32 10, !dbg !1332
  %184 = load i32, ptr %183, align 8, !dbg !1333, !tbaa !855
  %185 = and i32 %184, -2, !dbg !1333
  store i32 %185, ptr %183, align 8, !dbg !1333, !tbaa !855
  br label %205, !dbg !1334

186:                                              ; preds = %32
  %187 = load ptr, ptr %7, align 8, !dbg !1335, !tbaa !741
  %188 = getelementptr inbounds %struct.pping_config, ptr %187, i32 0, i32 0, !dbg !1336
  %189 = getelementptr inbounds %struct.bpf_config, ptr %188, i32 0, i32 3, !dbg !1337
  store i8 1, ptr %189, align 1, !dbg !1338, !tbaa !751
  br label %205, !dbg !1339

190:                                              ; preds = %32
  %191 = load ptr, ptr %7, align 8, !dbg !1340, !tbaa !741
  %192 = getelementptr inbounds %struct.pping_config, ptr %191, i32 0, i32 0, !dbg !1341
  %193 = getelementptr inbounds %struct.bpf_config, ptr %192, i32 0, i32 4, !dbg !1342
  store i8 1, ptr %193, align 2, !dbg !1343, !tbaa !767
  br label %205, !dbg !1344

194:                                              ; preds = %32
  %195 = call i32 (ptr, ...) @printf(ptr noundef @.str.38), !dbg !1345
  %196 = load ptr, ptr %6, align 8, !dbg !1346, !tbaa !741
  call void @print_usage(ptr noundef %196), !dbg !1347
  call void @exit(i32 noundef 0) #15, !dbg !1348
  unreachable, !dbg !1348

197:                                              ; preds = %32
  %198 = load ptr, ptr @stderr, align 8, !dbg !1349, !tbaa !741
  %199 = load ptr, ptr %6, align 8, !dbg !1350, !tbaa !741
  %200 = load i32, ptr @optind, align 4, !dbg !1351, !tbaa !794
  %201 = sext i32 %200 to i64, !dbg !1350
  %202 = getelementptr inbounds ptr, ptr %199, i64 %201, !dbg !1350
  %203 = load ptr, ptr %202, align 8, !dbg !1350, !tbaa !741
  %204 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %198, ptr noundef @.str.39, ptr noundef %203), !dbg !1352
  store i32 -22, ptr %4, align 4, !dbg !1353
  store i32 1, ptr %13, align 4
  br label %215, !dbg !1353

205:                                              ; preds = %190, %186, %179, %175, %174, %155, %123, %116, %89, %76, %69
  br label %27, !dbg !1144, !llvm.loop !1354

206:                                              ; preds = %27
  %207 = load ptr, ptr %7, align 8, !dbg !1356, !tbaa !741
  %208 = getelementptr inbounds %struct.pping_config, ptr %207, i32 0, i32 11, !dbg !1358
  %209 = load i32, ptr %208, align 4, !dbg !1358, !tbaa !856
  %210 = icmp eq i32 %209, 0, !dbg !1359
  br i1 %210, label %211, label %214, !dbg !1360

211:                                              ; preds = %206
  %212 = load ptr, ptr @stderr, align 8, !dbg !1361, !tbaa !741
  %213 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %212, ptr noundef @.str.40), !dbg !1363
  store i32 -22, ptr %4, align 4, !dbg !1364
  store i32 1, ptr %13, align 4
  br label %215, !dbg !1364

214:                                              ; preds = %206
  store i32 0, ptr %4, align 4, !dbg !1365
  store i32 1, ptr %13, align 4
  br label %215, !dbg !1365

215:                                              ; preds = %214, %211, %197, %170, %150, %122, %112, %88, %75, %57, %38
  call void @llvm.lifetime.end.p0(i64 8, ptr %12) #12, !dbg !1366
  call void @llvm.lifetime.end.p0(i64 8, ptr %11) #12, !dbg !1366
  call void @llvm.lifetime.end.p0(i64 8, ptr %10) #12, !dbg !1366
  call void @llvm.lifetime.end.p0(i64 4, ptr %9) #12, !dbg !1366
  call void @llvm.lifetime.end.p0(i64 4, ptr %8) #12, !dbg !1366
  %216 = load i32, ptr %4, align 4, !dbg !1366
  ret i32 %216, !dbg !1366
}

; Function Attrs: nounwind
define internal void @print_usage(ptr noundef %0) #0 !dbg !1367 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1371, metadata !DIExpression()), !dbg !1373
  call void @llvm.lifetime.start.p0(i64 4, ptr %3) #12, !dbg !1374
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1372, metadata !DIExpression()), !dbg !1375
  %4 = load ptr, ptr @__doc__, align 8, !dbg !1376, !tbaa !741
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.52, ptr noundef %4), !dbg !1377
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.53), !dbg !1378
  %7 = load ptr, ptr %2, align 8, !dbg !1379, !tbaa !741
  %8 = getelementptr inbounds ptr, ptr %7, i64 0, !dbg !1379
  %9 = load ptr, ptr %8, align 8, !dbg !1379, !tbaa !741
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.54, ptr noundef %9), !dbg !1380
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.55), !dbg !1381
  store i32 0, ptr %3, align 4, !dbg !1382, !tbaa !794
  br label %12, !dbg !1384

12:                                               ; preds = %49, %1
  %13 = load i32, ptr %3, align 4, !dbg !1385, !tbaa !794
  %14 = sext i32 %13 to i64, !dbg !1387
  %15 = getelementptr inbounds [13 x %struct.option], ptr @long_options, i64 0, i64 %14, !dbg !1387
  %16 = getelementptr inbounds %struct.option, ptr %15, i32 0, i32 0, !dbg !1388
  %17 = load ptr, ptr %16, align 8, !dbg !1388, !tbaa !1389
  %18 = icmp ne ptr %17, null, !dbg !1391
  br i1 %18, label %19, label %52, !dbg !1392

19:                                               ; preds = %12
  %20 = load i32, ptr %3, align 4, !dbg !1393, !tbaa !794
  %21 = sext i32 %20 to i64, !dbg !1395
  %22 = getelementptr inbounds [13 x %struct.option], ptr @long_options, i64 0, i64 %21, !dbg !1395
  %23 = getelementptr inbounds %struct.option, ptr %22, i32 0, i32 0, !dbg !1396
  %24 = load ptr, ptr %23, align 8, !dbg !1396, !tbaa !1389
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.56, ptr noundef %24), !dbg !1397
  %26 = load i32, ptr %3, align 4, !dbg !1398, !tbaa !794
  %27 = sext i32 %26 to i64, !dbg !1400
  %28 = getelementptr inbounds [13 x %struct.option], ptr @long_options, i64 0, i64 %27, !dbg !1400
  %29 = getelementptr inbounds %struct.option, ptr %28, i32 0, i32 2, !dbg !1401
  %30 = load ptr, ptr %29, align 8, !dbg !1401, !tbaa !1402
  %31 = icmp ne ptr %30, null, !dbg !1403
  br i1 %31, label %32, label %40, !dbg !1404

32:                                               ; preds = %19
  %33 = load i32, ptr %3, align 4, !dbg !1405, !tbaa !794
  %34 = sext i32 %33 to i64, !dbg !1406
  %35 = getelementptr inbounds [13 x %struct.option], ptr @long_options, i64 0, i64 %34, !dbg !1406
  %36 = getelementptr inbounds %struct.option, ptr %35, i32 0, i32 2, !dbg !1407
  %37 = load ptr, ptr %36, align 8, !dbg !1407, !tbaa !1402
  %38 = load i32, ptr %37, align 4, !dbg !1408, !tbaa !794
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.57, i32 noundef %38), !dbg !1409
  br label %47, !dbg !1409

40:                                               ; preds = %19
  %41 = load i32, ptr %3, align 4, !dbg !1410, !tbaa !794
  %42 = sext i32 %41 to i64, !dbg !1411
  %43 = getelementptr inbounds [13 x %struct.option], ptr @long_options, i64 0, i64 %42, !dbg !1411
  %44 = getelementptr inbounds %struct.option, ptr %43, i32 0, i32 3, !dbg !1412
  %45 = load i32, ptr %44, align 8, !dbg !1412, !tbaa !1413
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.58, i32 noundef %45), !dbg !1414
  br label %47

47:                                               ; preds = %40, %32
  %48 = call i32 (ptr, ...) @printf(ptr noundef @.str.53), !dbg !1415
  br label %49, !dbg !1416

49:                                               ; preds = %47
  %50 = load i32, ptr %3, align 4, !dbg !1417, !tbaa !794
  %51 = add nsw i32 %50, 1, !dbg !1417
  store i32 %51, ptr %3, align 4, !dbg !1417, !tbaa !794
  br label %12, !dbg !1418, !llvm.loop !1419

52:                                               ; preds = %12
  %53 = call i32 (ptr, ...) @printf(ptr noundef @.str.53), !dbg !1421
  call void @llvm.lifetime.end.p0(i64 4, ptr %3) #12, !dbg !1422
  ret void, !dbg !1422
}

; Function Attrs: nounwind
define internal void @print_event_standard(ptr noundef %0) #0 !dbg !1423 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1425, metadata !DIExpression()), !dbg !1426
  %3 = load ptr, ptr %2, align 8, !dbg !1427, !tbaa !741
  %4 = load i64, ptr %3, align 8, !dbg !1429, !tbaa !779
  %5 = icmp eq i64 %4, 2, !dbg !1430
  br i1 %5, label %6, label %37, !dbg !1431

6:                                                ; preds = %1
  %7 = load ptr, ptr @stdout, align 8, !dbg !1432, !tbaa !741
  %8 = load ptr, ptr %2, align 8, !dbg !1434, !tbaa !741
  %9 = getelementptr inbounds %struct.rtt_event, ptr %8, i32 0, i32 1, !dbg !1435
  %10 = load i64, ptr %9, align 8, !dbg !1435, !tbaa !779
  call void @print_ns_datetime(ptr noundef %7, i64 noundef %10), !dbg !1436
  %11 = load ptr, ptr %2, align 8, !dbg !1437, !tbaa !741
  %12 = getelementptr inbounds %struct.rtt_event, ptr %11, i32 0, i32 4, !dbg !1438
  %13 = load i64, ptr %12, align 8, !dbg !1438, !tbaa !779
  %14 = udiv i64 %13, 1000000, !dbg !1439
  %15 = load ptr, ptr %2, align 8, !dbg !1440, !tbaa !741
  %16 = getelementptr inbounds %struct.rtt_event, ptr %15, i32 0, i32 4, !dbg !1441
  %17 = load i64, ptr %16, align 8, !dbg !1441, !tbaa !779
  %18 = urem i64 %17, 1000000, !dbg !1442
  %19 = load ptr, ptr %2, align 8, !dbg !1443, !tbaa !741
  %20 = getelementptr inbounds %struct.rtt_event, ptr %19, i32 0, i32 5, !dbg !1444
  %21 = load i64, ptr %20, align 8, !dbg !1444, !tbaa !779
  %22 = udiv i64 %21, 1000000, !dbg !1445
  %23 = load ptr, ptr %2, align 8, !dbg !1446, !tbaa !741
  %24 = getelementptr inbounds %struct.rtt_event, ptr %23, i32 0, i32 5, !dbg !1447
  %25 = load i64, ptr %24, align 8, !dbg !1447, !tbaa !779
  %26 = urem i64 %25, 1000000, !dbg !1448
  %27 = load ptr, ptr %2, align 8, !dbg !1449, !tbaa !741
  %28 = getelementptr inbounds %struct.rtt_event, ptr %27, i32 0, i32 2, !dbg !1450
  %29 = getelementptr inbounds %struct.network_tuple, ptr %28, i32 0, i32 2, !dbg !1451
  %30 = load i16, ptr %29, align 8, !dbg !1451, !tbaa !779
  %31 = call ptr @proto_to_str(i16 noundef zeroext %30), !dbg !1452
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.60, i64 noundef %14, i64 noundef %18, i64 noundef %22, i64 noundef %26, ptr noundef %31), !dbg !1453
  %33 = load ptr, ptr @stdout, align 8, !dbg !1454, !tbaa !741
  %34 = load ptr, ptr %2, align 8, !dbg !1455, !tbaa !741
  %35 = getelementptr inbounds %struct.rtt_event, ptr %34, i32 0, i32 2, !dbg !1456
  call void @print_flow_ppvizformat(ptr noundef %33, ptr noundef %35), !dbg !1457
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.53), !dbg !1458
  br label %69, !dbg !1459

37:                                               ; preds = %1
  %38 = load ptr, ptr %2, align 8, !dbg !1460, !tbaa !741
  %39 = load i64, ptr %38, align 8, !dbg !1462, !tbaa !779
  %40 = icmp eq i64 %39, 1, !dbg !1463
  br i1 %40, label %41, label %68, !dbg !1464

41:                                               ; preds = %37
  %42 = load ptr, ptr @stdout, align 8, !dbg !1465, !tbaa !741
  %43 = load ptr, ptr %2, align 8, !dbg !1467, !tbaa !741
  %44 = getelementptr inbounds %struct.flow_event, ptr %43, i32 0, i32 1, !dbg !1468
  %45 = load i64, ptr %44, align 8, !dbg !1468, !tbaa !779
  call void @print_ns_datetime(ptr noundef %42, i64 noundef %45), !dbg !1469
  %46 = load ptr, ptr %2, align 8, !dbg !1470, !tbaa !741
  %47 = getelementptr inbounds %struct.rtt_event, ptr %46, i32 0, i32 2, !dbg !1471
  %48 = getelementptr inbounds %struct.network_tuple, ptr %47, i32 0, i32 2, !dbg !1472
  %49 = load i16, ptr %48, align 8, !dbg !1472, !tbaa !779
  %50 = call ptr @proto_to_str(i16 noundef zeroext %49), !dbg !1473
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.61, ptr noundef %50), !dbg !1474
  %52 = load ptr, ptr @stdout, align 8, !dbg !1475, !tbaa !741
  %53 = load ptr, ptr %2, align 8, !dbg !1476, !tbaa !741
  %54 = getelementptr inbounds %struct.flow_event, ptr %53, i32 0, i32 2, !dbg !1477
  call void @print_flow_ppvizformat(ptr noundef %52, ptr noundef %54), !dbg !1478
  %55 = load ptr, ptr %2, align 8, !dbg !1479, !tbaa !741
  %56 = getelementptr inbounds %struct.flow_event, ptr %55, i32 0, i32 3, !dbg !1480
  %57 = load i8, ptr %56, align 4, !dbg !1480, !tbaa !779
  %58 = call ptr @flowevent_to_str(i8 noundef zeroext %57), !dbg !1481
  %59 = load ptr, ptr %2, align 8, !dbg !1482, !tbaa !741
  %60 = getelementptr inbounds %struct.flow_event, ptr %59, i32 0, i32 4, !dbg !1483
  %61 = load i8, ptr %60, align 1, !dbg !1483, !tbaa !779
  %62 = call ptr @eventreason_to_str(i8 noundef zeroext %61), !dbg !1484
  %63 = load ptr, ptr %2, align 8, !dbg !1485, !tbaa !741
  %64 = getelementptr inbounds %struct.flow_event, ptr %63, i32 0, i32 5, !dbg !1486
  %65 = load i8, ptr %64, align 2, !dbg !1486, !tbaa !779
  %66 = call ptr @eventsource_to_str(i8 noundef zeroext %65), !dbg !1487
  %67 = call i32 (ptr, ...) @printf(ptr noundef @.str.62, ptr noundef %58, ptr noundef %62, ptr noundef %66), !dbg !1488
  br label %68, !dbg !1489

68:                                               ; preds = %41, %37
  br label %69

69:                                               ; preds = %68, %6
  ret void, !dbg !1490
}

; Function Attrs: nounwind
define internal void @print_event_json(ptr noundef %0) #0 !dbg !1491 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1493, metadata !DIExpression()), !dbg !1494
  %3 = load ptr, ptr %2, align 8, !dbg !1495, !tbaa !741
  %4 = load i64, ptr %3, align 8, !dbg !1497, !tbaa !779
  %5 = icmp ne i64 %4, 2, !dbg !1498
  br i1 %5, label %6, label %11, !dbg !1499

6:                                                ; preds = %1
  %7 = load ptr, ptr %2, align 8, !dbg !1500, !tbaa !741
  %8 = load i64, ptr %7, align 8, !dbg !1501, !tbaa !779
  %9 = icmp ne i64 %8, 1, !dbg !1502
  br i1 %9, label %10, label %11, !dbg !1503

10:                                               ; preds = %6
  br label %33, !dbg !1504

11:                                               ; preds = %6, %1
  %12 = load ptr, ptr @json_ctx, align 8, !dbg !1505, !tbaa !741
  %13 = icmp ne ptr %12, null, !dbg !1505
  br i1 %13, label %18, label %14, !dbg !1507

14:                                               ; preds = %11
  %15 = load ptr, ptr @stdout, align 8, !dbg !1508, !tbaa !741
  %16 = call ptr @jsonw_new(ptr noundef %15), !dbg !1510
  store ptr %16, ptr @json_ctx, align 8, !dbg !1511, !tbaa !741
  %17 = load ptr, ptr @json_ctx, align 8, !dbg !1512, !tbaa !741
  call void @jsonw_start_array(ptr noundef %17), !dbg !1513
  br label %18, !dbg !1514

18:                                               ; preds = %14, %11
  %19 = load ptr, ptr @json_ctx, align 8, !dbg !1515, !tbaa !741
  call void @jsonw_start_object(ptr noundef %19), !dbg !1516
  %20 = load ptr, ptr @json_ctx, align 8, !dbg !1517, !tbaa !741
  %21 = load ptr, ptr %2, align 8, !dbg !1518, !tbaa !741
  call void @print_common_fields_json(ptr noundef %20, ptr noundef %21), !dbg !1519
  %22 = load ptr, ptr %2, align 8, !dbg !1520, !tbaa !741
  %23 = load i64, ptr %22, align 8, !dbg !1522, !tbaa !779
  %24 = icmp eq i64 %23, 2, !dbg !1523
  br i1 %24, label %25, label %28, !dbg !1524

25:                                               ; preds = %18
  %26 = load ptr, ptr @json_ctx, align 8, !dbg !1525, !tbaa !741
  %27 = load ptr, ptr %2, align 8, !dbg !1526, !tbaa !741
  call void @print_rttevent_fields_json(ptr noundef %26, ptr noundef %27), !dbg !1527
  br label %31, !dbg !1527

28:                                               ; preds = %18
  %29 = load ptr, ptr @json_ctx, align 8, !dbg !1528, !tbaa !741
  %30 = load ptr, ptr %2, align 8, !dbg !1529, !tbaa !741
  call void @print_flowevent_fields_json(ptr noundef %29, ptr noundef %30), !dbg !1530
  br label %31

31:                                               ; preds = %28, %25
  %32 = load ptr, ptr @json_ctx, align 8, !dbg !1531, !tbaa !741
  call void @jsonw_end_object(ptr noundef %32), !dbg !1532
  br label %33, !dbg !1533

33:                                               ; preds = %31, %10
  ret void, !dbg !1533
}

; Function Attrs: nounwind
define internal void @print_event_ppviz(ptr noundef %0) #0 !dbg !1534 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %2, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1536, metadata !DIExpression()), !dbg !1541
  %5 = load ptr, ptr %2, align 8, !dbg !1542, !tbaa !741
  %6 = load i64, ptr %5, align 8, !dbg !1544, !tbaa !779
  %7 = icmp ne i64 %6, 2, !dbg !1545
  br i1 %7, label %8, label %9, !dbg !1546

8:                                                ; preds = %1
  br label %39, !dbg !1547

9:                                                ; preds = %1
  call void @llvm.lifetime.start.p0(i64 8, ptr %3) #12, !dbg !1548
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1537, metadata !DIExpression()), !dbg !1549
  %10 = load ptr, ptr %2, align 8, !dbg !1550, !tbaa !741
  store ptr %10, ptr %3, align 8, !dbg !1549, !tbaa !741
  call void @llvm.lifetime.start.p0(i64 8, ptr %4) #12, !dbg !1551
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1540, metadata !DIExpression()), !dbg !1552
  %11 = load ptr, ptr %3, align 8, !dbg !1553, !tbaa !741
  %12 = getelementptr inbounds %struct.rtt_event, ptr %11, i32 0, i32 1, !dbg !1554
  %13 = load i64, ptr %12, align 8, !dbg !1554, !tbaa !1555
  %14 = call i64 @convert_monotonic_to_realtime(i64 noundef %13), !dbg !1561
  store i64 %14, ptr %4, align 8, !dbg !1552, !tbaa !1562
  %15 = load i64, ptr %4, align 8, !dbg !1563, !tbaa !1562
  %16 = udiv i64 %15, 1000000000, !dbg !1564
  %17 = load i64, ptr %4, align 8, !dbg !1565, !tbaa !1562
  %18 = urem i64 %17, 1000000000, !dbg !1566
  %19 = load ptr, ptr %3, align 8, !dbg !1567, !tbaa !741
  %20 = getelementptr inbounds %struct.rtt_event, ptr %19, i32 0, i32 4, !dbg !1568
  %21 = load i64, ptr %20, align 8, !dbg !1568, !tbaa !1569
  %22 = udiv i64 %21, 1000000000, !dbg !1570
  %23 = load ptr, ptr %3, align 8, !dbg !1571, !tbaa !741
  %24 = getelementptr inbounds %struct.rtt_event, ptr %23, i32 0, i32 4, !dbg !1572
  %25 = load i64, ptr %24, align 8, !dbg !1572, !tbaa !1569
  %26 = urem i64 %25, 1000000000, !dbg !1573
  %27 = load ptr, ptr %3, align 8, !dbg !1574, !tbaa !741
  %28 = getelementptr inbounds %struct.rtt_event, ptr %27, i32 0, i32 5, !dbg !1575
  %29 = load i64, ptr %28, align 8, !dbg !1575, !tbaa !1576
  %30 = udiv i64 %29, 1000000000, !dbg !1577
  %31 = load ptr, ptr %3, align 8, !dbg !1578, !tbaa !741
  %32 = getelementptr inbounds %struct.rtt_event, ptr %31, i32 0, i32 5, !dbg !1579
  %33 = load i64, ptr %32, align 8, !dbg !1579, !tbaa !1576
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.97, i64 noundef %16, i64 noundef %18, i64 noundef %22, i64 noundef %26, i64 noundef %30, i64 noundef %33), !dbg !1580
  %35 = load ptr, ptr @stdout, align 8, !dbg !1581, !tbaa !741
  %36 = load ptr, ptr %3, align 8, !dbg !1582, !tbaa !741
  %37 = getelementptr inbounds %struct.rtt_event, ptr %36, i32 0, i32 2, !dbg !1583
  call void @print_flow_ppvizformat(ptr noundef %35, ptr noundef %37), !dbg !1584
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.53), !dbg !1585
  call void @llvm.lifetime.end.p0(i64 8, ptr %4) #12, !dbg !1586
  call void @llvm.lifetime.end.p0(i64 8, ptr %3) #12, !dbg !1586
  br label %39, !dbg !1586

39:                                               ; preds = %9, %8
  ret void, !dbg !1586
}

; Function Attrs: nounwind
define internal i32 @load_attach_bpfprogs(ptr noundef %0, ptr noundef %1) #0 !dbg !1587 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1592, metadata !DIExpression()), !dbg !1597
  store ptr %1, ptr %5, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1593, metadata !DIExpression()), !dbg !1598
  call void @llvm.lifetime.start.p0(i64 4, ptr %6) #12, !dbg !1599
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1594, metadata !DIExpression()), !dbg !1600
  call void @llvm.lifetime.start.p0(i64 4, ptr %7) #12, !dbg !1599
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1595, metadata !DIExpression()), !dbg !1601
  %9 = load ptr, ptr %5, align 8, !dbg !1602, !tbaa !741
  %10 = getelementptr inbounds %struct.pping_config, ptr %9, i32 0, i32 4, !dbg !1603
  %11 = load ptr, ptr %10, align 8, !dbg !1603, !tbaa !849
  %12 = call ptr @bpf_object__open(ptr noundef %11), !dbg !1604
  %13 = load ptr, ptr %4, align 8, !dbg !1605, !tbaa !741
  store ptr %12, ptr %13, align 8, !dbg !1606, !tbaa !741
  %14 = load ptr, ptr %4, align 8, !dbg !1607, !tbaa !741
  %15 = load ptr, ptr %14, align 8, !dbg !1608, !tbaa !741
  %16 = call i64 @libbpf_get_error(ptr noundef %15), !dbg !1609
  %17 = trunc i64 %16 to i32, !dbg !1609
  store i32 %17, ptr %6, align 4, !dbg !1610, !tbaa !794
  %18 = load i32, ptr %6, align 4, !dbg !1611, !tbaa !794
  %19 = icmp ne i32 %18, 0, !dbg !1611
  br i1 %19, label %20, label %29, !dbg !1613

20:                                               ; preds = %2
  %21 = load ptr, ptr @stderr, align 8, !dbg !1614, !tbaa !741
  %22 = load ptr, ptr %5, align 8, !dbg !1616, !tbaa !741
  %23 = getelementptr inbounds %struct.pping_config, ptr %22, i32 0, i32 4, !dbg !1617
  %24 = load ptr, ptr %23, align 8, !dbg !1617, !tbaa !849
  %25 = load i32, ptr %6, align 4, !dbg !1618, !tbaa !794
  %26 = call ptr @get_libbpf_strerror(i32 noundef %25), !dbg !1619
  %27 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %21, ptr noundef @.str.98, ptr noundef %24, ptr noundef %26), !dbg !1620
  %28 = load i32, ptr %6, align 4, !dbg !1621, !tbaa !794
  store i32 %28, ptr %3, align 4, !dbg !1622
  store i32 1, ptr %8, align 4
  br label %182, !dbg !1622

29:                                               ; preds = %2
  %30 = load ptr, ptr %4, align 8, !dbg !1623, !tbaa !741
  %31 = load ptr, ptr %30, align 8, !dbg !1624, !tbaa !741
  %32 = load ptr, ptr %5, align 8, !dbg !1625, !tbaa !741
  %33 = getelementptr inbounds %struct.pping_config, ptr %32, i32 0, i32 0, !dbg !1626
  %34 = call i32 @init_rodata(ptr noundef %31, ptr noundef %33, i64 noundef 24), !dbg !1627
  store i32 %34, ptr %6, align 4, !dbg !1628, !tbaa !794
  %35 = load i32, ptr %6, align 4, !dbg !1629, !tbaa !794
  %36 = icmp ne i32 %35, 0, !dbg !1629
  br i1 %36, label %37, label %46, !dbg !1631

37:                                               ; preds = %29
  %38 = load ptr, ptr @stderr, align 8, !dbg !1632, !tbaa !741
  %39 = load ptr, ptr %5, align 8, !dbg !1634, !tbaa !741
  %40 = getelementptr inbounds %struct.pping_config, ptr %39, i32 0, i32 4, !dbg !1635
  %41 = load ptr, ptr %40, align 8, !dbg !1635, !tbaa !849
  %42 = load i32, ptr %6, align 4, !dbg !1636, !tbaa !794
  %43 = call ptr @get_libbpf_strerror(i32 noundef %42), !dbg !1637
  %44 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %38, ptr noundef @.str.99, ptr noundef %41, ptr noundef %43), !dbg !1638
  %45 = load i32, ptr %6, align 4, !dbg !1639, !tbaa !794
  store i32 %45, ptr %3, align 4, !dbg !1640
  store i32 1, ptr %8, align 4
  br label %182, !dbg !1640

46:                                               ; preds = %29
  %47 = load ptr, ptr %4, align 8, !dbg !1641, !tbaa !741
  %48 = load ptr, ptr %47, align 8, !dbg !1642, !tbaa !741
  %49 = load ptr, ptr %5, align 8, !dbg !1643, !tbaa !741
  %50 = call i32 @set_programs_to_load(ptr noundef %48, ptr noundef %49), !dbg !1644
  %51 = load ptr, ptr %4, align 8, !dbg !1645, !tbaa !741
  %52 = load ptr, ptr %51, align 8, !dbg !1646, !tbaa !741
  %53 = call i32 @bpf_object__load(ptr noundef %52), !dbg !1647
  store i32 %53, ptr %6, align 4, !dbg !1648, !tbaa !794
  %54 = load i32, ptr %6, align 4, !dbg !1649, !tbaa !794
  %55 = icmp ne i32 %54, 0, !dbg !1649
  br i1 %55, label %56, label %65, !dbg !1651

56:                                               ; preds = %46
  %57 = load ptr, ptr @stderr, align 8, !dbg !1652, !tbaa !741
  %58 = load ptr, ptr %5, align 8, !dbg !1654, !tbaa !741
  %59 = getelementptr inbounds %struct.pping_config, ptr %58, i32 0, i32 4, !dbg !1655
  %60 = load ptr, ptr %59, align 8, !dbg !1655, !tbaa !849
  %61 = load i32, ptr %6, align 4, !dbg !1656, !tbaa !794
  %62 = call ptr @get_libbpf_strerror(i32 noundef %61), !dbg !1657
  %63 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %57, ptr noundef @.str.100, ptr noundef %60, ptr noundef %62), !dbg !1658
  %64 = load i32, ptr %6, align 4, !dbg !1659, !tbaa !794
  store i32 %64, ptr %3, align 4, !dbg !1660
  store i32 1, ptr %8, align 4
  br label %182, !dbg !1660

65:                                               ; preds = %46
  %66 = load ptr, ptr %4, align 8, !dbg !1661, !tbaa !741
  %67 = load ptr, ptr %66, align 8, !dbg !1662, !tbaa !741
  %68 = load ptr, ptr %5, align 8, !dbg !1663, !tbaa !741
  %69 = getelementptr inbounds %struct.pping_config, ptr %68, i32 0, i32 11, !dbg !1664
  %70 = load i32, ptr %69, align 4, !dbg !1664, !tbaa !856
  %71 = load ptr, ptr %5, align 8, !dbg !1665, !tbaa !741
  %72 = getelementptr inbounds %struct.pping_config, ptr %71, i32 0, i32 6, !dbg !1666
  %73 = load ptr, ptr %72, align 8, !dbg !1666, !tbaa !851
  %74 = load ptr, ptr %5, align 8, !dbg !1667, !tbaa !741
  %75 = getelementptr inbounds %struct.pping_config, ptr %74, i32 0, i32 2, !dbg !1668
  %76 = load ptr, ptr %5, align 8, !dbg !1669, !tbaa !741
  %77 = getelementptr inbounds %struct.pping_config, ptr %76, i32 0, i32 17, !dbg !1670
  %78 = call i32 @tc_attach(ptr noundef %67, i32 noundef %70, i32 noundef 2, ptr noundef %73, ptr noundef %75, ptr noundef %77), !dbg !1671
  %79 = load ptr, ptr %5, align 8, !dbg !1672, !tbaa !741
  %80 = getelementptr inbounds %struct.pping_config, ptr %79, i32 0, i32 13, !dbg !1673
  store i32 %78, ptr %80, align 4, !dbg !1674, !tbaa !858
  %81 = load ptr, ptr %5, align 8, !dbg !1675, !tbaa !741
  %82 = getelementptr inbounds %struct.pping_config, ptr %81, i32 0, i32 13, !dbg !1677
  %83 = load i32, ptr %82, align 4, !dbg !1677, !tbaa !858
  %84 = icmp slt i32 %83, 0, !dbg !1678
  br i1 %84, label %85, label %98, !dbg !1679

85:                                               ; preds = %65
  %86 = load ptr, ptr @stderr, align 8, !dbg !1680, !tbaa !741
  %87 = load ptr, ptr %5, align 8, !dbg !1682, !tbaa !741
  %88 = getelementptr inbounds %struct.pping_config, ptr %87, i32 0, i32 14, !dbg !1683
  %89 = getelementptr inbounds [16 x i8], ptr %88, i64 0, i64 0, !dbg !1682
  %90 = load ptr, ptr %5, align 8, !dbg !1684, !tbaa !741
  %91 = getelementptr inbounds %struct.pping_config, ptr %90, i32 0, i32 13, !dbg !1685
  %92 = load i32, ptr %91, align 4, !dbg !1685, !tbaa !858
  %93 = call ptr @get_libbpf_strerror(i32 noundef %92), !dbg !1686
  %94 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %86, ptr noundef @.str.101, ptr noundef %89, ptr noundef %93), !dbg !1687
  %95 = load ptr, ptr %5, align 8, !dbg !1688, !tbaa !741
  %96 = getelementptr inbounds %struct.pping_config, ptr %95, i32 0, i32 13, !dbg !1689
  %97 = load i32, ptr %96, align 4, !dbg !1689, !tbaa !858
  store i32 %97, ptr %3, align 4, !dbg !1690
  store i32 1, ptr %8, align 4
  br label %182, !dbg !1690

98:                                               ; preds = %65
  %99 = load ptr, ptr %5, align 8, !dbg !1691, !tbaa !741
  %100 = getelementptr inbounds %struct.pping_config, ptr %99, i32 0, i32 5, !dbg !1693
  %101 = load ptr, ptr %100, align 8, !dbg !1693, !tbaa !850
  %102 = call i32 @strcmp(ptr noundef %101, ptr noundef @.str.8) #13, !dbg !1694
  %103 = icmp eq i32 %102, 0, !dbg !1695
  br i1 %103, label %104, label %119, !dbg !1696

104:                                              ; preds = %98
  %105 = load ptr, ptr %4, align 8, !dbg !1697, !tbaa !741
  %106 = load ptr, ptr %105, align 8, !dbg !1698, !tbaa !741
  %107 = load ptr, ptr %5, align 8, !dbg !1699, !tbaa !741
  %108 = getelementptr inbounds %struct.pping_config, ptr %107, i32 0, i32 5, !dbg !1700
  %109 = load ptr, ptr %108, align 8, !dbg !1700, !tbaa !850
  %110 = load ptr, ptr %5, align 8, !dbg !1701, !tbaa !741
  %111 = getelementptr inbounds %struct.pping_config, ptr %110, i32 0, i32 11, !dbg !1702
  %112 = load i32, ptr %111, align 4, !dbg !1702, !tbaa !856
  %113 = load ptr, ptr %5, align 8, !dbg !1703, !tbaa !741
  %114 = getelementptr inbounds %struct.pping_config, ptr %113, i32 0, i32 10, !dbg !1704
  %115 = load i32, ptr %114, align 8, !dbg !1704, !tbaa !855
  %116 = call i32 @xdp_attach(ptr noundef %106, ptr noundef %109, i32 noundef %112, i32 noundef %115), !dbg !1705
  %117 = load ptr, ptr %5, align 8, !dbg !1706, !tbaa !741
  %118 = getelementptr inbounds %struct.pping_config, ptr %117, i32 0, i32 12, !dbg !1707
  store i32 %116, ptr %118, align 8, !dbg !1708, !tbaa !857
  br label %133, !dbg !1706

119:                                              ; preds = %98
  %120 = load ptr, ptr %4, align 8, !dbg !1709, !tbaa !741
  %121 = load ptr, ptr %120, align 8, !dbg !1710, !tbaa !741
  %122 = load ptr, ptr %5, align 8, !dbg !1711, !tbaa !741
  %123 = getelementptr inbounds %struct.pping_config, ptr %122, i32 0, i32 11, !dbg !1712
  %124 = load i32, ptr %123, align 4, !dbg !1712, !tbaa !856
  %125 = load ptr, ptr %5, align 8, !dbg !1713, !tbaa !741
  %126 = getelementptr inbounds %struct.pping_config, ptr %125, i32 0, i32 5, !dbg !1714
  %127 = load ptr, ptr %126, align 8, !dbg !1714, !tbaa !850
  %128 = load ptr, ptr %5, align 8, !dbg !1715, !tbaa !741
  %129 = getelementptr inbounds %struct.pping_config, ptr %128, i32 0, i32 1, !dbg !1716
  %130 = call i32 @tc_attach(ptr noundef %121, i32 noundef %124, i32 noundef 1, ptr noundef %127, ptr noundef %129, ptr noundef null), !dbg !1717
  %131 = load ptr, ptr %5, align 8, !dbg !1718, !tbaa !741
  %132 = getelementptr inbounds %struct.pping_config, ptr %131, i32 0, i32 12, !dbg !1719
  store i32 %130, ptr %132, align 8, !dbg !1720, !tbaa !857
  br label %133

133:                                              ; preds = %119, %104
  %134 = load ptr, ptr %5, align 8, !dbg !1721, !tbaa !741
  %135 = getelementptr inbounds %struct.pping_config, ptr %134, i32 0, i32 12, !dbg !1723
  %136 = load i32, ptr %135, align 8, !dbg !1723, !tbaa !857
  %137 = icmp slt i32 %136, 0, !dbg !1724
  br i1 %137, label %138, label %158, !dbg !1725

138:                                              ; preds = %133
  %139 = load ptr, ptr @stderr, align 8, !dbg !1726, !tbaa !741
  %140 = load ptr, ptr %5, align 8, !dbg !1728, !tbaa !741
  %141 = getelementptr inbounds %struct.pping_config, ptr %140, i32 0, i32 14, !dbg !1729
  %142 = getelementptr inbounds [16 x i8], ptr %141, i64 0, i64 0, !dbg !1728
  %143 = load i32, ptr %6, align 4, !dbg !1730, !tbaa !794
  %144 = call ptr @get_libbpf_strerror(i32 noundef %143), !dbg !1731
  %145 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %139, ptr noundef @.str.102, ptr noundef %142, ptr noundef %144), !dbg !1732
  %146 = load ptr, ptr %5, align 8, !dbg !1733, !tbaa !741
  %147 = getelementptr inbounds %struct.pping_config, ptr %146, i32 0, i32 12, !dbg !1734
  %148 = load i32, ptr %147, align 8, !dbg !1734, !tbaa !857
  store i32 %148, ptr %6, align 4, !dbg !1735, !tbaa !794
  %149 = load ptr, ptr %5, align 8, !dbg !1736, !tbaa !741
  %150 = getelementptr inbounds %struct.pping_config, ptr %149, i32 0, i32 5, !dbg !1738
  %151 = load ptr, ptr %150, align 8, !dbg !1738, !tbaa !850
  %152 = call i32 @strcmp(ptr noundef %151, ptr noundef @.str.8) #13, !dbg !1739
  %153 = icmp eq i32 %152, 0, !dbg !1740
  br i1 %153, label %154, label %157, !dbg !1741

154:                                              ; preds = %138
  %155 = load ptr, ptr @stderr, align 8, !dbg !1742, !tbaa !741
  %156 = load i32, ptr %6, align 4, !dbg !1743, !tbaa !794
  call void @print_xdp_error_hints(ptr noundef %155, i32 noundef %156), !dbg !1744
  br label %157, !dbg !1744

157:                                              ; preds = %154, %138
  br label %159, !dbg !1745

158:                                              ; preds = %133
  store i32 0, ptr %3, align 4, !dbg !1746
  store i32 1, ptr %8, align 4
  br label %182, !dbg !1746

159:                                              ; preds = %157
  call void @llvm.dbg.label(metadata !1596), !dbg !1747
  %160 = load ptr, ptr %5, align 8, !dbg !1748, !tbaa !741
  %161 = getelementptr inbounds %struct.pping_config, ptr %160, i32 0, i32 11, !dbg !1749
  %162 = load i32, ptr %161, align 4, !dbg !1749, !tbaa !856
  %163 = load ptr, ptr %5, align 8, !dbg !1750, !tbaa !741
  %164 = getelementptr inbounds %struct.pping_config, ptr %163, i32 0, i32 2, !dbg !1751
  %165 = load ptr, ptr %5, align 8, !dbg !1752, !tbaa !741
  %166 = getelementptr inbounds %struct.pping_config, ptr %165, i32 0, i32 17, !dbg !1753
  %167 = load i8, ptr %166, align 1, !dbg !1753, !tbaa !861, !range !759, !noundef !760
  %168 = trunc i8 %167 to i1, !dbg !1753
  %169 = call i32 @tc_detach(i32 noundef %162, i32 noundef 2, ptr noundef %164, i1 noundef zeroext %168), !dbg !1754
  store i32 %169, ptr %7, align 4, !dbg !1755, !tbaa !794
  %170 = load i32, ptr %7, align 4, !dbg !1756, !tbaa !794
  %171 = icmp ne i32 %170, 0, !dbg !1756
  br i1 %171, label %172, label %180, !dbg !1758

172:                                              ; preds = %159
  %173 = load ptr, ptr @stderr, align 8, !dbg !1759, !tbaa !741
  %174 = load ptr, ptr %5, align 8, !dbg !1760, !tbaa !741
  %175 = getelementptr inbounds %struct.pping_config, ptr %174, i32 0, i32 14, !dbg !1761
  %176 = getelementptr inbounds [16 x i8], ptr %175, i64 0, i64 0, !dbg !1760
  %177 = load i32, ptr %7, align 4, !dbg !1762, !tbaa !794
  %178 = call ptr @get_libbpf_strerror(i32 noundef %177), !dbg !1763
  %179 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %173, ptr noundef @.str.103, ptr noundef %176, ptr noundef %178), !dbg !1764
  br label %180, !dbg !1764

180:                                              ; preds = %172, %159
  %181 = load i32, ptr %6, align 4, !dbg !1765, !tbaa !794
  store i32 %181, ptr %3, align 4, !dbg !1766
  store i32 1, ptr %8, align 4
  br label %182, !dbg !1766

182:                                              ; preds = %180, %158, %85, %56, %37, %20
  call void @llvm.lifetime.end.p0(i64 4, ptr %7) #12, !dbg !1767
  call void @llvm.lifetime.end.p0(i64 4, ptr %6) #12, !dbg !1767
  %183 = load i32, ptr %3, align 4, !dbg !1767
  ret i32 %183, !dbg !1767
}

; Function Attrs: nounwind
define internal i32 @setup_periodical_map_cleaning(ptr noundef %0, ptr noundef %1) #0 !dbg !1768 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca %struct.map_cleanup_args, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1772, metadata !DIExpression()), !dbg !1784
  store ptr %1, ptr %5, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1773, metadata !DIExpression()), !dbg !1785
  call void @llvm.lifetime.start.p0(i64 8, ptr %6) #12, !dbg !1786
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1774, metadata !DIExpression()), !dbg !1787
  call void @llvm.lifetime.start.p0(i64 16, ptr %7) #12, !dbg !1788
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1777, metadata !DIExpression()), !dbg !1789
  %10 = getelementptr inbounds %struct.map_cleanup_args, ptr %7, i32 0, i32 0, !dbg !1790
  %11 = load ptr, ptr %5, align 8, !dbg !1791, !tbaa !741
  %12 = getelementptr inbounds %struct.pping_config, ptr %11, i32 0, i32 3, !dbg !1792
  %13 = load i64, ptr %12, align 8, !dbg !1792, !tbaa !848
  store i64 %13, ptr %10, align 8, !dbg !1790, !tbaa !1793
  %14 = getelementptr inbounds %struct.map_cleanup_args, ptr %7, i32 0, i32 1, !dbg !1790
  store i32 0, ptr %14, align 8, !dbg !1790, !tbaa !1795
  %15 = getelementptr inbounds %struct.map_cleanup_args, ptr %7, i32 0, i32 2, !dbg !1790
  store i32 0, ptr %15, align 4, !dbg !1790, !tbaa !1796
  call void @llvm.lifetime.start.p0(i64 4, ptr %8) #12, !dbg !1797
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1783, metadata !DIExpression()), !dbg !1798
  %16 = getelementptr inbounds %struct.map_cleanup_args, ptr %7, i32 0, i32 0, !dbg !1799
  %17 = load i64, ptr %16, align 8, !dbg !1799, !tbaa !1793
  %18 = icmp ne i64 %17, 0, !dbg !1801
  br i1 %18, label %22, label %19, !dbg !1802

19:                                               ; preds = %2
  %20 = load ptr, ptr @stderr, align 8, !dbg !1803, !tbaa !741
  %21 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %20, ptr noundef @.str.107), !dbg !1805
  store i32 0, ptr %3, align 4, !dbg !1806
  store i32 1, ptr %9, align 4
  br label %75, !dbg !1806

22:                                               ; preds = %2
  %23 = load ptr, ptr %4, align 8, !dbg !1807, !tbaa !741
  %24 = load ptr, ptr %5, align 8, !dbg !1808, !tbaa !741
  %25 = getelementptr inbounds %struct.pping_config, ptr %24, i32 0, i32 7, !dbg !1809
  %26 = load ptr, ptr %25, align 8, !dbg !1809, !tbaa !852
  %27 = call i32 @bpf_object__find_map_fd_by_name(ptr noundef %23, ptr noundef %26), !dbg !1810
  %28 = getelementptr inbounds %struct.map_cleanup_args, ptr %7, i32 0, i32 1, !dbg !1811
  store i32 %27, ptr %28, align 8, !dbg !1812, !tbaa !1795
  %29 = getelementptr inbounds %struct.map_cleanup_args, ptr %7, i32 0, i32 1, !dbg !1813
  %30 = load i32, ptr %29, align 8, !dbg !1813, !tbaa !1795
  %31 = icmp slt i32 %30, 0, !dbg !1815
  br i1 %31, label %32, label %43, !dbg !1816

32:                                               ; preds = %22
  %33 = load ptr, ptr @stderr, align 8, !dbg !1817, !tbaa !741
  %34 = load ptr, ptr %5, align 8, !dbg !1819, !tbaa !741
  %35 = getelementptr inbounds %struct.pping_config, ptr %34, i32 0, i32 7, !dbg !1820
  %36 = load ptr, ptr %35, align 8, !dbg !1820, !tbaa !852
  %37 = getelementptr inbounds %struct.map_cleanup_args, ptr %7, i32 0, i32 1, !dbg !1821
  %38 = load i32, ptr %37, align 8, !dbg !1821, !tbaa !1795
  %39 = call ptr @get_libbpf_strerror(i32 noundef %38), !dbg !1822
  %40 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %33, ptr noundef @.str.108, ptr noundef %36, ptr noundef %39), !dbg !1823
  %41 = getelementptr inbounds %struct.map_cleanup_args, ptr %7, i32 0, i32 1, !dbg !1824
  %42 = load i32, ptr %41, align 8, !dbg !1824, !tbaa !1795
  store i32 %42, ptr %3, align 4, !dbg !1825
  store i32 1, ptr %9, align 4
  br label %75, !dbg !1825

43:                                               ; preds = %22
  %44 = load ptr, ptr %4, align 8, !dbg !1826, !tbaa !741
  %45 = load ptr, ptr %5, align 8, !dbg !1827, !tbaa !741
  %46 = getelementptr inbounds %struct.pping_config, ptr %45, i32 0, i32 8, !dbg !1828
  %47 = load ptr, ptr %46, align 8, !dbg !1828, !tbaa !853
  %48 = call i32 @bpf_object__find_map_fd_by_name(ptr noundef %44, ptr noundef %47), !dbg !1829
  %49 = getelementptr inbounds %struct.map_cleanup_args, ptr %7, i32 0, i32 2, !dbg !1830
  store i32 %48, ptr %49, align 4, !dbg !1831, !tbaa !1796
  %50 = getelementptr inbounds %struct.map_cleanup_args, ptr %7, i32 0, i32 2, !dbg !1832
  %51 = load i32, ptr %50, align 4, !dbg !1832, !tbaa !1796
  %52 = icmp slt i32 %51, 0, !dbg !1834
  br i1 %52, label %53, label %64, !dbg !1835

53:                                               ; preds = %43
  %54 = load ptr, ptr @stderr, align 8, !dbg !1836, !tbaa !741
  %55 = load ptr, ptr %5, align 8, !dbg !1838, !tbaa !741
  %56 = getelementptr inbounds %struct.pping_config, ptr %55, i32 0, i32 8, !dbg !1839
  %57 = load ptr, ptr %56, align 8, !dbg !1839, !tbaa !853
  %58 = getelementptr inbounds %struct.map_cleanup_args, ptr %7, i32 0, i32 2, !dbg !1840
  %59 = load i32, ptr %58, align 4, !dbg !1840, !tbaa !1796
  %60 = call ptr @get_libbpf_strerror(i32 noundef %59), !dbg !1841
  %61 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %54, ptr noundef @.str.108, ptr noundef %57, ptr noundef %60), !dbg !1842
  %62 = getelementptr inbounds %struct.map_cleanup_args, ptr %7, i32 0, i32 2, !dbg !1843
  %63 = load i32, ptr %62, align 4, !dbg !1843, !tbaa !1796
  store i32 %63, ptr %3, align 4, !dbg !1844
  store i32 1, ptr %9, align 4
  br label %75, !dbg !1844

64:                                               ; preds = %43
  %65 = call i32 @pthread_create(ptr noundef %6, ptr noundef null, ptr noundef @periodic_map_cleanup, ptr noundef %7) #12, !dbg !1845
  store i32 %65, ptr %8, align 4, !dbg !1846, !tbaa !794
  %66 = load i32, ptr %8, align 4, !dbg !1847, !tbaa !794
  %67 = icmp ne i32 %66, 0, !dbg !1847
  br i1 %67, label %68, label %74, !dbg !1849

68:                                               ; preds = %64
  %69 = load ptr, ptr @stderr, align 8, !dbg !1850, !tbaa !741
  %70 = load i32, ptr %8, align 4, !dbg !1852, !tbaa !794
  %71 = call ptr @get_libbpf_strerror(i32 noundef %70), !dbg !1853
  %72 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %69, ptr noundef @.str.109, ptr noundef %71), !dbg !1854
  %73 = load i32, ptr %8, align 4, !dbg !1855, !tbaa !794
  store i32 %73, ptr %3, align 4, !dbg !1856
  store i32 1, ptr %9, align 4
  br label %75, !dbg !1856

74:                                               ; preds = %64
  store i32 0, ptr %3, align 4, !dbg !1857
  store i32 1, ptr %9, align 4
  br label %75, !dbg !1857

75:                                               ; preds = %74, %68, %53, %32, %19
  call void @llvm.lifetime.end.p0(i64 4, ptr %8) #12, !dbg !1858
  call void @llvm.lifetime.end.p0(i64 16, ptr %7) #12, !dbg !1858
  call void @llvm.lifetime.end.p0(i64 8, ptr %6) #12, !dbg !1858
  %76 = load i32, ptr %3, align 4, !dbg !1858
  ret i32 %76, !dbg !1858
}

declare !dbg !1859 dso_local ptr @perf_buffer__new(i32 noundef, i64 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #5

declare !dbg !1891 dso_local i32 @bpf_object__find_map_fd_by_name(ptr noundef, ptr noundef) #5

; Function Attrs: nounwind
define internal void @handle_event(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3) #0 !dbg !1899 {
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1901, metadata !DIExpression()), !dbg !1906
  store i32 %1, ptr %6, align 4, !tbaa !794
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1902, metadata !DIExpression()), !dbg !1907
  store ptr %2, ptr %7, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1903, metadata !DIExpression()), !dbg !1908
  store i32 %3, ptr %8, align 4, !tbaa !794
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1904, metadata !DIExpression()), !dbg !1909
  call void @llvm.lifetime.start.p0(i64 8, ptr %9) #12, !dbg !1910
  call void @llvm.dbg.declare(metadata ptr %9, metadata !1905, metadata !DIExpression()), !dbg !1911
  %11 = load ptr, ptr %7, align 8, !dbg !1912, !tbaa !741
  store ptr %11, ptr %9, align 8, !dbg !1911, !tbaa !741
  %12 = load i32, ptr %8, align 4, !dbg !1913, !tbaa !794
  %13 = zext i32 %12 to i64, !dbg !1913
  %14 = icmp ult i64 %13, 8, !dbg !1915
  br i1 %14, label %15, label %16, !dbg !1916

15:                                               ; preds = %4
  store i32 1, ptr %10, align 4
  br label %30, !dbg !1917

16:                                               ; preds = %4
  %17 = load ptr, ptr %9, align 8, !dbg !1918, !tbaa !741
  %18 = load i64, ptr %17, align 8, !dbg !1919, !tbaa !779
  switch i64 %18, label %24 [
    i64 3, label %19
    i64 2, label %21
    i64 1, label %21
  ], !dbg !1920

19:                                               ; preds = %16
  %20 = load ptr, ptr %9, align 8, !dbg !1921, !tbaa !741
  call void @warn_map_full(ptr noundef %20), !dbg !1923
  br label %29, !dbg !1924

21:                                               ; preds = %16, %16
  %22 = load ptr, ptr @print_event_func, align 8, !dbg !1925, !tbaa !741
  %23 = load ptr, ptr %9, align 8, !dbg !1926, !tbaa !741
  call void %22(ptr noundef %23), !dbg !1925
  br label %29, !dbg !1927

24:                                               ; preds = %16
  %25 = load ptr, ptr @stderr, align 8, !dbg !1928, !tbaa !741
  %26 = load ptr, ptr %9, align 8, !dbg !1929, !tbaa !741
  %27 = load i64, ptr %26, align 8, !dbg !1930, !tbaa !779
  %28 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %25, ptr noundef @.str.111, i64 noundef %27), !dbg !1931
  br label %29, !dbg !1932

29:                                               ; preds = %24, %21, %19
  store i32 0, ptr %10, align 4, !dbg !1933
  br label %30, !dbg !1933

30:                                               ; preds = %29, %15
  call void @llvm.lifetime.end.p0(i64 8, ptr %9) #12, !dbg !1933
  %31 = load i32, ptr %10, align 4
  switch i32 %31, label %33 [
    i32 0, label %32
    i32 1, label %32
  ]

32:                                               ; preds = %30, %30
  ret void, !dbg !1933

33:                                               ; preds = %30
  unreachable
}

; Function Attrs: nounwind
define internal void @handle_missed_events(ptr noundef %0, i32 noundef %1, i64 noundef %2) #0 !dbg !1934 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1936, metadata !DIExpression()), !dbg !1939
  store i32 %1, ptr %5, align 4, !tbaa !794
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1937, metadata !DIExpression()), !dbg !1940
  store i64 %2, ptr %6, align 8, !tbaa !1562
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1938, metadata !DIExpression()), !dbg !1941
  %7 = load ptr, ptr @stderr, align 8, !dbg !1942, !tbaa !741
  %8 = load i64, ptr %6, align 8, !dbg !1943, !tbaa !1562
  %9 = load i32, ptr %5, align 4, !dbg !1944, !tbaa !794
  %10 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %7, ptr noundef @.str.114, i64 noundef %8, i32 noundef %9), !dbg !1945
  ret void, !dbg !1946
}

declare !dbg !1947 dso_local i64 @libbpf_get_error(ptr noundef) #5

; Function Attrs: nounwind
declare !dbg !1954 dso_local ptr @signal(i32 noundef, ptr noundef) #0

declare !dbg !1963 dso_local i32 @perf_buffer__poll(ptr noundef, i32 noundef) #5

declare !dbg !1969 dso_local void @jsonw_end_array(ptr noundef) #5

declare !dbg !1974 dso_local void @jsonw_destroy(ptr noundef) #5

declare !dbg !1980 dso_local void @perf_buffer__free(ptr noundef) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind willreturn memory(read)
declare !dbg !1985 dso_local i32 @strcmp(ptr noundef, ptr noundef) #6

; Function Attrs: nounwind
define internal i32 @xdp_detach(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 !dbg !1992 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 %0, ptr %5, align 4, !tbaa !794
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1996, metadata !DIExpression()), !dbg !2001
  store i32 %1, ptr %6, align 4, !tbaa !794
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1997, metadata !DIExpression()), !dbg !2002
  store i32 %2, ptr %7, align 4, !tbaa !794
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1998, metadata !DIExpression()), !dbg !2003
  call void @llvm.lifetime.start.p0(i64 4, ptr %8) #12, !dbg !2004
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1999, metadata !DIExpression()), !dbg !2005
  call void @llvm.lifetime.start.p0(i64 4, ptr %9) #12, !dbg !2006
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2000, metadata !DIExpression()), !dbg !2007
  %11 = load i32, ptr %5, align 4, !dbg !2008, !tbaa !794
  %12 = load i32, ptr %6, align 4, !dbg !2009, !tbaa !794
  %13 = call i32 @bpf_get_link_xdp_id(i32 noundef %11, ptr noundef %8, i32 noundef %12), !dbg !2010
  store i32 %13, ptr %9, align 4, !dbg !2011, !tbaa !794
  %14 = load i32, ptr %9, align 4, !dbg !2012, !tbaa !794
  %15 = icmp ne i32 %14, 0, !dbg !2012
  br i1 %15, label %16, label %18, !dbg !2014

16:                                               ; preds = %3
  %17 = load i32, ptr %9, align 4, !dbg !2015, !tbaa !794
  store i32 %17, ptr %4, align 4, !dbg !2016
  store i32 1, ptr %10, align 4
  br label %34, !dbg !2016

18:                                               ; preds = %3
  %19 = load i32, ptr %8, align 4, !dbg !2017, !tbaa !794
  %20 = icmp ne i32 %19, 0, !dbg !2017
  br i1 %20, label %22, label %21, !dbg !2019

21:                                               ; preds = %18
  store i32 0, ptr %4, align 4, !dbg !2020
  store i32 1, ptr %10, align 4
  br label %34, !dbg !2020

22:                                               ; preds = %18
  %23 = load i32, ptr %7, align 4, !dbg !2022, !tbaa !794
  %24 = icmp ne i32 %23, 0, !dbg !2022
  br i1 %24, label %25, label %30, !dbg !2024

25:                                               ; preds = %22
  %26 = load i32, ptr %8, align 4, !dbg !2025, !tbaa !794
  %27 = load i32, ptr %7, align 4, !dbg !2026, !tbaa !794
  %28 = icmp ne i32 %26, %27, !dbg !2027
  br i1 %28, label %29, label %30, !dbg !2028

29:                                               ; preds = %25
  store i32 -2, ptr %4, align 4, !dbg !2029
  store i32 1, ptr %10, align 4
  br label %34, !dbg !2029

30:                                               ; preds = %25, %22
  %31 = load i32, ptr %5, align 4, !dbg !2030, !tbaa !794
  %32 = load i32, ptr %6, align 4, !dbg !2031, !tbaa !794
  %33 = call i32 @bpf_set_link_xdp_fd(i32 noundef %31, i32 noundef -1, i32 noundef %32), !dbg !2032
  store i32 %33, ptr %4, align 4, !dbg !2033
  store i32 1, ptr %10, align 4
  br label %34, !dbg !2033

34:                                               ; preds = %30, %29, %21, %16
  call void @llvm.lifetime.end.p0(i64 4, ptr %9) #12, !dbg !2034
  call void @llvm.lifetime.end.p0(i64 4, ptr %8) #12, !dbg !2034
  %35 = load i32, ptr %4, align 4, !dbg !2034
  ret i32 %35, !dbg !2034
}

; Function Attrs: nounwind
define internal i32 @tc_detach(i32 noundef %0, i32 noundef %1, ptr noundef %2, i1 noundef zeroext %3) #0 !dbg !2035 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i8, align 1
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca %struct.bpf_tc_hook, align 8
  %13 = alloca %struct.bpf_tc_opts, align 8
  %14 = alloca i32, align 4
  store i32 %0, ptr %6, align 4, !tbaa !794
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2041, metadata !DIExpression()), !dbg !2055
  store i32 %1, ptr %7, align 4, !tbaa !779
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2042, metadata !DIExpression()), !dbg !2056
  store ptr %2, ptr %8, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2043, metadata !DIExpression()), !dbg !2057
  %15 = zext i1 %3 to i8
  store i8 %15, ptr %9, align 1, !tbaa !761
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2044, metadata !DIExpression()), !dbg !2058
  call void @llvm.lifetime.start.p0(i64 4, ptr %10) #12, !dbg !2059
  call void @llvm.dbg.declare(metadata ptr %10, metadata !2045, metadata !DIExpression()), !dbg !2060
  call void @llvm.lifetime.start.p0(i64 4, ptr %11) #12, !dbg !2061
  call void @llvm.dbg.declare(metadata ptr %11, metadata !2046, metadata !DIExpression()), !dbg !2062
  store i32 0, ptr %11, align 4, !dbg !2062, !tbaa !794
  call void @llvm.lifetime.start.p0(i64 24, ptr %12) #12, !dbg !2063
  call void @llvm.dbg.declare(metadata ptr %12, metadata !2047, metadata !DIExpression()), !dbg !2063
  call void @llvm.memset.p0.i64(ptr align 8 %12, i8 0, i64 24, i1 false), !dbg !2064
  %16 = getelementptr inbounds %struct.bpf_tc_hook, ptr %12, i32 0, i32 0, !dbg !2064
  store i64 24, ptr %16, align 8, !dbg !2064, !tbaa !2066
  %17 = getelementptr inbounds %struct.bpf_tc_hook, ptr %12, i32 0, i32 1, !dbg !2064
  %18 = load i32, ptr %6, align 4, !dbg !2064, !tbaa !794
  store i32 %18, ptr %17, align 8, !dbg !2064, !tbaa !2068
  %19 = getelementptr inbounds %struct.bpf_tc_hook, ptr %12, i32 0, i32 2, !dbg !2064
  %20 = load i32, ptr %7, align 4, !dbg !2064, !tbaa !779
  store i32 %20, ptr %19, align 4, !dbg !2064, !tbaa !2069
  %21 = getelementptr inbounds %struct.bpf_tc_hook, ptr %12, i32 0, i32 3, !dbg !2064
  store i32 0, ptr %21, align 8, !dbg !2064, !tbaa !2070
  call void @llvm.lifetime.start.p0(i64 32, ptr %13) #12, !dbg !2071
  call void @llvm.dbg.declare(metadata ptr %13, metadata !2054, metadata !DIExpression()), !dbg !2071
  call void @llvm.memset.p0.i64(ptr align 8 %13, i8 0, i64 32, i1 false), !dbg !2072
  %22 = getelementptr inbounds %struct.bpf_tc_opts, ptr %13, i32 0, i32 0, !dbg !2072
  store i64 32, ptr %22, align 8, !dbg !2072, !tbaa !829
  %23 = getelementptr inbounds %struct.bpf_tc_opts, ptr %13, i32 0, i32 1, !dbg !2072
  store i32 0, ptr %23, align 8, !dbg !2072, !tbaa !2074
  %24 = getelementptr inbounds %struct.bpf_tc_opts, ptr %13, i32 0, i32 2, !dbg !2072
  store i32 0, ptr %24, align 4, !dbg !2072, !tbaa !2075
  %25 = getelementptr inbounds %struct.bpf_tc_opts, ptr %13, i32 0, i32 3, !dbg !2072
  store i32 0, ptr %25, align 8, !dbg !2072, !tbaa !2076
  %26 = getelementptr inbounds %struct.bpf_tc_opts, ptr %13, i32 0, i32 4, !dbg !2072
  %27 = load ptr, ptr %8, align 8, !dbg !2072, !tbaa !741
  %28 = getelementptr inbounds %struct.bpf_tc_opts, ptr %27, i32 0, i32 4, !dbg !2072
  %29 = load i32, ptr %28, align 4, !dbg !2072, !tbaa !2077
  store i32 %29, ptr %26, align 4, !dbg !2072, !tbaa !2077
  %30 = getelementptr inbounds %struct.bpf_tc_opts, ptr %13, i32 0, i32 5, !dbg !2072
  %31 = load ptr, ptr %8, align 8, !dbg !2072, !tbaa !741
  %32 = getelementptr inbounds %struct.bpf_tc_opts, ptr %31, i32 0, i32 5, !dbg !2072
  %33 = load i32, ptr %32, align 8, !dbg !2072, !tbaa !2078
  store i32 %33, ptr %30, align 8, !dbg !2072, !tbaa !2078
  %34 = call i32 @bpf_tc_query(ptr noundef %12, ptr noundef %13), !dbg !2079
  store i32 %34, ptr %10, align 4, !dbg !2080, !tbaa !794
  %35 = load i32, ptr %10, align 4, !dbg !2081, !tbaa !794
  %36 = icmp ne i32 %35, 0, !dbg !2081
  br i1 %36, label %37, label %39, !dbg !2083

37:                                               ; preds = %4
  %38 = load i32, ptr %10, align 4, !dbg !2084, !tbaa !794
  store i32 %38, ptr %5, align 4, !dbg !2085
  store i32 1, ptr %14, align 4
  br label %67, !dbg !2085

39:                                               ; preds = %4
  %40 = load ptr, ptr %8, align 8, !dbg !2086, !tbaa !741
  %41 = getelementptr inbounds %struct.bpf_tc_opts, ptr %40, i32 0, i32 3, !dbg !2088
  %42 = load i32, ptr %41, align 8, !dbg !2088, !tbaa !2076
  %43 = getelementptr inbounds %struct.bpf_tc_opts, ptr %13, i32 0, i32 3, !dbg !2089
  %44 = load i32, ptr %43, align 8, !dbg !2089, !tbaa !2076
  %45 = icmp ne i32 %42, %44, !dbg !2090
  br i1 %45, label %46, label %47, !dbg !2091

46:                                               ; preds = %39
  store i32 -2, ptr %5, align 4, !dbg !2092
  store i32 1, ptr %14, align 4
  br label %67, !dbg !2092

47:                                               ; preds = %39
  %48 = getelementptr inbounds %struct.bpf_tc_opts, ptr %13, i32 0, i32 1, !dbg !2093
  store i32 0, ptr %48, align 8, !dbg !2094, !tbaa !2074
  %49 = getelementptr inbounds %struct.bpf_tc_opts, ptr %13, i32 0, i32 3, !dbg !2095
  store i32 0, ptr %49, align 8, !dbg !2096, !tbaa !2076
  %50 = getelementptr inbounds %struct.bpf_tc_opts, ptr %13, i32 0, i32 2, !dbg !2097
  store i32 0, ptr %50, align 4, !dbg !2098, !tbaa !2075
  %51 = call i32 @bpf_tc_detach(ptr noundef %12, ptr noundef %13), !dbg !2099
  store i32 %51, ptr %10, align 4, !dbg !2100, !tbaa !794
  %52 = load i8, ptr %9, align 1, !dbg !2101, !tbaa !761, !range !759, !noundef !760
  %53 = trunc i8 %52 to i1, !dbg !2101
  br i1 %53, label %54, label %57, !dbg !2103

54:                                               ; preds = %47
  %55 = getelementptr inbounds %struct.bpf_tc_hook, ptr %12, i32 0, i32 2, !dbg !2104
  store i32 3, ptr %55, align 4, !dbg !2106, !tbaa !2069
  %56 = call i32 @bpf_tc_hook_destroy(ptr noundef %12), !dbg !2107
  store i32 %56, ptr %11, align 4, !dbg !2108, !tbaa !794
  br label %57, !dbg !2109

57:                                               ; preds = %54, %47
  %58 = load i8, ptr %9, align 1, !dbg !2110, !tbaa !761, !range !759, !noundef !760
  %59 = trunc i8 %58 to i1, !dbg !2110
  br i1 %59, label %60, label %62, !dbg !2110

60:                                               ; preds = %57
  %61 = load i32, ptr %11, align 4, !dbg !2111, !tbaa !794
  br label %64, !dbg !2110

62:                                               ; preds = %57
  %63 = load i32, ptr %10, align 4, !dbg !2112, !tbaa !794
  br label %64, !dbg !2110

64:                                               ; preds = %62, %60
  %65 = phi i32 [ %61, %60 ], [ %63, %62 ], !dbg !2110
  store i32 %65, ptr %10, align 4, !dbg !2113, !tbaa !794
  %66 = load i32, ptr %10, align 4, !dbg !2114, !tbaa !794
  store i32 %66, ptr %5, align 4, !dbg !2115
  store i32 1, ptr %14, align 4
  br label %67, !dbg !2115

67:                                               ; preds = %64, %46, %37
  call void @llvm.lifetime.end.p0(i64 32, ptr %13) #12, !dbg !2116
  call void @llvm.lifetime.end.p0(i64 24, ptr %12) #12, !dbg !2116
  call void @llvm.lifetime.end.p0(i64 4, ptr %11) #12, !dbg !2116
  call void @llvm.lifetime.end.p0(i64 4, ptr %10) #12, !dbg !2116
  %68 = load i32, ptr %5, align 4, !dbg !2116
  ret i32 %68, !dbg !2116
}

; Function Attrs: nounwind
declare !dbg !2117 dso_local i32 @setrlimit(i32 noundef, ptr noundef) #0

; Function Attrs: nounwind willreturn memory(none)
declare !dbg !2127 dso_local ptr @__errno_location() #7

declare !dbg !2131 dso_local i32 @libbpf_strerror(i32 noundef, ptr noundef, i64 noundef) #5

; Function Attrs: nounwind
declare !dbg !2138 dso_local i32 @getopt_long(i32 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

; Function Attrs: nounwind willreturn memory(read)
declare !dbg !2150 dso_local i64 @strlen(ptr noundef) #6

; Function Attrs: nounwind
declare !dbg !2155 dso_local ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #0

; Function Attrs: nounwind
declare !dbg !2162 dso_local i32 @if_nametoindex(ptr noundef) #0

; Function Attrs: nounwind
define internal i32 @parse_bounded_double(ptr noundef %0, ptr noundef %1, double noundef %2, double noundef %3, ptr noundef %4) #0 !dbg !2168 {
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  store ptr %0, ptr %7, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2173, metadata !DIExpression()), !dbg !2179
  store ptr %1, ptr %8, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2174, metadata !DIExpression()), !dbg !2180
  store double %2, ptr %9, align 8, !tbaa !1199
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2175, metadata !DIExpression()), !dbg !2181
  store double %3, ptr %10, align 8, !tbaa !1199
  call void @llvm.dbg.declare(metadata ptr %10, metadata !2176, metadata !DIExpression()), !dbg !2182
  store ptr %4, ptr %11, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %11, metadata !2177, metadata !DIExpression()), !dbg !2183
  call void @llvm.lifetime.start.p0(i64 8, ptr %12) #12, !dbg !2184
  call void @llvm.dbg.declare(metadata ptr %12, metadata !2178, metadata !DIExpression()), !dbg !2185
  %14 = load ptr, ptr %8, align 8, !dbg !2186, !tbaa !741
  %15 = call double @strtod(ptr noundef %14, ptr noundef %12) #12, !dbg !2187
  %16 = load ptr, ptr %7, align 8, !dbg !2188, !tbaa !741
  store double %15, ptr %16, align 8, !dbg !2189, !tbaa !1199
  %17 = load ptr, ptr %8, align 8, !dbg !2190, !tbaa !741
  %18 = call i64 @strlen(ptr noundef %17) #13, !dbg !2192
  %19 = load ptr, ptr %12, align 8, !dbg !2193, !tbaa !741
  %20 = load ptr, ptr %8, align 8, !dbg !2194, !tbaa !741
  %21 = ptrtoint ptr %19 to i64, !dbg !2195
  %22 = ptrtoint ptr %20 to i64, !dbg !2195
  %23 = sub i64 %21, %22, !dbg !2195
  %24 = icmp ne i64 %18, %23, !dbg !2196
  br i1 %24, label %25, label %30, !dbg !2197

25:                                               ; preds = %5
  %26 = load ptr, ptr @stderr, align 8, !dbg !2198, !tbaa !741
  %27 = load ptr, ptr %11, align 8, !dbg !2200, !tbaa !741
  %28 = load ptr, ptr %8, align 8, !dbg !2201, !tbaa !741
  %29 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %26, ptr noundef @.str.50, ptr noundef %27, ptr noundef %28), !dbg !2202
  store i32 -22, ptr %6, align 4, !dbg !2203
  store i32 1, ptr %13, align 4
  br label %47, !dbg !2203

30:                                               ; preds = %5
  %31 = load ptr, ptr %7, align 8, !dbg !2204, !tbaa !741
  %32 = load double, ptr %31, align 8, !dbg !2206, !tbaa !1199
  %33 = load double, ptr %9, align 8, !dbg !2207, !tbaa !1199
  %34 = fcmp olt double %32, %33, !dbg !2208
  br i1 %34, label %40, label %35, !dbg !2209

35:                                               ; preds = %30
  %36 = load ptr, ptr %7, align 8, !dbg !2210, !tbaa !741
  %37 = load double, ptr %36, align 8, !dbg !2211, !tbaa !1199
  %38 = load double, ptr %10, align 8, !dbg !2212, !tbaa !1199
  %39 = fcmp ogt double %37, %38, !dbg !2213
  br i1 %39, label %40, label %46, !dbg !2214

40:                                               ; preds = %35, %30
  %41 = load ptr, ptr @stderr, align 8, !dbg !2215, !tbaa !741
  %42 = load ptr, ptr %11, align 8, !dbg !2217, !tbaa !741
  %43 = load double, ptr %9, align 8, !dbg !2218, !tbaa !1199
  %44 = load double, ptr %10, align 8, !dbg !2219, !tbaa !1199
  %45 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %41, ptr noundef @.str.51, ptr noundef %42, double noundef %43, double noundef %44), !dbg !2220
  store i32 -22, ptr %6, align 4, !dbg !2221
  store i32 1, ptr %13, align 4
  br label %47, !dbg !2221

46:                                               ; preds = %35
  store i32 0, ptr %6, align 4, !dbg !2222
  store i32 1, ptr %13, align 4
  br label %47, !dbg !2222

47:                                               ; preds = %46, %40, %25
  call void @llvm.lifetime.end.p0(i64 8, ptr %12) #12, !dbg !2223
  %48 = load i32, ptr %6, align 4, !dbg !2223
  ret i32 %48, !dbg !2223
}

; Function Attrs: noreturn nounwind
declare !dbg !2224 dso_local void @exit(i32 noundef) #8

; Function Attrs: nounwind
declare !dbg !2228 dso_local double @strtod(ptr noundef, ptr noundef) #0

; Function Attrs: nounwind
define internal void @print_ns_datetime(ptr noundef %0, i64 noundef %1) #0 !dbg !2234 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca [9 x i8], align 1
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store ptr %0, ptr %3, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2238, metadata !DIExpression()), !dbg !2246
  store i64 %1, ptr %4, align 8, !tbaa !1562
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2239, metadata !DIExpression()), !dbg !2247
  call void @llvm.lifetime.start.p0(i64 9, ptr %5) #12, !dbg !2248
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2240, metadata !DIExpression()), !dbg !2249
  call void @llvm.lifetime.start.p0(i64 8, ptr %6) #12, !dbg !2250
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2241, metadata !DIExpression()), !dbg !2251
  %8 = load i64, ptr %4, align 8, !dbg !2252, !tbaa !1562
  %9 = call i64 @convert_monotonic_to_realtime(i64 noundef %8), !dbg !2253
  store i64 %9, ptr %6, align 8, !dbg !2251, !tbaa !1562
  call void @llvm.lifetime.start.p0(i64 8, ptr %7) #12, !dbg !2254
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2242, metadata !DIExpression()), !dbg !2255
  %10 = load i64, ptr %6, align 8, !dbg !2256, !tbaa !1562
  %11 = udiv i64 %10, 1000000000, !dbg !2257
  store i64 %11, ptr %7, align 8, !dbg !2255, !tbaa !846
  %12 = getelementptr inbounds [9 x i8], ptr %5, i64 0, i64 0, !dbg !2258
  %13 = call ptr @localtime(ptr noundef %7) #12, !dbg !2259
  %14 = call i64 @strftime(ptr noundef %12, i64 noundef 9, ptr noundef @.str.63, ptr noundef %13) #12, !dbg !2260
  %15 = load ptr, ptr %3, align 8, !dbg !2261, !tbaa !741
  %16 = getelementptr inbounds [9 x i8], ptr %5, i64 0, i64 0, !dbg !2262
  %17 = load i64, ptr %6, align 8, !dbg !2263, !tbaa !1562
  %18 = urem i64 %17, 1000000000, !dbg !2264
  %19 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %15, ptr noundef @.str.64, ptr noundef %16, i64 noundef %18), !dbg !2265
  call void @llvm.lifetime.end.p0(i64 8, ptr %7) #12, !dbg !2266
  call void @llvm.lifetime.end.p0(i64 8, ptr %6) #12, !dbg !2266
  call void @llvm.lifetime.end.p0(i64 9, ptr %5) #12, !dbg !2266
  ret void, !dbg !2266
}

; Function Attrs: nounwind
define internal ptr @proto_to_str(i16 noundef zeroext %0) #0 !dbg !532 {
  %2 = alloca ptr, align 8
  %3 = alloca i16, align 2
  store i16 %0, ptr %3, align 2, !tbaa !2267
  call void @llvm.dbg.declare(metadata ptr %3, metadata !536, metadata !DIExpression()), !dbg !2268
  %4 = load i16, ptr %3, align 2, !dbg !2269, !tbaa !2267
  %5 = zext i16 %4 to i32, !dbg !2269
  switch i32 %5, label %9 [
    i32 6, label %6
    i32 1, label %7
    i32 58, label %8
  ], !dbg !2270

6:                                                ; preds = %1
  store ptr @.str.1, ptr %2, align 8, !dbg !2271
  br label %13, !dbg !2271

7:                                                ; preds = %1
  store ptr @.str.2, ptr %2, align 8, !dbg !2273
  br label %13, !dbg !2273

8:                                                ; preds = %1
  store ptr @.str.65, ptr %2, align 8, !dbg !2274
  br label %13, !dbg !2274

9:                                                ; preds = %1
  %10 = load i16, ptr %3, align 2, !dbg !2275, !tbaa !2267
  %11 = zext i16 %10 to i32, !dbg !2275
  %12 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef @proto_to_str.buf, i64 noundef 8, ptr noundef @.str.66, i32 noundef %11) #12, !dbg !2276
  store ptr @proto_to_str.buf, ptr %2, align 8, !dbg !2277
  br label %13, !dbg !2277

13:                                               ; preds = %9, %8, %7, %6
  %14 = load ptr, ptr %2, align 8, !dbg !2278
  ret ptr %14, !dbg !2278
}

; Function Attrs: nounwind
define internal void @print_flow_ppvizformat(ptr noundef %0, ptr noundef %1) #0 !dbg !2279 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca [46 x i8], align 1
  %6 = alloca [46 x i8], align 1
  store ptr %0, ptr %3, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2285, metadata !DIExpression()), !dbg !2289
  store ptr %1, ptr %4, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2286, metadata !DIExpression()), !dbg !2290
  call void @llvm.lifetime.start.p0(i64 46, ptr %5) #12, !dbg !2291
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2287, metadata !DIExpression()), !dbg !2292
  call void @llvm.lifetime.start.p0(i64 46, ptr %6) #12, !dbg !2293
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2288, metadata !DIExpression()), !dbg !2294
  %7 = getelementptr inbounds [46 x i8], ptr %5, i64 0, i64 0, !dbg !2295
  %8 = load ptr, ptr %4, align 8, !dbg !2296, !tbaa !741
  %9 = getelementptr inbounds %struct.network_tuple, ptr %8, i32 0, i32 3, !dbg !2297
  %10 = load i8, ptr %9, align 2, !dbg !2297, !tbaa !2298
  %11 = zext i8 %10 to i32, !dbg !2296
  %12 = load ptr, ptr %4, align 8, !dbg !2299, !tbaa !741
  %13 = getelementptr inbounds %struct.network_tuple, ptr %12, i32 0, i32 0, !dbg !2300
  %14 = getelementptr inbounds %struct.flow_address, ptr %13, i32 0, i32 0, !dbg !2301
  %15 = call i32 @format_ip_address(ptr noundef %7, i64 noundef 46, i32 noundef %11, ptr noundef %14), !dbg !2302
  %16 = getelementptr inbounds [46 x i8], ptr %6, i64 0, i64 0, !dbg !2303
  %17 = load ptr, ptr %4, align 8, !dbg !2304, !tbaa !741
  %18 = getelementptr inbounds %struct.network_tuple, ptr %17, i32 0, i32 3, !dbg !2305
  %19 = load i8, ptr %18, align 2, !dbg !2305, !tbaa !2298
  %20 = zext i8 %19 to i32, !dbg !2304
  %21 = load ptr, ptr %4, align 8, !dbg !2306, !tbaa !741
  %22 = getelementptr inbounds %struct.network_tuple, ptr %21, i32 0, i32 1, !dbg !2307
  %23 = getelementptr inbounds %struct.flow_address, ptr %22, i32 0, i32 0, !dbg !2308
  %24 = call i32 @format_ip_address(ptr noundef %16, i64 noundef 46, i32 noundef %20, ptr noundef %23), !dbg !2309
  %25 = load ptr, ptr %3, align 8, !dbg !2310, !tbaa !741
  %26 = getelementptr inbounds [46 x i8], ptr %5, i64 0, i64 0, !dbg !2311
  %27 = load ptr, ptr %4, align 8, !dbg !2312, !tbaa !741
  %28 = getelementptr inbounds %struct.network_tuple, ptr %27, i32 0, i32 0, !dbg !2312
  %29 = getelementptr inbounds %struct.flow_address, ptr %28, i32 0, i32 1, !dbg !2312
  %30 = load i16, ptr %29, align 4, !dbg !2312, !tbaa !2313
  %31 = call i16 @__bswap_16(i16 noundef zeroext %30), !dbg !2312
  %32 = zext i16 %31 to i32, !dbg !2312
  %33 = getelementptr inbounds [46 x i8], ptr %6, i64 0, i64 0, !dbg !2314
  %34 = load ptr, ptr %4, align 8, !dbg !2315, !tbaa !741
  %35 = getelementptr inbounds %struct.network_tuple, ptr %34, i32 0, i32 1, !dbg !2315
  %36 = getelementptr inbounds %struct.flow_address, ptr %35, i32 0, i32 1, !dbg !2315
  %37 = load i16, ptr %36, align 4, !dbg !2315, !tbaa !2316
  %38 = call i16 @__bswap_16(i16 noundef zeroext %37), !dbg !2315
  %39 = zext i16 %38 to i32, !dbg !2315
  %40 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %25, ptr noundef @.str.67, ptr noundef %26, i32 noundef %32, ptr noundef %33, i32 noundef %39), !dbg !2317
  call void @llvm.lifetime.end.p0(i64 46, ptr %6) #12, !dbg !2318
  call void @llvm.lifetime.end.p0(i64 46, ptr %5) #12, !dbg !2318
  ret void, !dbg !2318
}

; Function Attrs: nounwind
define internal ptr @flowevent_to_str(i8 noundef zeroext %0) #0 !dbg !2319 {
  %2 = alloca ptr, align 8
  %3 = alloca i8, align 1
  store i8 %0, ptr %3, align 1, !tbaa !779
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2323, metadata !DIExpression()), !dbg !2324
  %4 = load i8, ptr %3, align 1, !dbg !2325, !tbaa !779
  %5 = zext i8 %4 to i32, !dbg !2325
  switch i32 %5, label %9 [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %8
    i32 3, label %8
  ], !dbg !2326

6:                                                ; preds = %1
  store ptr @.str.68, ptr %2, align 8, !dbg !2327
  br label %10, !dbg !2327

7:                                                ; preds = %1
  store ptr @.str.69, ptr %2, align 8, !dbg !2329
  br label %10, !dbg !2329

8:                                                ; preds = %1, %1
  store ptr @.str.70, ptr %2, align 8, !dbg !2330
  br label %10, !dbg !2330

9:                                                ; preds = %1
  store ptr @.str.71, ptr %2, align 8, !dbg !2331
  br label %10, !dbg !2331

10:                                               ; preds = %9, %8, %7, %6
  %11 = load ptr, ptr %2, align 8, !dbg !2332
  ret ptr %11, !dbg !2332
}

; Function Attrs: nounwind
define internal ptr @eventreason_to_str(i8 noundef zeroext %0) #0 !dbg !2333 {
  %2 = alloca ptr, align 8
  %3 = alloca i8, align 1
  store i8 %0, ptr %3, align 1, !tbaa !779
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2337, metadata !DIExpression()), !dbg !2338
  %4 = load i8, ptr %3, align 1, !dbg !2339, !tbaa !779
  %5 = zext i8 %4 to i32, !dbg !2339
  switch i32 %5, label %12 [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %8
    i32 3, label %9
    i32 4, label %10
    i32 5, label %11
  ], !dbg !2340

6:                                                ; preds = %1
  store ptr @.str.72, ptr %2, align 8, !dbg !2341
  br label %13, !dbg !2341

7:                                                ; preds = %1
  store ptr @.str.73, ptr %2, align 8, !dbg !2343
  br label %13, !dbg !2343

8:                                                ; preds = %1
  store ptr @.str.74, ptr %2, align 8, !dbg !2344
  br label %13, !dbg !2344

9:                                                ; preds = %1
  store ptr @.str.75, ptr %2, align 8, !dbg !2345
  br label %13, !dbg !2345

10:                                               ; preds = %1
  store ptr @.str.76, ptr %2, align 8, !dbg !2346
  br label %13, !dbg !2346

11:                                               ; preds = %1
  store ptr @.str.77, ptr %2, align 8, !dbg !2347
  br label %13, !dbg !2347

12:                                               ; preds = %1
  store ptr @.str.71, ptr %2, align 8, !dbg !2348
  br label %13, !dbg !2348

13:                                               ; preds = %12, %11, %10, %9, %8, %7, %6
  %14 = load ptr, ptr %2, align 8, !dbg !2349
  ret ptr %14, !dbg !2349
}

; Function Attrs: nounwind
define internal ptr @eventsource_to_str(i8 noundef zeroext %0) #0 !dbg !2350 {
  %2 = alloca ptr, align 8
  %3 = alloca i8, align 1
  store i8 %0, ptr %3, align 1, !tbaa !779
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2354, metadata !DIExpression()), !dbg !2355
  %4 = load i8, ptr %3, align 1, !dbg !2356, !tbaa !779
  %5 = zext i8 %4 to i32, !dbg !2356
  switch i32 %5, label %9 [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %8
  ], !dbg !2357

6:                                                ; preds = %1
  store ptr @.str.78, ptr %2, align 8, !dbg !2358
  br label %10, !dbg !2358

7:                                                ; preds = %1
  store ptr @.str.79, ptr %2, align 8, !dbg !2360
  br label %10, !dbg !2360

8:                                                ; preds = %1
  store ptr @.str.80, ptr %2, align 8, !dbg !2361
  br label %10, !dbg !2361

9:                                                ; preds = %1
  store ptr @.str.71, ptr %2, align 8, !dbg !2362
  br label %10, !dbg !2362

10:                                               ; preds = %9, %8, %7, %6
  %11 = load ptr, ptr %2, align 8, !dbg !2363
  ret ptr %11, !dbg !2363
}

; Function Attrs: nounwind
define internal i64 @convert_monotonic_to_realtime(i64 noundef %0) #0 !dbg !521 {
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  store i64 %0, ptr %3, align 8, !tbaa !1562
  call void @llvm.dbg.declare(metadata ptr %3, metadata !525, metadata !DIExpression()), !dbg !2364
  call void @llvm.lifetime.start.p0(i64 8, ptr %4) #12, !dbg !2365
  call void @llvm.dbg.declare(metadata ptr %4, metadata !526, metadata !DIExpression()), !dbg !2366
  %7 = call i64 @get_time_ns(i32 noundef 1), !dbg !2367
  store i64 %7, ptr %4, align 8, !dbg !2366, !tbaa !1562
  call void @llvm.lifetime.start.p0(i64 8, ptr %5) #12, !dbg !2368
  call void @llvm.dbg.declare(metadata ptr %5, metadata !527, metadata !DIExpression()), !dbg !2369
  %8 = load i64, ptr @convert_monotonic_to_realtime.offset, align 8, !dbg !2370, !tbaa !1562
  %9 = icmp eq i64 %8, 0, !dbg !2372
  br i1 %9, label %19, label %10, !dbg !2373

10:                                               ; preds = %1
  %11 = load i64, ptr %4, align 8, !dbg !2374, !tbaa !1562
  %12 = load i64, ptr @convert_monotonic_to_realtime.offset_updated, align 8, !dbg !2375, !tbaa !1562
  %13 = icmp ugt i64 %11, %12, !dbg !2376
  br i1 %13, label %14, label %31, !dbg !2377

14:                                               ; preds = %10
  %15 = load i64, ptr %4, align 8, !dbg !2378, !tbaa !1562
  %16 = load i64, ptr @convert_monotonic_to_realtime.offset_updated, align 8, !dbg !2379, !tbaa !1562
  %17 = sub i64 %15, %16, !dbg !2380
  %18 = icmp ugt i64 %17, 1000000000, !dbg !2381
  br i1 %18, label %19, label %31, !dbg !2382

19:                                               ; preds = %14, %1
  %20 = call i64 @get_time_ns(i32 noundef 1), !dbg !2383
  store i64 %20, ptr %4, align 8, !dbg !2385, !tbaa !1562
  %21 = call i64 @get_time_ns(i32 noundef 0), !dbg !2386
  store i64 %21, ptr %5, align 8, !dbg !2387, !tbaa !1562
  %22 = load i64, ptr %5, align 8, !dbg !2388, !tbaa !1562
  %23 = load i64, ptr %4, align 8, !dbg !2390, !tbaa !1562
  %24 = icmp ult i64 %22, %23, !dbg !2391
  br i1 %24, label %25, label %26, !dbg !2392

25:                                               ; preds = %19
  store i64 0, ptr %2, align 8, !dbg !2393
  store i32 1, ptr %6, align 4
  br label %35, !dbg !2393

26:                                               ; preds = %19
  %27 = load i64, ptr %5, align 8, !dbg !2394, !tbaa !1562
  %28 = load i64, ptr %4, align 8, !dbg !2395, !tbaa !1562
  %29 = sub i64 %27, %28, !dbg !2396
  store i64 %29, ptr @convert_monotonic_to_realtime.offset, align 8, !dbg !2397, !tbaa !1562
  %30 = load i64, ptr %4, align 8, !dbg !2398, !tbaa !1562
  store i64 %30, ptr @convert_monotonic_to_realtime.offset_updated, align 8, !dbg !2399, !tbaa !1562
  br label %31, !dbg !2400

31:                                               ; preds = %26, %14, %10
  %32 = load i64, ptr %3, align 8, !dbg !2401, !tbaa !1562
  %33 = load i64, ptr @convert_monotonic_to_realtime.offset, align 8, !dbg !2402, !tbaa !1562
  %34 = add i64 %32, %33, !dbg !2403
  store i64 %34, ptr %2, align 8, !dbg !2404
  store i32 1, ptr %6, align 4
  br label %35, !dbg !2404

35:                                               ; preds = %31, %25
  call void @llvm.lifetime.end.p0(i64 8, ptr %5) #12, !dbg !2405
  call void @llvm.lifetime.end.p0(i64 8, ptr %4) #12, !dbg !2405
  %36 = load i64, ptr %2, align 8, !dbg !2405
  ret i64 %36, !dbg !2405
}

; Function Attrs: nounwind
declare !dbg !2406 dso_local i64 @strftime(ptr noundef, i64 noundef, ptr noundef, ptr noundef) #0

; Function Attrs: nounwind
declare !dbg !2434 dso_local ptr @localtime(ptr noundef) #0

; Function Attrs: nounwind
define internal i64 @get_time_ns(i32 noundef %0) #0 !dbg !2442 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  %4 = alloca %struct.timespec, align 8
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4, !tbaa !794
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2449, metadata !DIExpression()), !dbg !2457
  call void @llvm.lifetime.start.p0(i64 16, ptr %4) #12, !dbg !2458
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2450, metadata !DIExpression()), !dbg !2459
  %6 = load i32, ptr %3, align 4, !dbg !2460, !tbaa !794
  %7 = call i32 @clock_gettime(i32 noundef %6, ptr noundef %4) #12, !dbg !2462
  %8 = icmp ne i32 %7, 0, !dbg !2463
  br i1 %8, label %9, label %10, !dbg !2464

9:                                                ; preds = %1
  store i64 0, ptr %2, align 8, !dbg !2465
  store i32 1, ptr %5, align 4
  br label %17, !dbg !2465

10:                                               ; preds = %1
  %11 = getelementptr inbounds %struct.timespec, ptr %4, i32 0, i32 0, !dbg !2466
  %12 = load i64, ptr %11, align 8, !dbg !2466, !tbaa !2467
  %13 = mul i64 %12, 1000000000, !dbg !2469
  %14 = getelementptr inbounds %struct.timespec, ptr %4, i32 0, i32 1, !dbg !2470
  %15 = load i64, ptr %14, align 8, !dbg !2470, !tbaa !2471
  %16 = add i64 %13, %15, !dbg !2472
  store i64 %16, ptr %2, align 8, !dbg !2473
  store i32 1, ptr %5, align 4
  br label %17, !dbg !2473

17:                                               ; preds = %10, %9
  call void @llvm.lifetime.end.p0(i64 16, ptr %4) #12, !dbg !2474
  %18 = load i64, ptr %2, align 8, !dbg !2474
  ret i64 %18, !dbg !2474
}

; Function Attrs: nounwind
declare !dbg !2475 dso_local i32 @clock_gettime(i32 noundef, ptr noundef) #0

; Function Attrs: nounwind
declare !dbg !2482 dso_local i32 @snprintf(ptr noundef, i64 noundef, ptr noundef, ...) #0

; Function Attrs: nounwind
define internal i32 @format_ip_address(ptr noundef %0, i64 noundef %1, i32 noundef %2, ptr noundef %3) #0 !dbg !2489 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2495, metadata !DIExpression()), !dbg !2499
  store i64 %1, ptr %7, align 8, !tbaa !846
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2496, metadata !DIExpression()), !dbg !2500
  store i32 %2, ptr %8, align 4, !tbaa !794
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2497, metadata !DIExpression()), !dbg !2501
  store ptr %3, ptr %9, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2498, metadata !DIExpression()), !dbg !2502
  %10 = load i32, ptr %8, align 4, !dbg !2503, !tbaa !794
  %11 = icmp eq i32 %10, 2, !dbg !2505
  br i1 %11, label %12, label %29, !dbg !2506

12:                                               ; preds = %4
  %13 = load i32, ptr %8, align 4, !dbg !2507, !tbaa !794
  %14 = load ptr, ptr %9, align 8, !dbg !2508, !tbaa !741
  %15 = getelementptr inbounds %struct.in6_addr, ptr %14, i32 0, i32 0, !dbg !2509
  %16 = getelementptr inbounds [16 x i8], ptr %15, i64 0, i64 12, !dbg !2508
  %17 = load ptr, ptr %6, align 8, !dbg !2510, !tbaa !741
  %18 = load i64, ptr %7, align 8, !dbg !2511, !tbaa !846
  %19 = trunc i64 %18 to i32, !dbg !2511
  %20 = call ptr @inet_ntop(i32 noundef %13, ptr noundef %16, ptr noundef %17, i32 noundef %19) #12, !dbg !2512
  %21 = icmp ne ptr %20, null, !dbg !2512
  br i1 %21, label %22, label %26, !dbg !2512

22:                                               ; preds = %12
  %23 = call ptr @__errno_location() #14, !dbg !2513
  %24 = load i32, ptr %23, align 4, !dbg !2513, !tbaa !794
  %25 = sub nsw i32 0, %24, !dbg !2514
  br label %27, !dbg !2512

26:                                               ; preds = %12
  br label %27, !dbg !2512

27:                                               ; preds = %26, %22
  %28 = phi i32 [ %25, %22 ], [ 0, %26 ], !dbg !2512
  store i32 %28, ptr %5, align 4, !dbg !2515
  br label %49, !dbg !2515

29:                                               ; preds = %4
  %30 = load i32, ptr %8, align 4, !dbg !2516, !tbaa !794
  %31 = icmp eq i32 %30, 10, !dbg !2518
  br i1 %31, label %32, label %47, !dbg !2519

32:                                               ; preds = %29
  %33 = load i32, ptr %8, align 4, !dbg !2520, !tbaa !794
  %34 = load ptr, ptr %9, align 8, !dbg !2521, !tbaa !741
  %35 = load ptr, ptr %6, align 8, !dbg !2522, !tbaa !741
  %36 = load i64, ptr %7, align 8, !dbg !2523, !tbaa !846
  %37 = trunc i64 %36 to i32, !dbg !2523
  %38 = call ptr @inet_ntop(i32 noundef %33, ptr noundef %34, ptr noundef %35, i32 noundef %37) #12, !dbg !2524
  %39 = icmp ne ptr %38, null, !dbg !2524
  br i1 %39, label %40, label %44, !dbg !2524

40:                                               ; preds = %32
  %41 = call ptr @__errno_location() #14, !dbg !2525
  %42 = load i32, ptr %41, align 4, !dbg !2525, !tbaa !794
  %43 = sub nsw i32 0, %42, !dbg !2526
  br label %45, !dbg !2524

44:                                               ; preds = %32
  br label %45, !dbg !2524

45:                                               ; preds = %44, %40
  %46 = phi i32 [ %43, %40 ], [ 0, %44 ], !dbg !2524
  store i32 %46, ptr %5, align 4, !dbg !2527
  br label %49, !dbg !2527

47:                                               ; preds = %29
  br label %48

48:                                               ; preds = %47
  store i32 -22, ptr %5, align 4, !dbg !2528
  br label %49, !dbg !2528

49:                                               ; preds = %48, %45, %27
  %50 = load i32, ptr %5, align 4, !dbg !2529
  ret i32 %50, !dbg !2529
}

; Function Attrs: inlinehint nounwind
define internal i16 @__bswap_16(i16 noundef zeroext %0) #9 !dbg !2530 {
  %2 = alloca i16, align 2
  store i16 %0, ptr %2, align 2, !tbaa !2267
  call void @llvm.dbg.declare(metadata ptr %2, metadata !2535, metadata !DIExpression()), !dbg !2536
  %3 = load i16, ptr %2, align 2, !dbg !2537, !tbaa !2267
  %4 = zext i16 %3 to i32, !dbg !2537
  %5 = ashr i32 %4, 8, !dbg !2537
  %6 = and i32 %5, 255, !dbg !2537
  %7 = load i16, ptr %2, align 2, !dbg !2537, !tbaa !2267
  %8 = zext i16 %7 to i32, !dbg !2537
  %9 = and i32 %8, 255, !dbg !2537
  %10 = shl i32 %9, 8, !dbg !2537
  %11 = or i32 %6, %10, !dbg !2537
  %12 = trunc i32 %11 to i16, !dbg !2537
  ret i16 %12, !dbg !2538
}

; Function Attrs: nounwind
declare !dbg !2539 dso_local ptr @inet_ntop(i32 noundef, ptr noundef, ptr noundef, i32 noundef) #0

declare !dbg !2552 dso_local ptr @jsonw_new(ptr noundef) #5

declare !dbg !2557 dso_local void @jsonw_start_array(ptr noundef) #5

declare !dbg !2560 dso_local void @jsonw_start_object(ptr noundef) #5

; Function Attrs: nounwind
define internal void @print_common_fields_json(ptr noundef %0, ptr noundef %1) #0 !dbg !2563 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca [46 x i8], align 1
  %7 = alloca [46 x i8], align 1
  store ptr %0, ptr %3, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2567, metadata !DIExpression()), !dbg !2572
  store ptr %1, ptr %4, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2568, metadata !DIExpression()), !dbg !2573
  call void @llvm.lifetime.start.p0(i64 8, ptr %5) #12, !dbg !2574
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2569, metadata !DIExpression()), !dbg !2575
  %8 = load ptr, ptr %4, align 8, !dbg !2576, !tbaa !741
  %9 = getelementptr inbounds %struct.rtt_event, ptr %8, i32 0, i32 2, !dbg !2577
  store ptr %9, ptr %5, align 8, !dbg !2575, !tbaa !741
  call void @llvm.lifetime.start.p0(i64 46, ptr %6) #12, !dbg !2578
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2570, metadata !DIExpression()), !dbg !2579
  call void @llvm.lifetime.start.p0(i64 46, ptr %7) #12, !dbg !2580
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2571, metadata !DIExpression()), !dbg !2581
  %10 = getelementptr inbounds [46 x i8], ptr %6, i64 0, i64 0, !dbg !2582
  %11 = load ptr, ptr %5, align 8, !dbg !2583, !tbaa !741
  %12 = getelementptr inbounds %struct.network_tuple, ptr %11, i32 0, i32 3, !dbg !2584
  %13 = load i8, ptr %12, align 2, !dbg !2584, !tbaa !2298
  %14 = zext i8 %13 to i32, !dbg !2583
  %15 = load ptr, ptr %5, align 8, !dbg !2585, !tbaa !741
  %16 = getelementptr inbounds %struct.network_tuple, ptr %15, i32 0, i32 0, !dbg !2586
  %17 = getelementptr inbounds %struct.flow_address, ptr %16, i32 0, i32 0, !dbg !2587
  %18 = call i32 @format_ip_address(ptr noundef %10, i64 noundef 46, i32 noundef %14, ptr noundef %17), !dbg !2588
  %19 = getelementptr inbounds [46 x i8], ptr %7, i64 0, i64 0, !dbg !2589
  %20 = load ptr, ptr %5, align 8, !dbg !2590, !tbaa !741
  %21 = getelementptr inbounds %struct.network_tuple, ptr %20, i32 0, i32 3, !dbg !2591
  %22 = load i8, ptr %21, align 2, !dbg !2591, !tbaa !2298
  %23 = zext i8 %22 to i32, !dbg !2590
  %24 = load ptr, ptr %5, align 8, !dbg !2592, !tbaa !741
  %25 = getelementptr inbounds %struct.network_tuple, ptr %24, i32 0, i32 1, !dbg !2593
  %26 = getelementptr inbounds %struct.flow_address, ptr %25, i32 0, i32 0, !dbg !2594
  %27 = call i32 @format_ip_address(ptr noundef %19, i64 noundef 46, i32 noundef %23, ptr noundef %26), !dbg !2595
  %28 = load ptr, ptr %3, align 8, !dbg !2596, !tbaa !741
  %29 = load ptr, ptr %4, align 8, !dbg !2597, !tbaa !741
  %30 = getelementptr inbounds %struct.rtt_event, ptr %29, i32 0, i32 1, !dbg !2598
  %31 = load i64, ptr %30, align 8, !dbg !2598, !tbaa !779
  %32 = call i64 @convert_monotonic_to_realtime(i64 noundef %31), !dbg !2599
  call void @jsonw_u64_field(ptr noundef %28, ptr noundef @.str.81, i64 noundef %32), !dbg !2600
  %33 = load ptr, ptr %3, align 8, !dbg !2601, !tbaa !741
  %34 = getelementptr inbounds [46 x i8], ptr %6, i64 0, i64 0, !dbg !2602
  call void @jsonw_string_field(ptr noundef %33, ptr noundef @.str.82, ptr noundef %34), !dbg !2603
  %35 = load ptr, ptr %3, align 8, !dbg !2604, !tbaa !741
  %36 = load ptr, ptr %5, align 8, !dbg !2605, !tbaa !741
  %37 = getelementptr inbounds %struct.network_tuple, ptr %36, i32 0, i32 0, !dbg !2605
  %38 = getelementptr inbounds %struct.flow_address, ptr %37, i32 0, i32 1, !dbg !2605
  %39 = load i16, ptr %38, align 4, !dbg !2605, !tbaa !2313
  %40 = call i16 @__bswap_16(i16 noundef zeroext %39), !dbg !2605
  call void @jsonw_hu_field(ptr noundef %35, ptr noundef @.str.83, i16 noundef zeroext %40), !dbg !2606
  %41 = load ptr, ptr %3, align 8, !dbg !2607, !tbaa !741
  %42 = getelementptr inbounds [46 x i8], ptr %7, i64 0, i64 0, !dbg !2608
  call void @jsonw_string_field(ptr noundef %41, ptr noundef @.str.84, ptr noundef %42), !dbg !2609
  %43 = load ptr, ptr %3, align 8, !dbg !2610, !tbaa !741
  %44 = load ptr, ptr %5, align 8, !dbg !2611, !tbaa !741
  %45 = getelementptr inbounds %struct.network_tuple, ptr %44, i32 0, i32 1, !dbg !2611
  %46 = getelementptr inbounds %struct.flow_address, ptr %45, i32 0, i32 1, !dbg !2611
  %47 = load i16, ptr %46, align 4, !dbg !2611, !tbaa !2316
  %48 = call i16 @__bswap_16(i16 noundef zeroext %47), !dbg !2611
  call void @jsonw_hu_field(ptr noundef %43, ptr noundef @.str.85, i16 noundef zeroext %48), !dbg !2612
  %49 = load ptr, ptr %3, align 8, !dbg !2613, !tbaa !741
  %50 = load ptr, ptr %5, align 8, !dbg !2614, !tbaa !741
  %51 = getelementptr inbounds %struct.network_tuple, ptr %50, i32 0, i32 2, !dbg !2615
  %52 = load i16, ptr %51, align 4, !dbg !2615, !tbaa !2616
  %53 = call ptr @proto_to_str(i16 noundef zeroext %52), !dbg !2617
  call void @jsonw_string_field(ptr noundef %49, ptr noundef @.str.86, ptr noundef %53), !dbg !2618
  call void @llvm.lifetime.end.p0(i64 46, ptr %7) #12, !dbg !2619
  call void @llvm.lifetime.end.p0(i64 46, ptr %6) #12, !dbg !2619
  call void @llvm.lifetime.end.p0(i64 8, ptr %5) #12, !dbg !2619
  ret void, !dbg !2619
}

; Function Attrs: nounwind
define internal void @print_rttevent_fields_json(ptr noundef %0, ptr noundef %1) #0 !dbg !2620 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2624, metadata !DIExpression()), !dbg !2626
  store ptr %1, ptr %4, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2625, metadata !DIExpression()), !dbg !2627
  %5 = load ptr, ptr %3, align 8, !dbg !2628, !tbaa !741
  %6 = load ptr, ptr %4, align 8, !dbg !2629, !tbaa !741
  %7 = getelementptr inbounds %struct.rtt_event, ptr %6, i32 0, i32 4, !dbg !2630
  %8 = load i64, ptr %7, align 8, !dbg !2630, !tbaa !1569
  call void @jsonw_u64_field(ptr noundef %5, ptr noundef @.str.87, i64 noundef %8), !dbg !2631
  %9 = load ptr, ptr %3, align 8, !dbg !2632, !tbaa !741
  %10 = load ptr, ptr %4, align 8, !dbg !2633, !tbaa !741
  %11 = getelementptr inbounds %struct.rtt_event, ptr %10, i32 0, i32 5, !dbg !2634
  %12 = load i64, ptr %11, align 8, !dbg !2634, !tbaa !1576
  call void @jsonw_u64_field(ptr noundef %9, ptr noundef @.str.88, i64 noundef %12), !dbg !2635
  %13 = load ptr, ptr %3, align 8, !dbg !2636, !tbaa !741
  %14 = load ptr, ptr %4, align 8, !dbg !2637, !tbaa !741
  %15 = getelementptr inbounds %struct.rtt_event, ptr %14, i32 0, i32 6, !dbg !2638
  %16 = load i64, ptr %15, align 8, !dbg !2638, !tbaa !2639
  call void @jsonw_u64_field(ptr noundef %13, ptr noundef @.str.89, i64 noundef %16), !dbg !2640
  %17 = load ptr, ptr %3, align 8, !dbg !2641, !tbaa !741
  %18 = load ptr, ptr %4, align 8, !dbg !2642, !tbaa !741
  %19 = getelementptr inbounds %struct.rtt_event, ptr %18, i32 0, i32 7, !dbg !2643
  %20 = load i64, ptr %19, align 8, !dbg !2643, !tbaa !2644
  call void @jsonw_u64_field(ptr noundef %17, ptr noundef @.str.90, i64 noundef %20), !dbg !2645
  %21 = load ptr, ptr %3, align 8, !dbg !2646, !tbaa !741
  %22 = load ptr, ptr %4, align 8, !dbg !2647, !tbaa !741
  %23 = getelementptr inbounds %struct.rtt_event, ptr %22, i32 0, i32 8, !dbg !2648
  %24 = load i64, ptr %23, align 8, !dbg !2648, !tbaa !2649
  call void @jsonw_u64_field(ptr noundef %21, ptr noundef @.str.91, i64 noundef %24), !dbg !2650
  %25 = load ptr, ptr %3, align 8, !dbg !2651, !tbaa !741
  %26 = load ptr, ptr %4, align 8, !dbg !2652, !tbaa !741
  %27 = getelementptr inbounds %struct.rtt_event, ptr %26, i32 0, i32 9, !dbg !2653
  %28 = load i64, ptr %27, align 8, !dbg !2653, !tbaa !2654
  call void @jsonw_u64_field(ptr noundef %25, ptr noundef @.str.92, i64 noundef %28), !dbg !2655
  %29 = load ptr, ptr %3, align 8, !dbg !2656, !tbaa !741
  %30 = load ptr, ptr %4, align 8, !dbg !2657, !tbaa !741
  %31 = getelementptr inbounds %struct.rtt_event, ptr %30, i32 0, i32 10, !dbg !2658
  %32 = load i8, ptr %31, align 8, !dbg !2658, !tbaa !2659, !range !759, !noundef !760
  %33 = trunc i8 %32 to i1, !dbg !2658
  call void @jsonw_bool_field(ptr noundef %29, ptr noundef @.str.93, i1 noundef zeroext %33), !dbg !2660
  ret void, !dbg !2661
}

; Function Attrs: nounwind
define internal void @print_flowevent_fields_json(ptr noundef %0, ptr noundef %1) #0 !dbg !2662 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2668, metadata !DIExpression()), !dbg !2670
  store ptr %1, ptr %4, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2669, metadata !DIExpression()), !dbg !2671
  %5 = load ptr, ptr %3, align 8, !dbg !2672, !tbaa !741
  %6 = load ptr, ptr %4, align 8, !dbg !2673, !tbaa !741
  %7 = getelementptr inbounds %struct.flow_event, ptr %6, i32 0, i32 3, !dbg !2674
  %8 = load i8, ptr %7, align 4, !dbg !2674, !tbaa !2675
  %9 = call ptr @flowevent_to_str(i8 noundef zeroext %8), !dbg !2677
  call void @jsonw_string_field(ptr noundef %5, ptr noundef @.str.94, ptr noundef %9), !dbg !2678
  %10 = load ptr, ptr %3, align 8, !dbg !2679, !tbaa !741
  %11 = load ptr, ptr %4, align 8, !dbg !2680, !tbaa !741
  %12 = getelementptr inbounds %struct.flow_event, ptr %11, i32 0, i32 4, !dbg !2681
  %13 = load i8, ptr %12, align 1, !dbg !2681, !tbaa !2682
  %14 = call ptr @eventreason_to_str(i8 noundef zeroext %13), !dbg !2683
  call void @jsonw_string_field(ptr noundef %10, ptr noundef @.str.95, ptr noundef %14), !dbg !2684
  %15 = load ptr, ptr %3, align 8, !dbg !2685, !tbaa !741
  %16 = load ptr, ptr %4, align 8, !dbg !2686, !tbaa !741
  %17 = getelementptr inbounds %struct.flow_event, ptr %16, i32 0, i32 5, !dbg !2687
  %18 = load i8, ptr %17, align 2, !dbg !2687, !tbaa !2688
  %19 = call ptr @eventsource_to_str(i8 noundef zeroext %18), !dbg !2689
  call void @jsonw_string_field(ptr noundef %15, ptr noundef @.str.96, ptr noundef %19), !dbg !2690
  ret void, !dbg !2691
}

declare !dbg !2692 dso_local void @jsonw_end_object(ptr noundef) #5

declare !dbg !2695 dso_local void @jsonw_u64_field(ptr noundef, ptr noundef, i64 noundef) #5

declare !dbg !2704 dso_local void @jsonw_string_field(ptr noundef, ptr noundef, ptr noundef) #5

declare !dbg !2711 dso_local void @jsonw_hu_field(ptr noundef, ptr noundef, i16 noundef zeroext) #5

declare !dbg !2718 dso_local void @jsonw_bool_field(ptr noundef, ptr noundef, i1 noundef zeroext) #5

declare !dbg !2725 dso_local ptr @bpf_object__open(ptr noundef) #5

; Function Attrs: nounwind
define internal i32 @init_rodata(ptr noundef %0, ptr noundef %1, i64 noundef %2) #0 !dbg !2730 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %5, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2734, metadata !DIExpression()), !dbg !2740
  store ptr %1, ptr %6, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2735, metadata !DIExpression()), !dbg !2741
  store i64 %2, ptr %7, align 8, !tbaa !846
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2736, metadata !DIExpression()), !dbg !2742
  call void @llvm.lifetime.start.p0(i64 8, ptr %8) #12, !dbg !2743
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2737, metadata !DIExpression()), !dbg !2744
  store ptr null, ptr %8, align 8, !dbg !2744, !tbaa !741
  %10 = load ptr, ptr %5, align 8, !dbg !2745, !tbaa !741
  %11 = call ptr @bpf_object__next_map(ptr noundef %10, ptr noundef null), !dbg !2745
  store ptr %11, ptr %8, align 8, !dbg !2745, !tbaa !741
  br label %12, !dbg !2745

12:                                               ; preds = %26, %3
  %13 = load ptr, ptr %8, align 8, !dbg !2747, !tbaa !741
  %14 = icmp ne ptr %13, null, !dbg !2747
  br i1 %14, label %15, label %30, !dbg !2745

15:                                               ; preds = %12
  %16 = load ptr, ptr %8, align 8, !dbg !2749, !tbaa !741
  %17 = call ptr @bpf_map__name(ptr noundef %16), !dbg !2752
  %18 = call ptr @strstr(ptr noundef %17, ptr noundef @.str.104) #13, !dbg !2753
  %19 = icmp ne ptr %18, null, !dbg !2753
  br i1 %19, label %20, label %25, !dbg !2754

20:                                               ; preds = %15
  %21 = load ptr, ptr %8, align 8, !dbg !2755, !tbaa !741
  %22 = load ptr, ptr %6, align 8, !dbg !2756, !tbaa !741
  %23 = load i64, ptr %7, align 8, !dbg !2757, !tbaa !846
  %24 = call i32 @bpf_map__set_initial_value(ptr noundef %21, ptr noundef %22, i64 noundef %23), !dbg !2758
  store i32 %24, ptr %4, align 4, !dbg !2759
  store i32 1, ptr %9, align 4
  br label %31, !dbg !2759

25:                                               ; preds = %15
  br label %26, !dbg !2760

26:                                               ; preds = %25
  %27 = load ptr, ptr %5, align 8, !dbg !2747, !tbaa !741
  %28 = load ptr, ptr %8, align 8, !dbg !2747, !tbaa !741
  %29 = call ptr @bpf_object__next_map(ptr noundef %27, ptr noundef %28), !dbg !2747
  store ptr %29, ptr %8, align 8, !dbg !2747, !tbaa !741
  br label %12, !dbg !2747, !llvm.loop !2761

30:                                               ; preds = %12
  store i32 -22, ptr %4, align 4, !dbg !2763
  store i32 1, ptr %9, align 4
  br label %31, !dbg !2763

31:                                               ; preds = %30, %20
  call void @llvm.lifetime.end.p0(i64 8, ptr %8) #12, !dbg !2764
  %32 = load i32, ptr %4, align 4, !dbg !2764
  ret i32 %32, !dbg !2764
}

; Function Attrs: nounwind
define internal i32 @set_programs_to_load(ptr noundef %0, ptr noundef %1) #0 !dbg !2765 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2767, metadata !DIExpression()), !dbg !2773
  store ptr %1, ptr %5, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2768, metadata !DIExpression()), !dbg !2774
  call void @llvm.lifetime.start.p0(i64 8, ptr %6) #12, !dbg !2775
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2769, metadata !DIExpression()), !dbg !2776
  call void @llvm.lifetime.start.p0(i64 8, ptr %7) #12, !dbg !2777
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2772, metadata !DIExpression()), !dbg !2778
  %9 = load ptr, ptr %5, align 8, !dbg !2779, !tbaa !741
  %10 = getelementptr inbounds %struct.pping_config, ptr %9, i32 0, i32 5, !dbg !2780
  %11 = load ptr, ptr %10, align 8, !dbg !2780, !tbaa !850
  %12 = call i32 @strcmp(ptr noundef %11, ptr noundef @.str.8) #13, !dbg !2781
  %13 = icmp ne i32 %12, 0, !dbg !2782
  %14 = zext i1 %13 to i64, !dbg !2781
  %15 = select i1 %13, ptr @.str.8, ptr @.str.36, !dbg !2781
  store ptr %15, ptr %7, align 8, !dbg !2778, !tbaa !741
  %16 = load ptr, ptr %4, align 8, !dbg !2783, !tbaa !741
  %17 = load ptr, ptr %7, align 8, !dbg !2784, !tbaa !741
  %18 = call ptr @bpf_object__find_program_by_name(ptr noundef %16, ptr noundef %17), !dbg !2785
  store ptr %18, ptr %6, align 8, !dbg !2786, !tbaa !741
  %19 = load ptr, ptr %6, align 8, !dbg !2787, !tbaa !741
  %20 = call i64 @libbpf_get_error(ptr noundef %19), !dbg !2789
  %21 = icmp ne i64 %20, 0, !dbg !2789
  br i1 %21, label %22, label %26, !dbg !2790

22:                                               ; preds = %2
  %23 = load ptr, ptr %6, align 8, !dbg !2791, !tbaa !741
  %24 = call i64 @libbpf_get_error(ptr noundef %23), !dbg !2792
  %25 = trunc i64 %24 to i32, !dbg !2792
  store i32 %25, ptr %3, align 4, !dbg !2793
  store i32 1, ptr %8, align 4
  br label %29, !dbg !2793

26:                                               ; preds = %2
  %27 = load ptr, ptr %6, align 8, !dbg !2794, !tbaa !741
  %28 = call i32 @bpf_program__set_autoload(ptr noundef %27, i1 noundef zeroext false), !dbg !2795
  store i32 %28, ptr %3, align 4, !dbg !2796
  store i32 1, ptr %8, align 4
  br label %29, !dbg !2796

29:                                               ; preds = %26, %22
  call void @llvm.lifetime.end.p0(i64 8, ptr %7) #12, !dbg !2797
  call void @llvm.lifetime.end.p0(i64 8, ptr %6) #12, !dbg !2797
  %30 = load i32, ptr %3, align 4, !dbg !2797
  ret i32 %30, !dbg !2797
}

declare !dbg !2798 dso_local i32 @bpf_object__load(ptr noundef) #5

; Function Attrs: nounwind
define internal i32 @tc_attach(ptr noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) #0 !dbg !2803 {
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i8, align 1
  %17 = alloca %struct.bpf_tc_hook, align 8
  %18 = alloca i32, align 4
  store ptr %0, ptr %8, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2809, metadata !DIExpression()), !dbg !2820
  store i32 %1, ptr %9, align 4, !tbaa !794
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2810, metadata !DIExpression()), !dbg !2821
  store i32 %2, ptr %10, align 4, !tbaa !779
  call void @llvm.dbg.declare(metadata ptr %10, metadata !2811, metadata !DIExpression()), !dbg !2822
  store ptr %3, ptr %11, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %11, metadata !2812, metadata !DIExpression()), !dbg !2823
  store ptr %4, ptr %12, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %12, metadata !2813, metadata !DIExpression()), !dbg !2824
  store ptr %5, ptr %13, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %13, metadata !2814, metadata !DIExpression()), !dbg !2825
  call void @llvm.lifetime.start.p0(i64 4, ptr %14) #12, !dbg !2826
  call void @llvm.dbg.declare(metadata ptr %14, metadata !2815, metadata !DIExpression()), !dbg !2827
  call void @llvm.lifetime.start.p0(i64 4, ptr %15) #12, !dbg !2828
  call void @llvm.dbg.declare(metadata ptr %15, metadata !2816, metadata !DIExpression()), !dbg !2829
  call void @llvm.lifetime.start.p0(i64 1, ptr %16) #12, !dbg !2830
  call void @llvm.dbg.declare(metadata ptr %16, metadata !2817, metadata !DIExpression()), !dbg !2831
  store i8 1, ptr %16, align 1, !dbg !2831, !tbaa !761
  call void @llvm.lifetime.start.p0(i64 24, ptr %17) #12, !dbg !2832
  call void @llvm.dbg.declare(metadata ptr %17, metadata !2818, metadata !DIExpression()), !dbg !2832
  call void @llvm.memset.p0.i64(ptr align 8 %17, i8 0, i64 24, i1 false), !dbg !2833
  %19 = getelementptr inbounds %struct.bpf_tc_hook, ptr %17, i32 0, i32 0, !dbg !2833
  store i64 24, ptr %19, align 8, !dbg !2833, !tbaa !2066
  %20 = getelementptr inbounds %struct.bpf_tc_hook, ptr %17, i32 0, i32 1, !dbg !2833
  %21 = load i32, ptr %9, align 4, !dbg !2833, !tbaa !794
  store i32 %21, ptr %20, align 8, !dbg !2833, !tbaa !2068
  %22 = getelementptr inbounds %struct.bpf_tc_hook, ptr %17, i32 0, i32 2, !dbg !2833
  %23 = load i32, ptr %10, align 4, !dbg !2833, !tbaa !779
  store i32 %23, ptr %22, align 4, !dbg !2833, !tbaa !2069
  %24 = getelementptr inbounds %struct.bpf_tc_hook, ptr %17, i32 0, i32 3, !dbg !2833
  store i32 0, ptr %24, align 8, !dbg !2833, !tbaa !2070
  %25 = call i32 @bpf_tc_hook_create(ptr noundef %17), !dbg !2835
  store i32 %25, ptr %14, align 4, !dbg !2836, !tbaa !794
  %26 = load i32, ptr %14, align 4, !dbg !2837, !tbaa !794
  %27 = icmp eq i32 %26, -17, !dbg !2839
  br i1 %27, label %28, label %29, !dbg !2840

28:                                               ; preds = %6
  store i8 0, ptr %16, align 1, !dbg !2841, !tbaa !761
  br label %35, !dbg !2842

29:                                               ; preds = %6
  %30 = load i32, ptr %14, align 4, !dbg !2843, !tbaa !794
  %31 = icmp ne i32 %30, 0, !dbg !2843
  br i1 %31, label %32, label %34, !dbg !2845

32:                                               ; preds = %29
  %33 = load i32, ptr %14, align 4, !dbg !2846, !tbaa !794
  store i32 %33, ptr %7, align 4, !dbg !2847
  store i32 1, ptr %18, align 4
  br label %75, !dbg !2847

34:                                               ; preds = %29
  br label %35

35:                                               ; preds = %34, %28
  %36 = load ptr, ptr %8, align 8, !dbg !2848, !tbaa !741
  %37 = load ptr, ptr %11, align 8, !dbg !2849, !tbaa !741
  %38 = call ptr @bpf_object__find_program_by_name(ptr noundef %36, ptr noundef %37), !dbg !2850
  %39 = call i32 @bpf_program__fd(ptr noundef %38), !dbg !2851
  store i32 %39, ptr %15, align 4, !dbg !2852, !tbaa !794
  %40 = load i32, ptr %15, align 4, !dbg !2853, !tbaa !794
  %41 = icmp slt i32 %40, 0, !dbg !2855
  br i1 %41, label %42, label %44, !dbg !2856

42:                                               ; preds = %35
  %43 = load i32, ptr %15, align 4, !dbg !2857, !tbaa !794
  store i32 %43, ptr %14, align 4, !dbg !2859, !tbaa !794
  br label %67, !dbg !2860

44:                                               ; preds = %35
  %45 = load i32, ptr %15, align 4, !dbg !2861, !tbaa !794
  %46 = load ptr, ptr %12, align 8, !dbg !2862, !tbaa !741
  %47 = getelementptr inbounds %struct.bpf_tc_opts, ptr %46, i32 0, i32 1, !dbg !2863
  store i32 %45, ptr %47, align 8, !dbg !2864, !tbaa !2074
  %48 = load ptr, ptr %12, align 8, !dbg !2865, !tbaa !741
  %49 = getelementptr inbounds %struct.bpf_tc_opts, ptr %48, i32 0, i32 3, !dbg !2866
  store i32 0, ptr %49, align 8, !dbg !2867, !tbaa !2076
  %50 = load ptr, ptr %12, align 8, !dbg !2868, !tbaa !741
  %51 = call i32 @bpf_tc_attach(ptr noundef %17, ptr noundef %50), !dbg !2869
  store i32 %51, ptr %14, align 4, !dbg !2870, !tbaa !794
  %52 = load i32, ptr %14, align 4, !dbg !2871, !tbaa !794
  %53 = icmp ne i32 %52, 0, !dbg !2871
  br i1 %53, label %54, label %55, !dbg !2873

54:                                               ; preds = %44
  br label %67, !dbg !2874

55:                                               ; preds = %44
  %56 = load ptr, ptr %13, align 8, !dbg !2875, !tbaa !741
  %57 = icmp ne ptr %56, null, !dbg !2875
  br i1 %57, label %58, label %63, !dbg !2877

58:                                               ; preds = %55
  %59 = load i8, ptr %16, align 1, !dbg !2878, !tbaa !761, !range !759, !noundef !760
  %60 = trunc i8 %59 to i1, !dbg !2878
  %61 = load ptr, ptr %13, align 8, !dbg !2879, !tbaa !741
  %62 = zext i1 %60 to i8, !dbg !2880
  store i8 %62, ptr %61, align 1, !dbg !2880, !tbaa !761
  br label %63, !dbg !2881

63:                                               ; preds = %58, %55
  %64 = load ptr, ptr %12, align 8, !dbg !2882, !tbaa !741
  %65 = getelementptr inbounds %struct.bpf_tc_opts, ptr %64, i32 0, i32 3, !dbg !2883
  %66 = load i32, ptr %65, align 8, !dbg !2883, !tbaa !2076
  store i32 %66, ptr %7, align 4, !dbg !2884
  store i32 1, ptr %18, align 4
  br label %75, !dbg !2884

67:                                               ; preds = %54, %42
  call void @llvm.dbg.label(metadata !2819), !dbg !2885
  %68 = load i8, ptr %16, align 1, !dbg !2886, !tbaa !761, !range !759, !noundef !760
  %69 = trunc i8 %68 to i1, !dbg !2886
  br i1 %69, label %70, label %73, !dbg !2888

70:                                               ; preds = %67
  %71 = getelementptr inbounds %struct.bpf_tc_hook, ptr %17, i32 0, i32 2, !dbg !2889
  store i32 3, ptr %71, align 4, !dbg !2891, !tbaa !2069
  %72 = call i32 @bpf_tc_hook_destroy(ptr noundef %17), !dbg !2892
  br label %73, !dbg !2893

73:                                               ; preds = %70, %67
  %74 = load i32, ptr %14, align 4, !dbg !2894, !tbaa !794
  store i32 %74, ptr %7, align 4, !dbg !2895
  store i32 1, ptr %18, align 4
  br label %75, !dbg !2895

75:                                               ; preds = %73, %63, %32
  call void @llvm.lifetime.end.p0(i64 24, ptr %17) #12, !dbg !2896
  call void @llvm.lifetime.end.p0(i64 1, ptr %16) #12, !dbg !2896
  call void @llvm.lifetime.end.p0(i64 4, ptr %15) #12, !dbg !2896
  call void @llvm.lifetime.end.p0(i64 4, ptr %14) #12, !dbg !2896
  %76 = load i32, ptr %7, align 4, !dbg !2896
  ret i32 %76, !dbg !2896
}

; Function Attrs: nounwind
define internal i32 @xdp_attach(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 !dbg !2897 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  store ptr %0, ptr %6, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2901, metadata !DIExpression()), !dbg !2909
  store ptr %1, ptr %7, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2902, metadata !DIExpression()), !dbg !2910
  store i32 %2, ptr %8, align 4, !tbaa !794
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2903, metadata !DIExpression()), !dbg !2911
  store i32 %3, ptr %9, align 4, !tbaa !794
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2904, metadata !DIExpression()), !dbg !2912
  call void @llvm.lifetime.start.p0(i64 8, ptr %10) #12, !dbg !2913
  call void @llvm.dbg.declare(metadata ptr %10, metadata !2905, metadata !DIExpression()), !dbg !2914
  call void @llvm.lifetime.start.p0(i64 4, ptr %11) #12, !dbg !2915
  call void @llvm.dbg.declare(metadata ptr %11, metadata !2906, metadata !DIExpression()), !dbg !2916
  call void @llvm.lifetime.start.p0(i64 4, ptr %12) #12, !dbg !2915
  call void @llvm.dbg.declare(metadata ptr %12, metadata !2907, metadata !DIExpression()), !dbg !2917
  call void @llvm.lifetime.start.p0(i64 4, ptr %13) #12, !dbg !2918
  call void @llvm.dbg.declare(metadata ptr %13, metadata !2908, metadata !DIExpression()), !dbg !2919
  %15 = load ptr, ptr %7, align 8, !dbg !2920, !tbaa !741
  %16 = icmp ne ptr %15, null, !dbg !2920
  br i1 %16, label %17, label %21, !dbg !2922

17:                                               ; preds = %4
  %18 = load ptr, ptr %6, align 8, !dbg !2923, !tbaa !741
  %19 = load ptr, ptr %7, align 8, !dbg !2924, !tbaa !741
  %20 = call ptr @bpf_object__find_program_by_name(ptr noundef %18, ptr noundef %19), !dbg !2925
  store ptr %20, ptr %10, align 8, !dbg !2926, !tbaa !741
  br label %24, !dbg !2927

21:                                               ; preds = %4
  %22 = load ptr, ptr %6, align 8, !dbg !2928, !tbaa !741
  %23 = call ptr @bpf_object__next_program(ptr noundef %22, ptr noundef null), !dbg !2929
  store ptr %23, ptr %10, align 8, !dbg !2930, !tbaa !741
  br label %24

24:                                               ; preds = %21, %17
  %25 = load ptr, ptr %10, align 8, !dbg !2931, !tbaa !741
  %26 = call i32 @bpf_program__fd(ptr noundef %25), !dbg !2932
  store i32 %26, ptr %11, align 4, !dbg !2933, !tbaa !794
  %27 = load i32, ptr %11, align 4, !dbg !2934, !tbaa !794
  %28 = icmp slt i32 %27, 0, !dbg !2936
  br i1 %28, label %29, label %31, !dbg !2937

29:                                               ; preds = %24
  %30 = load i32, ptr %11, align 4, !dbg !2938, !tbaa !794
  store i32 %30, ptr %5, align 4, !dbg !2939
  store i32 1, ptr %14, align 4
  br label %53, !dbg !2939

31:                                               ; preds = %24
  %32 = load i32, ptr %8, align 4, !dbg !2940, !tbaa !794
  %33 = load i32, ptr %11, align 4, !dbg !2941, !tbaa !794
  %34 = load i32, ptr %9, align 4, !dbg !2942, !tbaa !794
  %35 = call i32 @bpf_set_link_xdp_fd(i32 noundef %32, i32 noundef %33, i32 noundef %34), !dbg !2943
  store i32 %35, ptr %12, align 4, !dbg !2944, !tbaa !794
  %36 = load i32, ptr %12, align 4, !dbg !2945, !tbaa !794
  %37 = icmp ne i32 %36, 0, !dbg !2945
  br i1 %37, label %38, label %40, !dbg !2947

38:                                               ; preds = %31
  %39 = load i32, ptr %12, align 4, !dbg !2948, !tbaa !794
  store i32 %39, ptr %5, align 4, !dbg !2949
  store i32 1, ptr %14, align 4
  br label %53, !dbg !2949

40:                                               ; preds = %31
  %41 = load i32, ptr %8, align 4, !dbg !2950, !tbaa !794
  %42 = load i32, ptr %9, align 4, !dbg !2951, !tbaa !794
  %43 = call i32 @bpf_get_link_xdp_id(i32 noundef %41, ptr noundef %13, i32 noundef %42), !dbg !2952
  store i32 %43, ptr %12, align 4, !dbg !2953, !tbaa !794
  %44 = load i32, ptr %12, align 4, !dbg !2954, !tbaa !794
  %45 = icmp ne i32 %44, 0, !dbg !2954
  br i1 %45, label %46, label %51, !dbg !2956

46:                                               ; preds = %40
  %47 = load i32, ptr %8, align 4, !dbg !2957, !tbaa !794
  %48 = load i32, ptr %9, align 4, !dbg !2959, !tbaa !794
  %49 = call i32 @bpf_set_link_xdp_fd(i32 noundef %47, i32 noundef -1, i32 noundef %48), !dbg !2960
  %50 = load i32, ptr %12, align 4, !dbg !2961, !tbaa !794
  store i32 %50, ptr %5, align 4, !dbg !2962
  store i32 1, ptr %14, align 4
  br label %53, !dbg !2962

51:                                               ; preds = %40
  %52 = load i32, ptr %13, align 4, !dbg !2963, !tbaa !794
  store i32 %52, ptr %5, align 4, !dbg !2964
  store i32 1, ptr %14, align 4
  br label %53, !dbg !2964

53:                                               ; preds = %51, %46, %38, %29
  call void @llvm.lifetime.end.p0(i64 4, ptr %13) #12, !dbg !2965
  call void @llvm.lifetime.end.p0(i64 4, ptr %12) #12, !dbg !2965
  call void @llvm.lifetime.end.p0(i64 4, ptr %11) #12, !dbg !2965
  call void @llvm.lifetime.end.p0(i64 8, ptr %10) #12, !dbg !2965
  %54 = load i32, ptr %5, align 4, !dbg !2965
  ret i32 %54, !dbg !2965
}

; Function Attrs: nounwind
define internal void @print_xdp_error_hints(ptr noundef %0, i32 noundef %1) #0 !dbg !2966 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2970, metadata !DIExpression()), !dbg !2972
  store i32 %1, ptr %4, align 4, !tbaa !794
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2971, metadata !DIExpression()), !dbg !2973
  %5 = load i32, ptr %4, align 4, !dbg !2974, !tbaa !794
  %6 = icmp sgt i32 %5, 0, !dbg !2975
  br i1 %6, label %7, label %9, !dbg !2974

7:                                                ; preds = %2
  %8 = load i32, ptr %4, align 4, !dbg !2976, !tbaa !794
  br label %12, !dbg !2974

9:                                                ; preds = %2
  %10 = load i32, ptr %4, align 4, !dbg !2977, !tbaa !794
  %11 = sub nsw i32 0, %10, !dbg !2978
  br label %12, !dbg !2974

12:                                               ; preds = %9, %7
  %13 = phi i32 [ %8, %7 ], [ %11, %9 ], !dbg !2974
  store i32 %13, ptr %4, align 4, !dbg !2979, !tbaa !794
  %14 = load i32, ptr %4, align 4, !dbg !2980, !tbaa !794
  switch i32 %14, label %21 [
    i32 16, label %15
    i32 17, label %15
    i32 95, label %18
  ], !dbg !2981

15:                                               ; preds = %12, %12
  %16 = load ptr, ptr %3, align 8, !dbg !2982, !tbaa !741
  %17 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %16, ptr noundef @.str.105), !dbg !2984
  br label %21, !dbg !2985

18:                                               ; preds = %12
  %19 = load ptr, ptr %3, align 8, !dbg !2986, !tbaa !741
  %20 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %19, ptr noundef @.str.106), !dbg !2987
  br label %21, !dbg !2988

21:                                               ; preds = %12, %18, %15
  ret void, !dbg !2989
}

declare !dbg !2990 dso_local ptr @bpf_object__next_map(ptr noundef, ptr noundef) #5

; Function Attrs: nounwind willreturn memory(read)
declare !dbg !2998 dso_local ptr @strstr(ptr noundef, ptr noundef) #6

declare !dbg !3004 dso_local ptr @bpf_map__name(ptr noundef) #5

declare !dbg !3009 dso_local i32 @bpf_map__set_initial_value(ptr noundef, ptr noundef, i64 noundef) #5

declare !dbg !3016 dso_local ptr @bpf_object__find_program_by_name(ptr noundef, ptr noundef) #5

declare !dbg !3022 dso_local i32 @bpf_program__set_autoload(ptr noundef, i1 noundef zeroext) #5

declare !dbg !3028 dso_local i32 @bpf_tc_hook_create(ptr noundef) #5

declare !dbg !3034 dso_local i32 @bpf_program__fd(ptr noundef) #5

declare !dbg !3041 dso_local i32 @bpf_tc_attach(ptr noundef, ptr noundef) #5

declare !dbg !3049 dso_local i32 @bpf_tc_hook_destroy(ptr noundef) #5

declare !dbg !3052 dso_local ptr @bpf_object__next_program(ptr noundef, ptr noundef) #5

declare !dbg !3058 dso_local i32 @bpf_set_link_xdp_fd(i32 noundef, i32 noundef, i32 noundef) #5

declare !dbg !3065 dso_local i32 @bpf_get_link_xdp_id(i32 noundef, ptr noundef, i32 noundef) #5

; Function Attrs: nounwind
declare !dbg !3073 dso_local i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

; Function Attrs: nounwind
define internal ptr @periodic_map_cleanup(ptr noundef %0) #0 !dbg !3096 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca %struct.timespec, align 8
  store ptr %0, ptr %2, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %2, metadata !3098, metadata !DIExpression()), !dbg !3102
  call void @llvm.lifetime.start.p0(i64 8, ptr %3) #12, !dbg !3103
  call void @llvm.dbg.declare(metadata ptr %3, metadata !3099, metadata !DIExpression()), !dbg !3104
  %5 = load ptr, ptr %2, align 8, !dbg !3105, !tbaa !741
  store ptr %5, ptr %3, align 8, !dbg !3104, !tbaa !741
  call void @llvm.lifetime.start.p0(i64 16, ptr %4) #12, !dbg !3106
  call void @llvm.dbg.declare(metadata ptr %4, metadata !3101, metadata !DIExpression()), !dbg !3107
  %6 = load ptr, ptr %3, align 8, !dbg !3108, !tbaa !741
  %7 = getelementptr inbounds %struct.map_cleanup_args, ptr %6, i32 0, i32 0, !dbg !3109
  %8 = load i64, ptr %7, align 8, !dbg !3109, !tbaa !1793
  %9 = udiv i64 %8, 1000000000, !dbg !3110
  %10 = getelementptr inbounds %struct.timespec, ptr %4, i32 0, i32 0, !dbg !3111
  store i64 %9, ptr %10, align 8, !dbg !3112, !tbaa !2467
  %11 = load ptr, ptr %3, align 8, !dbg !3113, !tbaa !741
  %12 = getelementptr inbounds %struct.map_cleanup_args, ptr %11, i32 0, i32 0, !dbg !3114
  %13 = load i64, ptr %12, align 8, !dbg !3114, !tbaa !1793
  %14 = urem i64 %13, 1000000000, !dbg !3115
  %15 = getelementptr inbounds %struct.timespec, ptr %4, i32 0, i32 1, !dbg !3116
  store i64 %14, ptr %15, align 8, !dbg !3117, !tbaa !2471
  br label %16, !dbg !3118

16:                                               ; preds = %19, %1
  %17 = load volatile i32, ptr @keep_running, align 4, !dbg !3119, !tbaa !794
  %18 = icmp ne i32 %17, 0, !dbg !3118
  br i1 %18, label %19, label %29, !dbg !3118

19:                                               ; preds = %16
  %20 = load ptr, ptr %3, align 8, !dbg !3120, !tbaa !741
  %21 = getelementptr inbounds %struct.map_cleanup_args, ptr %20, i32 0, i32 1, !dbg !3122
  %22 = load i32, ptr %21, align 8, !dbg !3122, !tbaa !1795
  %23 = call i32 @clean_map(i32 noundef %22, i64 noundef 48, i64 noundef 8, ptr noundef @packet_ts_timeout), !dbg !3123
  %24 = load ptr, ptr %3, align 8, !dbg !3124, !tbaa !741
  %25 = getelementptr inbounds %struct.map_cleanup_args, ptr %24, i32 0, i32 2, !dbg !3125
  %26 = load i32, ptr %25, align 4, !dbg !3125, !tbaa !1796
  %27 = call i32 @clean_map(i32 noundef %26, i64 noundef 44, i64 noundef 64, ptr noundef @flow_timeout), !dbg !3126
  %28 = call i32 @nanosleep(ptr noundef %4, ptr noundef null), !dbg !3127
  br label %16, !dbg !3118, !llvm.loop !3128

29:                                               ; preds = %16
  call void @pthread_exit(ptr noundef null) #16, !dbg !3130
  unreachable, !dbg !3130
}

; Function Attrs: nounwind
define internal i32 @clean_map(i32 noundef %0, i64 noundef %1, i64 noundef %2, ptr noundef %3) #0 !dbg !3131 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca ptr, align 8
  %14 = alloca i8, align 1
  %15 = alloca i64, align 8
  %16 = alloca i32, align 4
  %17 = alloca i64, align 8
  %18 = alloca i32, align 4
  store i32 %0, ptr %6, align 4, !tbaa !794
  call void @llvm.dbg.declare(metadata ptr %6, metadata !3138, metadata !DIExpression()), !dbg !3151
  store i64 %1, ptr %7, align 8, !tbaa !846
  call void @llvm.dbg.declare(metadata ptr %7, metadata !3139, metadata !DIExpression()), !dbg !3152
  store i64 %2, ptr %8, align 8, !tbaa !846
  call void @llvm.dbg.declare(metadata ptr %8, metadata !3140, metadata !DIExpression()), !dbg !3153
  store ptr %3, ptr %9, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %9, metadata !3141, metadata !DIExpression()), !dbg !3154
  call void @llvm.lifetime.start.p0(i64 4, ptr %10) #12, !dbg !3155
  call void @llvm.dbg.declare(metadata ptr %10, metadata !3142, metadata !DIExpression()), !dbg !3156
  store i32 0, ptr %10, align 4, !dbg !3156, !tbaa !794
  call void @llvm.lifetime.start.p0(i64 8, ptr %11) #12, !dbg !3157
  call void @llvm.dbg.declare(metadata ptr %11, metadata !3143, metadata !DIExpression()), !dbg !3158
  call void @llvm.lifetime.start.p0(i64 8, ptr %12) #12, !dbg !3157
  call void @llvm.dbg.declare(metadata ptr %12, metadata !3144, metadata !DIExpression()), !dbg !3159
  call void @llvm.lifetime.start.p0(i64 8, ptr %13) #12, !dbg !3157
  call void @llvm.dbg.declare(metadata ptr %13, metadata !3145, metadata !DIExpression()), !dbg !3160
  call void @llvm.lifetime.start.p0(i64 1, ptr %14) #12, !dbg !3161
  call void @llvm.dbg.declare(metadata ptr %14, metadata !3146, metadata !DIExpression()), !dbg !3162
  store i8 0, ptr %14, align 1, !dbg !3162, !tbaa !761
  call void @llvm.lifetime.start.p0(i64 8, ptr %15) #12, !dbg !3163
  call void @llvm.dbg.declare(metadata ptr %15, metadata !3147, metadata !DIExpression()), !dbg !3164
  %19 = call i64 @get_time_ns(i32 noundef 1), !dbg !3165
  store i64 %19, ptr %15, align 8, !dbg !3164, !tbaa !1562
  call void @llvm.lifetime.start.p0(i64 4, ptr %16) #12, !dbg !3166
  call void @llvm.dbg.declare(metadata ptr %16, metadata !3148, metadata !DIExpression()), !dbg !3167
  store i32 0, ptr %16, align 4, !dbg !3167, !tbaa !794
  call void @llvm.lifetime.start.p0(i64 8, ptr %17) #12, !dbg !3168
  call void @llvm.dbg.declare(metadata ptr %17, metadata !3149, metadata !DIExpression()), !dbg !3169
  %20 = load i64, ptr %15, align 8, !dbg !3170, !tbaa !1562
  %21 = icmp eq i64 %20, 0, !dbg !3172
  br i1 %21, label %22, label %26, !dbg !3173

22:                                               ; preds = %4
  %23 = call ptr @__errno_location() #14, !dbg !3174
  %24 = load i32, ptr %23, align 4, !dbg !3174, !tbaa !794
  %25 = sub nsw i32 0, %24, !dbg !3175
  store i32 %25, ptr %5, align 4, !dbg !3176
  store i32 1, ptr %18, align 4
  br label %104, !dbg !3176

26:                                               ; preds = %4
  %27 = load i64, ptr %7, align 8, !dbg !3177, !tbaa !846
  %28 = call noalias ptr @malloc(i64 noundef %27) #17, !dbg !3178
  store ptr %28, ptr %11, align 8, !dbg !3179, !tbaa !741
  %29 = load i64, ptr %7, align 8, !dbg !3180, !tbaa !846
  %30 = call noalias ptr @malloc(i64 noundef %29) #17, !dbg !3181
  store ptr %30, ptr %12, align 8, !dbg !3182, !tbaa !741
  %31 = load i64, ptr %8, align 8, !dbg !3183, !tbaa !846
  %32 = call noalias ptr @malloc(i64 noundef %31) #17, !dbg !3184
  store ptr %32, ptr %13, align 8, !dbg !3185, !tbaa !741
  %33 = load ptr, ptr %11, align 8, !dbg !3186, !tbaa !741
  %34 = icmp ne ptr %33, null, !dbg !3186
  br i1 %34, label %35, label %41, !dbg !3188

35:                                               ; preds = %26
  %36 = load ptr, ptr %12, align 8, !dbg !3189, !tbaa !741
  %37 = icmp ne ptr %36, null, !dbg !3189
  br i1 %37, label %38, label %41, !dbg !3190

38:                                               ; preds = %35
  %39 = load ptr, ptr %13, align 8, !dbg !3191, !tbaa !741
  %40 = icmp ne ptr %39, null, !dbg !3191
  br i1 %40, label %42, label %41, !dbg !3192

41:                                               ; preds = %38, %35, %26
  store i32 -12, ptr %10, align 4, !dbg !3193, !tbaa !794
  br label %99, !dbg !3195

42:                                               ; preds = %38
  br label %43, !dbg !3196

43:                                               ; preds = %71, %42
  %44 = load i32, ptr %6, align 4, !dbg !3197, !tbaa !794
  %45 = load ptr, ptr %12, align 8, !dbg !3198, !tbaa !741
  %46 = load ptr, ptr %11, align 8, !dbg !3199, !tbaa !741
  %47 = call i32 @bpf_map_get_next_key(i32 noundef %44, ptr noundef %45, ptr noundef %46), !dbg !3200
  %48 = icmp eq i32 %47, 0, !dbg !3201
  br i1 %48, label %49, label %77, !dbg !3196

49:                                               ; preds = %43
  %50 = load i8, ptr %14, align 1, !dbg !3202, !tbaa !761, !range !759, !noundef !760
  %51 = trunc i8 %50 to i1, !dbg !3202
  br i1 %51, label %52, label %58, !dbg !3205

52:                                               ; preds = %49
  %53 = load i32, ptr %6, align 4, !dbg !3206, !tbaa !794
  %54 = load ptr, ptr %12, align 8, !dbg !3208, !tbaa !741
  %55 = call i32 @bpf_map_delete_elem(i32 noundef %53, ptr noundef %54), !dbg !3209
  %56 = load i32, ptr %10, align 4, !dbg !3210, !tbaa !794
  %57 = add nsw i32 %56, 1, !dbg !3210
  store i32 %57, ptr %10, align 4, !dbg !3210, !tbaa !794
  store i8 0, ptr %14, align 1, !dbg !3211, !tbaa !761
  br label %58, !dbg !3212

58:                                               ; preds = %52, %49
  %59 = load i32, ptr %6, align 4, !dbg !3213, !tbaa !794
  %60 = load ptr, ptr %11, align 8, !dbg !3215, !tbaa !741
  %61 = load ptr, ptr %13, align 8, !dbg !3216, !tbaa !741
  %62 = call i32 @bpf_map_lookup_elem(i32 noundef %59, ptr noundef %60, ptr noundef %61), !dbg !3217
  %63 = icmp eq i32 %62, 0, !dbg !3218
  br i1 %63, label %64, label %71, !dbg !3219

64:                                               ; preds = %58
  %65 = load ptr, ptr %9, align 8, !dbg !3220, !tbaa !741
  %66 = load ptr, ptr %11, align 8, !dbg !3221, !tbaa !741
  %67 = load ptr, ptr %13, align 8, !dbg !3222, !tbaa !741
  %68 = load i64, ptr %15, align 8, !dbg !3223, !tbaa !1562
  %69 = call i1 %65(ptr noundef %66, ptr noundef %67, i64 noundef %68), !dbg !3220
  %70 = zext i1 %69 to i8, !dbg !3224
  store i8 %70, ptr %14, align 1, !dbg !3224, !tbaa !761
  br label %71, !dbg !3225

71:                                               ; preds = %64, %58
  %72 = load i32, ptr %16, align 4, !dbg !3226, !tbaa !794
  %73 = add nsw i32 %72, 1, !dbg !3226
  store i32 %73, ptr %16, align 4, !dbg !3226, !tbaa !794
  %74 = load ptr, ptr %12, align 8, !dbg !3227, !tbaa !741
  %75 = load ptr, ptr %11, align 8, !dbg !3228, !tbaa !741
  %76 = load i64, ptr %7, align 8, !dbg !3229, !tbaa !846
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %74, ptr align 1 %75, i64 %76, i1 false), !dbg !3230
  br label %43, !dbg !3196, !llvm.loop !3231

77:                                               ; preds = %43
  %78 = load i8, ptr %14, align 1, !dbg !3233, !tbaa !761, !range !759, !noundef !760
  %79 = trunc i8 %78 to i1, !dbg !3233
  br i1 %79, label %80, label %86, !dbg !3235

80:                                               ; preds = %77
  %81 = load i32, ptr %6, align 4, !dbg !3236, !tbaa !794
  %82 = load ptr, ptr %12, align 8, !dbg !3238, !tbaa !741
  %83 = call i32 @bpf_map_delete_elem(i32 noundef %81, ptr noundef %82), !dbg !3239
  %84 = load i32, ptr %10, align 4, !dbg !3240, !tbaa !794
  %85 = add nsw i32 %84, 1, !dbg !3240
  store i32 %85, ptr %10, align 4, !dbg !3240, !tbaa !794
  br label %86, !dbg !3241

86:                                               ; preds = %80, %77
  %87 = call i64 @get_time_ns(i32 noundef 1), !dbg !3242
  %88 = load i64, ptr %15, align 8, !dbg !3243, !tbaa !1562
  %89 = sub i64 %87, %88, !dbg !3244
  store i64 %89, ptr %17, align 8, !dbg !3245, !tbaa !1562
  %90 = load ptr, ptr @stderr, align 8, !dbg !3246, !tbaa !741
  %91 = load i32, ptr %6, align 4, !dbg !3247, !tbaa !794
  %92 = load i32, ptr %16, align 4, !dbg !3248, !tbaa !794
  %93 = load i32, ptr %10, align 4, !dbg !3249, !tbaa !794
  %94 = load i64, ptr %17, align 8, !dbg !3250, !tbaa !1562
  %95 = udiv i64 %94, 1000000000, !dbg !3251
  %96 = load i64, ptr %17, align 8, !dbg !3252, !tbaa !1562
  %97 = urem i64 %96, 1000000000, !dbg !3253
  %98 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %90, ptr noundef @.str.110, i32 noundef %91, i32 noundef %92, i32 noundef %93, i64 noundef %95, i64 noundef %97), !dbg !3254
  br label %99, !dbg !3254

99:                                               ; preds = %86, %41
  call void @llvm.dbg.label(metadata !3150), !dbg !3255
  %100 = load ptr, ptr %11, align 8, !dbg !3256, !tbaa !741
  call void @free(ptr noundef %100) #12, !dbg !3257
  %101 = load ptr, ptr %12, align 8, !dbg !3258, !tbaa !741
  call void @free(ptr noundef %101) #12, !dbg !3259
  %102 = load ptr, ptr %13, align 8, !dbg !3260, !tbaa !741
  call void @free(ptr noundef %102) #12, !dbg !3261
  %103 = load i32, ptr %10, align 4, !dbg !3262, !tbaa !794
  store i32 %103, ptr %5, align 4, !dbg !3263
  store i32 1, ptr %18, align 4
  br label %104, !dbg !3263

104:                                              ; preds = %99, %22
  call void @llvm.lifetime.end.p0(i64 8, ptr %17) #12, !dbg !3264
  call void @llvm.lifetime.end.p0(i64 4, ptr %16) #12, !dbg !3264
  call void @llvm.lifetime.end.p0(i64 8, ptr %15) #12, !dbg !3264
  call void @llvm.lifetime.end.p0(i64 1, ptr %14) #12, !dbg !3264
  call void @llvm.lifetime.end.p0(i64 8, ptr %13) #12, !dbg !3264
  call void @llvm.lifetime.end.p0(i64 8, ptr %12) #12, !dbg !3264
  call void @llvm.lifetime.end.p0(i64 8, ptr %11) #12, !dbg !3264
  call void @llvm.lifetime.end.p0(i64 4, ptr %10) #12, !dbg !3264
  %105 = load i32, ptr %5, align 4, !dbg !3264
  ret i32 %105, !dbg !3264
}

; Function Attrs: nounwind
define internal i1 @packet_ts_timeout(ptr noundef %0, ptr noundef %1, i64 noundef %2) #0 !dbg !3265 {
  %4 = alloca i1, align 1
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %5, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %5, metadata !3267, metadata !DIExpression()), !dbg !3271
  store ptr %1, ptr %6, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %6, metadata !3268, metadata !DIExpression()), !dbg !3272
  store i64 %2, ptr %7, align 8, !tbaa !1562
  call void @llvm.dbg.declare(metadata ptr %7, metadata !3269, metadata !DIExpression()), !dbg !3273
  call void @llvm.lifetime.start.p0(i64 8, ptr %8) #12, !dbg !3274
  call void @llvm.dbg.declare(metadata ptr %8, metadata !3270, metadata !DIExpression()), !dbg !3275
  %10 = load ptr, ptr %6, align 8, !dbg !3276, !tbaa !741
  %11 = load i64, ptr %10, align 8, !dbg !3277, !tbaa !1562
  store i64 %11, ptr %8, align 8, !dbg !3275, !tbaa !1562
  %12 = load i64, ptr %7, align 8, !dbg !3278, !tbaa !1562
  %13 = load i64, ptr %8, align 8, !dbg !3280, !tbaa !1562
  %14 = icmp ugt i64 %12, %13, !dbg !3281
  br i1 %14, label %15, label %21, !dbg !3282

15:                                               ; preds = %3
  %16 = load i64, ptr %7, align 8, !dbg !3283, !tbaa !1562
  %17 = load i64, ptr %8, align 8, !dbg !3284, !tbaa !1562
  %18 = sub i64 %16, %17, !dbg !3285
  %19 = icmp ugt i64 %18, 10000000000, !dbg !3286
  br i1 %19, label %20, label %21, !dbg !3287

20:                                               ; preds = %15
  store i1 true, ptr %4, align 1, !dbg !3288
  store i32 1, ptr %9, align 4
  br label %22, !dbg !3288

21:                                               ; preds = %15, %3
  store i1 false, ptr %4, align 1, !dbg !3289
  store i32 1, ptr %9, align 4
  br label %22, !dbg !3289

22:                                               ; preds = %21, %20
  call void @llvm.lifetime.end.p0(i64 8, ptr %8) #12, !dbg !3290
  %23 = load i1, ptr %4, align 1, !dbg !3290
  ret i1 %23, !dbg !3290
}

; Function Attrs: nounwind
define internal i1 @flow_timeout(ptr noundef %0, ptr noundef %1, i64 noundef %2) #0 !dbg !3291 {
  %4 = alloca i1, align 1
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca %struct.flow_event, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %5, metadata !3293, metadata !DIExpression()), !dbg !3312
  store ptr %1, ptr %6, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %6, metadata !3294, metadata !DIExpression()), !dbg !3313
  store i64 %2, ptr %7, align 8, !tbaa !1562
  call void @llvm.dbg.declare(metadata ptr %7, metadata !3295, metadata !DIExpression()), !dbg !3314
  call void @llvm.lifetime.start.p0(i64 64, ptr %8) #12, !dbg !3315
  call void @llvm.dbg.declare(metadata ptr %8, metadata !3296, metadata !DIExpression()), !dbg !3316
  call void @llvm.lifetime.start.p0(i64 8, ptr %9) #12, !dbg !3317
  call void @llvm.dbg.declare(metadata ptr %9, metadata !3297, metadata !DIExpression()), !dbg !3318
  %11 = load ptr, ptr %6, align 8, !dbg !3319, !tbaa !741
  store ptr %11, ptr %9, align 8, !dbg !3318, !tbaa !741
  %12 = load i64, ptr %7, align 8, !dbg !3320, !tbaa !1562
  %13 = load ptr, ptr %9, align 8, !dbg !3322, !tbaa !741
  %14 = getelementptr inbounds %struct.flow_state, ptr %13, i32 0, i32 2, !dbg !3323
  %15 = load i64, ptr %14, align 8, !dbg !3323, !tbaa !3324
  %16 = icmp ugt i64 %12, %15, !dbg !3326
  br i1 %16, label %17, label %43, !dbg !3327

17:                                               ; preds = %3
  %18 = load i64, ptr %7, align 8, !dbg !3328, !tbaa !1562
  %19 = load ptr, ptr %9, align 8, !dbg !3329, !tbaa !741
  %20 = getelementptr inbounds %struct.flow_state, ptr %19, i32 0, i32 2, !dbg !3330
  %21 = load i64, ptr %20, align 8, !dbg !3330, !tbaa !3324
  %22 = sub i64 %18, %21, !dbg !3331
  %23 = icmp ugt i64 %22, 300000000000, !dbg !3332
  br i1 %23, label %24, label %43, !dbg !3333

24:                                               ; preds = %17
  %25 = load ptr, ptr @print_event_func, align 8, !dbg !3334, !tbaa !741
  %26 = icmp ne ptr %25, null, !dbg !3334
  br i1 %26, label %27, label %42, !dbg !3337

27:                                               ; preds = %24
  %28 = load ptr, ptr %9, align 8, !dbg !3338, !tbaa !741
  %29 = getelementptr inbounds %struct.flow_state, ptr %28, i32 0, i32 8, !dbg !3339
  %30 = load i8, ptr %29, align 4, !dbg !3339, !tbaa !3340, !range !759, !noundef !760
  %31 = trunc i8 %30 to i1, !dbg !3339
  br i1 %31, label %32, label %42, !dbg !3341

32:                                               ; preds = %27
  %33 = getelementptr inbounds %struct.flow_event, ptr %8, i32 0, i32 0, !dbg !3342
  store i64 1, ptr %33, align 8, !dbg !3344, !tbaa !3345
  %34 = load i64, ptr %7, align 8, !dbg !3346, !tbaa !1562
  %35 = getelementptr inbounds %struct.flow_event, ptr %8, i32 0, i32 1, !dbg !3347
  store i64 %34, ptr %35, align 8, !dbg !3348, !tbaa !3349
  %36 = getelementptr inbounds %struct.flow_event, ptr %8, i32 0, i32 2, !dbg !3350
  %37 = load ptr, ptr %5, align 8, !dbg !3351, !tbaa !741
  call void @reverse_flow(ptr noundef %36, ptr noundef %37), !dbg !3352
  %38 = getelementptr inbounds %struct.flow_event, ptr %8, i32 0, i32 3, !dbg !3353
  store i8 2, ptr %38, align 4, !dbg !3354, !tbaa !2675
  %39 = getelementptr inbounds %struct.flow_event, ptr %8, i32 0, i32 4, !dbg !3355
  store i8 5, ptr %39, align 1, !dbg !3356, !tbaa !2682
  %40 = getelementptr inbounds %struct.flow_event, ptr %8, i32 0, i32 5, !dbg !3357
  store i8 2, ptr %40, align 2, !dbg !3358, !tbaa !2688
  %41 = load ptr, ptr @print_event_func, align 8, !dbg !3359, !tbaa !741
  call void %41(ptr noundef %8), !dbg !3359
  br label %42, !dbg !3360

42:                                               ; preds = %32, %27, %24
  store i1 true, ptr %4, align 1, !dbg !3361
  store i32 1, ptr %10, align 4
  br label %44, !dbg !3361

43:                                               ; preds = %17, %3
  store i1 false, ptr %4, align 1, !dbg !3362
  store i32 1, ptr %10, align 4
  br label %44, !dbg !3362

44:                                               ; preds = %43, %42
  call void @llvm.lifetime.end.p0(i64 8, ptr %9) #12, !dbg !3363
  call void @llvm.lifetime.end.p0(i64 64, ptr %8) #12, !dbg !3363
  %45 = load i1, ptr %4, align 1, !dbg !3363
  ret i1 %45, !dbg !3363
}

declare !dbg !3364 dso_local i32 @nanosleep(ptr noundef, ptr noundef) #5

; Function Attrs: noreturn
declare !dbg !3372 dso_local void @pthread_exit(ptr noundef) #10

; Function Attrs: nounwind allocsize(0)
declare !dbg !3377 dso_local noalias ptr @malloc(i64 noundef) #11

declare !dbg !3382 dso_local i32 @bpf_map_get_next_key(i32 noundef, ptr noundef, ptr noundef) #5

declare !dbg !3390 dso_local i32 @bpf_map_delete_elem(i32 noundef, ptr noundef) #5

declare !dbg !3396 dso_local i32 @bpf_map_lookup_elem(i32 noundef, ptr noundef, ptr noundef) #5

; Function Attrs: nounwind
declare !dbg !3401 dso_local void @free(ptr noundef) #0

; Function Attrs: nounwind
define internal void @reverse_flow(ptr noundef %0, ptr noundef %1) #0 !dbg !3404 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %3, metadata !3409, metadata !DIExpression()), !dbg !3411
  store ptr %1, ptr %4, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %4, metadata !3410, metadata !DIExpression()), !dbg !3412
  %5 = load ptr, ptr %4, align 8, !dbg !3413, !tbaa !741
  %6 = getelementptr inbounds %struct.network_tuple, ptr %5, i32 0, i32 3, !dbg !3414
  %7 = load i8, ptr %6, align 2, !dbg !3414, !tbaa !2298
  %8 = load ptr, ptr %3, align 8, !dbg !3415, !tbaa !741
  %9 = getelementptr inbounds %struct.network_tuple, ptr %8, i32 0, i32 3, !dbg !3416
  store i8 %7, ptr %9, align 2, !dbg !3417, !tbaa !2298
  %10 = load ptr, ptr %4, align 8, !dbg !3418, !tbaa !741
  %11 = getelementptr inbounds %struct.network_tuple, ptr %10, i32 0, i32 2, !dbg !3419
  %12 = load i16, ptr %11, align 4, !dbg !3419, !tbaa !2616
  %13 = load ptr, ptr %3, align 8, !dbg !3420, !tbaa !741
  %14 = getelementptr inbounds %struct.network_tuple, ptr %13, i32 0, i32 2, !dbg !3421
  store i16 %12, ptr %14, align 4, !dbg !3422, !tbaa !2616
  %15 = load ptr, ptr %3, align 8, !dbg !3423, !tbaa !741
  %16 = getelementptr inbounds %struct.network_tuple, ptr %15, i32 0, i32 0, !dbg !3424
  %17 = load ptr, ptr %4, align 8, !dbg !3425, !tbaa !741
  %18 = getelementptr inbounds %struct.network_tuple, ptr %17, i32 0, i32 1, !dbg !3426
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %16, ptr align 4 %18, i64 20, i1 false), !dbg !3426, !tbaa.struct !3427
  %19 = load ptr, ptr %3, align 8, !dbg !3428, !tbaa !741
  %20 = getelementptr inbounds %struct.network_tuple, ptr %19, i32 0, i32 1, !dbg !3429
  %21 = load ptr, ptr %4, align 8, !dbg !3430, !tbaa !741
  %22 = getelementptr inbounds %struct.network_tuple, ptr %21, i32 0, i32 0, !dbg !3431
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %20, ptr align 4 %22, i64 20, i1 false), !dbg !3431, !tbaa.struct !3427
  %23 = load ptr, ptr %3, align 8, !dbg !3432, !tbaa !741
  %24 = getelementptr inbounds %struct.network_tuple, ptr %23, i32 0, i32 4, !dbg !3433
  store i8 0, ptr %24, align 1, !dbg !3434, !tbaa !3435
  ret void, !dbg !3436
}

; Function Attrs: nounwind
define internal void @warn_map_full(ptr noundef %0) #0 !dbg !3437 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !741
  call void @llvm.dbg.declare(metadata ptr %2, metadata !3443, metadata !DIExpression()), !dbg !3444
  %3 = load ptr, ptr @stderr, align 8, !dbg !3445, !tbaa !741
  %4 = load ptr, ptr %2, align 8, !dbg !3446, !tbaa !741
  %5 = getelementptr inbounds %struct.map_full_event, ptr %4, i32 0, i32 1, !dbg !3447
  %6 = load i64, ptr %5, align 8, !dbg !3447, !tbaa !3448
  call void @print_ns_datetime(ptr noundef %3, i64 noundef %6), !dbg !3450
  %7 = load ptr, ptr @stderr, align 8, !dbg !3451, !tbaa !741
  %8 = load ptr, ptr %2, align 8, !dbg !3452, !tbaa !741
  %9 = getelementptr inbounds %struct.map_full_event, ptr %8, i32 0, i32 3, !dbg !3453
  %10 = load i8, ptr %9, align 4, !dbg !3453, !tbaa !3454
  %11 = zext i8 %10 to i32, !dbg !3452
  %12 = icmp eq i32 %11, 0, !dbg !3455
  %13 = zext i1 %12 to i64, !dbg !3452
  %14 = select i1 %12, ptr @.str.113, ptr @.str.81, !dbg !3452
  %15 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %7, ptr noundef @.str.112, ptr noundef %14), !dbg !3456
  %16 = load ptr, ptr @stderr, align 8, !dbg !3457, !tbaa !741
  %17 = load ptr, ptr %2, align 8, !dbg !3458, !tbaa !741
  %18 = getelementptr inbounds %struct.map_full_event, ptr %17, i32 0, i32 2, !dbg !3459
  call void @print_flow_ppvizformat(ptr noundef %16, ptr noundef %18), !dbg !3460
  %19 = load ptr, ptr @stderr, align 8, !dbg !3461, !tbaa !741
  %20 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %19, ptr noundef @.str.53), !dbg !3462
  ret void, !dbg !3463
}

declare !dbg !3464 dso_local i32 @bpf_tc_query(ptr noundef, ptr noundef) #5

declare !dbg !3468 dso_local i32 @bpf_tc_detach(ptr noundef, ptr noundef) #5

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #6 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #7 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #8 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #9 = { inlinehint nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #10 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #11 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #12 = { nounwind }
attributes #13 = { nounwind willreturn memory(read) }
attributes #14 = { nounwind willreturn memory(none) }
attributes #15 = { noreturn nounwind }
attributes #16 = { noreturn }
attributes #17 = { nounwind allocsize(0) }

!llvm.dbg.cu = !{!36}
!llvm.module.flags = !{!691, !692, !693, !694}
!llvm.ident = !{!695}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 295, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "pping.c", directory: "/home/demo/bpf-examples/pping", checksumkind: CSK_MD5, checksum: "8717fc9554e88b2dcc3637177a155cad")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 80, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 10)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 295, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 32, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 4)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 295, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 40, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 5)
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(scope: null, file: !2, line: 301, type: !19, isLocal: true, isDefinition: true)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 72, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 9)
!22 = !DIGlobalVariableExpression(var: !23, expr: !DIExpression())
!23 = distinct !DIGlobalVariable(scope: null, file: !2, line: 302, type: !14, isLocal: true, isDefinition: true)
!24 = !DIGlobalVariableExpression(var: !25, expr: !DIExpression())
!25 = distinct !DIGlobalVariable(scope: null, file: !2, line: 303, type: !26, isLocal: true, isDefinition: true)
!26 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 48, elements: !27)
!27 = !{!28}
!28 = !DISubrange(count: 6)
!29 = !DIGlobalVariableExpression(var: !30, expr: !DIExpression())
!30 = distinct !DIGlobalVariable(scope: null, file: !2, line: 304, type: !31, isLocal: true, isDefinition: true)
!31 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 112, elements: !32)
!32 = !{!33}
!33 = !DISubrange(count: 14)
!34 = !DIGlobalVariableExpression(var: !35, expr: !DIExpression())
!35 = distinct !DIGlobalVariable(name: "keep_running", scope: !36, file: !2, line: 92, type: !690, isLocal: true, isDefinition: true)
!36 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "clang version 16.0.0", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !37, retainedTypes: !137, globals: !229, splitDebugInlining: false, nameTableKind: None)
!37 = !{!38, !44, !52, !60, !65, !69, !75, !97, !128}
!38 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "PPING_OUTPUT_FORMAT", file: !2, line: 44, baseType: !39, size: 32, elements: !40)
!39 = !DIBasicType(name: "unsigned int", size: 32, encoding: DW_ATE_unsigned)
!40 = !{!41, !42, !43}
!41 = !DIEnumerator(name: "PPING_OUTPUT_STANDARD", value: 0)
!42 = !DIEnumerator(name: "PPING_OUTPUT_JSON", value: 1)
!43 = !DIEnumerator(name: "PPING_OUTPUT_PPVIZ", value: 2)
!44 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "flow_event_type", file: !45, line: 19, baseType: !46, size: 8, elements: !47)
!45 = !DIFile(filename: "./pping.h", directory: "/home/demo/bpf-examples/pping", checksumkind: CSK_MD5, checksum: "6a861e6a346893fa17ab178d912b413e")
!46 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!47 = !{!48, !49, !50, !51}
!48 = !DIEnumerator(name: "FLOW_EVENT_NONE", value: 0)
!49 = !DIEnumerator(name: "FLOW_EVENT_OPENING", value: 1)
!50 = !DIEnumerator(name: "FLOW_EVENT_CLOSING", value: 2)
!51 = !DIEnumerator(name: "FLOW_EVENT_CLOSING_BOTH", value: 3)
!52 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "flow_event_reason", file: !45, line: 26, baseType: !46, size: 8, elements: !53)
!53 = !{!54, !55, !56, !57, !58, !59}
!54 = !DIEnumerator(name: "EVENT_REASON_SYN", value: 0)
!55 = !DIEnumerator(name: "EVENT_REASON_SYN_ACK", value: 1)
!56 = !DIEnumerator(name: "EVENT_REASON_FIRST_OBS_PCKT", value: 2)
!57 = !DIEnumerator(name: "EVENT_REASON_FIN", value: 3)
!58 = !DIEnumerator(name: "EVENT_REASON_RST", value: 4)
!59 = !DIEnumerator(name: "EVENT_REASON_FLOW_TIMEOUT", value: 5)
!60 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "flow_event_source", file: !45, line: 35, baseType: !46, size: 8, elements: !61)
!61 = !{!62, !63, !64}
!62 = !DIEnumerator(name: "EVENT_SOURCE_PKT_SRC", value: 0)
!63 = !DIEnumerator(name: "EVENT_SOURCE_PKT_DEST", value: 1)
!64 = !DIEnumerator(name: "EVENT_SOURCE_USERSPACE", value: 2)
!65 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "pping_map", file: !45, line: 41, baseType: !46, size: 8, elements: !66)
!66 = !{!67, !68}
!67 = !DIEnumerator(name: "PPING_MAP_FLOWSTATE", value: 0)
!68 = !DIEnumerator(name: "PPING_MAP_PACKETTS", value: 1)
!69 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "bpf_tc_attach_point", file: !70, line: 844, baseType: !39, size: 32, elements: !71)
!70 = !DIFile(filename: "../lib/libbpf-install/usr/include/bpf/libbpf.h", directory: "/home/demo/bpf-examples/pping", checksumkind: CSK_MD5, checksum: "905e04328ccab93b1e224aed068a34ef")
!71 = !{!72, !73, !74}
!72 = !DIEnumerator(name: "BPF_TC_INGRESS", value: 1)
!73 = !DIEnumerator(name: "BPF_TC_EGRESS", value: 2)
!74 = !DIEnumerator(name: "BPF_TC_CUSTOM", value: 4)
!75 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "__rlimit_resource", file: !76, line: 31, baseType: !39, size: 32, elements: !77)
!76 = !DIFile(filename: "/usr/include/bits/resource.h", directory: "", checksumkind: CSK_MD5, checksum: "bb0bdc9e7ae341ef435e98e05276a863")
!77 = !{!78, !79, !80, !81, !82, !83, !84, !85, !86, !87, !88, !89, !90, !91, !92, !93, !94, !95, !96}
!78 = !DIEnumerator(name: "RLIMIT_CPU", value: 0)
!79 = !DIEnumerator(name: "RLIMIT_FSIZE", value: 1)
!80 = !DIEnumerator(name: "RLIMIT_DATA", value: 2)
!81 = !DIEnumerator(name: "RLIMIT_STACK", value: 3)
!82 = !DIEnumerator(name: "RLIMIT_CORE", value: 4)
!83 = !DIEnumerator(name: "__RLIMIT_RSS", value: 5)
!84 = !DIEnumerator(name: "RLIMIT_NOFILE", value: 7)
!85 = !DIEnumerator(name: "__RLIMIT_OFILE", value: 7)
!86 = !DIEnumerator(name: "RLIMIT_AS", value: 9)
!87 = !DIEnumerator(name: "__RLIMIT_NPROC", value: 6)
!88 = !DIEnumerator(name: "__RLIMIT_MEMLOCK", value: 8)
!89 = !DIEnumerator(name: "__RLIMIT_LOCKS", value: 10)
!90 = !DIEnumerator(name: "__RLIMIT_SIGPENDING", value: 11)
!91 = !DIEnumerator(name: "__RLIMIT_MSGQUEUE", value: 12)
!92 = !DIEnumerator(name: "__RLIMIT_NICE", value: 13)
!93 = !DIEnumerator(name: "__RLIMIT_RTPRIO", value: 14)
!94 = !DIEnumerator(name: "__RLIMIT_RTTIME", value: 15)
!95 = !DIEnumerator(name: "__RLIMIT_NLIMITS", value: 16)
!96 = !DIEnumerator(name: "__RLIM_NLIMITS", value: 16)
!97 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !98, line: 40, baseType: !39, size: 32, elements: !99)
!98 = !DIFile(filename: "/usr/include/netinet/in.h", directory: "", checksumkind: CSK_MD5, checksum: "eb6560f10d4cfe9f30fea2c92b9da0fd")
!99 = !{!100, !101, !102, !103, !104, !105, !106, !107, !108, !109, !110, !111, !112, !113, !114, !115, !116, !117, !118, !119, !120, !121, !122, !123, !124, !125, !126, !127}
!100 = !DIEnumerator(name: "IPPROTO_IP", value: 0)
!101 = !DIEnumerator(name: "IPPROTO_ICMP", value: 1)
!102 = !DIEnumerator(name: "IPPROTO_IGMP", value: 2)
!103 = !DIEnumerator(name: "IPPROTO_IPIP", value: 4)
!104 = !DIEnumerator(name: "IPPROTO_TCP", value: 6)
!105 = !DIEnumerator(name: "IPPROTO_EGP", value: 8)
!106 = !DIEnumerator(name: "IPPROTO_PUP", value: 12)
!107 = !DIEnumerator(name: "IPPROTO_UDP", value: 17)
!108 = !DIEnumerator(name: "IPPROTO_IDP", value: 22)
!109 = !DIEnumerator(name: "IPPROTO_TP", value: 29)
!110 = !DIEnumerator(name: "IPPROTO_DCCP", value: 33)
!111 = !DIEnumerator(name: "IPPROTO_IPV6", value: 41)
!112 = !DIEnumerator(name: "IPPROTO_RSVP", value: 46)
!113 = !DIEnumerator(name: "IPPROTO_GRE", value: 47)
!114 = !DIEnumerator(name: "IPPROTO_ESP", value: 50)
!115 = !DIEnumerator(name: "IPPROTO_AH", value: 51)
!116 = !DIEnumerator(name: "IPPROTO_MTP", value: 92)
!117 = !DIEnumerator(name: "IPPROTO_BEETPH", value: 94)
!118 = !DIEnumerator(name: "IPPROTO_ENCAP", value: 98)
!119 = !DIEnumerator(name: "IPPROTO_PIM", value: 103)
!120 = !DIEnumerator(name: "IPPROTO_COMP", value: 108)
!121 = !DIEnumerator(name: "IPPROTO_SCTP", value: 132)
!122 = !DIEnumerator(name: "IPPROTO_UDPLITE", value: 136)
!123 = !DIEnumerator(name: "IPPROTO_MPLS", value: 137)
!124 = !DIEnumerator(name: "IPPROTO_ETHERNET", value: 143)
!125 = !DIEnumerator(name: "IPPROTO_RAW", value: 255)
!126 = !DIEnumerator(name: "IPPROTO_MPTCP", value: 262)
!127 = !DIEnumerator(name: "IPPROTO_MAX", value: 263)
!128 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !98, line: 103, baseType: !39, size: 32, elements: !129)
!129 = !{!130, !131, !132, !133, !134, !135, !136}
!130 = !DIEnumerator(name: "IPPROTO_HOPOPTS", value: 0)
!131 = !DIEnumerator(name: "IPPROTO_ROUTING", value: 43)
!132 = !DIEnumerator(name: "IPPROTO_FRAGMENT", value: 44)
!133 = !DIEnumerator(name: "IPPROTO_ICMPV6", value: 58)
!134 = !DIEnumerator(name: "IPPROTO_NONE", value: 59)
!135 = !DIEnumerator(name: "IPPROTO_DSTOPTS", value: 60)
!136 = !DIEnumerator(name: "IPPROTO_MH", value: 135)
!137 = !{!138, !141, !142, !143, !146, !148, !149}
!138 = !DIDerivedType(tag: DW_TAG_typedef, name: "__rlim_t", file: !139, line: 157, baseType: !140)
!139 = !DIFile(filename: "/usr/include/bits/types.h", directory: "", checksumkind: CSK_MD5, checksum: "d108b5f93a74c50510d7d9bc0ab36df9")
!140 = !DIBasicType(name: "unsigned long", size: 64, encoding: DW_ATE_unsigned)
!141 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!142 = !DIDerivedType(tag: DW_TAG_typedef, name: "fixpoint64", file: !45, line: 9, baseType: !143)
!143 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u64", file: !144, line: 31, baseType: !145)
!144 = !DIFile(filename: "/usr/include/asm-generic/int-ll64.h", directory: "", checksumkind: CSK_MD5, checksum: "b810f270733e106319b67ef512c6246e")
!145 = !DIBasicType(name: "unsigned long long", size: 64, encoding: DW_ATE_unsigned)
!146 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint16_t", file: !139, line: 40, baseType: !147)
!147 = !DIBasicType(name: "unsigned short", size: 16, encoding: DW_ATE_unsigned)
!148 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !143, size: 64)
!149 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !150, size: 64)
!150 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "pping_event", file: !45, line: 154, size: 960, elements: !151)
!151 = !{!152, !153, !208, !218}
!152 = !DIDerivedType(tag: DW_TAG_member, name: "event_type", scope: !150, file: !45, line: 155, baseType: !143, size: 64)
!153 = !DIDerivedType(tag: DW_TAG_member, name: "rtt_event", scope: !150, file: !45, line: 156, baseType: !154, size: 960)
!154 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rtt_event", file: !45, line: 114, size: 960, elements: !155)
!155 = !{!156, !157, !158, !194, !196, !197, !198, !199, !200, !201, !202, !204}
!156 = !DIDerivedType(tag: DW_TAG_member, name: "event_type", scope: !154, file: !45, line: 115, baseType: !143, size: 64)
!157 = !DIDerivedType(tag: DW_TAG_member, name: "timestamp", scope: !154, file: !45, line: 116, baseType: !143, size: 64, offset: 64)
!158 = !DIDerivedType(tag: DW_TAG_member, name: "flow", scope: !154, file: !45, line: 117, baseType: !159, size: 352, offset: 128)
!159 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "network_tuple", file: !45, line: 74, size: 352, elements: !160)
!160 = !{!161, !189, !190, !191, !193}
!161 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !159, file: !45, line: 75, baseType: !162, size: 160)
!162 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "flow_address", file: !45, line: 61, size: 160, elements: !163)
!163 = !{!164, !186, !188}
!164 = !DIDerivedType(tag: DW_TAG_member, name: "ip", scope: !162, file: !45, line: 62, baseType: !165, size: 128)
!165 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !98, line: 219, size: 128, elements: !166)
!166 = !{!167}
!167 = !DIDerivedType(tag: DW_TAG_member, name: "__in6_u", scope: !165, file: !98, line: 226, baseType: !168, size: 128)
!168 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !165, file: !98, line: 221, size: 128, elements: !169)
!169 = !{!170, !177, !182}
!170 = !DIDerivedType(tag: DW_TAG_member, name: "__u6_addr8", scope: !168, file: !98, line: 223, baseType: !171, size: 128)
!171 = !DICompositeType(tag: DW_TAG_array_type, baseType: !172, size: 128, elements: !175)
!172 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint8_t", file: !173, line: 24, baseType: !174)
!173 = !DIFile(filename: "/usr/include/bits/stdint-uintn.h", directory: "", checksumkind: CSK_MD5, checksum: "2bf2ae53c58c01b1a1b9383b5195125c")
!174 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint8_t", file: !139, line: 38, baseType: !46)
!175 = !{!176}
!176 = !DISubrange(count: 16)
!177 = !DIDerivedType(tag: DW_TAG_member, name: "__u6_addr16", scope: !168, file: !98, line: 224, baseType: !178, size: 128)
!178 = !DICompositeType(tag: DW_TAG_array_type, baseType: !179, size: 128, elements: !180)
!179 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint16_t", file: !173, line: 25, baseType: !146)
!180 = !{!181}
!181 = !DISubrange(count: 8)
!182 = !DIDerivedType(tag: DW_TAG_member, name: "__u6_addr32", scope: !168, file: !98, line: 225, baseType: !183, size: 128)
!183 = !DICompositeType(tag: DW_TAG_array_type, baseType: !184, size: 128, elements: !10)
!184 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint32_t", file: !173, line: 26, baseType: !185)
!185 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint32_t", file: !139, line: 42, baseType: !39)
!186 = !DIDerivedType(tag: DW_TAG_member, name: "port", scope: !162, file: !45, line: 63, baseType: !187, size: 16, offset: 128)
!187 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u16", file: !144, line: 24, baseType: !147)
!188 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !162, file: !45, line: 64, baseType: !187, size: 16, offset: 144)
!189 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !159, file: !45, line: 76, baseType: !162, size: 160, offset: 160)
!190 = !DIDerivedType(tag: DW_TAG_member, name: "proto", scope: !159, file: !45, line: 77, baseType: !187, size: 16, offset: 320)
!191 = !DIDerivedType(tag: DW_TAG_member, name: "ipv", scope: !159, file: !45, line: 78, baseType: !192, size: 8, offset: 336)
!192 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u8", file: !144, line: 21, baseType: !46)
!193 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !159, file: !45, line: 79, baseType: !192, size: 8, offset: 344)
!194 = !DIDerivedType(tag: DW_TAG_member, name: "padding", scope: !154, file: !45, line: 118, baseType: !195, size: 32, offset: 480)
!195 = !DIDerivedType(tag: DW_TAG_typedef, name: "__u32", file: !144, line: 27, baseType: !39)
!196 = !DIDerivedType(tag: DW_TAG_member, name: "rtt", scope: !154, file: !45, line: 119, baseType: !143, size: 64, offset: 512)
!197 = !DIDerivedType(tag: DW_TAG_member, name: "min_rtt", scope: !154, file: !45, line: 120, baseType: !143, size: 64, offset: 576)
!198 = !DIDerivedType(tag: DW_TAG_member, name: "sent_pkts", scope: !154, file: !45, line: 121, baseType: !143, size: 64, offset: 640)
!199 = !DIDerivedType(tag: DW_TAG_member, name: "sent_bytes", scope: !154, file: !45, line: 122, baseType: !143, size: 64, offset: 704)
!200 = !DIDerivedType(tag: DW_TAG_member, name: "rec_pkts", scope: !154, file: !45, line: 123, baseType: !143, size: 64, offset: 768)
!201 = !DIDerivedType(tag: DW_TAG_member, name: "rec_bytes", scope: !154, file: !45, line: 124, baseType: !143, size: 64, offset: 832)
!202 = !DIDerivedType(tag: DW_TAG_member, name: "match_on_egress", scope: !154, file: !45, line: 125, baseType: !203, size: 8, offset: 896)
!203 = !DIBasicType(name: "_Bool", size: 8, encoding: DW_ATE_boolean)
!204 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !154, file: !45, line: 126, baseType: !205, size: 56, offset: 904)
!205 = !DICompositeType(tag: DW_TAG_array_type, baseType: !192, size: 56, elements: !206)
!206 = !{!207}
!207 = !DISubrange(count: 7)
!208 = !DIDerivedType(tag: DW_TAG_member, name: "flow_event", scope: !150, file: !45, line: 157, baseType: !209, size: 512)
!209 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "flow_event", file: !45, line: 132, size: 512, elements: !210)
!210 = !{!211, !212, !213, !214, !215, !216, !217}
!211 = !DIDerivedType(tag: DW_TAG_member, name: "event_type", scope: !209, file: !45, line: 133, baseType: !143, size: 64)
!212 = !DIDerivedType(tag: DW_TAG_member, name: "timestamp", scope: !209, file: !45, line: 134, baseType: !143, size: 64, offset: 64)
!213 = !DIDerivedType(tag: DW_TAG_member, name: "flow", scope: !209, file: !45, line: 135, baseType: !159, size: 352, offset: 128)
!214 = !DIDerivedType(tag: DW_TAG_member, name: "flow_event_type", scope: !209, file: !45, line: 136, baseType: !44, size: 8, offset: 480)
!215 = !DIDerivedType(tag: DW_TAG_member, name: "reason", scope: !209, file: !45, line: 137, baseType: !52, size: 8, offset: 488)
!216 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !209, file: !45, line: 138, baseType: !60, size: 8, offset: 496)
!217 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !209, file: !45, line: 139, baseType: !192, size: 8, offset: 504)
!218 = !DIDerivedType(tag: DW_TAG_member, name: "map_event", scope: !150, file: !45, line: 158, baseType: !219, size: 512)
!219 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "map_full_event", file: !45, line: 146, size: 512, elements: !220)
!220 = !{!221, !222, !223, !224, !225}
!221 = !DIDerivedType(tag: DW_TAG_member, name: "event_type", scope: !219, file: !45, line: 147, baseType: !143, size: 64)
!222 = !DIDerivedType(tag: DW_TAG_member, name: "timestamp", scope: !219, file: !45, line: 148, baseType: !143, size: 64, offset: 64)
!223 = !DIDerivedType(tag: DW_TAG_member, name: "flow", scope: !219, file: !45, line: 149, baseType: !159, size: 352, offset: 128)
!224 = !DIDerivedType(tag: DW_TAG_member, name: "map", scope: !219, file: !45, line: 150, baseType: !65, size: 8, offset: 480)
!225 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !219, file: !45, line: 151, baseType: !226, size: 24, offset: 488)
!226 = !DICompositeType(tag: DW_TAG_array_type, baseType: !192, size: 24, elements: !227)
!227 = !{!228}
!228 = !DISubrange(count: 3)
!229 = !{!0, !7, !12, !17, !22, !24, !29, !230, !235, !240, !243, !245, !250, !253, !258, !263, !268, !273, !278, !283, !288, !290, !292, !297, !302, !365, !367, !369, !372, !34, !374, !386, !388, !393, !398, !400, !402, !404, !406, !408, !413, !415, !417, !420, !422, !424, !426, !431, !436, !438, !440, !442, !444, !446, !448, !450, !452, !454, !466, !471, !476, !478, !483, !488, !490, !492, !497, !499, !504, !506, !508, !510, !515, !517, !519, !528, !530, !538, !540, !542, !547, !549, !551, !553, !555, !557, !559, !564, !566, !568, !570, !572, !574, !576, !583, !585, !587, !589, !591, !593, !595, !597, !599, !601, !603, !605, !607, !609, !611, !613, !615, !620, !622, !627, !632, !637, !642, !644, !646, !651, !653, !655, !660, !665, !670, !675, !677, !679, !684}
!230 = !DIGlobalVariableExpression(var: !231, expr: !DIExpression())
!231 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1033, type: !232, isLocal: true, isDefinition: true)
!232 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 104, elements: !233)
!233 = !{!234}
!234 = !DISubrange(count: 13)
!235 = !DIGlobalVariableExpression(var: !236, expr: !DIExpression())
!236 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1034, type: !237, isLocal: true, isDefinition: true)
!237 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 144, elements: !238)
!238 = !{!239}
!239 = !DISubrange(count: 18)
!240 = !DIGlobalVariableExpression(var: !241, expr: !DIExpression())
!241 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1035, type: !242, isLocal: true, isDefinition: true)
!242 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 128, elements: !175)
!243 = !DIGlobalVariableExpression(var: !244, expr: !DIExpression())
!244 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1036, type: !3, isLocal: true, isDefinition: true)
!245 = !DIGlobalVariableExpression(var: !246, expr: !DIExpression())
!246 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1037, type: !247, isLocal: true, isDefinition: true)
!247 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 88, elements: !248)
!248 = !{!249}
!249 = !DISubrange(count: 11)
!250 = !DIGlobalVariableExpression(var: !251, expr: !DIExpression())
!251 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1038, type: !252, isLocal: true, isDefinition: true)
!252 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 56, elements: !206)
!253 = !DIGlobalVariableExpression(var: !254, expr: !DIExpression())
!254 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1047, type: !255, isLocal: true, isDefinition: true)
!255 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 280, elements: !256)
!256 = !{!257}
!257 = !DISubrange(count: 35)
!258 = !DIGlobalVariableExpression(var: !259, expr: !DIExpression())
!259 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1054, type: !260, isLocal: true, isDefinition: true)
!260 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 304, elements: !261)
!261 = !{!262}
!262 = !DISubrange(count: 38)
!263 = !DIGlobalVariableExpression(var: !264, expr: !DIExpression())
!264 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1061, type: !265, isLocal: true, isDefinition: true)
!265 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 248, elements: !266)
!266 = !{!267}
!267 = !DISubrange(count: 31)
!268 = !DIGlobalVariableExpression(var: !269, expr: !DIExpression())
!269 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1073, type: !270, isLocal: true, isDefinition: true)
!270 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 776, elements: !271)
!271 = !{!272}
!272 = !DISubrange(count: 97)
!273 = !DIGlobalVariableExpression(var: !274, expr: !DIExpression())
!274 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1087, type: !275, isLocal: true, isDefinition: true)
!275 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 368, elements: !276)
!276 = !{!277}
!277 = !DISubrange(count: 46)
!278 = !DIGlobalVariableExpression(var: !279, expr: !DIExpression())
!279 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1094, type: !280, isLocal: true, isDefinition: true)
!280 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 392, elements: !281)
!281 = !{!282}
!282 = !DISubrange(count: 49)
!283 = !DIGlobalVariableExpression(var: !284, expr: !DIExpression())
!284 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1101, type: !285, isLocal: true, isDefinition: true)
!285 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 288, elements: !286)
!286 = !{!287}
!287 = !DISubrange(count: 36)
!288 = !DIGlobalVariableExpression(var: !289, expr: !DIExpression())
!289 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1113, type: !255, isLocal: true, isDefinition: true)
!290 = !DIGlobalVariableExpression(var: !291, expr: !DIExpression())
!291 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1127, type: !265, isLocal: true, isDefinition: true)
!292 = !DIGlobalVariableExpression(var: !293, expr: !DIExpression())
!293 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1150, type: !294, isLocal: true, isDefinition: true)
!294 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 440, elements: !295)
!295 = !{!296}
!296 = !DISubrange(count: 55)
!297 = !DIGlobalVariableExpression(var: !298, expr: !DIExpression())
!298 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1158, type: !299, isLocal: true, isDefinition: true)
!299 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 432, elements: !300)
!300 = !{!301}
!301 = !DISubrange(count: 54)
!302 = !DIGlobalVariableExpression(var: !303, expr: !DIExpression())
!303 = distinct !DIGlobalVariable(name: "stdin", scope: !36, file: !304, line: 143, type: !305, isLocal: false, isDefinition: false)
!304 = !DIFile(filename: "/usr/include/stdio.h", directory: "", checksumkind: CSK_MD5, checksum: "f31eefcc3f15835fc5a4023a625cf609")
!305 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !306, size: 64)
!306 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !307, line: 7, baseType: !308)
!307 = !DIFile(filename: "/usr/include/bits/types/FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "571f9fb6223c42439075fdde11a0de5d")
!308 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_FILE", file: !309, line: 49, size: 1728, elements: !310)
!309 = !DIFile(filename: "/usr/include/bits/types/struct_FILE.h", directory: "", checksumkind: CSK_MD5, checksum: "1bad07471b7974df4ecc1d1c2ca207e6")
!310 = !{!311, !313, !315, !316, !317, !318, !319, !320, !321, !322, !323, !324, !325, !328, !330, !331, !332, !335, !336, !338, !342, !345, !349, !352, !355, !356, !357, !360, !361}
!311 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !308, file: !309, line: 51, baseType: !312, size: 32)
!312 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!313 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_ptr", scope: !308, file: !309, line: 54, baseType: !314, size: 64, offset: 64)
!314 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!315 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_end", scope: !308, file: !309, line: 55, baseType: !314, size: 64, offset: 128)
!316 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_read_base", scope: !308, file: !309, line: 56, baseType: !314, size: 64, offset: 192)
!317 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_base", scope: !308, file: !309, line: 57, baseType: !314, size: 64, offset: 256)
!318 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_ptr", scope: !308, file: !309, line: 58, baseType: !314, size: 64, offset: 320)
!319 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_write_end", scope: !308, file: !309, line: 59, baseType: !314, size: 64, offset: 384)
!320 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_base", scope: !308, file: !309, line: 60, baseType: !314, size: 64, offset: 448)
!321 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_buf_end", scope: !308, file: !309, line: 61, baseType: !314, size: 64, offset: 512)
!322 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_base", scope: !308, file: !309, line: 64, baseType: !314, size: 64, offset: 576)
!323 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_backup_base", scope: !308, file: !309, line: 65, baseType: !314, size: 64, offset: 640)
!324 = !DIDerivedType(tag: DW_TAG_member, name: "_IO_save_end", scope: !308, file: !309, line: 66, baseType: !314, size: 64, offset: 704)
!325 = !DIDerivedType(tag: DW_TAG_member, name: "_markers", scope: !308, file: !309, line: 68, baseType: !326, size: 64, offset: 768)
!326 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !327, size: 64)
!327 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_marker", file: !309, line: 36, flags: DIFlagFwdDecl)
!328 = !DIDerivedType(tag: DW_TAG_member, name: "_chain", scope: !308, file: !309, line: 70, baseType: !329, size: 64, offset: 832)
!329 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !308, size: 64)
!330 = !DIDerivedType(tag: DW_TAG_member, name: "_fileno", scope: !308, file: !309, line: 72, baseType: !312, size: 32, offset: 896)
!331 = !DIDerivedType(tag: DW_TAG_member, name: "_flags2", scope: !308, file: !309, line: 73, baseType: !312, size: 32, offset: 928)
!332 = !DIDerivedType(tag: DW_TAG_member, name: "_old_offset", scope: !308, file: !309, line: 74, baseType: !333, size: 64, offset: 960)
!333 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off_t", file: !139, line: 152, baseType: !334)
!334 = !DIBasicType(name: "long", size: 64, encoding: DW_ATE_signed)
!335 = !DIDerivedType(tag: DW_TAG_member, name: "_cur_column", scope: !308, file: !309, line: 77, baseType: !147, size: 16, offset: 1024)
!336 = !DIDerivedType(tag: DW_TAG_member, name: "_vtable_offset", scope: !308, file: !309, line: 78, baseType: !337, size: 8, offset: 1040)
!337 = !DIBasicType(name: "signed char", size: 8, encoding: DW_ATE_signed_char)
!338 = !DIDerivedType(tag: DW_TAG_member, name: "_shortbuf", scope: !308, file: !309, line: 79, baseType: !339, size: 8, offset: 1048)
!339 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 8, elements: !340)
!340 = !{!341}
!341 = !DISubrange(count: 1)
!342 = !DIDerivedType(tag: DW_TAG_member, name: "_lock", scope: !308, file: !309, line: 81, baseType: !343, size: 64, offset: 1088)
!343 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !344, size: 64)
!344 = !DIDerivedType(tag: DW_TAG_typedef, name: "_IO_lock_t", file: !309, line: 43, baseType: null)
!345 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !308, file: !309, line: 89, baseType: !346, size: 64, offset: 1152)
!346 = !DIDerivedType(tag: DW_TAG_typedef, name: "__off64_t", file: !139, line: 153, baseType: !347)
!347 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !139, line: 47, baseType: !348)
!348 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!349 = !DIDerivedType(tag: DW_TAG_member, name: "_codecvt", scope: !308, file: !309, line: 91, baseType: !350, size: 64, offset: 1216)
!350 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !351, size: 64)
!351 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_codecvt", file: !309, line: 37, flags: DIFlagFwdDecl)
!352 = !DIDerivedType(tag: DW_TAG_member, name: "_wide_data", scope: !308, file: !309, line: 92, baseType: !353, size: 64, offset: 1280)
!353 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !354, size: 64)
!354 = !DICompositeType(tag: DW_TAG_structure_type, name: "_IO_wide_data", file: !309, line: 38, flags: DIFlagFwdDecl)
!355 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_list", scope: !308, file: !309, line: 93, baseType: !329, size: 64, offset: 1344)
!356 = !DIDerivedType(tag: DW_TAG_member, name: "_freeres_buf", scope: !308, file: !309, line: 94, baseType: !141, size: 64, offset: 1408)
!357 = !DIDerivedType(tag: DW_TAG_member, name: "__pad5", scope: !308, file: !309, line: 95, baseType: !358, size: 64, offset: 1472)
!358 = !DIDerivedType(tag: DW_TAG_typedef, name: "size_t", file: !359, line: 46, baseType: !140)
!359 = !DIFile(filename: "SVF/llvm-16.0.0.obj/lib/clang/16/include/stddef.h", directory: "/home/demo", checksumkind: CSK_MD5, checksum: "f95079da609b0e8f201cb8136304bf3b")
!360 = !DIDerivedType(tag: DW_TAG_member, name: "_mode", scope: !308, file: !309, line: 96, baseType: !312, size: 32, offset: 1536)
!361 = !DIDerivedType(tag: DW_TAG_member, name: "_unused2", scope: !308, file: !309, line: 98, baseType: !362, size: 160, offset: 1568)
!362 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 160, elements: !363)
!363 = !{!364}
!364 = !DISubrange(count: 20)
!365 = !DIGlobalVariableExpression(var: !366, expr: !DIExpression())
!366 = distinct !DIGlobalVariable(name: "stdout", scope: !36, file: !304, line: 144, type: !305, isLocal: false, isDefinition: false)
!367 = !DIGlobalVariableExpression(var: !368, expr: !DIExpression())
!368 = distinct !DIGlobalVariable(name: "stderr", scope: !36, file: !304, line: 145, type: !305, isLocal: false, isDefinition: false)
!369 = !DIGlobalVariableExpression(var: !370, expr: !DIExpression())
!370 = distinct !DIGlobalVariable(name: "optarg", scope: !36, file: !371, line: 36, type: !314, isLocal: false, isDefinition: false)
!371 = !DIFile(filename: "/usr/include/bits/getopt_core.h", directory: "", checksumkind: CSK_MD5, checksum: "81ab788980ce9d5be2ba931a6ae17301")
!372 = !DIGlobalVariableExpression(var: !373, expr: !DIExpression())
!373 = distinct !DIGlobalVariable(name: "optind", scope: !36, file: !371, line: 50, type: !312, isLocal: false, isDefinition: false)
!374 = !DIGlobalVariableExpression(var: !375, expr: !DIExpression())
!375 = distinct !DIGlobalVariable(name: "buf", scope: !376, file: !2, line: 145, type: !383, isLocal: true, isDefinition: true)
!376 = distinct !DISubprogram(name: "get_libbpf_strerror", scope: !2, file: !2, line: 143, type: !377, scopeLine: 144, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !381)
!377 = !DISubroutineType(types: !378)
!378 = !{!379, !312}
!379 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !380, size: 64)
!380 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!381 = !{!382}
!382 = !DILocalVariable(name: "err", arg: 1, scope: !376, file: !2, line: 143, type: !312)
!383 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 1600, elements: !384)
!384 = !{!385}
!385 = !DISubrange(count: 200)
!386 = !DIGlobalVariableExpression(var: !387, expr: !DIExpression())
!387 = distinct !DIGlobalVariable(scope: null, file: !2, line: 178, type: !362, isLocal: true, isDefinition: true)
!388 = !DIGlobalVariableExpression(var: !389, expr: !DIExpression())
!389 = distinct !DIGlobalVariable(scope: null, file: !2, line: 183, type: !390, isLocal: true, isDefinition: true)
!390 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 200, elements: !391)
!391 = !{!392}
!392 = !DISubrange(count: 25)
!393 = !DIGlobalVariableExpression(var: !394, expr: !DIExpression())
!394 = distinct !DIGlobalVariable(scope: null, file: !2, line: 192, type: !395, isLocal: true, isDefinition: true)
!395 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 328, elements: !396)
!396 = !{!397}
!397 = !DISubrange(count: 41)
!398 = !DIGlobalVariableExpression(var: !399, expr: !DIExpression())
!399 = distinct !DIGlobalVariable(scope: null, file: !2, line: 200, type: !247, isLocal: true, isDefinition: true)
!400 = !DIGlobalVariableExpression(var: !401, expr: !DIExpression())
!401 = distinct !DIGlobalVariable(scope: null, file: !2, line: 209, type: !19, isLocal: true, isDefinition: true)
!402 = !DIGlobalVariableExpression(var: !403, expr: !DIExpression())
!403 = distinct !DIGlobalVariable(scope: null, file: !2, line: 216, type: !9, isLocal: true, isDefinition: true)
!404 = !DIGlobalVariableExpression(var: !405, expr: !DIExpression())
!405 = distinct !DIGlobalVariable(scope: null, file: !2, line: 219, type: !19, isLocal: true, isDefinition: true)
!406 = !DIGlobalVariableExpression(var: !407, expr: !DIExpression())
!407 = distinct !DIGlobalVariable(scope: null, file: !2, line: 223, type: !260, isLocal: true, isDefinition: true)
!408 = !DIGlobalVariableExpression(var: !409, expr: !DIExpression())
!409 = distinct !DIGlobalVariable(scope: null, file: !2, line: 230, type: !410, isLocal: true, isDefinition: true)
!410 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 136, elements: !411)
!411 = !{!412}
!412 = !DISubrange(count: 17)
!413 = !DIGlobalVariableExpression(var: !414, expr: !DIExpression())
!414 = distinct !DIGlobalVariable(scope: null, file: !2, line: 245, type: !275, isLocal: true, isDefinition: true)
!415 = !DIGlobalVariableExpression(var: !416, expr: !DIExpression())
!416 = distinct !DIGlobalVariable(scope: null, file: !2, line: 250, type: !9, isLocal: true, isDefinition: true)
!417 = !DIGlobalVariableExpression(var: !418, expr: !DIExpression())
!418 = distinct !DIGlobalVariable(scope: null, file: !2, line: 252, type: !419, isLocal: true, isDefinition: true)
!419 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 24, elements: !227)
!420 = !DIGlobalVariableExpression(var: !421, expr: !DIExpression())
!421 = distinct !DIGlobalVariable(scope: null, file: !2, line: 253, type: !410, isLocal: true, isDefinition: true)
!422 = !DIGlobalVariableExpression(var: !423, expr: !DIExpression())
!423 = distinct !DIGlobalVariable(scope: null, file: !2, line: 255, type: !285, isLocal: true, isDefinition: true)
!424 = !DIGlobalVariableExpression(var: !425, expr: !DIExpression())
!425 = distinct !DIGlobalVariable(scope: null, file: !2, line: 273, type: !252, isLocal: true, isDefinition: true)
!426 = !DIGlobalVariableExpression(var: !427, expr: !DIExpression())
!427 = distinct !DIGlobalVariable(scope: null, file: !2, line: 277, type: !428, isLocal: true, isDefinition: true)
!428 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 152, elements: !429)
!429 = !{!430}
!430 = !DISubrange(count: 19)
!431 = !DIGlobalVariableExpression(var: !432, expr: !DIExpression())
!432 = distinct !DIGlobalVariable(scope: null, file: !2, line: 284, type: !433, isLocal: true, isDefinition: true)
!433 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 408, elements: !434)
!434 = !{!435}
!435 = !DISubrange(count: 51)
!436 = !DIGlobalVariableExpression(var: !437, expr: !DIExpression())
!437 = distinct !DIGlobalVariable(scope: null, file: !2, line: 97, type: !14, isLocal: true, isDefinition: true)
!438 = !DIGlobalVariableExpression(var: !439, expr: !DIExpression())
!439 = distinct !DIGlobalVariable(scope: null, file: !2, line: 98, type: !3, isLocal: true, isDefinition: true)
!440 = !DIGlobalVariableExpression(var: !441, expr: !DIExpression())
!441 = distinct !DIGlobalVariable(scope: null, file: !2, line: 101, type: !19, isLocal: true, isDefinition: true)
!442 = !DIGlobalVariableExpression(var: !443, expr: !DIExpression())
!443 = distinct !DIGlobalVariable(scope: null, file: !2, line: 102, type: !26, isLocal: true, isDefinition: true)
!444 = !DIGlobalVariableExpression(var: !445, expr: !DIExpression())
!445 = distinct !DIGlobalVariable(scope: null, file: !2, line: 104, type: !252, isLocal: true, isDefinition: true)
!446 = !DIGlobalVariableExpression(var: !447, expr: !DIExpression())
!447 = distinct !DIGlobalVariable(scope: null, file: !2, line: 105, type: !232, isLocal: true, isDefinition: true)
!448 = !DIGlobalVariableExpression(var: !449, expr: !DIExpression())
!449 = distinct !DIGlobalVariable(scope: null, file: !2, line: 106, type: !9, isLocal: true, isDefinition: true)
!450 = !DIGlobalVariableExpression(var: !451, expr: !DIExpression())
!451 = distinct !DIGlobalVariable(scope: null, file: !2, line: 107, type: !14, isLocal: true, isDefinition: true)
!452 = !DIGlobalVariableExpression(var: !453, expr: !DIExpression())
!453 = distinct !DIGlobalVariable(scope: null, file: !2, line: 108, type: !31, isLocal: true, isDefinition: true)
!454 = !DIGlobalVariableExpression(var: !455, expr: !DIExpression())
!455 = distinct !DIGlobalVariable(name: "long_options", scope: !36, file: !2, line: 96, type: !456, isLocal: true, isDefinition: true)
!456 = !DICompositeType(tag: DW_TAG_array_type, baseType: !457, size: 3328, elements: !233)
!457 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !458)
!458 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "option", file: !459, line: 50, size: 256, elements: !460)
!459 = !DIFile(filename: "/usr/include/bits/getopt_ext.h", directory: "", checksumkind: CSK_MD5, checksum: "b4f86ba96a508c530fa381ae1dafe9eb")
!460 = !{!461, !462, !463, !465}
!461 = !DIDerivedType(tag: DW_TAG_member, name: "name", scope: !458, file: !459, line: 52, baseType: !379, size: 64)
!462 = !DIDerivedType(tag: DW_TAG_member, name: "has_arg", scope: !458, file: !459, line: 55, baseType: !312, size: 32, offset: 64)
!463 = !DIDerivedType(tag: DW_TAG_member, name: "flag", scope: !458, file: !459, line: 56, baseType: !464, size: 64, offset: 128)
!464 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !312, size: 64)
!465 = !DIDerivedType(tag: DW_TAG_member, name: "val", scope: !458, file: !459, line: 57, baseType: !312, size: 32, offset: 192)
!466 = !DIGlobalVariableExpression(var: !467, expr: !DIExpression())
!467 = distinct !DIGlobalVariable(scope: null, file: !2, line: 156, type: !468, isLocal: true, isDefinition: true)
!468 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 232, elements: !469)
!469 = !{!470}
!470 = !DISubrange(count: 29)
!471 = !DIGlobalVariableExpression(var: !472, expr: !DIExpression())
!472 = distinct !DIGlobalVariable(scope: null, file: !2, line: 160, type: !473, isLocal: true, isDefinition: true)
!473 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 216, elements: !474)
!474 = !{!475}
!475 = !DISubrange(count: 27)
!476 = !DIGlobalVariableExpression(var: !477, expr: !DIExpression())
!477 = distinct !DIGlobalVariable(scope: null, file: !2, line: 119, type: !362, isLocal: true, isDefinition: true)
!478 = !DIGlobalVariableExpression(var: !479, expr: !DIExpression())
!479 = distinct !DIGlobalVariable(scope: null, file: !2, line: 120, type: !480, isLocal: true, isDefinition: true)
!480 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 16, elements: !481)
!481 = !{!482}
!482 = !DISubrange(count: 2)
!483 = !DIGlobalVariableExpression(var: !484, expr: !DIExpression())
!484 = distinct !DIGlobalVariable(scope: null, file: !2, line: 121, type: !485, isLocal: true, isDefinition: true)
!485 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 256, elements: !486)
!486 = !{!487}
!487 = !DISubrange(count: 32)
!488 = !DIGlobalVariableExpression(var: !489, expr: !DIExpression())
!489 = distinct !DIGlobalVariable(scope: null, file: !2, line: 122, type: !428, isLocal: true, isDefinition: true)
!490 = !DIGlobalVariableExpression(var: !491, expr: !DIExpression())
!491 = distinct !DIGlobalVariable(scope: null, file: !2, line: 124, type: !19, isLocal: true, isDefinition: true)
!492 = !DIGlobalVariableExpression(var: !493, expr: !DIExpression())
!493 = distinct !DIGlobalVariable(scope: null, file: !2, line: 126, type: !494, isLocal: true, isDefinition: true)
!494 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 208, elements: !495)
!495 = !{!496}
!496 = !DISubrange(count: 26)
!497 = !DIGlobalVariableExpression(var: !498, expr: !DIExpression())
!498 = distinct !DIGlobalVariable(scope: null, file: !2, line: 129, type: !428, isLocal: true, isDefinition: true)
!499 = !DIGlobalVariableExpression(var: !500, expr: !DIExpression())
!500 = distinct !DIGlobalVariable(scope: null, file: !2, line: 3, type: !501, isLocal: true, isDefinition: true)
!501 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 472, elements: !502)
!502 = !{!503}
!503 = !DISubrange(count: 59)
!504 = !DIGlobalVariableExpression(var: !505, expr: !DIExpression())
!505 = distinct !DIGlobalVariable(name: "__doc__", scope: !36, file: !2, line: 2, type: !379, isLocal: true, isDefinition: true)
!506 = !DIGlobalVariableExpression(var: !507, expr: !DIExpression())
!507 = distinct !DIGlobalVariable(scope: null, file: !2, line: 729, type: !255, isLocal: true, isDefinition: true)
!508 = !DIGlobalVariableExpression(var: !509, expr: !DIExpression())
!509 = distinct !DIGlobalVariable(scope: null, file: !2, line: 739, type: !14, isLocal: true, isDefinition: true)
!510 = !DIGlobalVariableExpression(var: !511, expr: !DIExpression())
!511 = distinct !DIGlobalVariable(scope: null, file: !2, line: 741, type: !512, isLocal: true, isDefinition: true)
!512 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 184, elements: !513)
!513 = !{!514}
!514 = !DISubrange(count: 23)
!515 = !DIGlobalVariableExpression(var: !516, expr: !DIExpression())
!516 = distinct !DIGlobalVariable(scope: null, file: !2, line: 721, type: !19, isLocal: true, isDefinition: true)
!517 = !DIGlobalVariableExpression(var: !518, expr: !DIExpression())
!518 = distinct !DIGlobalVariable(scope: null, file: !2, line: 722, type: !3, isLocal: true, isDefinition: true)
!519 = !DIGlobalVariableExpression(var: !520, expr: !DIExpression())
!520 = distinct !DIGlobalVariable(name: "offset", scope: !521, file: !2, line: 604, type: !143, isLocal: true, isDefinition: true)
!521 = distinct !DISubprogram(name: "convert_monotonic_to_realtime", scope: !2, file: !2, line: 602, type: !522, scopeLine: 603, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !524)
!522 = !DISubroutineType(types: !523)
!523 = !{!143, !143}
!524 = !{!525, !526, !527}
!525 = !DILocalVariable(name: "monotonic_time", arg: 1, scope: !521, file: !2, line: 602, type: !143)
!526 = !DILocalVariable(name: "now_mon", scope: !521, file: !2, line: 606, type: !143)
!527 = !DILocalVariable(name: "now_rt", scope: !521, file: !2, line: 607, type: !143)
!528 = !DIGlobalVariableExpression(var: !529, expr: !DIExpression())
!529 = distinct !DIGlobalVariable(name: "offset_updated", scope: !521, file: !2, line: 605, type: !143, isLocal: true, isDefinition: true)
!530 = !DIGlobalVariableExpression(var: !531, expr: !DIExpression())
!531 = distinct !DIGlobalVariable(name: "buf", scope: !532, file: !2, line: 640, type: !537, isLocal: true, isDefinition: true)
!532 = distinct !DISubprogram(name: "proto_to_str", scope: !2, file: !2, line: 638, type: !533, scopeLine: 639, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !535)
!533 = !DISubroutineType(types: !534)
!534 = !{!379, !187}
!535 = !{!536}
!536 = !DILocalVariable(name: "proto", arg: 1, scope: !532, file: !2, line: 638, type: !187)
!537 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 64, elements: !180)
!538 = !DIGlobalVariableExpression(var: !539, expr: !DIExpression())
!539 = distinct !DIGlobalVariable(scope: null, file: !2, line: 648, type: !252, isLocal: true, isDefinition: true)
!540 = !DIGlobalVariableExpression(var: !541, expr: !DIExpression())
!541 = distinct !DIGlobalVariable(scope: null, file: !2, line: 650, type: !419, isLocal: true, isDefinition: true)
!542 = !DIGlobalVariableExpression(var: !543, expr: !DIExpression())
!543 = distinct !DIGlobalVariable(scope: null, file: !2, line: 711, type: !544, isLocal: true, isDefinition: true)
!544 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 96, elements: !545)
!545 = !{!546}
!546 = !DISubrange(count: 12)
!547 = !DIGlobalVariableExpression(var: !548, expr: !DIExpression())
!548 = distinct !DIGlobalVariable(scope: null, file: !2, line: 659, type: !14, isLocal: true, isDefinition: true)
!549 = !DIGlobalVariableExpression(var: !550, expr: !DIExpression())
!550 = distinct !DIGlobalVariable(scope: null, file: !2, line: 661, type: !537, isLocal: true, isDefinition: true)
!551 = !DIGlobalVariableExpression(var: !552, expr: !DIExpression())
!552 = distinct !DIGlobalVariable(scope: null, file: !2, line: 664, type: !537, isLocal: true, isDefinition: true)
!553 = !DIGlobalVariableExpression(var: !554, expr: !DIExpression())
!554 = distinct !DIGlobalVariable(scope: null, file: !2, line: 666, type: !537, isLocal: true, isDefinition: true)
!555 = !DIGlobalVariableExpression(var: !556, expr: !DIExpression())
!556 = distinct !DIGlobalVariable(scope: null, file: !2, line: 674, type: !9, isLocal: true, isDefinition: true)
!557 = !DIGlobalVariableExpression(var: !558, expr: !DIExpression())
!558 = distinct !DIGlobalVariable(scope: null, file: !2, line: 676, type: !537, isLocal: true, isDefinition: true)
!559 = !DIGlobalVariableExpression(var: !560, expr: !DIExpression())
!560 = distinct !DIGlobalVariable(scope: null, file: !2, line: 678, type: !561, isLocal: true, isDefinition: true)
!561 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 176, elements: !562)
!562 = !{!563}
!563 = !DISubrange(count: 22)
!564 = !DIGlobalVariableExpression(var: !565, expr: !DIExpression())
!565 = distinct !DIGlobalVariable(scope: null, file: !2, line: 680, type: !9, isLocal: true, isDefinition: true)
!566 = !DIGlobalVariableExpression(var: !567, expr: !DIExpression())
!567 = distinct !DIGlobalVariable(scope: null, file: !2, line: 682, type: !9, isLocal: true, isDefinition: true)
!568 = !DIGlobalVariableExpression(var: !569, expr: !DIExpression())
!569 = distinct !DIGlobalVariable(scope: null, file: !2, line: 684, type: !232, isLocal: true, isDefinition: true)
!570 = !DIGlobalVariableExpression(var: !571, expr: !DIExpression())
!571 = distinct !DIGlobalVariable(scope: null, file: !2, line: 694, type: !9, isLocal: true, isDefinition: true)
!572 = !DIGlobalVariableExpression(var: !573, expr: !DIExpression())
!573 = distinct !DIGlobalVariable(scope: null, file: !2, line: 696, type: !14, isLocal: true, isDefinition: true)
!574 = !DIGlobalVariableExpression(var: !575, expr: !DIExpression())
!575 = distinct !DIGlobalVariable(scope: null, file: !2, line: 698, type: !237, isLocal: true, isDefinition: true)
!576 = !DIGlobalVariableExpression(var: !577, expr: !DIExpression())
!577 = distinct !DIGlobalVariable(name: "print_event_func", scope: !36, file: !2, line: 94, type: !578, isLocal: true, isDefinition: true)
!578 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !579, size: 64)
!579 = !DISubroutineType(types: !580)
!580 = !{null, !581}
!581 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !582, size: 64)
!582 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !150)
!583 = !DIGlobalVariableExpression(var: !584, expr: !DIExpression())
!584 = distinct !DIGlobalVariable(scope: null, file: !2, line: 774, type: !3, isLocal: true, isDefinition: true)
!585 = !DIGlobalVariableExpression(var: !586, expr: !DIExpression())
!586 = distinct !DIGlobalVariable(scope: null, file: !2, line: 776, type: !252, isLocal: true, isDefinition: true)
!587 = !DIGlobalVariableExpression(var: !588, expr: !DIExpression())
!588 = distinct !DIGlobalVariable(scope: null, file: !2, line: 777, type: !19, isLocal: true, isDefinition: true)
!589 = !DIGlobalVariableExpression(var: !590, expr: !DIExpression())
!590 = distinct !DIGlobalVariable(scope: null, file: !2, line: 778, type: !537, isLocal: true, isDefinition: true)
!591 = !DIGlobalVariableExpression(var: !592, expr: !DIExpression())
!592 = distinct !DIGlobalVariable(scope: null, file: !2, line: 779, type: !3, isLocal: true, isDefinition: true)
!593 = !DIGlobalVariableExpression(var: !594, expr: !DIExpression())
!594 = distinct !DIGlobalVariable(scope: null, file: !2, line: 780, type: !19, isLocal: true, isDefinition: true)
!595 = !DIGlobalVariableExpression(var: !596, expr: !DIExpression())
!596 = distinct !DIGlobalVariable(scope: null, file: !2, line: 786, type: !9, isLocal: true, isDefinition: true)
!597 = !DIGlobalVariableExpression(var: !598, expr: !DIExpression())
!598 = distinct !DIGlobalVariable(scope: null, file: !2, line: 787, type: !537, isLocal: true, isDefinition: true)
!599 = !DIGlobalVariableExpression(var: !600, expr: !DIExpression())
!600 = distinct !DIGlobalVariable(scope: null, file: !2, line: 788, type: !232, isLocal: true, isDefinition: true)
!601 = !DIGlobalVariableExpression(var: !602, expr: !DIExpression())
!602 = distinct !DIGlobalVariable(scope: null, file: !2, line: 789, type: !247, isLocal: true, isDefinition: true)
!603 = !DIGlobalVariableExpression(var: !604, expr: !DIExpression())
!604 = distinct !DIGlobalVariable(scope: null, file: !2, line: 790, type: !544, isLocal: true, isDefinition: true)
!605 = !DIGlobalVariableExpression(var: !606, expr: !DIExpression())
!606 = distinct !DIGlobalVariable(scope: null, file: !2, line: 791, type: !3, isLocal: true, isDefinition: true)
!607 = !DIGlobalVariableExpression(var: !608, expr: !DIExpression())
!608 = distinct !DIGlobalVariable(scope: null, file: !2, line: 792, type: !242, isLocal: true, isDefinition: true)
!609 = !DIGlobalVariableExpression(var: !610, expr: !DIExpression())
!610 = distinct !DIGlobalVariable(scope: null, file: !2, line: 798, type: !247, isLocal: true, isDefinition: true)
!611 = !DIGlobalVariableExpression(var: !612, expr: !DIExpression())
!612 = distinct !DIGlobalVariable(scope: null, file: !2, line: 800, type: !252, isLocal: true, isDefinition: true)
!613 = !DIGlobalVariableExpression(var: !614, expr: !DIExpression())
!614 = distinct !DIGlobalVariable(scope: null, file: !2, line: 802, type: !232, isLocal: true, isDefinition: true)
!615 = !DIGlobalVariableExpression(var: !616, expr: !DIExpression())
!616 = distinct !DIGlobalVariable(scope: null, file: !2, line: 757, type: !617, isLocal: true, isDefinition: true)
!617 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 296, elements: !618)
!618 = !{!619}
!619 = !DISubrange(count: 37)
!620 = !DIGlobalVariableExpression(var: !621, expr: !DIExpression())
!621 = distinct !DIGlobalVariable(scope: null, file: !2, line: 910, type: !255, isLocal: true, isDefinition: true)
!622 = !DIGlobalVariableExpression(var: !623, expr: !DIExpression())
!623 = distinct !DIGlobalVariable(scope: null, file: !2, line: 918, type: !624, isLocal: true, isDefinition: true)
!624 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 352, elements: !625)
!625 = !{!626}
!626 = !DISubrange(count: 44)
!627 = !DIGlobalVariableExpression(var: !628, expr: !DIExpression())
!628 = distinct !DIGlobalVariable(scope: null, file: !2, line: 926, type: !629, isLocal: true, isDefinition: true)
!629 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 312, elements: !630)
!630 = !{!631}
!631 = !DISubrange(count: 39)
!632 = !DIGlobalVariableExpression(var: !633, expr: !DIExpression())
!633 = distinct !DIGlobalVariable(scope: null, file: !2, line: 938, type: !634, isLocal: true, isDefinition: true)
!634 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 456, elements: !635)
!635 = !{!636}
!636 = !DISubrange(count: 57)
!637 = !DIGlobalVariableExpression(var: !638, expr: !DIExpression())
!638 = distinct !DIGlobalVariable(scope: null, file: !2, line: 956, type: !639, isLocal: true, isDefinition: true)
!639 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 464, elements: !640)
!640 = !{!641}
!641 = !DISubrange(count: 58)
!642 = !DIGlobalVariableExpression(var: !643, expr: !DIExpression())
!643 = distinct !DIGlobalVariable(scope: null, file: !2, line: 971, type: !395, isLocal: true, isDefinition: true)
!644 = !DIGlobalVariableExpression(var: !645, expr: !DIExpression())
!645 = distinct !DIGlobalVariable(scope: null, file: !2, line: 327, type: !537, isLocal: true, isDefinition: true)
!646 = !DIGlobalVariableExpression(var: !647, expr: !DIExpression())
!647 = distinct !DIGlobalVariable(scope: null, file: !2, line: 892, type: !648, isLocal: true, isDefinition: true)
!648 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 512, elements: !649)
!649 = !{!650}
!650 = !DISubrange(count: 64)
!651 = !DIGlobalVariableExpression(var: !652, expr: !DIExpression())
!652 = distinct !DIGlobalVariable(scope: null, file: !2, line: 896, type: !485, isLocal: true, isDefinition: true)
!653 = !DIGlobalVariableExpression(var: !654, expr: !DIExpression())
!654 = distinct !DIGlobalVariable(scope: null, file: !2, line: 986, type: !265, isLocal: true, isDefinition: true)
!655 = !DIGlobalVariableExpression(var: !656, expr: !DIExpression())
!656 = distinct !DIGlobalVariable(scope: null, file: !2, line: 993, type: !657, isLocal: true, isDefinition: true)
!657 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 360, elements: !658)
!658 = !{!659}
!659 = !DISubrange(count: 45)
!660 = !DIGlobalVariableExpression(var: !661, expr: !DIExpression())
!661 = distinct !DIGlobalVariable(scope: null, file: !2, line: 1011, type: !662, isLocal: true, isDefinition: true)
!662 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 480, elements: !663)
!663 = !{!664}
!664 = !DISubrange(count: 60)
!665 = !DIGlobalVariableExpression(var: !666, expr: !DIExpression())
!666 = distinct !DIGlobalVariable(scope: null, file: !2, line: 574, type: !667, isLocal: true, isDefinition: true)
!667 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 552, elements: !668)
!668 = !{!669}
!669 = !DISubrange(count: 69)
!670 = !DIGlobalVariableExpression(var: !671, expr: !DIExpression())
!671 = distinct !DIGlobalVariable(scope: null, file: !2, line: 849, type: !672, isLocal: true, isDefinition: true)
!672 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 272, elements: !673)
!673 = !{!674}
!674 = !DISubrange(count: 34)
!675 = !DIGlobalVariableExpression(var: !676, expr: !DIExpression())
!676 = distinct !DIGlobalVariable(scope: null, file: !2, line: 827, type: !275, isLocal: true, isDefinition: true)
!677 = !DIGlobalVariableExpression(var: !678, expr: !DIExpression())
!678 = distinct !DIGlobalVariable(scope: null, file: !2, line: 828, type: !14, isLocal: true, isDefinition: true)
!679 = !DIGlobalVariableExpression(var: !680, expr: !DIExpression())
!680 = distinct !DIGlobalVariable(scope: null, file: !2, line: 856, type: !681, isLocal: true, isDefinition: true)
!681 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 224, elements: !682)
!682 = !{!683}
!683 = !DISubrange(count: 28)
!684 = !DIGlobalVariableExpression(var: !685, expr: !DIExpression())
!685 = distinct !DIGlobalVariable(name: "json_ctx", scope: !36, file: !2, line: 93, type: !686, isLocal: true, isDefinition: true)
!686 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !687, size: 64)
!687 = !DIDerivedType(tag: DW_TAG_typedef, name: "json_writer_t", file: !688, line: 21, baseType: !689)
!688 = !DIFile(filename: "../lib/util/json_writer.h", directory: "/home/demo/bpf-examples/pping", checksumkind: CSK_MD5, checksum: "a3d1c9d40d0b039d45a7ff575e542b45")
!689 = !DICompositeType(tag: DW_TAG_structure_type, name: "json_writer", file: !688, line: 21, flags: DIFlagFwdDecl)
!690 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !312)
!691 = !{i32 7, !"Dwarf Version", i32 5}
!692 = !{i32 2, !"Debug Info Version", i32 3}
!693 = !{i32 1, !"wchar_size", i32 4}
!694 = !{i32 7, !"frame-pointer", i32 2}
!695 = !{!"clang version 16.0.0"}
!696 = distinct !DISubprogram(name: "tracked_protocols_to_str", scope: !2, file: !2, line: 291, type: !697, scopeLine: 292, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !737)
!697 = !DISubroutineType(types: !698)
!698 = !{!379, !699}
!699 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !700, size: 64)
!700 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "pping_config", file: !2, line: 71, size: 1472, elements: !701)
!701 = !{!702, !712, !721, !722, !723, !724, !725, !726, !727, !728, !729, !730, !731, !732, !733, !734, !735, !736}
!702 = !DIDerivedType(tag: DW_TAG_member, name: "bpf_config", scope: !700, file: !2, line: 72, baseType: !703, size: 192)
!703 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_config", file: !45, line: 46, size: 192, elements: !704)
!704 = !{!705, !706, !707, !708, !709, !710, !711}
!705 = !DIDerivedType(tag: DW_TAG_member, name: "rate_limit", scope: !703, file: !45, line: 47, baseType: !143, size: 64)
!706 = !DIDerivedType(tag: DW_TAG_member, name: "rtt_rate", scope: !703, file: !45, line: 48, baseType: !142, size: 64, offset: 64)
!707 = !DIDerivedType(tag: DW_TAG_member, name: "use_srtt", scope: !703, file: !45, line: 49, baseType: !203, size: 8, offset: 128)
!708 = !DIDerivedType(tag: DW_TAG_member, name: "track_tcp", scope: !703, file: !45, line: 50, baseType: !203, size: 8, offset: 136)
!709 = !DIDerivedType(tag: DW_TAG_member, name: "track_icmp", scope: !703, file: !45, line: 51, baseType: !203, size: 8, offset: 144)
!710 = !DIDerivedType(tag: DW_TAG_member, name: "localfilt", scope: !703, file: !45, line: 52, baseType: !203, size: 8, offset: 152)
!711 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !703, file: !45, line: 53, baseType: !195, size: 32, offset: 160)
!712 = !DIDerivedType(tag: DW_TAG_member, name: "tc_ingress_opts", scope: !700, file: !2, line: 73, baseType: !713, size: 256, offset: 192)
!713 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_tc_opts", file: !70, line: 866, size: 256, elements: !714)
!714 = !{!715, !716, !717, !718, !719, !720}
!715 = !DIDerivedType(tag: DW_TAG_member, name: "sz", scope: !713, file: !70, line: 867, baseType: !358, size: 64)
!716 = !DIDerivedType(tag: DW_TAG_member, name: "prog_fd", scope: !713, file: !70, line: 868, baseType: !312, size: 32, offset: 64)
!717 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !713, file: !70, line: 869, baseType: !195, size: 32, offset: 96)
!718 = !DIDerivedType(tag: DW_TAG_member, name: "prog_id", scope: !713, file: !70, line: 870, baseType: !195, size: 32, offset: 128)
!719 = !DIDerivedType(tag: DW_TAG_member, name: "handle", scope: !713, file: !70, line: 871, baseType: !195, size: 32, offset: 160)
!720 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !713, file: !70, line: 872, baseType: !195, size: 32, offset: 192)
!721 = !DIDerivedType(tag: DW_TAG_member, name: "tc_egress_opts", scope: !700, file: !2, line: 74, baseType: !713, size: 256, offset: 448)
!722 = !DIDerivedType(tag: DW_TAG_member, name: "cleanup_interval", scope: !700, file: !2, line: 75, baseType: !143, size: 64, offset: 704)
!723 = !DIDerivedType(tag: DW_TAG_member, name: "object_path", scope: !700, file: !2, line: 76, baseType: !314, size: 64, offset: 768)
!724 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_prog", scope: !700, file: !2, line: 77, baseType: !314, size: 64, offset: 832)
!725 = !DIDerivedType(tag: DW_TAG_member, name: "egress_prog", scope: !700, file: !2, line: 78, baseType: !314, size: 64, offset: 896)
!726 = !DIDerivedType(tag: DW_TAG_member, name: "packet_map", scope: !700, file: !2, line: 79, baseType: !314, size: 64, offset: 960)
!727 = !DIDerivedType(tag: DW_TAG_member, name: "flow_map", scope: !700, file: !2, line: 80, baseType: !314, size: 64, offset: 1024)
!728 = !DIDerivedType(tag: DW_TAG_member, name: "event_map", scope: !700, file: !2, line: 81, baseType: !314, size: 64, offset: 1088)
!729 = !DIDerivedType(tag: DW_TAG_member, name: "xdp_flags", scope: !700, file: !2, line: 82, baseType: !312, size: 32, offset: 1152)
!730 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !700, file: !2, line: 83, baseType: !312, size: 32, offset: 1184)
!731 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_prog_id", scope: !700, file: !2, line: 84, baseType: !312, size: 32, offset: 1216)
!732 = !DIDerivedType(tag: DW_TAG_member, name: "egress_prog_id", scope: !700, file: !2, line: 85, baseType: !312, size: 32, offset: 1248)
!733 = !DIDerivedType(tag: DW_TAG_member, name: "ifname", scope: !700, file: !2, line: 86, baseType: !242, size: 128, offset: 1280)
!734 = !DIDerivedType(tag: DW_TAG_member, name: "output_format", scope: !700, file: !2, line: 87, baseType: !38, size: 32, offset: 1408)
!735 = !DIDerivedType(tag: DW_TAG_member, name: "force", scope: !700, file: !2, line: 88, baseType: !203, size: 8, offset: 1440)
!736 = !DIDerivedType(tag: DW_TAG_member, name: "created_tc_hook", scope: !700, file: !2, line: 89, baseType: !203, size: 8, offset: 1448)
!737 = !{!738, !739, !740}
!738 = !DILocalVariable(name: "config", arg: 1, scope: !696, file: !2, line: 291, type: !699)
!739 = !DILocalVariable(name: "tcp", scope: !696, file: !2, line: 293, type: !203)
!740 = !DILocalVariable(name: "icmp", scope: !696, file: !2, line: 294, type: !203)
!741 = !{!742, !742, i64 0}
!742 = !{!"any pointer", !743, i64 0}
!743 = !{!"omnipotent char", !744, i64 0}
!744 = !{!"Simple C/C++ TBAA"}
!745 = !DILocation(line: 291, column: 59, scope: !696)
!746 = !DILocation(line: 293, column: 2, scope: !696)
!747 = !DILocation(line: 293, column: 7, scope: !696)
!748 = !DILocation(line: 293, column: 13, scope: !696)
!749 = !DILocation(line: 293, column: 21, scope: !696)
!750 = !DILocation(line: 293, column: 32, scope: !696)
!751 = !{!752, !755, i64 17}
!752 = !{!"pping_config", !753, i64 0, !757, i64 24, !757, i64 56, !754, i64 88, !742, i64 96, !742, i64 104, !742, i64 112, !742, i64 120, !742, i64 128, !742, i64 136, !756, i64 144, !756, i64 148, !756, i64 152, !756, i64 156, !743, i64 160, !743, i64 176, !755, i64 180, !755, i64 181}
!753 = !{!"bpf_config", !754, i64 0, !754, i64 8, !755, i64 16, !755, i64 17, !755, i64 18, !755, i64 19, !756, i64 20}
!754 = !{!"long long", !743, i64 0}
!755 = !{!"_Bool", !743, i64 0}
!756 = !{!"int", !743, i64 0}
!757 = !{!"bpf_tc_opts", !758, i64 0, !756, i64 8, !756, i64 12, !756, i64 16, !756, i64 20, !756, i64 24}
!758 = !{!"long", !743, i64 0}
!759 = !{i8 0, i8 2}
!760 = !{}
!761 = !{!755, !755, i64 0}
!762 = !DILocation(line: 294, column: 2, scope: !696)
!763 = !DILocation(line: 294, column: 7, scope: !696)
!764 = !DILocation(line: 294, column: 14, scope: !696)
!765 = !DILocation(line: 294, column: 22, scope: !696)
!766 = !DILocation(line: 294, column: 33, scope: !696)
!767 = !{!752, !755, i64 18}
!768 = !DILocation(line: 295, column: 9, scope: !696)
!769 = !DILocation(line: 295, column: 13, scope: !696)
!770 = !DILocation(line: 295, column: 16, scope: !696)
!771 = !DILocation(line: 295, column: 37, scope: !696)
!772 = !DILocation(line: 296, column: 1, scope: !696)
!773 = !DILocation(line: 295, column: 2, scope: !696)
!774 = distinct !DISubprogram(name: "output_format_to_str", scope: !2, file: !2, line: 298, type: !775, scopeLine: 299, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !777)
!775 = !DISubroutineType(types: !776)
!776 = !{!379, !38}
!777 = !{!778}
!778 = !DILocalVariable(name: "format", arg: 1, scope: !774, file: !2, line: 298, type: !38)
!779 = !{!743, !743, i64 0}
!780 = !DILocation(line: 298, column: 59, scope: !774)
!781 = !DILocation(line: 300, column: 10, scope: !774)
!782 = !DILocation(line: 300, column: 2, scope: !774)
!783 = !DILocation(line: 301, column: 30, scope: !784)
!784 = distinct !DILexicalBlock(scope: !774, file: !2, line: 300, column: 18)
!785 = !DILocation(line: 302, column: 26, scope: !784)
!786 = !DILocation(line: 303, column: 27, scope: !784)
!787 = !DILocation(line: 304, column: 11, scope: !784)
!788 = !DILocation(line: 306, column: 1, scope: !774)
!789 = distinct !DISubprogram(name: "abort_program", scope: !2, file: !2, line: 308, type: !790, scopeLine: 309, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !792)
!790 = !DISubroutineType(types: !791)
!791 = !{null, !312}
!792 = !{!793}
!793 = !DILocalVariable(name: "sig", arg: 1, scope: !789, file: !2, line: 308, type: !312)
!794 = !{!756, !756, i64 0}
!795 = !DILocation(line: 308, column: 24, scope: !789)
!796 = !DILocation(line: 310, column: 15, scope: !789)
!797 = !DILocation(line: 311, column: 1, scope: !789)
!798 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 1019, type: !799, scopeLine: 1020, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !802)
!799 = !DISubroutineType(types: !800)
!800 = !{!312, !312, !801}
!801 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !314, size: 64)
!802 = !{!803, !804, !805, !806, !807, !810, !813, !814, !815, !816}
!803 = !DILocalVariable(name: "argc", arg: 1, scope: !798, file: !2, line: 1019, type: !312)
!804 = !DILocalVariable(name: "argv", arg: 2, scope: !798, file: !2, line: 1019, type: !801)
!805 = !DILocalVariable(name: "err", scope: !798, file: !2, line: 1021, type: !312)
!806 = !DILocalVariable(name: "detach_err", scope: !798, file: !2, line: 1021, type: !312)
!807 = !DILocalVariable(name: "obj", scope: !798, file: !2, line: 1022, type: !808)
!808 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !809, size: 64)
!809 = !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_object", file: !70, line: 66, flags: DIFlagFwdDecl)
!810 = !DILocalVariable(name: "pb", scope: !798, file: !2, line: 1023, type: !811)
!811 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !812, size: 64)
!812 = !DICompositeType(tag: DW_TAG_structure_type, name: "perf_buffer", file: !70, line: 908, flags: DIFlagFwdDecl)
!813 = !DILocalVariable(name: "tc_ingress_opts", scope: !798, file: !2, line: 1025, type: !713)
!814 = !DILocalVariable(name: "tc_egress_opts", scope: !798, file: !2, line: 1026, type: !713)
!815 = !DILocalVariable(name: "config", scope: !798, file: !2, line: 1028, type: !700)
!816 = !DILabel(scope: !798, name: "cleanup_attached_progs", file: !2, line: 1141)
!817 = !DILocation(line: 1019, column: 14, scope: !798)
!818 = !DILocation(line: 1019, column: 26, scope: !798)
!819 = !DILocation(line: 1021, column: 2, scope: !798)
!820 = !DILocation(line: 1021, column: 6, scope: !798)
!821 = !DILocation(line: 1021, column: 15, scope: !798)
!822 = !DILocation(line: 1022, column: 2, scope: !798)
!823 = !DILocation(line: 1022, column: 21, scope: !798)
!824 = !DILocation(line: 1023, column: 2, scope: !798)
!825 = !DILocation(line: 1023, column: 22, scope: !798)
!826 = !DILocation(line: 1025, column: 2, scope: !798)
!827 = !DILocation(line: 1025, column: 2, scope: !828)
!828 = distinct !DILexicalBlock(scope: !798, file: !2, line: 1025, column: 2)
!829 = !{!757, !758, i64 0}
!830 = !DILocation(line: 1026, column: 2, scope: !798)
!831 = !DILocation(line: 1026, column: 2, scope: !832)
!832 = distinct !DILexicalBlock(scope: !798, file: !2, line: 1026, column: 2)
!833 = !DILocation(line: 1028, column: 2, scope: !798)
!834 = !DILocation(line: 1028, column: 22, scope: !798)
!835 = !DILocation(line: 1028, column: 31, scope: !798)
!836 = !DILocation(line: 1029, column: 17, scope: !798)
!837 = !{!753, !754, i64 0}
!838 = !{!753, !754, i64 8}
!839 = !{!753, !755, i64 16}
!840 = !{!753, !755, i64 17}
!841 = !{!753, !755, i64 18}
!842 = !{!753, !755, i64 19}
!843 = !{!753, !756, i64 20}
!844 = !DILocation(line: 1040, column: 22, scope: !798)
!845 = !{i64 0, i64 8, !846, i64 8, i64 4, !794, i64 12, i64 4, !794, i64 16, i64 4, !794, i64 20, i64 4, !794, i64 24, i64 4, !794}
!846 = !{!758, !758, i64 0}
!847 = !DILocation(line: 1041, column: 21, scope: !798)
!848 = !{!752, !754, i64 88}
!849 = !{!752, !742, i64 96}
!850 = !{!752, !742, i64 104}
!851 = !{!752, !742, i64 112}
!852 = !{!752, !742, i64 120}
!853 = !{!752, !742, i64 128}
!854 = !{!752, !742, i64 136}
!855 = !{!752, !756, i64 144}
!856 = !{!752, !756, i64 148}
!857 = !{!752, !756, i64 152}
!858 = !{!752, !756, i64 156}
!859 = !{!752, !743, i64 176}
!860 = !{!752, !755, i64 180}
!861 = !{!752, !755, i64 181}
!862 = !DILocation(line: 1046, column: 6, scope: !863)
!863 = distinct !DILexicalBlock(scope: !798, file: !2, line: 1046, column: 6)
!864 = !DILocation(line: 1046, column: 16, scope: !863)
!865 = !DILocation(line: 1046, column: 6, scope: !798)
!866 = !DILocation(line: 1047, column: 3, scope: !867)
!867 = distinct !DILexicalBlock(scope: !863, file: !2, line: 1046, column: 22)
!868 = !DILocation(line: 1048, column: 3, scope: !867)
!869 = !DILocation(line: 1052, column: 8, scope: !798)
!870 = !DILocation(line: 1052, column: 6, scope: !798)
!871 = !DILocation(line: 1053, column: 6, scope: !872)
!872 = distinct !DILexicalBlock(scope: !798, file: !2, line: 1053, column: 6)
!873 = !DILocation(line: 1053, column: 6, scope: !798)
!874 = !DILocation(line: 1054, column: 11, scope: !875)
!875 = distinct !DILexicalBlock(scope: !872, file: !2, line: 1053, column: 11)
!876 = !DILocation(line: 1055, column: 24, scope: !875)
!877 = !DILocation(line: 1055, column: 4, scope: !875)
!878 = !DILocation(line: 1054, column: 3, scope: !875)
!879 = !DILocation(line: 1056, column: 3, scope: !875)
!880 = !DILocation(line: 1059, column: 24, scope: !798)
!881 = !DILocation(line: 1059, column: 30, scope: !798)
!882 = !DILocation(line: 1059, column: 8, scope: !798)
!883 = !DILocation(line: 1059, column: 6, scope: !798)
!884 = !DILocation(line: 1060, column: 6, scope: !885)
!885 = distinct !DILexicalBlock(scope: !798, file: !2, line: 1060, column: 6)
!886 = !DILocation(line: 1060, column: 6, scope: !798)
!887 = !DILocation(line: 1061, column: 11, scope: !888)
!888 = distinct !DILexicalBlock(scope: !885, file: !2, line: 1060, column: 11)
!889 = !DILocation(line: 1062, column: 24, scope: !888)
!890 = !DILocation(line: 1062, column: 4, scope: !888)
!891 = !DILocation(line: 1061, column: 3, scope: !888)
!892 = !DILocation(line: 1063, column: 15, scope: !888)
!893 = !DILocation(line: 1063, column: 3, scope: !888)
!894 = !DILocation(line: 1064, column: 3, scope: !888)
!895 = !DILocation(line: 1067, column: 14, scope: !896)
!896 = distinct !DILexicalBlock(scope: !798, file: !2, line: 1067, column: 6)
!897 = !DILocation(line: 1067, column: 25, scope: !896)
!898 = !DILocation(line: 1067, column: 35, scope: !896)
!899 = !DILocation(line: 1067, column: 46, scope: !896)
!900 = !DILocation(line: 1067, column: 57, scope: !896)
!901 = !DILocation(line: 1067, column: 6, scope: !798)
!902 = !DILocation(line: 1068, column: 10, scope: !896)
!903 = !DILocation(line: 1068, column: 21, scope: !896)
!904 = !DILocation(line: 1068, column: 31, scope: !896)
!905 = !DILocation(line: 1068, column: 3, scope: !896)
!906 = !DILocation(line: 1070, column: 13, scope: !907)
!907 = distinct !DILexicalBlock(scope: !798, file: !2, line: 1070, column: 6)
!908 = !DILocation(line: 1070, column: 24, scope: !907)
!909 = !DILocation(line: 1070, column: 35, scope: !907)
!910 = !DILocation(line: 1071, column: 13, scope: !907)
!911 = !DILocation(line: 1071, column: 27, scope: !907)
!912 = !DILocation(line: 1070, column: 6, scope: !798)
!913 = !DILocation(line: 1072, column: 11, scope: !907)
!914 = !DILocation(line: 1072, column: 3, scope: !907)
!915 = !DILocation(line: 1075, column: 17, scope: !798)
!916 = !DILocation(line: 1075, column: 2, scope: !798)
!917 = !DILocation(line: 1077, column: 20, scope: !918)
!918 = distinct !DILexicalBlock(scope: !798, file: !2, line: 1075, column: 32)
!919 = !DILocation(line: 1078, column: 3, scope: !918)
!920 = !DILocation(line: 1080, column: 20, scope: !918)
!921 = !DILocation(line: 1081, column: 3, scope: !918)
!922 = !DILocation(line: 1083, column: 20, scope: !918)
!923 = !DILocation(line: 1084, column: 3, scope: !918)
!924 = !DILocation(line: 1087, column: 10, scope: !798)
!925 = !DILocation(line: 1088, column: 31, scope: !798)
!926 = !DILocation(line: 1088, column: 3, scope: !798)
!927 = !DILocation(line: 1089, column: 3, scope: !798)
!928 = !DILocation(line: 1089, column: 45, scope: !798)
!929 = !DILocation(line: 1089, column: 38, scope: !798)
!930 = !DILocation(line: 1087, column: 2, scope: !798)
!931 = !DILocation(line: 1091, column: 8, scope: !798)
!932 = !DILocation(line: 1091, column: 6, scope: !798)
!933 = !DILocation(line: 1092, column: 6, scope: !934)
!934 = distinct !DILexicalBlock(scope: !798, file: !2, line: 1092, column: 6)
!935 = !DILocation(line: 1092, column: 6, scope: !798)
!936 = !DILocation(line: 1093, column: 11, scope: !937)
!937 = distinct !DILexicalBlock(scope: !934, file: !2, line: 1092, column: 11)
!938 = !DILocation(line: 1095, column: 11, scope: !937)
!939 = !DILocation(line: 1093, column: 3, scope: !937)
!940 = !DILocation(line: 1096, column: 3, scope: !937)
!941 = !DILocation(line: 1099, column: 38, scope: !798)
!942 = !DILocation(line: 1099, column: 8, scope: !798)
!943 = !DILocation(line: 1099, column: 6, scope: !798)
!944 = !DILocation(line: 1100, column: 6, scope: !945)
!945 = distinct !DILexicalBlock(scope: !798, file: !2, line: 1100, column: 6)
!946 = !DILocation(line: 1100, column: 6, scope: !798)
!947 = !DILocation(line: 1101, column: 11, scope: !948)
!948 = distinct !DILexicalBlock(scope: !945, file: !2, line: 1100, column: 11)
!949 = !DILocation(line: 1102, column: 24, scope: !948)
!950 = !DILocation(line: 1102, column: 4, scope: !948)
!951 = !DILocation(line: 1101, column: 3, scope: !948)
!952 = !DILocation(line: 1103, column: 3, scope: !948)
!953 = !DILocation(line: 1107, column: 7, scope: !798)
!954 = !DILocation(line: 1107, column: 5, scope: !798)
!955 = !DILocation(line: 1111, column: 25, scope: !798)
!956 = !DILocation(line: 1111, column: 8, scope: !798)
!957 = !DILocation(line: 1111, column: 6, scope: !798)
!958 = !DILocation(line: 1112, column: 6, scope: !959)
!959 = distinct !DILexicalBlock(scope: !798, file: !2, line: 1112, column: 6)
!960 = !DILocation(line: 1112, column: 6, scope: !798)
!961 = !DILocation(line: 1113, column: 11, scope: !962)
!962 = distinct !DILexicalBlock(scope: !959, file: !2, line: 1112, column: 11)
!963 = !DILocation(line: 1114, column: 11, scope: !962)
!964 = !DILocation(line: 1114, column: 42, scope: !962)
!965 = !DILocation(line: 1114, column: 22, scope: !962)
!966 = !DILocation(line: 1113, column: 3, scope: !962)
!967 = !DILocation(line: 1115, column: 3, scope: !962)
!968 = !DILocation(line: 1119, column: 2, scope: !798)
!969 = !DILocation(line: 1120, column: 2, scope: !798)
!970 = !DILocation(line: 1123, column: 2, scope: !798)
!971 = !DILocation(line: 1123, column: 9, scope: !798)
!972 = !DILocation(line: 1124, column: 32, scope: !973)
!973 = distinct !DILexicalBlock(scope: !974, file: !2, line: 1124, column: 7)
!974 = distinct !DILexicalBlock(scope: !798, file: !2, line: 1123, column: 23)
!975 = !DILocation(line: 1124, column: 14, scope: !973)
!976 = !DILocation(line: 1124, column: 12, scope: !973)
!977 = !DILocation(line: 1124, column: 59, scope: !973)
!978 = !DILocation(line: 1124, column: 7, scope: !974)
!979 = !DILocation(line: 1125, column: 8, scope: !980)
!980 = distinct !DILexicalBlock(scope: !981, file: !2, line: 1125, column: 8)
!981 = distinct !DILexicalBlock(scope: !973, file: !2, line: 1124, column: 64)
!982 = !DILocation(line: 1125, column: 8, scope: !981)
!983 = !DILocation(line: 1126, column: 13, scope: !980)
!984 = !DILocation(line: 1128, column: 27, scope: !980)
!985 = !DILocation(line: 1128, column: 26, scope: !980)
!986 = !DILocation(line: 1128, column: 6, scope: !980)
!987 = !DILocation(line: 1126, column: 5, scope: !980)
!988 = !DILocation(line: 1129, column: 4, scope: !981)
!989 = distinct !{!989, !970, !990, !991}
!990 = !DILocation(line: 1131, column: 2, scope: !798)
!991 = !{!"llvm.loop.mustprogress"}
!992 = !DILocation(line: 1134, column: 13, scope: !993)
!993 = distinct !DILexicalBlock(scope: !798, file: !2, line: 1134, column: 6)
!994 = !DILocation(line: 1134, column: 27, scope: !993)
!995 = !DILocation(line: 1134, column: 48, scope: !993)
!996 = !DILocation(line: 1134, column: 51, scope: !993)
!997 = !DILocation(line: 1134, column: 6, scope: !798)
!998 = !DILocation(line: 1135, column: 19, scope: !999)
!999 = distinct !DILexicalBlock(scope: !993, file: !2, line: 1134, column: 61)
!1000 = !DILocation(line: 1135, column: 3, scope: !999)
!1001 = !DILocation(line: 1136, column: 3, scope: !999)
!1002 = !DILocation(line: 1137, column: 2, scope: !999)
!1003 = !DILocation(line: 1139, column: 20, scope: !798)
!1004 = !DILocation(line: 1139, column: 2, scope: !798)
!1005 = !DILocation(line: 1141, column: 1, scope: !798)
!1006 = !DILocation(line: 1142, column: 20, scope: !1007)
!1007 = distinct !DILexicalBlock(scope: !798, file: !2, line: 1142, column: 6)
!1008 = !DILocation(line: 1142, column: 6, scope: !1007)
!1009 = !DILocation(line: 1142, column: 55, scope: !1007)
!1010 = !DILocation(line: 1142, column: 6, scope: !798)
!1011 = !DILocation(line: 1143, column: 34, scope: !1007)
!1012 = !DILocation(line: 1143, column: 50, scope: !1007)
!1013 = !DILocation(line: 1144, column: 13, scope: !1007)
!1014 = !DILocation(line: 1143, column: 16, scope: !1007)
!1015 = !DILocation(line: 1143, column: 14, scope: !1007)
!1016 = !DILocation(line: 1143, column: 3, scope: !1007)
!1017 = !DILocation(line: 1146, column: 33, scope: !1007)
!1018 = !DILocation(line: 1147, column: 20, scope: !1007)
!1019 = !DILocation(line: 1146, column: 16, scope: !1007)
!1020 = !DILocation(line: 1146, column: 14, scope: !1007)
!1021 = !DILocation(line: 1148, column: 6, scope: !1022)
!1022 = distinct !DILexicalBlock(scope: !798, file: !2, line: 1148, column: 6)
!1023 = !DILocation(line: 1148, column: 6, scope: !798)
!1024 = !DILocation(line: 1149, column: 11, scope: !1022)
!1025 = !DILocation(line: 1151, column: 11, scope: !1022)
!1026 = !DILocation(line: 1151, column: 4, scope: !1022)
!1027 = !DILocation(line: 1151, column: 39, scope: !1022)
!1028 = !DILocation(line: 1151, column: 19, scope: !1022)
!1029 = !DILocation(line: 1149, column: 3, scope: !1022)
!1030 = !DILocation(line: 1154, column: 20, scope: !798)
!1031 = !DILocation(line: 1154, column: 52, scope: !798)
!1032 = !DILocation(line: 1155, column: 13, scope: !798)
!1033 = !DILocation(line: 1155, column: 19, scope: !798)
!1034 = !DILocation(line: 1155, column: 29, scope: !798)
!1035 = !DILocation(line: 0, scope: !798)
!1036 = !DILocation(line: 1154, column: 3, scope: !798)
!1037 = !DILocation(line: 1153, column: 13, scope: !798)
!1038 = !DILocation(line: 1156, column: 6, scope: !1039)
!1039 = distinct !DILexicalBlock(scope: !798, file: !2, line: 1156, column: 6)
!1040 = !DILocation(line: 1156, column: 6, scope: !798)
!1041 = !DILocation(line: 1157, column: 11, scope: !1039)
!1042 = !DILocation(line: 1159, column: 11, scope: !1039)
!1043 = !DILocation(line: 1159, column: 4, scope: !1039)
!1044 = !DILocation(line: 1159, column: 39, scope: !1039)
!1045 = !DILocation(line: 1159, column: 19, scope: !1039)
!1046 = !DILocation(line: 1157, column: 3, scope: !1039)
!1047 = !DILocation(line: 1161, column: 10, scope: !798)
!1048 = !DILocation(line: 1161, column: 14, scope: !798)
!1049 = !DILocation(line: 1161, column: 19, scope: !798)
!1050 = !DILocation(line: 1161, column: 22, scope: !798)
!1051 = !DILocation(line: 1161, column: 36, scope: !798)
!1052 = !DILocation(line: 1161, column: 39, scope: !798)
!1053 = !DILocation(line: 1161, column: 50, scope: !798)
!1054 = !DILocation(line: 1161, column: 2, scope: !798)
!1055 = !DILocation(line: 1162, column: 1, scope: !798)
!1056 = !DISubprogram(name: "geteuid", scope: !1057, file: !1057, line: 700, type: !1058, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !760)
!1057 = !DIFile(filename: "/usr/include/unistd.h", directory: "", checksumkind: CSK_MD5, checksum: "ed37c2e6f30ba31a8b41e4d70547c39c")
!1058 = !DISubroutineType(types: !1059)
!1059 = !{!1060}
!1060 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uid_t", file: !139, line: 146, baseType: !39)
!1061 = !DISubprogram(name: "printf", scope: !304, file: !304, line: 356, type: !1062, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !1064)
!1062 = !DISubroutineType(types: !1063)
!1063 = !{!312, !379, null}
!1064 = !{!1065}
!1065 = !DILocalVariable(name: "__format", arg: 1, scope: !1061, file: !304, line: 356, type: !379)
!1066 = distinct !DISubprogram(name: "set_rlimit", scope: !2, file: !2, line: 313, type: !1067, scopeLine: 314, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !1069)
!1067 = !DISubroutineType(types: !1068)
!1068 = !{!312, !334}
!1069 = !{!1070, !1071}
!1070 = !DILocalVariable(name: "lim", arg: 1, scope: !1066, file: !2, line: 313, type: !334)
!1071 = !DILocalVariable(name: "rlim", scope: !1066, file: !2, line: 315, type: !1072)
!1072 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rlimit", file: !76, line: 139, size: 128, elements: !1073)
!1073 = !{!1074, !1076}
!1074 = !DIDerivedType(tag: DW_TAG_member, name: "rlim_cur", scope: !1072, file: !76, line: 142, baseType: !1075, size: 64)
!1075 = !DIDerivedType(tag: DW_TAG_typedef, name: "rlim_t", file: !76, line: 131, baseType: !138)
!1076 = !DIDerivedType(tag: DW_TAG_member, name: "rlim_max", scope: !1072, file: !76, line: 144, baseType: !1075, size: 64, offset: 64)
!1077 = !DILocation(line: 313, column: 32, scope: !1066)
!1078 = !DILocation(line: 315, column: 2, scope: !1066)
!1079 = !DILocation(line: 315, column: 16, scope: !1066)
!1080 = !DILocation(line: 315, column: 23, scope: !1066)
!1081 = !DILocation(line: 316, column: 15, scope: !1066)
!1082 = !{!1083, !758, i64 0}
!1083 = !{!"rlimit", !758, i64 0, !758, i64 8}
!1084 = !DILocation(line: 317, column: 15, scope: !1066)
!1085 = !{!1083, !758, i64 8}
!1086 = !DILocation(line: 320, column: 10, scope: !1066)
!1087 = !DILocation(line: 320, column: 9, scope: !1066)
!1088 = !DILocation(line: 320, column: 50, scope: !1066)
!1089 = !DILocation(line: 320, column: 49, scope: !1066)
!1090 = !DILocation(line: 321, column: 1, scope: !1066)
!1091 = !DILocation(line: 320, column: 2, scope: !1066)
!1092 = !DISubprogram(name: "fprintf", scope: !304, file: !304, line: 350, type: !1093, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !1095)
!1093 = !DISubroutineType(types: !1094)
!1094 = !{!312, !305, !379, null}
!1095 = !{!1096, !1097}
!1096 = !DILocalVariable(name: "__stream", arg: 1, scope: !1092, file: !304, line: 350, type: !305)
!1097 = !DILocalVariable(name: "__format", arg: 2, scope: !1092, file: !304, line: 350, type: !379)
!1098 = !DILocation(line: 143, column: 44, scope: !376)
!1099 = !DILocation(line: 146, column: 18, scope: !376)
!1100 = !DILocation(line: 146, column: 2, scope: !376)
!1101 = !DILocation(line: 147, column: 2, scope: !376)
!1102 = distinct !DISubprogram(name: "parse_arguments", scope: !2, file: !2, line: 167, type: !1103, scopeLine: 168, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !1105)
!1103 = !DISubroutineType(types: !1104)
!1104 = !{!312, !312, !801, !699}
!1105 = !{!1106, !1107, !1108, !1109, !1110, !1111, !1113, !1114}
!1106 = !DILocalVariable(name: "argc", arg: 1, scope: !1102, file: !2, line: 167, type: !312)
!1107 = !DILocalVariable(name: "argv", arg: 2, scope: !1102, file: !2, line: 167, type: !801)
!1108 = !DILocalVariable(name: "config", arg: 3, scope: !1102, file: !2, line: 167, type: !699)
!1109 = !DILocalVariable(name: "err", scope: !1102, file: !2, line: 169, type: !312)
!1110 = !DILocalVariable(name: "opt", scope: !1102, file: !2, line: 169, type: !312)
!1111 = !DILocalVariable(name: "rate_limit_ms", scope: !1102, file: !2, line: 170, type: !1112)
!1112 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!1113 = !DILocalVariable(name: "cleanup_interval_s", scope: !1102, file: !2, line: 170, type: !1112)
!1114 = !DILocalVariable(name: "rtt_rate", scope: !1102, file: !2, line: 170, type: !1112)
!1115 = !DILocation(line: 167, column: 32, scope: !1102)
!1116 = !DILocation(line: 167, column: 44, scope: !1102)
!1117 = !DILocation(line: 167, column: 73, scope: !1102)
!1118 = !DILocation(line: 169, column: 2, scope: !1102)
!1119 = !DILocation(line: 169, column: 6, scope: !1102)
!1120 = !DILocation(line: 169, column: 11, scope: !1102)
!1121 = !DILocation(line: 170, column: 2, scope: !1102)
!1122 = !DILocation(line: 170, column: 9, scope: !1102)
!1123 = !DILocation(line: 170, column: 24, scope: !1102)
!1124 = !DILocation(line: 170, column: 44, scope: !1102)
!1125 = !DILocation(line: 172, column: 2, scope: !1102)
!1126 = !DILocation(line: 172, column: 10, scope: !1102)
!1127 = !DILocation(line: 172, column: 18, scope: !1102)
!1128 = !DILocation(line: 173, column: 2, scope: !1102)
!1129 = !DILocation(line: 173, column: 10, scope: !1102)
!1130 = !DILocation(line: 173, column: 21, scope: !1102)
!1131 = !DILocation(line: 173, column: 31, scope: !1102)
!1132 = !{!752, !755, i64 19}
!1133 = !DILocation(line: 174, column: 2, scope: !1102)
!1134 = !DILocation(line: 174, column: 10, scope: !1102)
!1135 = !DILocation(line: 174, column: 16, scope: !1102)
!1136 = !DILocation(line: 175, column: 2, scope: !1102)
!1137 = !DILocation(line: 175, column: 10, scope: !1102)
!1138 = !DILocation(line: 175, column: 21, scope: !1102)
!1139 = !DILocation(line: 175, column: 31, scope: !1102)
!1140 = !DILocation(line: 176, column: 2, scope: !1102)
!1141 = !DILocation(line: 176, column: 10, scope: !1102)
!1142 = !DILocation(line: 176, column: 21, scope: !1102)
!1143 = !DILocation(line: 176, column: 32, scope: !1102)
!1144 = !DILocation(line: 178, column: 2, scope: !1102)
!1145 = !DILocation(line: 178, column: 28, scope: !1102)
!1146 = !DILocation(line: 178, column: 34, scope: !1102)
!1147 = !DILocation(line: 178, column: 16, scope: !1102)
!1148 = !DILocation(line: 178, column: 14, scope: !1102)
!1149 = !DILocation(line: 179, column: 14, scope: !1102)
!1150 = !DILocation(line: 180, column: 11, scope: !1151)
!1151 = distinct !DILexicalBlock(scope: !1102, file: !2, line: 179, column: 21)
!1152 = !DILocation(line: 180, column: 3, scope: !1151)
!1153 = !DILocation(line: 182, column: 15, scope: !1154)
!1154 = distinct !DILexicalBlock(scope: !1155, file: !2, line: 182, column: 8)
!1155 = distinct !DILexicalBlock(scope: !1151, file: !2, line: 180, column: 16)
!1156 = !DILocation(line: 182, column: 8, scope: !1154)
!1157 = !DILocation(line: 182, column: 23, scope: !1154)
!1158 = !DILocation(line: 182, column: 8, scope: !1155)
!1159 = !DILocation(line: 183, column: 13, scope: !1160)
!1160 = distinct !DILexicalBlock(scope: !1154, file: !2, line: 182, column: 38)
!1161 = !DILocation(line: 183, column: 5, scope: !1160)
!1162 = !DILocation(line: 184, column: 5, scope: !1160)
!1163 = !DILocation(line: 186, column: 12, scope: !1155)
!1164 = !DILocation(line: 186, column: 20, scope: !1155)
!1165 = !DILocation(line: 186, column: 28, scope: !1155)
!1166 = !DILocation(line: 186, column: 4, scope: !1155)
!1167 = !DILocation(line: 188, column: 37, scope: !1155)
!1168 = !DILocation(line: 188, column: 45, scope: !1155)
!1169 = !DILocation(line: 188, column: 22, scope: !1155)
!1170 = !DILocation(line: 188, column: 4, scope: !1155)
!1171 = !DILocation(line: 188, column: 12, scope: !1155)
!1172 = !DILocation(line: 188, column: 20, scope: !1155)
!1173 = !DILocation(line: 189, column: 8, scope: !1174)
!1174 = distinct !DILexicalBlock(scope: !1155, file: !2, line: 189, column: 8)
!1175 = !DILocation(line: 189, column: 16, scope: !1174)
!1176 = !DILocation(line: 189, column: 24, scope: !1174)
!1177 = !DILocation(line: 189, column: 8, scope: !1155)
!1178 = !DILocation(line: 190, column: 12, scope: !1179)
!1179 = distinct !DILexicalBlock(scope: !1174, file: !2, line: 189, column: 30)
!1180 = !DILocation(line: 190, column: 11, scope: !1179)
!1181 = !DILocation(line: 190, column: 9, scope: !1179)
!1182 = !DILocation(line: 191, column: 13, scope: !1179)
!1183 = !DILocation(line: 193, column: 6, scope: !1179)
!1184 = !DILocation(line: 193, column: 14, scope: !1179)
!1185 = !DILocation(line: 193, column: 42, scope: !1179)
!1186 = !DILocation(line: 193, column: 22, scope: !1179)
!1187 = !DILocation(line: 191, column: 5, scope: !1179)
!1188 = !DILocation(line: 194, column: 12, scope: !1179)
!1189 = !DILocation(line: 194, column: 5, scope: !1179)
!1190 = !DILocation(line: 196, column: 4, scope: !1155)
!1191 = !DILocation(line: 198, column: 47, scope: !1155)
!1192 = !DILocation(line: 198, column: 10, scope: !1155)
!1193 = !DILocation(line: 198, column: 8, scope: !1155)
!1194 = !DILocation(line: 201, column: 8, scope: !1195)
!1195 = distinct !DILexicalBlock(scope: !1155, file: !2, line: 201, column: 8)
!1196 = !DILocation(line: 201, column: 8, scope: !1155)
!1197 = !DILocation(line: 202, column: 5, scope: !1195)
!1198 = !DILocation(line: 205, column: 5, scope: !1155)
!1199 = !{!1200, !1200, i64 0}
!1200 = !{!"double", !743, i64 0}
!1201 = !DILocation(line: 205, column: 19, scope: !1155)
!1202 = !DILocation(line: 204, column: 4, scope: !1155)
!1203 = !DILocation(line: 204, column: 12, scope: !1155)
!1204 = !DILocation(line: 204, column: 23, scope: !1155)
!1205 = !DILocation(line: 204, column: 34, scope: !1155)
!1206 = !{!752, !754, i64 0}
!1207 = !DILocation(line: 206, column: 4, scope: !1155)
!1208 = !DILocation(line: 208, column: 42, scope: !1155)
!1209 = !DILocation(line: 208, column: 10, scope: !1155)
!1210 = !DILocation(line: 208, column: 8, scope: !1155)
!1211 = !DILocation(line: 210, column: 8, scope: !1212)
!1212 = distinct !DILexicalBlock(scope: !1155, file: !2, line: 210, column: 8)
!1213 = !DILocation(line: 210, column: 8, scope: !1155)
!1214 = !DILocation(line: 211, column: 5, scope: !1212)
!1215 = !DILocation(line: 213, column: 5, scope: !1155)
!1216 = !DILocation(line: 212, column: 4, scope: !1155)
!1217 = !DILocation(line: 212, column: 12, scope: !1155)
!1218 = !DILocation(line: 212, column: 23, scope: !1155)
!1219 = !DILocation(line: 212, column: 32, scope: !1155)
!1220 = !{!752, !754, i64 8}
!1221 = !DILocation(line: 214, column: 4, scope: !1155)
!1222 = !DILocation(line: 216, column: 15, scope: !1223)
!1223 = distinct !DILexicalBlock(scope: !1155, file: !2, line: 216, column: 8)
!1224 = !DILocation(line: 216, column: 8, scope: !1223)
!1225 = !DILocation(line: 216, column: 30, scope: !1223)
!1226 = !DILocation(line: 216, column: 8, scope: !1155)
!1227 = !DILocation(line: 217, column: 5, scope: !1228)
!1228 = distinct !DILexicalBlock(scope: !1223, file: !2, line: 216, column: 36)
!1229 = !DILocation(line: 217, column: 13, scope: !1228)
!1230 = !DILocation(line: 217, column: 24, scope: !1228)
!1231 = !DILocation(line: 217, column: 33, scope: !1228)
!1232 = !{!752, !755, i64 16}
!1233 = !DILocation(line: 218, column: 4, scope: !1228)
!1234 = !DILocation(line: 219, column: 20, scope: !1235)
!1235 = distinct !DILexicalBlock(scope: !1223, file: !2, line: 219, column: 13)
!1236 = !DILocation(line: 219, column: 13, scope: !1235)
!1237 = !DILocation(line: 219, column: 40, scope: !1235)
!1238 = !DILocation(line: 219, column: 13, scope: !1223)
!1239 = !DILocation(line: 220, column: 5, scope: !1240)
!1240 = distinct !DILexicalBlock(scope: !1235, file: !2, line: 219, column: 46)
!1241 = !DILocation(line: 220, column: 13, scope: !1240)
!1242 = !DILocation(line: 220, column: 24, scope: !1240)
!1243 = !DILocation(line: 220, column: 33, scope: !1240)
!1244 = !DILocation(line: 221, column: 4, scope: !1240)
!1245 = !DILocation(line: 222, column: 13, scope: !1246)
!1246 = distinct !DILexicalBlock(scope: !1235, file: !2, line: 221, column: 11)
!1247 = !DILocation(line: 222, column: 5, scope: !1246)
!1248 = !DILocation(line: 224, column: 5, scope: !1246)
!1249 = !DILocation(line: 226, column: 4, scope: !1155)
!1250 = !DILocation(line: 228, column: 52, scope: !1155)
!1251 = !DILocation(line: 228, column: 10, scope: !1155)
!1252 = !DILocation(line: 228, column: 8, scope: !1155)
!1253 = !DILocation(line: 231, column: 8, scope: !1254)
!1254 = distinct !DILexicalBlock(scope: !1155, file: !2, line: 231, column: 8)
!1255 = !DILocation(line: 231, column: 8, scope: !1155)
!1256 = !DILocation(line: 232, column: 5, scope: !1254)
!1257 = !DILocation(line: 235, column: 5, scope: !1155)
!1258 = !DILocation(line: 235, column: 24, scope: !1155)
!1259 = !DILocation(line: 234, column: 4, scope: !1155)
!1260 = !DILocation(line: 234, column: 12, scope: !1155)
!1261 = !DILocation(line: 234, column: 29, scope: !1155)
!1262 = !DILocation(line: 236, column: 4, scope: !1155)
!1263 = !DILocation(line: 238, column: 15, scope: !1264)
!1264 = distinct !DILexicalBlock(scope: !1155, file: !2, line: 238, column: 8)
!1265 = !DILocation(line: 238, column: 8, scope: !1264)
!1266 = !DILocation(line: 238, column: 35, scope: !1264)
!1267 = !DILocation(line: 238, column: 8, scope: !1155)
!1268 = !DILocation(line: 239, column: 5, scope: !1269)
!1269 = distinct !DILexicalBlock(scope: !1264, file: !2, line: 238, column: 41)
!1270 = !DILocation(line: 239, column: 13, scope: !1269)
!1271 = !DILocation(line: 239, column: 27, scope: !1269)
!1272 = !DILocation(line: 240, column: 4, scope: !1269)
!1273 = !DILocation(line: 240, column: 22, scope: !1274)
!1274 = distinct !DILexicalBlock(scope: !1264, file: !2, line: 240, column: 15)
!1275 = !DILocation(line: 240, column: 15, scope: !1274)
!1276 = !DILocation(line: 240, column: 38, scope: !1274)
!1277 = !DILocation(line: 240, column: 15, scope: !1264)
!1278 = !DILocation(line: 241, column: 5, scope: !1279)
!1279 = distinct !DILexicalBlock(scope: !1274, file: !2, line: 240, column: 44)
!1280 = !DILocation(line: 241, column: 13, scope: !1279)
!1281 = !DILocation(line: 241, column: 27, scope: !1279)
!1282 = !DILocation(line: 242, column: 4, scope: !1279)
!1283 = !DILocation(line: 242, column: 22, scope: !1284)
!1284 = distinct !DILexicalBlock(scope: !1274, file: !2, line: 242, column: 15)
!1285 = !DILocation(line: 242, column: 15, scope: !1284)
!1286 = !DILocation(line: 242, column: 39, scope: !1284)
!1287 = !DILocation(line: 242, column: 15, scope: !1274)
!1288 = !DILocation(line: 243, column: 5, scope: !1289)
!1289 = distinct !DILexicalBlock(scope: !1284, file: !2, line: 242, column: 45)
!1290 = !DILocation(line: 243, column: 13, scope: !1289)
!1291 = !DILocation(line: 243, column: 27, scope: !1289)
!1292 = !DILocation(line: 244, column: 4, scope: !1289)
!1293 = !DILocation(line: 245, column: 13, scope: !1294)
!1294 = distinct !DILexicalBlock(scope: !1284, file: !2, line: 244, column: 11)
!1295 = !DILocation(line: 245, column: 5, scope: !1294)
!1296 = !DILocation(line: 246, column: 5, scope: !1294)
!1297 = !DILocation(line: 248, column: 4, scope: !1155)
!1298 = !DILocation(line: 250, column: 15, scope: !1299)
!1299 = distinct !DILexicalBlock(scope: !1155, file: !2, line: 250, column: 8)
!1300 = !DILocation(line: 250, column: 8, scope: !1299)
!1301 = !DILocation(line: 250, column: 30, scope: !1299)
!1302 = !DILocation(line: 250, column: 8, scope: !1155)
!1303 = !DILocation(line: 251, column: 5, scope: !1304)
!1304 = distinct !DILexicalBlock(scope: !1299, file: !2, line: 250, column: 36)
!1305 = !DILocation(line: 251, column: 13, scope: !1304)
!1306 = !DILocation(line: 251, column: 26, scope: !1304)
!1307 = !DILocation(line: 252, column: 4, scope: !1304)
!1308 = !DILocation(line: 252, column: 22, scope: !1309)
!1309 = distinct !DILexicalBlock(scope: !1299, file: !2, line: 252, column: 15)
!1310 = !DILocation(line: 252, column: 15, scope: !1309)
!1311 = !DILocation(line: 252, column: 36, scope: !1309)
!1312 = !DILocation(line: 252, column: 15, scope: !1299)
!1313 = !DILocation(line: 253, column: 5, scope: !1314)
!1314 = distinct !DILexicalBlock(scope: !1309, file: !2, line: 252, column: 42)
!1315 = !DILocation(line: 253, column: 13, scope: !1314)
!1316 = !DILocation(line: 253, column: 26, scope: !1314)
!1317 = !DILocation(line: 254, column: 4, scope: !1314)
!1318 = !DILocation(line: 255, column: 13, scope: !1319)
!1319 = distinct !DILexicalBlock(scope: !1309, file: !2, line: 254, column: 11)
!1320 = !DILocation(line: 255, column: 5, scope: !1319)
!1321 = !DILocation(line: 256, column: 5, scope: !1319)
!1322 = !DILocation(line: 258, column: 4, scope: !1155)
!1323 = !DILocation(line: 260, column: 4, scope: !1155)
!1324 = !DILocation(line: 260, column: 12, scope: !1155)
!1325 = !DILocation(line: 260, column: 23, scope: !1155)
!1326 = !DILocation(line: 260, column: 33, scope: !1155)
!1327 = !DILocation(line: 261, column: 4, scope: !1155)
!1328 = !DILocation(line: 263, column: 4, scope: !1155)
!1329 = !DILocation(line: 263, column: 12, scope: !1155)
!1330 = !DILocation(line: 263, column: 18, scope: !1155)
!1331 = !DILocation(line: 264, column: 4, scope: !1155)
!1332 = !DILocation(line: 264, column: 12, scope: !1155)
!1333 = !DILocation(line: 264, column: 22, scope: !1155)
!1334 = !DILocation(line: 265, column: 4, scope: !1155)
!1335 = !DILocation(line: 267, column: 4, scope: !1155)
!1336 = !DILocation(line: 267, column: 12, scope: !1155)
!1337 = !DILocation(line: 267, column: 23, scope: !1155)
!1338 = !DILocation(line: 267, column: 33, scope: !1155)
!1339 = !DILocation(line: 268, column: 4, scope: !1155)
!1340 = !DILocation(line: 270, column: 4, scope: !1155)
!1341 = !DILocation(line: 270, column: 12, scope: !1155)
!1342 = !DILocation(line: 270, column: 23, scope: !1155)
!1343 = !DILocation(line: 270, column: 34, scope: !1155)
!1344 = !DILocation(line: 271, column: 4, scope: !1155)
!1345 = !DILocation(line: 273, column: 4, scope: !1155)
!1346 = !DILocation(line: 274, column: 16, scope: !1155)
!1347 = !DILocation(line: 274, column: 4, scope: !1155)
!1348 = !DILocation(line: 275, column: 4, scope: !1155)
!1349 = !DILocation(line: 277, column: 12, scope: !1155)
!1350 = !DILocation(line: 277, column: 43, scope: !1155)
!1351 = !DILocation(line: 277, column: 48, scope: !1155)
!1352 = !DILocation(line: 277, column: 4, scope: !1155)
!1353 = !DILocation(line: 278, column: 4, scope: !1155)
!1354 = distinct !{!1354, !1144, !1355, !991}
!1355 = !DILocation(line: 280, column: 2, scope: !1102)
!1356 = !DILocation(line: 282, column: 6, scope: !1357)
!1357 = distinct !DILexicalBlock(scope: !1102, file: !2, line: 282, column: 6)
!1358 = !DILocation(line: 282, column: 14, scope: !1357)
!1359 = !DILocation(line: 282, column: 22, scope: !1357)
!1360 = !DILocation(line: 282, column: 6, scope: !1102)
!1361 = !DILocation(line: 283, column: 11, scope: !1362)
!1362 = distinct !DILexicalBlock(scope: !1357, file: !2, line: 282, column: 28)
!1363 = !DILocation(line: 283, column: 3, scope: !1362)
!1364 = !DILocation(line: 285, column: 3, scope: !1362)
!1365 = !DILocation(line: 288, column: 2, scope: !1102)
!1366 = !DILocation(line: 289, column: 1, scope: !1102)
!1367 = distinct !DISubprogram(name: "print_usage", scope: !2, file: !2, line: 115, type: !1368, scopeLine: 116, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !1370)
!1368 = !DISubroutineType(types: !1369)
!1369 = !{null, !801}
!1370 = !{!1371, !1372}
!1371 = !DILocalVariable(name: "argv", arg: 1, scope: !1367, file: !2, line: 115, type: !801)
!1372 = !DILocalVariable(name: "i", scope: !1367, file: !2, line: 117, type: !312)
!1373 = !DILocation(line: 115, column: 31, scope: !1367)
!1374 = !DILocation(line: 117, column: 2, scope: !1367)
!1375 = !DILocation(line: 117, column: 6, scope: !1367)
!1376 = !DILocation(line: 119, column: 35, scope: !1367)
!1377 = !DILocation(line: 119, column: 2, scope: !1367)
!1378 = !DILocation(line: 120, column: 2, scope: !1367)
!1379 = !DILocation(line: 121, column: 45, scope: !1367)
!1380 = !DILocation(line: 121, column: 2, scope: !1367)
!1381 = !DILocation(line: 122, column: 2, scope: !1367)
!1382 = !DILocation(line: 123, column: 9, scope: !1383)
!1383 = distinct !DILexicalBlock(scope: !1367, file: !2, line: 123, column: 2)
!1384 = !DILocation(line: 123, column: 7, scope: !1383)
!1385 = !DILocation(line: 123, column: 27, scope: !1386)
!1386 = distinct !DILexicalBlock(scope: !1383, file: !2, line: 123, column: 2)
!1387 = !DILocation(line: 123, column: 14, scope: !1386)
!1388 = !DILocation(line: 123, column: 30, scope: !1386)
!1389 = !{!1390, !742, i64 0}
!1390 = !{!"option", !742, i64 0, !756, i64 8, !742, i64 16, !756, i64 24}
!1391 = !DILocation(line: 123, column: 35, scope: !1386)
!1392 = !DILocation(line: 123, column: 2, scope: !1383)
!1393 = !DILocation(line: 124, column: 35, scope: !1394)
!1394 = distinct !DILexicalBlock(scope: !1386, file: !2, line: 123, column: 46)
!1395 = !DILocation(line: 124, column: 22, scope: !1394)
!1396 = !DILocation(line: 124, column: 38, scope: !1394)
!1397 = !DILocation(line: 124, column: 3, scope: !1394)
!1398 = !DILocation(line: 125, column: 20, scope: !1399)
!1399 = distinct !DILexicalBlock(scope: !1394, file: !2, line: 125, column: 7)
!1400 = !DILocation(line: 125, column: 7, scope: !1399)
!1401 = !DILocation(line: 125, column: 23, scope: !1399)
!1402 = !{!1390, !742, i64 16}
!1403 = !DILocation(line: 125, column: 28, scope: !1399)
!1404 = !DILocation(line: 125, column: 7, scope: !1394)
!1405 = !DILocation(line: 127, column: 25, scope: !1399)
!1406 = !DILocation(line: 127, column: 12, scope: !1399)
!1407 = !DILocation(line: 127, column: 28, scope: !1399)
!1408 = !DILocation(line: 127, column: 11, scope: !1399)
!1409 = !DILocation(line: 126, column: 4, scope: !1399)
!1410 = !DILocation(line: 129, column: 46, scope: !1399)
!1411 = !DILocation(line: 129, column: 33, scope: !1399)
!1412 = !DILocation(line: 129, column: 49, scope: !1399)
!1413 = !{!1390, !756, i64 24}
!1414 = !DILocation(line: 129, column: 4, scope: !1399)
!1415 = !DILocation(line: 130, column: 3, scope: !1394)
!1416 = !DILocation(line: 131, column: 2, scope: !1394)
!1417 = !DILocation(line: 123, column: 42, scope: !1386)
!1418 = !DILocation(line: 123, column: 2, scope: !1386)
!1419 = distinct !{!1419, !1392, !1420, !991}
!1420 = !DILocation(line: 131, column: 2, scope: !1383)
!1421 = !DILocation(line: 132, column: 2, scope: !1367)
!1422 = !DILocation(line: 133, column: 1, scope: !1367)
!1423 = distinct !DISubprogram(name: "print_event_standard", scope: !2, file: !2, line: 725, type: !579, scopeLine: 726, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !1424)
!1424 = !{!1425}
!1425 = !DILocalVariable(name: "e", arg: 1, scope: !1423, file: !2, line: 725, type: !581)
!1426 = !DILocation(line: 725, column: 59, scope: !1423)
!1427 = !DILocation(line: 727, column: 6, scope: !1428)
!1428 = distinct !DILexicalBlock(scope: !1423, file: !2, line: 727, column: 6)
!1429 = !DILocation(line: 727, column: 9, scope: !1428)
!1430 = !DILocation(line: 727, column: 20, scope: !1428)
!1431 = !DILocation(line: 727, column: 6, scope: !1423)
!1432 = !DILocation(line: 728, column: 21, scope: !1433)
!1433 = distinct !DILexicalBlock(scope: !1428, file: !2, line: 727, column: 39)
!1434 = !DILocation(line: 728, column: 29, scope: !1433)
!1435 = !DILocation(line: 728, column: 42, scope: !1433)
!1436 = !DILocation(line: 728, column: 3, scope: !1433)
!1437 = !DILocation(line: 730, column: 10, scope: !1433)
!1438 = !DILocation(line: 730, column: 23, scope: !1433)
!1439 = !DILocation(line: 730, column: 27, scope: !1433)
!1440 = !DILocation(line: 731, column: 10, scope: !1433)
!1441 = !DILocation(line: 731, column: 23, scope: !1433)
!1442 = !DILocation(line: 731, column: 27, scope: !1433)
!1443 = !DILocation(line: 732, column: 10, scope: !1433)
!1444 = !DILocation(line: 732, column: 23, scope: !1433)
!1445 = !DILocation(line: 732, column: 31, scope: !1433)
!1446 = !DILocation(line: 733, column: 10, scope: !1433)
!1447 = !DILocation(line: 733, column: 23, scope: !1433)
!1448 = !DILocation(line: 733, column: 31, scope: !1433)
!1449 = !DILocation(line: 734, column: 23, scope: !1433)
!1450 = !DILocation(line: 734, column: 36, scope: !1433)
!1451 = !DILocation(line: 734, column: 41, scope: !1433)
!1452 = !DILocation(line: 734, column: 10, scope: !1433)
!1453 = !DILocation(line: 729, column: 3, scope: !1433)
!1454 = !DILocation(line: 735, column: 26, scope: !1433)
!1455 = !DILocation(line: 735, column: 35, scope: !1433)
!1456 = !DILocation(line: 735, column: 48, scope: !1433)
!1457 = !DILocation(line: 735, column: 3, scope: !1433)
!1458 = !DILocation(line: 736, column: 3, scope: !1433)
!1459 = !DILocation(line: 737, column: 2, scope: !1433)
!1460 = !DILocation(line: 737, column: 13, scope: !1461)
!1461 = distinct !DILexicalBlock(scope: !1428, file: !2, line: 737, column: 13)
!1462 = !DILocation(line: 737, column: 16, scope: !1461)
!1463 = !DILocation(line: 737, column: 27, scope: !1461)
!1464 = !DILocation(line: 737, column: 13, scope: !1428)
!1465 = !DILocation(line: 738, column: 21, scope: !1466)
!1466 = distinct !DILexicalBlock(scope: !1461, file: !2, line: 737, column: 47)
!1467 = !DILocation(line: 738, column: 29, scope: !1466)
!1468 = !DILocation(line: 738, column: 43, scope: !1466)
!1469 = !DILocation(line: 738, column: 3, scope: !1466)
!1470 = !DILocation(line: 739, column: 31, scope: !1466)
!1471 = !DILocation(line: 739, column: 44, scope: !1466)
!1472 = !DILocation(line: 739, column: 49, scope: !1466)
!1473 = !DILocation(line: 739, column: 18, scope: !1466)
!1474 = !DILocation(line: 739, column: 3, scope: !1466)
!1475 = !DILocation(line: 740, column: 26, scope: !1466)
!1476 = !DILocation(line: 740, column: 35, scope: !1466)
!1477 = !DILocation(line: 740, column: 49, scope: !1466)
!1478 = !DILocation(line: 740, column: 3, scope: !1466)
!1479 = !DILocation(line: 742, column: 27, scope: !1466)
!1480 = !DILocation(line: 742, column: 41, scope: !1466)
!1481 = !DILocation(line: 742, column: 10, scope: !1466)
!1482 = !DILocation(line: 743, column: 29, scope: !1466)
!1483 = !DILocation(line: 743, column: 43, scope: !1466)
!1484 = !DILocation(line: 743, column: 10, scope: !1466)
!1485 = !DILocation(line: 744, column: 29, scope: !1466)
!1486 = !DILocation(line: 744, column: 43, scope: !1466)
!1487 = !DILocation(line: 744, column: 10, scope: !1466)
!1488 = !DILocation(line: 741, column: 3, scope: !1466)
!1489 = !DILocation(line: 745, column: 2, scope: !1466)
!1490 = !DILocation(line: 746, column: 1, scope: !1423)
!1491 = distinct !DISubprogram(name: "print_event_json", scope: !2, file: !2, line: 805, type: !579, scopeLine: 806, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !1492)
!1492 = !{!1493}
!1493 = !DILocalVariable(name: "e", arg: 1, scope: !1491, file: !2, line: 805, type: !581)
!1494 = !DILocation(line: 805, column: 55, scope: !1491)
!1495 = !DILocation(line: 807, column: 6, scope: !1496)
!1496 = distinct !DILexicalBlock(scope: !1491, file: !2, line: 807, column: 6)
!1497 = !DILocation(line: 807, column: 9, scope: !1496)
!1498 = !DILocation(line: 807, column: 20, scope: !1496)
!1499 = !DILocation(line: 807, column: 38, scope: !1496)
!1500 = !DILocation(line: 807, column: 41, scope: !1496)
!1501 = !DILocation(line: 807, column: 44, scope: !1496)
!1502 = !DILocation(line: 807, column: 55, scope: !1496)
!1503 = !DILocation(line: 807, column: 6, scope: !1491)
!1504 = !DILocation(line: 808, column: 3, scope: !1496)
!1505 = !DILocation(line: 810, column: 7, scope: !1506)
!1506 = distinct !DILexicalBlock(scope: !1491, file: !2, line: 810, column: 6)
!1507 = !DILocation(line: 810, column: 6, scope: !1491)
!1508 = !DILocation(line: 811, column: 24, scope: !1509)
!1509 = distinct !DILexicalBlock(scope: !1506, file: !2, line: 810, column: 17)
!1510 = !DILocation(line: 811, column: 14, scope: !1509)
!1511 = !DILocation(line: 811, column: 12, scope: !1509)
!1512 = !DILocation(line: 812, column: 21, scope: !1509)
!1513 = !DILocation(line: 812, column: 3, scope: !1509)
!1514 = !DILocation(line: 813, column: 2, scope: !1509)
!1515 = !DILocation(line: 815, column: 21, scope: !1491)
!1516 = !DILocation(line: 815, column: 2, scope: !1491)
!1517 = !DILocation(line: 816, column: 27, scope: !1491)
!1518 = !DILocation(line: 816, column: 37, scope: !1491)
!1519 = !DILocation(line: 816, column: 2, scope: !1491)
!1520 = !DILocation(line: 817, column: 6, scope: !1521)
!1521 = distinct !DILexicalBlock(scope: !1491, file: !2, line: 817, column: 6)
!1522 = !DILocation(line: 817, column: 9, scope: !1521)
!1523 = !DILocation(line: 817, column: 20, scope: !1521)
!1524 = !DILocation(line: 817, column: 6, scope: !1491)
!1525 = !DILocation(line: 818, column: 30, scope: !1521)
!1526 = !DILocation(line: 818, column: 41, scope: !1521)
!1527 = !DILocation(line: 818, column: 3, scope: !1521)
!1528 = !DILocation(line: 820, column: 31, scope: !1521)
!1529 = !DILocation(line: 820, column: 42, scope: !1521)
!1530 = !DILocation(line: 820, column: 3, scope: !1521)
!1531 = !DILocation(line: 821, column: 19, scope: !1491)
!1532 = !DILocation(line: 821, column: 2, scope: !1491)
!1533 = !DILocation(line: 822, column: 1, scope: !1491)
!1534 = distinct !DISubprogram(name: "print_event_ppviz", scope: !2, file: !2, line: 748, type: !579, scopeLine: 749, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !1535)
!1535 = !{!1536, !1537, !1540}
!1536 = !DILocalVariable(name: "e", arg: 1, scope: !1534, file: !2, line: 748, type: !581)
!1537 = !DILocalVariable(name: "re", scope: !1534, file: !2, line: 754, type: !1538)
!1538 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1539, size: 64)
!1539 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !154)
!1540 = !DILocalVariable(name: "time", scope: !1534, file: !2, line: 755, type: !143)
!1541 = !DILocation(line: 748, column: 56, scope: !1534)
!1542 = !DILocation(line: 751, column: 6, scope: !1543)
!1543 = distinct !DILexicalBlock(scope: !1534, file: !2, line: 751, column: 6)
!1544 = !DILocation(line: 751, column: 9, scope: !1543)
!1545 = !DILocation(line: 751, column: 20, scope: !1543)
!1546 = !DILocation(line: 751, column: 6, scope: !1534)
!1547 = !DILocation(line: 752, column: 3, scope: !1543)
!1548 = !DILocation(line: 754, column: 2, scope: !1534)
!1549 = !DILocation(line: 754, column: 26, scope: !1534)
!1550 = !DILocation(line: 754, column: 32, scope: !1534)
!1551 = !DILocation(line: 755, column: 2, scope: !1534)
!1552 = !DILocation(line: 755, column: 8, scope: !1534)
!1553 = !DILocation(line: 755, column: 45, scope: !1534)
!1554 = !DILocation(line: 755, column: 49, scope: !1534)
!1555 = !{!1556, !754, i64 8}
!1556 = !{!"rtt_event", !754, i64 0, !754, i64 8, !1557, i64 16, !756, i64 60, !754, i64 64, !754, i64 72, !754, i64 80, !754, i64 88, !754, i64 96, !754, i64 104, !755, i64 112, !743, i64 113}
!1557 = !{!"network_tuple", !1558, i64 0, !1558, i64 20, !1560, i64 40, !743, i64 42, !743, i64 43}
!1558 = !{!"flow_address", !1559, i64 0, !1560, i64 16, !1560, i64 18}
!1559 = !{!"in6_addr", !743, i64 0}
!1560 = !{!"short", !743, i64 0}
!1561 = !DILocation(line: 755, column: 15, scope: !1534)
!1562 = !{!754, !754, i64 0}
!1563 = !DILocation(line: 757, column: 49, scope: !1534)
!1564 = !DILocation(line: 757, column: 54, scope: !1534)
!1565 = !DILocation(line: 758, column: 9, scope: !1534)
!1566 = !DILocation(line: 758, column: 14, scope: !1534)
!1567 = !DILocation(line: 758, column: 31, scope: !1534)
!1568 = !DILocation(line: 758, column: 35, scope: !1534)
!1569 = !{!1556, !754, i64 64}
!1570 = !DILocation(line: 758, column: 39, scope: !1534)
!1571 = !DILocation(line: 759, column: 9, scope: !1534)
!1572 = !DILocation(line: 759, column: 13, scope: !1534)
!1573 = !DILocation(line: 759, column: 17, scope: !1534)
!1574 = !DILocation(line: 759, column: 34, scope: !1534)
!1575 = !DILocation(line: 759, column: 38, scope: !1534)
!1576 = !{!1556, !754, i64 72}
!1577 = !DILocation(line: 759, column: 46, scope: !1534)
!1578 = !DILocation(line: 759, column: 63, scope: !1534)
!1579 = !DILocation(line: 759, column: 67, scope: !1534)
!1580 = !DILocation(line: 757, column: 2, scope: !1534)
!1581 = !DILocation(line: 760, column: 25, scope: !1534)
!1582 = !DILocation(line: 760, column: 34, scope: !1534)
!1583 = !DILocation(line: 760, column: 38, scope: !1534)
!1584 = !DILocation(line: 760, column: 2, scope: !1534)
!1585 = !DILocation(line: 761, column: 2, scope: !1534)
!1586 = !DILocation(line: 762, column: 1, scope: !1534)
!1587 = distinct !DISubprogram(name: "load_attach_bpfprogs", scope: !2, file: !2, line: 901, type: !1588, scopeLine: 903, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !1591)
!1588 = !DISubroutineType(types: !1589)
!1589 = !{!312, !1590, !699}
!1590 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !808, size: 64)
!1591 = !{!1592, !1593, !1594, !1595, !1596}
!1592 = !DILocalVariable(name: "obj", arg: 1, scope: !1587, file: !2, line: 901, type: !1590)
!1593 = !DILocalVariable(name: "config", arg: 2, scope: !1587, file: !2, line: 902, type: !699)
!1594 = !DILocalVariable(name: "err", scope: !1587, file: !2, line: 904, type: !312)
!1595 = !DILocalVariable(name: "detach_err", scope: !1587, file: !2, line: 904, type: !312)
!1596 = !DILabel(scope: !1587, name: "ingress_err", file: !2, line: 966)
!1597 = !DILocation(line: 901, column: 53, scope: !1587)
!1598 = !DILocation(line: 902, column: 26, scope: !1587)
!1599 = !DILocation(line: 904, column: 2, scope: !1587)
!1600 = !DILocation(line: 904, column: 6, scope: !1587)
!1601 = !DILocation(line: 904, column: 11, scope: !1587)
!1602 = !DILocation(line: 907, column: 26, scope: !1587)
!1603 = !DILocation(line: 907, column: 34, scope: !1587)
!1604 = !DILocation(line: 907, column: 9, scope: !1587)
!1605 = !DILocation(line: 907, column: 3, scope: !1587)
!1606 = !DILocation(line: 907, column: 7, scope: !1587)
!1607 = !DILocation(line: 908, column: 26, scope: !1587)
!1608 = !DILocation(line: 908, column: 25, scope: !1587)
!1609 = !DILocation(line: 908, column: 8, scope: !1587)
!1610 = !DILocation(line: 908, column: 6, scope: !1587)
!1611 = !DILocation(line: 909, column: 6, scope: !1612)
!1612 = distinct !DILexicalBlock(scope: !1587, file: !2, line: 909, column: 6)
!1613 = !DILocation(line: 909, column: 6, scope: !1587)
!1614 = !DILocation(line: 910, column: 11, scope: !1615)
!1615 = distinct !DILexicalBlock(scope: !1612, file: !2, line: 909, column: 11)
!1616 = !DILocation(line: 911, column: 4, scope: !1615)
!1617 = !DILocation(line: 911, column: 12, scope: !1615)
!1618 = !DILocation(line: 911, column: 45, scope: !1615)
!1619 = !DILocation(line: 911, column: 25, scope: !1615)
!1620 = !DILocation(line: 910, column: 3, scope: !1615)
!1621 = !DILocation(line: 912, column: 10, scope: !1615)
!1622 = !DILocation(line: 912, column: 3, scope: !1615)
!1623 = !DILocation(line: 915, column: 21, scope: !1587)
!1624 = !DILocation(line: 915, column: 20, scope: !1587)
!1625 = !DILocation(line: 915, column: 27, scope: !1587)
!1626 = !DILocation(line: 915, column: 35, scope: !1587)
!1627 = !DILocation(line: 915, column: 8, scope: !1587)
!1628 = !DILocation(line: 915, column: 6, scope: !1587)
!1629 = !DILocation(line: 917, column: 6, scope: !1630)
!1630 = distinct !DILexicalBlock(scope: !1587, file: !2, line: 917, column: 6)
!1631 = !DILocation(line: 917, column: 6, scope: !1587)
!1632 = !DILocation(line: 918, column: 11, scope: !1633)
!1633 = distinct !DILexicalBlock(scope: !1630, file: !2, line: 917, column: 11)
!1634 = !DILocation(line: 919, column: 4, scope: !1633)
!1635 = !DILocation(line: 919, column: 12, scope: !1633)
!1636 = !DILocation(line: 919, column: 45, scope: !1633)
!1637 = !DILocation(line: 919, column: 25, scope: !1633)
!1638 = !DILocation(line: 918, column: 3, scope: !1633)
!1639 = !DILocation(line: 920, column: 10, scope: !1633)
!1640 = !DILocation(line: 920, column: 3, scope: !1633)
!1641 = !DILocation(line: 923, column: 24, scope: !1587)
!1642 = !DILocation(line: 923, column: 23, scope: !1587)
!1643 = !DILocation(line: 923, column: 29, scope: !1587)
!1644 = !DILocation(line: 923, column: 2, scope: !1587)
!1645 = !DILocation(line: 924, column: 26, scope: !1587)
!1646 = !DILocation(line: 924, column: 25, scope: !1587)
!1647 = !DILocation(line: 924, column: 8, scope: !1587)
!1648 = !DILocation(line: 924, column: 6, scope: !1587)
!1649 = !DILocation(line: 925, column: 6, scope: !1650)
!1650 = distinct !DILexicalBlock(scope: !1587, file: !2, line: 925, column: 6)
!1651 = !DILocation(line: 925, column: 6, scope: !1587)
!1652 = !DILocation(line: 926, column: 11, scope: !1653)
!1653 = distinct !DILexicalBlock(scope: !1650, file: !2, line: 925, column: 11)
!1654 = !DILocation(line: 927, column: 4, scope: !1653)
!1655 = !DILocation(line: 927, column: 12, scope: !1653)
!1656 = !DILocation(line: 927, column: 45, scope: !1653)
!1657 = !DILocation(line: 927, column: 25, scope: !1653)
!1658 = !DILocation(line: 926, column: 3, scope: !1653)
!1659 = !DILocation(line: 928, column: 10, scope: !1653)
!1660 = !DILocation(line: 928, column: 3, scope: !1653)
!1661 = !DILocation(line: 933, column: 14, scope: !1587)
!1662 = !DILocation(line: 933, column: 13, scope: !1587)
!1663 = !DILocation(line: 933, column: 19, scope: !1587)
!1664 = !DILocation(line: 933, column: 27, scope: !1587)
!1665 = !DILocation(line: 934, column: 6, scope: !1587)
!1666 = !DILocation(line: 934, column: 14, scope: !1587)
!1667 = !DILocation(line: 934, column: 28, scope: !1587)
!1668 = !DILocation(line: 934, column: 36, scope: !1587)
!1669 = !DILocation(line: 935, column: 7, scope: !1587)
!1670 = !DILocation(line: 935, column: 15, scope: !1587)
!1671 = !DILocation(line: 933, column: 3, scope: !1587)
!1672 = !DILocation(line: 932, column: 2, scope: !1587)
!1673 = !DILocation(line: 932, column: 10, scope: !1587)
!1674 = !DILocation(line: 932, column: 25, scope: !1587)
!1675 = !DILocation(line: 936, column: 6, scope: !1676)
!1676 = distinct !DILexicalBlock(scope: !1587, file: !2, line: 936, column: 6)
!1677 = !DILocation(line: 936, column: 14, scope: !1676)
!1678 = !DILocation(line: 936, column: 29, scope: !1676)
!1679 = !DILocation(line: 936, column: 6, scope: !1587)
!1680 = !DILocation(line: 937, column: 11, scope: !1681)
!1681 = distinct !DILexicalBlock(scope: !1676, file: !2, line: 936, column: 34)
!1682 = !DILocation(line: 939, column: 4, scope: !1681)
!1683 = !DILocation(line: 939, column: 12, scope: !1681)
!1684 = !DILocation(line: 940, column: 24, scope: !1681)
!1685 = !DILocation(line: 940, column: 32, scope: !1681)
!1686 = !DILocation(line: 940, column: 4, scope: !1681)
!1687 = !DILocation(line: 937, column: 3, scope: !1681)
!1688 = !DILocation(line: 941, column: 10, scope: !1681)
!1689 = !DILocation(line: 941, column: 18, scope: !1681)
!1690 = !DILocation(line: 941, column: 3, scope: !1681)
!1691 = !DILocation(line: 945, column: 13, scope: !1692)
!1692 = distinct !DILexicalBlock(scope: !1587, file: !2, line: 945, column: 6)
!1693 = !DILocation(line: 945, column: 21, scope: !1692)
!1694 = !DILocation(line: 945, column: 6, scope: !1692)
!1695 = !DILocation(line: 945, column: 56, scope: !1692)
!1696 = !DILocation(line: 945, column: 6, scope: !1587)
!1697 = !DILocation(line: 947, column: 16, scope: !1692)
!1698 = !DILocation(line: 947, column: 15, scope: !1692)
!1699 = !DILocation(line: 947, column: 21, scope: !1692)
!1700 = !DILocation(line: 947, column: 29, scope: !1692)
!1701 = !DILocation(line: 947, column: 43, scope: !1692)
!1702 = !DILocation(line: 947, column: 51, scope: !1692)
!1703 = !DILocation(line: 948, column: 8, scope: !1692)
!1704 = !DILocation(line: 948, column: 16, scope: !1692)
!1705 = !DILocation(line: 947, column: 4, scope: !1692)
!1706 = !DILocation(line: 946, column: 3, scope: !1692)
!1707 = !DILocation(line: 946, column: 11, scope: !1692)
!1708 = !DILocation(line: 946, column: 27, scope: !1692)
!1709 = !DILocation(line: 951, column: 15, scope: !1692)
!1710 = !DILocation(line: 951, column: 14, scope: !1692)
!1711 = !DILocation(line: 951, column: 20, scope: !1692)
!1712 = !DILocation(line: 951, column: 28, scope: !1692)
!1713 = !DILocation(line: 952, column: 7, scope: !1692)
!1714 = !DILocation(line: 952, column: 15, scope: !1692)
!1715 = !DILocation(line: 953, column: 8, scope: !1692)
!1716 = !DILocation(line: 953, column: 16, scope: !1692)
!1717 = !DILocation(line: 951, column: 4, scope: !1692)
!1718 = !DILocation(line: 950, column: 3, scope: !1692)
!1719 = !DILocation(line: 950, column: 11, scope: !1692)
!1720 = !DILocation(line: 950, column: 27, scope: !1692)
!1721 = !DILocation(line: 954, column: 6, scope: !1722)
!1722 = distinct !DILexicalBlock(scope: !1587, file: !2, line: 954, column: 6)
!1723 = !DILocation(line: 954, column: 14, scope: !1722)
!1724 = !DILocation(line: 954, column: 30, scope: !1722)
!1725 = !DILocation(line: 954, column: 6, scope: !1587)
!1726 = !DILocation(line: 955, column: 11, scope: !1727)
!1727 = distinct !DILexicalBlock(scope: !1722, file: !2, line: 954, column: 35)
!1728 = !DILocation(line: 957, column: 4, scope: !1727)
!1729 = !DILocation(line: 957, column: 12, scope: !1727)
!1730 = !DILocation(line: 957, column: 40, scope: !1727)
!1731 = !DILocation(line: 957, column: 20, scope: !1727)
!1732 = !DILocation(line: 955, column: 3, scope: !1727)
!1733 = !DILocation(line: 958, column: 9, scope: !1727)
!1734 = !DILocation(line: 958, column: 17, scope: !1727)
!1735 = !DILocation(line: 958, column: 7, scope: !1727)
!1736 = !DILocation(line: 959, column: 14, scope: !1737)
!1737 = distinct !DILexicalBlock(scope: !1727, file: !2, line: 959, column: 7)
!1738 = !DILocation(line: 959, column: 22, scope: !1737)
!1739 = !DILocation(line: 959, column: 7, scope: !1737)
!1740 = !DILocation(line: 959, column: 57, scope: !1737)
!1741 = !DILocation(line: 959, column: 7, scope: !1727)
!1742 = !DILocation(line: 960, column: 26, scope: !1737)
!1743 = !DILocation(line: 960, column: 34, scope: !1737)
!1744 = !DILocation(line: 960, column: 4, scope: !1737)
!1745 = !DILocation(line: 961, column: 3, scope: !1727)
!1746 = !DILocation(line: 964, column: 2, scope: !1587)
!1747 = !DILocation(line: 966, column: 1, scope: !1587)
!1748 = !DILocation(line: 968, column: 13, scope: !1587)
!1749 = !DILocation(line: 968, column: 21, scope: !1587)
!1750 = !DILocation(line: 969, column: 7, scope: !1587)
!1751 = !DILocation(line: 969, column: 15, scope: !1587)
!1752 = !DILocation(line: 969, column: 31, scope: !1587)
!1753 = !DILocation(line: 969, column: 39, scope: !1587)
!1754 = !DILocation(line: 968, column: 3, scope: !1587)
!1755 = !DILocation(line: 967, column: 13, scope: !1587)
!1756 = !DILocation(line: 970, column: 6, scope: !1757)
!1757 = distinct !DILexicalBlock(scope: !1587, file: !2, line: 970, column: 6)
!1758 = !DILocation(line: 970, column: 6, scope: !1587)
!1759 = !DILocation(line: 971, column: 11, scope: !1757)
!1760 = !DILocation(line: 972, column: 4, scope: !1757)
!1761 = !DILocation(line: 972, column: 12, scope: !1757)
!1762 = !DILocation(line: 972, column: 40, scope: !1757)
!1763 = !DILocation(line: 972, column: 20, scope: !1757)
!1764 = !DILocation(line: 971, column: 3, scope: !1757)
!1765 = !DILocation(line: 973, column: 9, scope: !1587)
!1766 = !DILocation(line: 973, column: 2, scope: !1587)
!1767 = !DILocation(line: 974, column: 1, scope: !1587)
!1768 = distinct !DISubprogram(name: "setup_periodical_map_cleaning", scope: !2, file: !2, line: 976, type: !1769, scopeLine: 978, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !1771)
!1769 = !DISubroutineType(types: !1770)
!1770 = !{!312, !808, !699}
!1771 = !{!1772, !1773, !1774, !1777, !1783}
!1772 = !DILocalVariable(name: "obj", arg: 1, scope: !1768, file: !2, line: 976, type: !808)
!1773 = !DILocalVariable(name: "config", arg: 2, scope: !1768, file: !2, line: 977, type: !699)
!1774 = !DILocalVariable(name: "tid", scope: !1768, file: !2, line: 979, type: !1775)
!1775 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !1776, line: 27, baseType: !140)
!1776 = !DIFile(filename: "/usr/include/bits/pthreadtypes.h", directory: "", checksumkind: CSK_MD5, checksum: "735e3bf264ff9d8f5d95898b1692fbdb")
!1777 = !DILocalVariable(name: "clean_args", scope: !1768, file: !2, line: 980, type: !1778)
!1778 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "map_cleanup_args", file: !2, line: 64, size: 128, elements: !1779)
!1779 = !{!1780, !1781, !1782}
!1780 = !DIDerivedType(tag: DW_TAG_member, name: "cleanup_interval", scope: !1778, file: !2, line: 65, baseType: !143, size: 64)
!1781 = !DIDerivedType(tag: DW_TAG_member, name: "packet_map_fd", scope: !1778, file: !2, line: 66, baseType: !312, size: 32, offset: 64)
!1782 = !DIDerivedType(tag: DW_TAG_member, name: "flow_map_fd", scope: !1778, file: !2, line: 67, baseType: !312, size: 32, offset: 96)
!1783 = !DILocalVariable(name: "err", scope: !1768, file: !2, line: 983, type: !312)
!1784 = !DILocation(line: 976, column: 61, scope: !1768)
!1785 = !DILocation(line: 977, column: 28, scope: !1768)
!1786 = !DILocation(line: 979, column: 2, scope: !1768)
!1787 = !DILocation(line: 979, column: 12, scope: !1768)
!1788 = !DILocation(line: 980, column: 2, scope: !1768)
!1789 = !DILocation(line: 980, column: 26, scope: !1768)
!1790 = !DILocation(line: 980, column: 39, scope: !1768)
!1791 = !DILocation(line: 981, column: 23, scope: !1768)
!1792 = !DILocation(line: 981, column: 31, scope: !1768)
!1793 = !{!1794, !754, i64 0}
!1794 = !{!"map_cleanup_args", !754, i64 0, !756, i64 8, !756, i64 12}
!1795 = !{!1794, !756, i64 8}
!1796 = !{!1794, !756, i64 12}
!1797 = !DILocation(line: 983, column: 2, scope: !1768)
!1798 = !DILocation(line: 983, column: 6, scope: !1768)
!1799 = !DILocation(line: 985, column: 18, scope: !1800)
!1800 = distinct !DILexicalBlock(scope: !1768, file: !2, line: 985, column: 6)
!1801 = !DILocation(line: 985, column: 7, scope: !1800)
!1802 = !DILocation(line: 985, column: 6, scope: !1768)
!1803 = !DILocation(line: 986, column: 11, scope: !1804)
!1804 = distinct !DILexicalBlock(scope: !1800, file: !2, line: 985, column: 36)
!1805 = !DILocation(line: 986, column: 3, scope: !1804)
!1806 = !DILocation(line: 987, column: 3, scope: !1804)
!1807 = !DILocation(line: 991, column: 35, scope: !1768)
!1808 = !DILocation(line: 991, column: 40, scope: !1768)
!1809 = !DILocation(line: 991, column: 48, scope: !1768)
!1810 = !DILocation(line: 991, column: 3, scope: !1768)
!1811 = !DILocation(line: 990, column: 13, scope: !1768)
!1812 = !DILocation(line: 990, column: 27, scope: !1768)
!1813 = !DILocation(line: 992, column: 17, scope: !1814)
!1814 = distinct !DILexicalBlock(scope: !1768, file: !2, line: 992, column: 6)
!1815 = !DILocation(line: 992, column: 31, scope: !1814)
!1816 = !DILocation(line: 992, column: 6, scope: !1768)
!1817 = !DILocation(line: 993, column: 11, scope: !1818)
!1818 = distinct !DILexicalBlock(scope: !1814, file: !2, line: 992, column: 36)
!1819 = !DILocation(line: 994, column: 4, scope: !1818)
!1820 = !DILocation(line: 994, column: 12, scope: !1818)
!1821 = !DILocation(line: 995, column: 35, scope: !1818)
!1822 = !DILocation(line: 995, column: 4, scope: !1818)
!1823 = !DILocation(line: 993, column: 3, scope: !1818)
!1824 = !DILocation(line: 996, column: 21, scope: !1818)
!1825 = !DILocation(line: 996, column: 3, scope: !1818)
!1826 = !DILocation(line: 1000, column: 35, scope: !1768)
!1827 = !DILocation(line: 1000, column: 40, scope: !1768)
!1828 = !DILocation(line: 1000, column: 48, scope: !1768)
!1829 = !DILocation(line: 1000, column: 3, scope: !1768)
!1830 = !DILocation(line: 999, column: 13, scope: !1768)
!1831 = !DILocation(line: 999, column: 25, scope: !1768)
!1832 = !DILocation(line: 1001, column: 17, scope: !1833)
!1833 = distinct !DILexicalBlock(scope: !1768, file: !2, line: 1001, column: 6)
!1834 = !DILocation(line: 1001, column: 29, scope: !1833)
!1835 = !DILocation(line: 1001, column: 6, scope: !1768)
!1836 = !DILocation(line: 1002, column: 11, scope: !1837)
!1837 = distinct !DILexicalBlock(scope: !1833, file: !2, line: 1001, column: 34)
!1838 = !DILocation(line: 1003, column: 4, scope: !1837)
!1839 = !DILocation(line: 1003, column: 12, scope: !1837)
!1840 = !DILocation(line: 1004, column: 35, scope: !1837)
!1841 = !DILocation(line: 1004, column: 4, scope: !1837)
!1842 = !DILocation(line: 1002, column: 3, scope: !1837)
!1843 = !DILocation(line: 1005, column: 21, scope: !1837)
!1844 = !DILocation(line: 1005, column: 3, scope: !1837)
!1845 = !DILocation(line: 1008, column: 8, scope: !1768)
!1846 = !DILocation(line: 1008, column: 6, scope: !1768)
!1847 = !DILocation(line: 1009, column: 6, scope: !1848)
!1848 = distinct !DILexicalBlock(scope: !1768, file: !2, line: 1009, column: 6)
!1849 = !DILocation(line: 1009, column: 6, scope: !1768)
!1850 = !DILocation(line: 1010, column: 11, scope: !1851)
!1851 = distinct !DILexicalBlock(scope: !1848, file: !2, line: 1009, column: 11)
!1852 = !DILocation(line: 1012, column: 24, scope: !1851)
!1853 = !DILocation(line: 1012, column: 4, scope: !1851)
!1854 = !DILocation(line: 1010, column: 3, scope: !1851)
!1855 = !DILocation(line: 1013, column: 10, scope: !1851)
!1856 = !DILocation(line: 1013, column: 3, scope: !1851)
!1857 = !DILocation(line: 1016, column: 2, scope: !1768)
!1858 = !DILocation(line: 1017, column: 1, scope: !1768)
!1859 = !DISubprogram(name: "perf_buffer__new", scope: !70, file: !70, line: 943, type: !1860, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !1884)
!1860 = !DISubroutineType(types: !1861)
!1861 = !{!811, !312, !358, !1862, !1866, !141, !1870}
!1862 = !DIDerivedType(tag: DW_TAG_typedef, name: "perf_buffer_sample_fn", file: !70, line: 910, baseType: !1863)
!1863 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1864, size: 64)
!1864 = !DISubroutineType(types: !1865)
!1865 = !{null, !141, !312, !141, !195}
!1866 = !DIDerivedType(tag: DW_TAG_typedef, name: "perf_buffer_lost_fn", file: !70, line: 912, baseType: !1867)
!1867 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1868, size: 64)
!1868 = !DISubroutineType(types: !1869)
!1869 = !{null, !141, !312, !143}
!1870 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1871, size: 64)
!1871 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1872)
!1872 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "perf_buffer_opts", file: !70, line: 915, size: 192, elements: !1873)
!1873 = !{!1874}
!1874 = !DIDerivedType(tag: DW_TAG_member, scope: !1872, file: !70, line: 916, baseType: !1875, size: 192)
!1875 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !1872, file: !70, line: 916, size: 192, elements: !1876)
!1876 = !{!1877, !1878}
!1877 = !DIDerivedType(tag: DW_TAG_member, name: "sz", scope: !1875, file: !70, line: 917, baseType: !358, size: 64)
!1878 = !DIDerivedType(tag: DW_TAG_member, scope: !1875, file: !70, line: 918, baseType: !1879, size: 192)
!1879 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !1875, file: !70, line: 918, size: 192, elements: !1880)
!1880 = !{!1881, !1882, !1883}
!1881 = !DIDerivedType(tag: DW_TAG_member, name: "sample_cb", scope: !1879, file: !70, line: 920, baseType: !1862, size: 64)
!1882 = !DIDerivedType(tag: DW_TAG_member, name: "lost_cb", scope: !1879, file: !70, line: 922, baseType: !1866, size: 64, offset: 64)
!1883 = !DIDerivedType(tag: DW_TAG_member, name: "ctx", scope: !1879, file: !70, line: 924, baseType: !141, size: 64, offset: 128)
!1884 = !{!1885, !1886, !1887, !1888, !1889, !1890}
!1885 = !DILocalVariable(name: "map_fd", arg: 1, scope: !1859, file: !70, line: 943, type: !312)
!1886 = !DILocalVariable(name: "page_cnt", arg: 2, scope: !1859, file: !70, line: 943, type: !358)
!1887 = !DILocalVariable(name: "sample_cb", arg: 3, scope: !1859, file: !70, line: 943, type: !1862)
!1888 = !DILocalVariable(name: "lost_cb", arg: 4, scope: !1859, file: !70, line: 943, type: !1866)
!1889 = !DILocalVariable(name: "ctx", arg: 5, scope: !1859, file: !70, line: 943, type: !141)
!1890 = !DILocalVariable(name: "opts", arg: 6, scope: !1859, file: !70, line: 943, type: !1870)
!1891 = !DISubprogram(name: "bpf_object__find_map_fd_by_name", scope: !70, file: !70, line: 674, type: !1892, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !1896)
!1892 = !DISubroutineType(types: !1893)
!1893 = !{!312, !1894, !379}
!1894 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1895, size: 64)
!1895 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !809)
!1896 = !{!1897, !1898}
!1897 = !DILocalVariable(name: "obj", arg: 1, scope: !1891, file: !70, line: 674, type: !1894)
!1898 = !DILocalVariable(name: "name", arg: 2, scope: !1891, file: !70, line: 674, type: !379)
!1899 = distinct !DISubprogram(name: "handle_event", scope: !2, file: !2, line: 833, type: !1864, scopeLine: 834, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !1900)
!1900 = !{!1901, !1902, !1903, !1904, !1905}
!1901 = !DILocalVariable(name: "ctx", arg: 1, scope: !1899, file: !2, line: 833, type: !141)
!1902 = !DILocalVariable(name: "cpu", arg: 2, scope: !1899, file: !2, line: 833, type: !312)
!1903 = !DILocalVariable(name: "data", arg: 3, scope: !1899, file: !2, line: 833, type: !141)
!1904 = !DILocalVariable(name: "data_size", arg: 4, scope: !1899, file: !2, line: 833, type: !195)
!1905 = !DILocalVariable(name: "e", scope: !1899, file: !2, line: 835, type: !581)
!1906 = !DILocation(line: 833, column: 32, scope: !1899)
!1907 = !DILocation(line: 833, column: 41, scope: !1899)
!1908 = !DILocation(line: 833, column: 52, scope: !1899)
!1909 = !DILocation(line: 833, column: 64, scope: !1899)
!1910 = !DILocation(line: 835, column: 2, scope: !1899)
!1911 = !DILocation(line: 835, column: 27, scope: !1899)
!1912 = !DILocation(line: 835, column: 31, scope: !1899)
!1913 = !DILocation(line: 837, column: 6, scope: !1914)
!1914 = distinct !DILexicalBlock(scope: !1899, file: !2, line: 837, column: 6)
!1915 = !DILocation(line: 837, column: 16, scope: !1914)
!1916 = !DILocation(line: 837, column: 6, scope: !1899)
!1917 = !DILocation(line: 838, column: 3, scope: !1914)
!1918 = !DILocation(line: 840, column: 10, scope: !1899)
!1919 = !DILocation(line: 840, column: 13, scope: !1899)
!1920 = !DILocation(line: 840, column: 2, scope: !1899)
!1921 = !DILocation(line: 842, column: 18, scope: !1922)
!1922 = distinct !DILexicalBlock(scope: !1899, file: !2, line: 840, column: 25)
!1923 = !DILocation(line: 842, column: 3, scope: !1922)
!1924 = !DILocation(line: 843, column: 3, scope: !1922)
!1925 = !DILocation(line: 846, column: 3, scope: !1922)
!1926 = !DILocation(line: 846, column: 20, scope: !1922)
!1927 = !DILocation(line: 847, column: 3, scope: !1922)
!1928 = !DILocation(line: 849, column: 11, scope: !1922)
!1929 = !DILocation(line: 850, column: 4, scope: !1922)
!1930 = !DILocation(line: 850, column: 7, scope: !1922)
!1931 = !DILocation(line: 849, column: 3, scope: !1922)
!1932 = !DILocation(line: 851, column: 2, scope: !1922)
!1933 = !DILocation(line: 852, column: 1, scope: !1899)
!1934 = distinct !DISubprogram(name: "handle_missed_events", scope: !2, file: !2, line: 854, type: !1868, scopeLine: 855, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !1935)
!1935 = !{!1936, !1937, !1938}
!1936 = !DILocalVariable(name: "ctx", arg: 1, scope: !1934, file: !2, line: 854, type: !141)
!1937 = !DILocalVariable(name: "cpu", arg: 2, scope: !1934, file: !2, line: 854, type: !312)
!1938 = !DILocalVariable(name: "lost_cnt", arg: 3, scope: !1934, file: !2, line: 854, type: !143)
!1939 = !DILocation(line: 854, column: 40, scope: !1934)
!1940 = !DILocation(line: 854, column: 49, scope: !1934)
!1941 = !DILocation(line: 854, column: 60, scope: !1934)
!1942 = !DILocation(line: 856, column: 10, scope: !1934)
!1943 = !DILocation(line: 856, column: 50, scope: !1934)
!1944 = !DILocation(line: 856, column: 60, scope: !1934)
!1945 = !DILocation(line: 856, column: 2, scope: !1934)
!1946 = !DILocation(line: 857, column: 1, scope: !1934)
!1947 = !DISubprogram(name: "libbpf_get_error", scope: !70, file: !70, line: 802, type: !1948, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !1952)
!1948 = !DISubroutineType(types: !1949)
!1949 = !{!334, !1950}
!1950 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1951, size: 64)
!1951 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!1952 = !{!1953}
!1953 = !DILocalVariable(name: "ptr", arg: 1, scope: !1947, file: !70, line: 802, type: !1950)
!1954 = !DISubprogram(name: "signal", scope: !1955, file: !1955, line: 88, type: !1956, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !1960)
!1955 = !DIFile(filename: "/usr/include/signal.h", directory: "", checksumkind: CSK_MD5, checksum: "331e107bf774bb600ec675d0db0b92ce")
!1956 = !DISubroutineType(types: !1957)
!1957 = !{!1958, !312, !1958}
!1958 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sighandler_t", file: !1955, line: 72, baseType: !1959)
!1959 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !790, size: 64)
!1960 = !{!1961, !1962}
!1961 = !DILocalVariable(name: "__sig", arg: 1, scope: !1954, file: !1955, line: 88, type: !312)
!1962 = !DILocalVariable(name: "__handler", arg: 2, scope: !1954, file: !1955, line: 88, type: !1958)
!1963 = !DISubprogram(name: "perf_buffer__poll", scope: !70, file: !70, line: 1023, type: !1964, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !1966)
!1964 = !DISubroutineType(types: !1965)
!1965 = !{!312, !811, !312}
!1966 = !{!1967, !1968}
!1967 = !DILocalVariable(name: "pb", arg: 1, scope: !1963, file: !70, line: 1023, type: !811)
!1968 = !DILocalVariable(name: "timeout_ms", arg: 2, scope: !1963, file: !70, line: 1023, type: !312)
!1969 = !DISubprogram(name: "jsonw_end_array", scope: !688, file: !688, line: 74, type: !1970, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !1972)
!1970 = !DISubroutineType(types: !1971)
!1971 = !{null, !686}
!1972 = !{!1973}
!1973 = !DILocalVariable(name: "self", arg: 1, scope: !1969, file: !688, line: 74, type: !686)
!1974 = !DISubprogram(name: "jsonw_destroy", scope: !688, file: !688, line: 26, type: !1975, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !1978)
!1975 = !DISubroutineType(types: !1976)
!1976 = !{null, !1977}
!1977 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !686, size: 64)
!1978 = !{!1979}
!1979 = !DILocalVariable(name: "self_p", arg: 1, scope: !1974, file: !688, line: 26, type: !1977)
!1980 = !DISubprogram(name: "perf_buffer__free", scope: !70, file: !70, line: 1021, type: !1981, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !1983)
!1981 = !DISubroutineType(types: !1982)
!1982 = !{null, !811}
!1983 = !{!1984}
!1984 = !DILocalVariable(name: "pb", arg: 1, scope: !1980, file: !70, line: 1021, type: !811)
!1985 = !DISubprogram(name: "strcmp", scope: !1986, file: !1986, line: 156, type: !1987, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !1989)
!1986 = !DIFile(filename: "/usr/include/string.h", directory: "", checksumkind: CSK_MD5, checksum: "f443da8025a0b7c1498fb6c554ec788d")
!1987 = !DISubroutineType(types: !1988)
!1988 = !{!312, !379, !379}
!1989 = !{!1990, !1991}
!1990 = !DILocalVariable(name: "__s1", arg: 1, scope: !1985, file: !1986, line: 156, type: !379)
!1991 = !DILocalVariable(name: "__s2", arg: 2, scope: !1985, file: !1986, line: 156, type: !379)
!1992 = distinct !DISubprogram(name: "xdp_detach", scope: !2, file: !2, line: 369, type: !1993, scopeLine: 370, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !1995)
!1993 = !DISubroutineType(types: !1994)
!1994 = !{!312, !312, !195, !195}
!1995 = !{!1996, !1997, !1998, !1999, !2000}
!1996 = !DILocalVariable(name: "ifindex", arg: 1, scope: !1992, file: !2, line: 369, type: !312)
!1997 = !DILocalVariable(name: "xdp_flags", arg: 2, scope: !1992, file: !2, line: 369, type: !195)
!1998 = !DILocalVariable(name: "expected_prog_id", arg: 3, scope: !1992, file: !2, line: 369, type: !195)
!1999 = !DILocalVariable(name: "curr_prog_id", scope: !1992, file: !2, line: 371, type: !195)
!2000 = !DILocalVariable(name: "err", scope: !1992, file: !2, line: 372, type: !312)
!2001 = !DILocation(line: 369, column: 27, scope: !1992)
!2002 = !DILocation(line: 369, column: 42, scope: !1992)
!2003 = !DILocation(line: 369, column: 59, scope: !1992)
!2004 = !DILocation(line: 371, column: 2, scope: !1992)
!2005 = !DILocation(line: 371, column: 8, scope: !1992)
!2006 = !DILocation(line: 372, column: 2, scope: !1992)
!2007 = !DILocation(line: 372, column: 6, scope: !1992)
!2008 = !DILocation(line: 374, column: 28, scope: !1992)
!2009 = !DILocation(line: 374, column: 52, scope: !1992)
!2010 = !DILocation(line: 374, column: 8, scope: !1992)
!2011 = !DILocation(line: 374, column: 6, scope: !1992)
!2012 = !DILocation(line: 375, column: 6, scope: !2013)
!2013 = distinct !DILexicalBlock(scope: !1992, file: !2, line: 375, column: 6)
!2014 = !DILocation(line: 375, column: 6, scope: !1992)
!2015 = !DILocation(line: 376, column: 10, scope: !2013)
!2016 = !DILocation(line: 376, column: 3, scope: !2013)
!2017 = !DILocation(line: 378, column: 7, scope: !2018)
!2018 = distinct !DILexicalBlock(scope: !1992, file: !2, line: 378, column: 6)
!2019 = !DILocation(line: 378, column: 6, scope: !1992)
!2020 = !DILocation(line: 379, column: 3, scope: !2021)
!2021 = distinct !DILexicalBlock(scope: !2018, file: !2, line: 378, column: 21)
!2022 = !DILocation(line: 382, column: 6, scope: !2023)
!2023 = distinct !DILexicalBlock(scope: !1992, file: !2, line: 382, column: 6)
!2024 = !DILocation(line: 382, column: 23, scope: !2023)
!2025 = !DILocation(line: 382, column: 26, scope: !2023)
!2026 = !DILocation(line: 382, column: 42, scope: !2023)
!2027 = !DILocation(line: 382, column: 39, scope: !2023)
!2028 = !DILocation(line: 382, column: 6, scope: !1992)
!2029 = !DILocation(line: 383, column: 3, scope: !2023)
!2030 = !DILocation(line: 385, column: 29, scope: !1992)
!2031 = !DILocation(line: 385, column: 42, scope: !1992)
!2032 = !DILocation(line: 385, column: 9, scope: !1992)
!2033 = !DILocation(line: 385, column: 2, scope: !1992)
!2034 = !DILocation(line: 386, column: 1, scope: !1992)
!2035 = distinct !DISubprogram(name: "tc_detach", scope: !2, file: !2, line: 442, type: !2036, scopeLine: 444, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2040)
!2036 = !DISubroutineType(types: !2037)
!2037 = !{!312, !312, !69, !2038, !203}
!2038 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2039, size: 64)
!2039 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !713)
!2040 = !{!2041, !2042, !2043, !2044, !2045, !2046, !2047, !2054}
!2041 = !DILocalVariable(name: "ifindex", arg: 1, scope: !2035, file: !2, line: 442, type: !312)
!2042 = !DILocalVariable(name: "attach_point", arg: 2, scope: !2035, file: !2, line: 442, type: !69)
!2043 = !DILocalVariable(name: "opts", arg: 3, scope: !2035, file: !2, line: 443, type: !2038)
!2044 = !DILocalVariable(name: "destroy_hook", arg: 4, scope: !2035, file: !2, line: 443, type: !203)
!2045 = !DILocalVariable(name: "err", scope: !2035, file: !2, line: 445, type: !312)
!2046 = !DILocalVariable(name: "hook_err", scope: !2035, file: !2, line: 446, type: !312)
!2047 = !DILocalVariable(name: "hook", scope: !2035, file: !2, line: 447, type: !2048)
!2048 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_tc_hook", file: !70, line: 857, size: 192, elements: !2049)
!2049 = !{!2050, !2051, !2052, !2053}
!2050 = !DIDerivedType(tag: DW_TAG_member, name: "sz", scope: !2048, file: !70, line: 858, baseType: !358, size: 64)
!2051 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !2048, file: !70, line: 859, baseType: !312, size: 32, offset: 64)
!2052 = !DIDerivedType(tag: DW_TAG_member, name: "attach_point", scope: !2048, file: !70, line: 860, baseType: !69, size: 32, offset: 96)
!2053 = !DIDerivedType(tag: DW_TAG_member, name: "parent", scope: !2048, file: !70, line: 861, baseType: !195, size: 32, offset: 128)
!2054 = !DILocalVariable(name: "opts_info", scope: !2035, file: !2, line: 449, type: !713)
!2055 = !DILocation(line: 442, column: 26, scope: !2035)
!2056 = !DILocation(line: 442, column: 60, scope: !2035)
!2057 = !DILocation(line: 443, column: 34, scope: !2035)
!2058 = !DILocation(line: 443, column: 45, scope: !2035)
!2059 = !DILocation(line: 445, column: 2, scope: !2035)
!2060 = !DILocation(line: 445, column: 6, scope: !2035)
!2061 = !DILocation(line: 446, column: 2, scope: !2035)
!2062 = !DILocation(line: 446, column: 6, scope: !2035)
!2063 = !DILocation(line: 447, column: 2, scope: !2035)
!2064 = !DILocation(line: 447, column: 2, scope: !2065)
!2065 = distinct !DILexicalBlock(scope: !2035, file: !2, line: 447, column: 2)
!2066 = !{!2067, !758, i64 0}
!2067 = !{!"bpf_tc_hook", !758, i64 0, !756, i64 8, !743, i64 12, !756, i64 16}
!2068 = !{!2067, !756, i64 8}
!2069 = !{!2067, !743, i64 12}
!2070 = !{!2067, !756, i64 16}
!2071 = !DILocation(line: 449, column: 2, scope: !2035)
!2072 = !DILocation(line: 449, column: 2, scope: !2073)
!2073 = distinct !DILexicalBlock(scope: !2035, file: !2, line: 449, column: 2)
!2074 = !{!757, !756, i64 8}
!2075 = !{!757, !756, i64 12}
!2076 = !{!757, !756, i64 16}
!2077 = !{!757, !756, i64 20}
!2078 = !{!757, !756, i64 24}
!2079 = !DILocation(line: 453, column: 8, scope: !2035)
!2080 = !DILocation(line: 453, column: 6, scope: !2035)
!2081 = !DILocation(line: 454, column: 6, scope: !2082)
!2082 = distinct !DILexicalBlock(scope: !2035, file: !2, line: 454, column: 6)
!2083 = !DILocation(line: 454, column: 6, scope: !2035)
!2084 = !DILocation(line: 455, column: 10, scope: !2082)
!2085 = !DILocation(line: 455, column: 3, scope: !2082)
!2086 = !DILocation(line: 456, column: 6, scope: !2087)
!2087 = distinct !DILexicalBlock(scope: !2035, file: !2, line: 456, column: 6)
!2088 = !DILocation(line: 456, column: 12, scope: !2087)
!2089 = !DILocation(line: 456, column: 33, scope: !2087)
!2090 = !DILocation(line: 456, column: 20, scope: !2087)
!2091 = !DILocation(line: 456, column: 6, scope: !2035)
!2092 = !DILocation(line: 457, column: 3, scope: !2087)
!2093 = !DILocation(line: 460, column: 12, scope: !2035)
!2094 = !DILocation(line: 460, column: 20, scope: !2035)
!2095 = !DILocation(line: 461, column: 12, scope: !2035)
!2096 = !DILocation(line: 461, column: 20, scope: !2035)
!2097 = !DILocation(line: 462, column: 12, scope: !2035)
!2098 = !DILocation(line: 462, column: 18, scope: !2035)
!2099 = !DILocation(line: 463, column: 8, scope: !2035)
!2100 = !DILocation(line: 463, column: 6, scope: !2035)
!2101 = !DILocation(line: 470, column: 6, scope: !2102)
!2102 = distinct !DILexicalBlock(scope: !2035, file: !2, line: 470, column: 6)
!2103 = !DILocation(line: 470, column: 6, scope: !2035)
!2104 = !DILocation(line: 471, column: 8, scope: !2105)
!2105 = distinct !DILexicalBlock(scope: !2102, file: !2, line: 470, column: 20)
!2106 = !DILocation(line: 471, column: 21, scope: !2105)
!2107 = !DILocation(line: 472, column: 14, scope: !2105)
!2108 = !DILocation(line: 472, column: 12, scope: !2105)
!2109 = !DILocation(line: 473, column: 2, scope: !2105)
!2110 = !DILocation(line: 475, column: 8, scope: !2035)
!2111 = !DILocation(line: 475, column: 23, scope: !2035)
!2112 = !DILocation(line: 475, column: 34, scope: !2035)
!2113 = !DILocation(line: 475, column: 6, scope: !2035)
!2114 = !DILocation(line: 476, column: 9, scope: !2035)
!2115 = !DILocation(line: 476, column: 2, scope: !2035)
!2116 = !DILocation(line: 477, column: 1, scope: !2035)
!2117 = !DISubprogram(name: "setrlimit", scope: !2118, file: !2118, line: 70, type: !2119, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2124)
!2118 = !DIFile(filename: "/usr/include/sys/resource.h", directory: "", checksumkind: CSK_MD5, checksum: "e55940cb1bf33174af2c45f02cd69e8a")
!2119 = !DISubroutineType(types: !2120)
!2120 = !{!312, !2121, !2122}
!2121 = !DIDerivedType(tag: DW_TAG_typedef, name: "__rlimit_resource_t", file: !2118, line: 42, baseType: !312)
!2122 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2123, size: 64)
!2123 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1072)
!2124 = !{!2125, !2126}
!2125 = !DILocalVariable(name: "__resource", arg: 1, scope: !2117, file: !2118, line: 70, type: !2121)
!2126 = !DILocalVariable(name: "__rlimits", arg: 2, scope: !2117, file: !2118, line: 70, type: !2122)
!2127 = !DISubprogram(name: "__errno_location", scope: !2128, file: !2128, line: 37, type: !2129, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !760)
!2128 = !DIFile(filename: "/usr/include/errno.h", directory: "", checksumkind: CSK_MD5, checksum: "01c14bf4ab600a3884f5da68eb763170")
!2129 = !DISubroutineType(types: !2130)
!2130 = !{!464}
!2131 = !DISubprogram(name: "libbpf_strerror", scope: !70, file: !70, line: 52, type: !2132, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2134)
!2132 = !DISubroutineType(types: !2133)
!2133 = !{!312, !312, !314, !358}
!2134 = !{!2135, !2136, !2137}
!2135 = !DILocalVariable(name: "err", arg: 1, scope: !2131, file: !70, line: 52, type: !312)
!2136 = !DILocalVariable(name: "buf", arg: 2, scope: !2131, file: !70, line: 52, type: !314)
!2137 = !DILocalVariable(name: "size", arg: 3, scope: !2131, file: !70, line: 52, type: !358)
!2138 = !DISubprogram(name: "getopt_long", scope: !459, file: !459, line: 66, type: !2139, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2144)
!2139 = !DISubroutineType(types: !2140)
!2140 = !{!312, !312, !2141, !379, !2143, !464}
!2141 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2142, size: 64)
!2142 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !314)
!2143 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !457, size: 64)
!2144 = !{!2145, !2146, !2147, !2148, !2149}
!2145 = !DILocalVariable(name: "___argc", arg: 1, scope: !2138, file: !459, line: 66, type: !312)
!2146 = !DILocalVariable(name: "___argv", arg: 2, scope: !2138, file: !459, line: 66, type: !2141)
!2147 = !DILocalVariable(name: "__shortopts", arg: 3, scope: !2138, file: !459, line: 66, type: !379)
!2148 = !DILocalVariable(name: "__longopts", arg: 4, scope: !2138, file: !459, line: 66, type: !2143)
!2149 = !DILocalVariable(name: "__longind", arg: 5, scope: !2138, file: !459, line: 66, type: !464)
!2150 = !DISubprogram(name: "strlen", scope: !1986, file: !1986, line: 407, type: !2151, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2153)
!2151 = !DISubroutineType(types: !2152)
!2152 = !{!140, !379}
!2153 = !{!2154}
!2154 = !DILocalVariable(name: "__s", arg: 1, scope: !2150, file: !1986, line: 407, type: !379)
!2155 = !DISubprogram(name: "strncpy", scope: !1986, file: !1986, line: 144, type: !2156, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2158)
!2156 = !DISubroutineType(types: !2157)
!2157 = !{!314, !314, !379, !140}
!2158 = !{!2159, !2160, !2161}
!2159 = !DILocalVariable(name: "__dest", arg: 1, scope: !2155, file: !1986, line: 144, type: !314)
!2160 = !DILocalVariable(name: "__src", arg: 2, scope: !2155, file: !1986, line: 144, type: !379)
!2161 = !DILocalVariable(name: "__n", arg: 3, scope: !2155, file: !1986, line: 144, type: !140)
!2162 = !DISubprogram(name: "if_nametoindex", scope: !2163, file: !2163, line: 193, type: !2164, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2166)
!2163 = !DIFile(filename: "/usr/include/net/if.h", directory: "", checksumkind: CSK_MD5, checksum: "ef0f4d1e9791a3fdd927ef15876d20ed")
!2164 = !DISubroutineType(types: !2165)
!2165 = !{!39, !379}
!2166 = !{!2167}
!2167 = !DILocalVariable(name: "__ifname", arg: 1, scope: !2162, file: !2163, line: 193, type: !379)
!2168 = distinct !DISubprogram(name: "parse_bounded_double", scope: !2, file: !2, line: 150, type: !2169, scopeLine: 152, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2172)
!2169 = !DISubroutineType(types: !2170)
!2170 = !{!312, !2171, !379, !1112, !1112, !379}
!2171 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1112, size: 64)
!2172 = !{!2173, !2174, !2175, !2176, !2177, !2178}
!2173 = !DILocalVariable(name: "res", arg: 1, scope: !2168, file: !2, line: 150, type: !2171)
!2174 = !DILocalVariable(name: "str", arg: 2, scope: !2168, file: !2, line: 150, type: !379)
!2175 = !DILocalVariable(name: "low", arg: 3, scope: !2168, file: !2, line: 150, type: !1112)
!2176 = !DILocalVariable(name: "high", arg: 4, scope: !2168, file: !2, line: 151, type: !1112)
!2177 = !DILocalVariable(name: "name", arg: 5, scope: !2168, file: !2, line: 151, type: !379)
!2178 = !DILocalVariable(name: "endptr", scope: !2168, file: !2, line: 153, type: !314)
!2179 = !DILocation(line: 150, column: 41, scope: !2168)
!2180 = !DILocation(line: 150, column: 58, scope: !2168)
!2181 = !DILocation(line: 150, column: 70, scope: !2168)
!2182 = !DILocation(line: 151, column: 15, scope: !2168)
!2183 = !DILocation(line: 151, column: 33, scope: !2168)
!2184 = !DILocation(line: 153, column: 2, scope: !2168)
!2185 = !DILocation(line: 153, column: 8, scope: !2168)
!2186 = !DILocation(line: 154, column: 16, scope: !2168)
!2187 = !DILocation(line: 154, column: 9, scope: !2168)
!2188 = !DILocation(line: 154, column: 3, scope: !2168)
!2189 = !DILocation(line: 154, column: 7, scope: !2168)
!2190 = !DILocation(line: 155, column: 13, scope: !2191)
!2191 = distinct !DILexicalBlock(scope: !2168, file: !2, line: 155, column: 6)
!2192 = !DILocation(line: 155, column: 6, scope: !2191)
!2193 = !DILocation(line: 155, column: 21, scope: !2191)
!2194 = !DILocation(line: 155, column: 30, scope: !2191)
!2195 = !DILocation(line: 155, column: 28, scope: !2191)
!2196 = !DILocation(line: 155, column: 18, scope: !2191)
!2197 = !DILocation(line: 155, column: 6, scope: !2168)
!2198 = !DILocation(line: 156, column: 11, scope: !2199)
!2199 = distinct !DILexicalBlock(scope: !2191, file: !2, line: 155, column: 35)
!2200 = !DILocation(line: 156, column: 52, scope: !2199)
!2201 = !DILocation(line: 156, column: 58, scope: !2199)
!2202 = !DILocation(line: 156, column: 3, scope: !2199)
!2203 = !DILocation(line: 157, column: 3, scope: !2199)
!2204 = !DILocation(line: 159, column: 7, scope: !2205)
!2205 = distinct !DILexicalBlock(scope: !2168, file: !2, line: 159, column: 6)
!2206 = !DILocation(line: 159, column: 6, scope: !2205)
!2207 = !DILocation(line: 159, column: 13, scope: !2205)
!2208 = !DILocation(line: 159, column: 11, scope: !2205)
!2209 = !DILocation(line: 159, column: 17, scope: !2205)
!2210 = !DILocation(line: 159, column: 21, scope: !2205)
!2211 = !DILocation(line: 159, column: 20, scope: !2205)
!2212 = !DILocation(line: 159, column: 27, scope: !2205)
!2213 = !DILocation(line: 159, column: 25, scope: !2205)
!2214 = !DILocation(line: 159, column: 6, scope: !2168)
!2215 = !DILocation(line: 160, column: 11, scope: !2216)
!2216 = distinct !DILexicalBlock(scope: !2205, file: !2, line: 159, column: 33)
!2217 = !DILocation(line: 160, column: 50, scope: !2216)
!2218 = !DILocation(line: 160, column: 56, scope: !2216)
!2219 = !DILocation(line: 160, column: 61, scope: !2216)
!2220 = !DILocation(line: 160, column: 3, scope: !2216)
!2221 = !DILocation(line: 161, column: 3, scope: !2216)
!2222 = !DILocation(line: 164, column: 2, scope: !2168)
!2223 = !DILocation(line: 165, column: 1, scope: !2168)
!2224 = !DISubprogram(name: "exit", scope: !2225, file: !2225, line: 624, type: !790, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized, retainedNodes: !2226)
!2225 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "02258fad21adf111bb9df9825e61954a")
!2226 = !{!2227}
!2227 = !DILocalVariable(name: "__status", arg: 1, scope: !2224, file: !2225, line: 624, type: !312)
!2228 = !DISubprogram(name: "strtod", scope: !2225, file: !2225, line: 118, type: !2229, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2231)
!2229 = !DISubroutineType(types: !2230)
!2230 = !{!1112, !379, !801}
!2231 = !{!2232, !2233}
!2232 = !DILocalVariable(name: "__nptr", arg: 1, scope: !2228, file: !2225, line: 118, type: !379)
!2233 = !DILocalVariable(name: "__endptr", arg: 2, scope: !2228, file: !2225, line: 118, type: !801)
!2234 = distinct !DISubprogram(name: "print_ns_datetime", scope: !2, file: !2, line: 715, type: !2235, scopeLine: 716, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2237)
!2235 = !DISubroutineType(types: !2236)
!2236 = !{null, !305, !143}
!2237 = !{!2238, !2239, !2240, !2241, !2242}
!2238 = !DILocalVariable(name: "stream", arg: 1, scope: !2234, file: !2, line: 715, type: !305)
!2239 = !DILocalVariable(name: "monotonic_ns", arg: 2, scope: !2234, file: !2, line: 715, type: !143)
!2240 = !DILocalVariable(name: "timestr", scope: !2234, file: !2, line: 717, type: !19)
!2241 = !DILocalVariable(name: "ts", scope: !2234, file: !2, line: 718, type: !143)
!2242 = !DILocalVariable(name: "ts_s", scope: !2234, file: !2, line: 719, type: !2243)
!2243 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !2244, line: 10, baseType: !2245)
!2244 = !DIFile(filename: "/usr/include/bits/types/time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5c299a4954617c88bb03645c7864e1b1")
!2245 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !139, line: 160, baseType: !334)
!2246 = !DILocation(line: 715, column: 37, scope: !2234)
!2247 = !DILocation(line: 715, column: 51, scope: !2234)
!2248 = !DILocation(line: 717, column: 2, scope: !2234)
!2249 = !DILocation(line: 717, column: 7, scope: !2234)
!2250 = !DILocation(line: 718, column: 2, scope: !2234)
!2251 = !DILocation(line: 718, column: 8, scope: !2234)
!2252 = !DILocation(line: 718, column: 43, scope: !2234)
!2253 = !DILocation(line: 718, column: 13, scope: !2234)
!2254 = !DILocation(line: 719, column: 2, scope: !2234)
!2255 = !DILocation(line: 719, column: 9, scope: !2234)
!2256 = !DILocation(line: 719, column: 16, scope: !2234)
!2257 = !DILocation(line: 719, column: 19, scope: !2234)
!2258 = !DILocation(line: 721, column: 11, scope: !2234)
!2259 = !DILocation(line: 721, column: 49, scope: !2234)
!2260 = !DILocation(line: 721, column: 2, scope: !2234)
!2261 = !DILocation(line: 722, column: 10, scope: !2234)
!2262 = !DILocation(line: 722, column: 31, scope: !2234)
!2263 = !DILocation(line: 722, column: 40, scope: !2234)
!2264 = !DILocation(line: 722, column: 43, scope: !2234)
!2265 = !DILocation(line: 722, column: 2, scope: !2234)
!2266 = !DILocation(line: 723, column: 1, scope: !2234)
!2267 = !{!1560, !1560, i64 0}
!2268 = !DILocation(line: 638, column: 39, scope: !532)
!2269 = !DILocation(line: 642, column: 10, scope: !532)
!2270 = !DILocation(line: 642, column: 2, scope: !532)
!2271 = !DILocation(line: 644, column: 3, scope: !2272)
!2272 = distinct !DILexicalBlock(scope: !532, file: !2, line: 642, column: 17)
!2273 = !DILocation(line: 646, column: 3, scope: !2272)
!2274 = !DILocation(line: 648, column: 3, scope: !2272)
!2275 = !DILocation(line: 650, column: 36, scope: !2272)
!2276 = !DILocation(line: 650, column: 3, scope: !2272)
!2277 = !DILocation(line: 651, column: 3, scope: !2272)
!2278 = !DILocation(line: 653, column: 1, scope: !532)
!2279 = distinct !DISubprogram(name: "print_flow_ppvizformat", scope: !2, file: !2, line: 704, type: !2280, scopeLine: 705, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2284)
!2280 = !DISubroutineType(types: !2281)
!2281 = !{null, !305, !2282}
!2282 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2283, size: 64)
!2283 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !159)
!2284 = !{!2285, !2286, !2287, !2288}
!2285 = !DILocalVariable(name: "stream", arg: 1, scope: !2279, file: !2, line: 704, type: !305)
!2286 = !DILocalVariable(name: "flow", arg: 2, scope: !2279, file: !2, line: 704, type: !2282)
!2287 = !DILocalVariable(name: "saddr", scope: !2279, file: !2, line: 706, type: !275)
!2288 = !DILocalVariable(name: "daddr", scope: !2279, file: !2, line: 707, type: !275)
!2289 = !DILocation(line: 704, column: 42, scope: !2279)
!2290 = !DILocation(line: 704, column: 78, scope: !2279)
!2291 = !DILocation(line: 706, column: 2, scope: !2279)
!2292 = !DILocation(line: 706, column: 7, scope: !2279)
!2293 = !DILocation(line: 707, column: 2, scope: !2279)
!2294 = !DILocation(line: 707, column: 7, scope: !2279)
!2295 = !DILocation(line: 709, column: 20, scope: !2279)
!2296 = !DILocation(line: 709, column: 42, scope: !2279)
!2297 = !DILocation(line: 709, column: 48, scope: !2279)
!2298 = !{!1557, !743, i64 42}
!2299 = !DILocation(line: 709, column: 54, scope: !2279)
!2300 = !DILocation(line: 709, column: 60, scope: !2279)
!2301 = !DILocation(line: 709, column: 66, scope: !2279)
!2302 = !DILocation(line: 709, column: 2, scope: !2279)
!2303 = !DILocation(line: 710, column: 20, scope: !2279)
!2304 = !DILocation(line: 710, column: 42, scope: !2279)
!2305 = !DILocation(line: 710, column: 48, scope: !2279)
!2306 = !DILocation(line: 710, column: 54, scope: !2279)
!2307 = !DILocation(line: 710, column: 60, scope: !2279)
!2308 = !DILocation(line: 710, column: 66, scope: !2279)
!2309 = !DILocation(line: 710, column: 2, scope: !2279)
!2310 = !DILocation(line: 711, column: 10, scope: !2279)
!2311 = !DILocation(line: 711, column: 33, scope: !2279)
!2312 = !DILocation(line: 711, column: 40, scope: !2279)
!2313 = !{!1557, !1560, i64 16}
!2314 = !DILocation(line: 711, column: 65, scope: !2279)
!2315 = !DILocation(line: 712, column: 3, scope: !2279)
!2316 = !{!1557, !1560, i64 36}
!2317 = !DILocation(line: 711, column: 2, scope: !2279)
!2318 = !DILocation(line: 713, column: 1, scope: !2279)
!2319 = distinct !DISubprogram(name: "flowevent_to_str", scope: !2, file: !2, line: 655, type: !2320, scopeLine: 656, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2322)
!2320 = !DISubroutineType(types: !2321)
!2321 = !{!379, !44}
!2322 = !{!2323}
!2323 = !DILocalVariable(name: "fe", arg: 1, scope: !2319, file: !2, line: 655, type: !44)
!2324 = !DILocation(line: 655, column: 58, scope: !2319)
!2325 = !DILocation(line: 657, column: 10, scope: !2319)
!2326 = !DILocation(line: 657, column: 2, scope: !2319)
!2327 = !DILocation(line: 659, column: 3, scope: !2328)
!2328 = distinct !DILexicalBlock(scope: !2319, file: !2, line: 657, column: 14)
!2329 = !DILocation(line: 661, column: 3, scope: !2328)
!2330 = !DILocation(line: 664, column: 3, scope: !2328)
!2331 = !DILocation(line: 666, column: 3, scope: !2328)
!2332 = !DILocation(line: 668, column: 1, scope: !2319)
!2333 = distinct !DISubprogram(name: "eventreason_to_str", scope: !2, file: !2, line: 670, type: !2334, scopeLine: 671, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2336)
!2334 = !DISubroutineType(types: !2335)
!2335 = !{!379, !52}
!2336 = !{!2337}
!2337 = !DILocalVariable(name: "er", arg: 1, scope: !2333, file: !2, line: 670, type: !52)
!2338 = !DILocation(line: 670, column: 62, scope: !2333)
!2339 = !DILocation(line: 672, column: 10, scope: !2333)
!2340 = !DILocation(line: 672, column: 2, scope: !2333)
!2341 = !DILocation(line: 674, column: 3, scope: !2342)
!2342 = distinct !DILexicalBlock(scope: !2333, file: !2, line: 672, column: 14)
!2343 = !DILocation(line: 676, column: 3, scope: !2342)
!2344 = !DILocation(line: 678, column: 3, scope: !2342)
!2345 = !DILocation(line: 680, column: 3, scope: !2342)
!2346 = !DILocation(line: 682, column: 3, scope: !2342)
!2347 = !DILocation(line: 684, column: 3, scope: !2342)
!2348 = !DILocation(line: 686, column: 3, scope: !2342)
!2349 = !DILocation(line: 688, column: 1, scope: !2333)
!2350 = distinct !DISubprogram(name: "eventsource_to_str", scope: !2, file: !2, line: 690, type: !2351, scopeLine: 691, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2353)
!2351 = !DISubroutineType(types: !2352)
!2352 = !{!379, !60}
!2353 = !{!2354}
!2354 = !DILocalVariable(name: "es", arg: 1, scope: !2350, file: !2, line: 690, type: !60)
!2355 = !DILocation(line: 690, column: 62, scope: !2350)
!2356 = !DILocation(line: 692, column: 10, scope: !2350)
!2357 = !DILocation(line: 692, column: 2, scope: !2350)
!2358 = !DILocation(line: 694, column: 3, scope: !2359)
!2359 = distinct !DILexicalBlock(scope: !2350, file: !2, line: 692, column: 14)
!2360 = !DILocation(line: 696, column: 3, scope: !2359)
!2361 = !DILocation(line: 698, column: 3, scope: !2359)
!2362 = !DILocation(line: 700, column: 3, scope: !2359)
!2363 = !DILocation(line: 702, column: 1, scope: !2350)
!2364 = !DILocation(line: 602, column: 50, scope: !521)
!2365 = !DILocation(line: 606, column: 2, scope: !521)
!2366 = !DILocation(line: 606, column: 8, scope: !521)
!2367 = !DILocation(line: 606, column: 18, scope: !521)
!2368 = !DILocation(line: 607, column: 2, scope: !521)
!2369 = !DILocation(line: 607, column: 8, scope: !521)
!2370 = !DILocation(line: 609, column: 6, scope: !2371)
!2371 = distinct !DILexicalBlock(scope: !521, file: !2, line: 609, column: 6)
!2372 = !DILocation(line: 609, column: 13, scope: !2371)
!2373 = !DILocation(line: 609, column: 18, scope: !2371)
!2374 = !DILocation(line: 610, column: 7, scope: !2371)
!2375 = !DILocation(line: 610, column: 17, scope: !2371)
!2376 = !DILocation(line: 610, column: 15, scope: !2371)
!2377 = !DILocation(line: 610, column: 32, scope: !2371)
!2378 = !DILocation(line: 611, column: 7, scope: !2371)
!2379 = !DILocation(line: 611, column: 17, scope: !2371)
!2380 = !DILocation(line: 611, column: 15, scope: !2371)
!2381 = !DILocation(line: 611, column: 32, scope: !2371)
!2382 = !DILocation(line: 609, column: 6, scope: !521)
!2383 = !DILocation(line: 612, column: 13, scope: !2384)
!2384 = distinct !DILexicalBlock(scope: !2371, file: !2, line: 611, column: 60)
!2385 = !DILocation(line: 612, column: 11, scope: !2384)
!2386 = !DILocation(line: 613, column: 12, scope: !2384)
!2387 = !DILocation(line: 613, column: 10, scope: !2384)
!2388 = !DILocation(line: 615, column: 7, scope: !2389)
!2389 = distinct !DILexicalBlock(scope: !2384, file: !2, line: 615, column: 7)
!2390 = !DILocation(line: 615, column: 16, scope: !2389)
!2391 = !DILocation(line: 615, column: 14, scope: !2389)
!2392 = !DILocation(line: 615, column: 7, scope: !2384)
!2393 = !DILocation(line: 616, column: 4, scope: !2389)
!2394 = !DILocation(line: 617, column: 12, scope: !2384)
!2395 = !DILocation(line: 617, column: 21, scope: !2384)
!2396 = !DILocation(line: 617, column: 19, scope: !2384)
!2397 = !DILocation(line: 617, column: 10, scope: !2384)
!2398 = !DILocation(line: 618, column: 20, scope: !2384)
!2399 = !DILocation(line: 618, column: 18, scope: !2384)
!2400 = !DILocation(line: 619, column: 2, scope: !2384)
!2401 = !DILocation(line: 620, column: 9, scope: !521)
!2402 = !DILocation(line: 620, column: 26, scope: !521)
!2403 = !DILocation(line: 620, column: 24, scope: !521)
!2404 = !DILocation(line: 620, column: 2, scope: !521)
!2405 = !DILocation(line: 621, column: 1, scope: !521)
!2406 = !DISubprogram(name: "strftime", scope: !2407, file: !2407, line: 100, type: !2408, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2429)
!2407 = !DIFile(filename: "/usr/include/time.h", directory: "", checksumkind: CSK_MD5, checksum: "db37158473a25e1d89b19f8bc6892801")
!2408 = !DISubroutineType(types: !2409)
!2409 = !{!358, !2410, !358, !2411, !2412}
!2410 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !314)
!2411 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !379)
!2412 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !2413)
!2413 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2414, size: 64)
!2414 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2415)
!2415 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !2416, line: 7, size: 448, elements: !2417)
!2416 = !DIFile(filename: "/usr/include/bits/types/struct_tm.h", directory: "", checksumkind: CSK_MD5, checksum: "9e5545b565ef031c4cd0faf90b69386f")
!2417 = !{!2418, !2419, !2420, !2421, !2422, !2423, !2424, !2425, !2426, !2427, !2428}
!2418 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !2415, file: !2416, line: 9, baseType: !312, size: 32)
!2419 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !2415, file: !2416, line: 10, baseType: !312, size: 32, offset: 32)
!2420 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !2415, file: !2416, line: 11, baseType: !312, size: 32, offset: 64)
!2421 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !2415, file: !2416, line: 12, baseType: !312, size: 32, offset: 96)
!2422 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !2415, file: !2416, line: 13, baseType: !312, size: 32, offset: 128)
!2423 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !2415, file: !2416, line: 14, baseType: !312, size: 32, offset: 160)
!2424 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !2415, file: !2416, line: 15, baseType: !312, size: 32, offset: 192)
!2425 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !2415, file: !2416, line: 16, baseType: !312, size: 32, offset: 224)
!2426 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !2415, file: !2416, line: 17, baseType: !312, size: 32, offset: 256)
!2427 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !2415, file: !2416, line: 20, baseType: !334, size: 64, offset: 320)
!2428 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !2415, file: !2416, line: 21, baseType: !379, size: 64, offset: 384)
!2429 = !{!2430, !2431, !2432, !2433}
!2430 = !DILocalVariable(name: "__s", arg: 1, scope: !2406, file: !2407, line: 100, type: !2410)
!2431 = !DILocalVariable(name: "__maxsize", arg: 2, scope: !2406, file: !2407, line: 100, type: !358)
!2432 = !DILocalVariable(name: "__format", arg: 3, scope: !2406, file: !2407, line: 100, type: !2411)
!2433 = !DILocalVariable(name: "__tp", arg: 4, scope: !2406, file: !2407, line: 100, type: !2412)
!2434 = !DISubprogram(name: "localtime", scope: !2407, file: !2407, line: 136, type: !2435, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2440)
!2435 = !DISubroutineType(types: !2436)
!2436 = !{!2437, !2438}
!2437 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2415, size: 64)
!2438 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2439, size: 64)
!2439 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2243)
!2440 = !{!2441}
!2441 = !DILocalVariable(name: "__timer", arg: 1, scope: !2434, file: !2407, line: 136, type: !2438)
!2442 = distinct !DISubprogram(name: "get_time_ns", scope: !2, file: !2, line: 483, type: !2443, scopeLine: 484, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2448)
!2443 = !DISubroutineType(types: !2444)
!2444 = !{!143, !2445}
!2445 = !DIDerivedType(tag: DW_TAG_typedef, name: "clockid_t", file: !2446, line: 7, baseType: !2447)
!2446 = !DIFile(filename: "/usr/include/bits/types/clockid_t.h", directory: "", checksumkind: CSK_MD5, checksum: "099a80153c2ad48bc7f5f4a188cb6d24")
!2447 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clockid_t", file: !139, line: 169, baseType: !312)
!2448 = !{!2449, !2450}
!2449 = !DILocalVariable(name: "clockid", arg: 1, scope: !2442, file: !2, line: 483, type: !2445)
!2450 = !DILocalVariable(name: "t", scope: !2442, file: !2, line: 485, type: !2451)
!2451 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !2452, line: 11, size: 128, elements: !2453)
!2452 = !DIFile(filename: "/usr/include/bits/types/struct_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "55dc154df3f21a5aa944dcafba9b43f6")
!2453 = !{!2454, !2455}
!2454 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !2451, file: !2452, line: 16, baseType: !2245, size: 64)
!2455 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !2451, file: !2452, line: 21, baseType: !2456, size: 64, offset: 64)
!2456 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !139, line: 197, baseType: !334)
!2457 = !DILocation(line: 483, column: 36, scope: !2442)
!2458 = !DILocation(line: 485, column: 2, scope: !2442)
!2459 = !DILocation(line: 485, column: 18, scope: !2442)
!2460 = !DILocation(line: 486, column: 20, scope: !2461)
!2461 = distinct !DILexicalBlock(scope: !2442, file: !2, line: 486, column: 6)
!2462 = !DILocation(line: 486, column: 6, scope: !2461)
!2463 = !DILocation(line: 486, column: 33, scope: !2461)
!2464 = !DILocation(line: 486, column: 6, scope: !2442)
!2465 = !DILocation(line: 487, column: 3, scope: !2461)
!2466 = !DILocation(line: 489, column: 18, scope: !2442)
!2467 = !{!2468, !758, i64 0}
!2468 = !{!"timespec", !758, i64 0, !758, i64 8}
!2469 = !DILocation(line: 489, column: 25, scope: !2442)
!2470 = !DILocation(line: 489, column: 52, scope: !2442)
!2471 = !{!2468, !758, i64 8}
!2472 = !DILocation(line: 489, column: 41, scope: !2442)
!2473 = !DILocation(line: 489, column: 2, scope: !2442)
!2474 = !DILocation(line: 490, column: 1, scope: !2442)
!2475 = !DISubprogram(name: "clock_gettime", scope: !2407, file: !2407, line: 279, type: !2476, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2479)
!2476 = !DISubroutineType(types: !2477)
!2477 = !{!312, !2445, !2478}
!2478 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2451, size: 64)
!2479 = !{!2480, !2481}
!2480 = !DILocalVariable(name: "__clock_id", arg: 1, scope: !2475, file: !2407, line: 279, type: !2445)
!2481 = !DILocalVariable(name: "__tp", arg: 2, scope: !2475, file: !2407, line: 279, type: !2478)
!2482 = !DISubprogram(name: "snprintf", scope: !304, file: !304, line: 378, type: !2483, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2485)
!2483 = !DISubroutineType(types: !2484)
!2484 = !{!312, !314, !140, !379, null}
!2485 = !{!2486, !2487, !2488}
!2486 = !DILocalVariable(name: "__s", arg: 1, scope: !2482, file: !304, line: 378, type: !314)
!2487 = !DILocalVariable(name: "__maxlen", arg: 2, scope: !2482, file: !304, line: 378, type: !140)
!2488 = !DILocalVariable(name: "__format", arg: 3, scope: !2482, file: !304, line: 378, type: !379)
!2489 = distinct !DISubprogram(name: "format_ip_address", scope: !2, file: !2, line: 627, type: !2490, scopeLine: 629, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2494)
!2490 = !DISubroutineType(types: !2491)
!2491 = !{!312, !314, !358, !312, !2492}
!2492 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2493, size: 64)
!2493 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !165)
!2494 = !{!2495, !2496, !2497, !2498}
!2495 = !DILocalVariable(name: "buf", arg: 1, scope: !2489, file: !2, line: 627, type: !314)
!2496 = !DILocalVariable(name: "size", arg: 2, scope: !2489, file: !2, line: 627, type: !358)
!2497 = !DILocalVariable(name: "af", arg: 3, scope: !2489, file: !2, line: 627, type: !312)
!2498 = !DILocalVariable(name: "addr", arg: 4, scope: !2489, file: !2, line: 628, type: !2492)
!2499 = !DILocation(line: 627, column: 36, scope: !2489)
!2500 = !DILocation(line: 627, column: 48, scope: !2489)
!2501 = !DILocation(line: 627, column: 58, scope: !2489)
!2502 = !DILocation(line: 628, column: 32, scope: !2489)
!2503 = !DILocation(line: 630, column: 6, scope: !2504)
!2504 = distinct !DILexicalBlock(scope: !2489, file: !2, line: 630, column: 6)
!2505 = !DILocation(line: 630, column: 9, scope: !2504)
!2506 = !DILocation(line: 630, column: 6, scope: !2489)
!2507 = !DILocation(line: 631, column: 20, scope: !2504)
!2508 = !DILocation(line: 631, column: 25, scope: !2504)
!2509 = !DILocation(line: 631, column: 31, scope: !2504)
!2510 = !DILocation(line: 632, column: 6, scope: !2504)
!2511 = !DILocation(line: 632, column: 11, scope: !2504)
!2512 = !DILocation(line: 631, column: 10, scope: !2504)
!2513 = !DILocation(line: 632, column: 20, scope: !2504)
!2514 = !DILocation(line: 632, column: 19, scope: !2504)
!2515 = !DILocation(line: 631, column: 3, scope: !2504)
!2516 = !DILocation(line: 633, column: 11, scope: !2517)
!2517 = distinct !DILexicalBlock(scope: !2504, file: !2, line: 633, column: 11)
!2518 = !DILocation(line: 633, column: 14, scope: !2517)
!2519 = !DILocation(line: 633, column: 11, scope: !2504)
!2520 = !DILocation(line: 634, column: 20, scope: !2517)
!2521 = !DILocation(line: 634, column: 24, scope: !2517)
!2522 = !DILocation(line: 634, column: 30, scope: !2517)
!2523 = !DILocation(line: 634, column: 35, scope: !2517)
!2524 = !DILocation(line: 634, column: 10, scope: !2517)
!2525 = !DILocation(line: 634, column: 44, scope: !2517)
!2526 = !DILocation(line: 634, column: 43, scope: !2517)
!2527 = !DILocation(line: 634, column: 3, scope: !2517)
!2528 = !DILocation(line: 635, column: 2, scope: !2489)
!2529 = !DILocation(line: 636, column: 1, scope: !2489)
!2530 = distinct !DISubprogram(name: "__bswap_16", scope: !2531, file: !2531, line: 34, type: !2532, scopeLine: 35, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2534)
!2531 = !DIFile(filename: "/usr/include/bits/byteswap.h", directory: "", checksumkind: CSK_MD5, checksum: "98f83253ffd9c64e7486789204e9fa05")
!2532 = !DISubroutineType(types: !2533)
!2533 = !{!146, !146}
!2534 = !{!2535}
!2535 = !DILocalVariable(name: "__bsx", arg: 1, scope: !2530, file: !2531, line: 34, type: !146)
!2536 = !DILocation(line: 34, column: 24, scope: !2530)
!2537 = !DILocation(line: 39, column: 10, scope: !2530)
!2538 = !DILocation(line: 39, column: 3, scope: !2530)
!2539 = !DISubprogram(name: "inet_ntop", scope: !2540, file: !2540, line: 64, type: !2541, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2547)
!2540 = !DIFile(filename: "/usr/include/arpa/inet.h", directory: "", checksumkind: CSK_MD5, checksum: "b2f9474dc296b712fc0e47c2c084f87d")
!2541 = !DISubroutineType(types: !2542)
!2542 = !{!379, !312, !2543, !2410, !2544}
!2543 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !1950)
!2544 = !DIDerivedType(tag: DW_TAG_typedef, name: "socklen_t", file: !2545, line: 33, baseType: !2546)
!2545 = !DIFile(filename: "/usr/include/bits/socket.h", directory: "", checksumkind: CSK_MD5, checksum: "e3826be048699664d9ef7b080f62f2e0")
!2546 = !DIDerivedType(tag: DW_TAG_typedef, name: "__socklen_t", file: !139, line: 210, baseType: !39)
!2547 = !{!2548, !2549, !2550, !2551}
!2548 = !DILocalVariable(name: "__af", arg: 1, scope: !2539, file: !2540, line: 64, type: !312)
!2549 = !DILocalVariable(name: "__cp", arg: 2, scope: !2539, file: !2540, line: 64, type: !2543)
!2550 = !DILocalVariable(name: "__buf", arg: 3, scope: !2539, file: !2540, line: 64, type: !2410)
!2551 = !DILocalVariable(name: "__len", arg: 4, scope: !2539, file: !2540, line: 64, type: !2544)
!2552 = !DISubprogram(name: "jsonw_new", scope: !688, file: !688, line: 24, type: !2553, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2555)
!2553 = !DISubroutineType(types: !2554)
!2554 = !{!686, !305}
!2555 = !{!2556}
!2556 = !DILocalVariable(name: "f", arg: 1, scope: !2552, file: !688, line: 24, type: !305)
!2557 = !DISubprogram(name: "jsonw_start_array", scope: !688, file: !688, line: 73, type: !1970, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2558)
!2558 = !{!2559}
!2559 = !DILocalVariable(name: "self", arg: 1, scope: !2557, file: !688, line: 73, type: !686)
!2560 = !DISubprogram(name: "jsonw_start_object", scope: !688, file: !688, line: 70, type: !1970, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2561)
!2561 = !{!2562}
!2562 = !DILocalVariable(name: "self", arg: 1, scope: !2560, file: !688, line: 70, type: !686)
!2563 = distinct !DISubprogram(name: "print_common_fields_json", scope: !2, file: !2, line: 764, type: !2564, scopeLine: 766, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2566)
!2564 = !DISubroutineType(types: !2565)
!2565 = !{null, !686, !581}
!2566 = !{!2567, !2568, !2569, !2570, !2571}
!2567 = !DILocalVariable(name: "ctx", arg: 1, scope: !2563, file: !2, line: 764, type: !686)
!2568 = !DILocalVariable(name: "e", arg: 2, scope: !2563, file: !2, line: 765, type: !581)
!2569 = !DILocalVariable(name: "flow", scope: !2563, file: !2, line: 767, type: !2282)
!2570 = !DILocalVariable(name: "saddr", scope: !2563, file: !2, line: 768, type: !275)
!2571 = !DILocalVariable(name: "daddr", scope: !2563, file: !2, line: 769, type: !275)
!2572 = !DILocation(line: 764, column: 53, scope: !2563)
!2573 = !DILocation(line: 765, column: 35, scope: !2563)
!2574 = !DILocation(line: 767, column: 2, scope: !2563)
!2575 = !DILocation(line: 767, column: 30, scope: !2563)
!2576 = !DILocation(line: 767, column: 38, scope: !2563)
!2577 = !DILocation(line: 767, column: 51, scope: !2563)
!2578 = !DILocation(line: 768, column: 2, scope: !2563)
!2579 = !DILocation(line: 768, column: 7, scope: !2563)
!2580 = !DILocation(line: 769, column: 2, scope: !2563)
!2581 = !DILocation(line: 769, column: 7, scope: !2563)
!2582 = !DILocation(line: 771, column: 20, scope: !2563)
!2583 = !DILocation(line: 771, column: 42, scope: !2563)
!2584 = !DILocation(line: 771, column: 48, scope: !2563)
!2585 = !DILocation(line: 771, column: 54, scope: !2563)
!2586 = !DILocation(line: 771, column: 60, scope: !2563)
!2587 = !DILocation(line: 771, column: 66, scope: !2563)
!2588 = !DILocation(line: 771, column: 2, scope: !2563)
!2589 = !DILocation(line: 772, column: 20, scope: !2563)
!2590 = !DILocation(line: 772, column: 42, scope: !2563)
!2591 = !DILocation(line: 772, column: 48, scope: !2563)
!2592 = !DILocation(line: 772, column: 54, scope: !2563)
!2593 = !DILocation(line: 772, column: 60, scope: !2563)
!2594 = !DILocation(line: 772, column: 66, scope: !2563)
!2595 = !DILocation(line: 772, column: 2, scope: !2563)
!2596 = !DILocation(line: 774, column: 18, scope: !2563)
!2597 = !DILocation(line: 775, column: 34, scope: !2563)
!2598 = !DILocation(line: 775, column: 47, scope: !2563)
!2599 = !DILocation(line: 775, column: 4, scope: !2563)
!2600 = !DILocation(line: 774, column: 2, scope: !2563)
!2601 = !DILocation(line: 776, column: 21, scope: !2563)
!2602 = !DILocation(line: 776, column: 36, scope: !2563)
!2603 = !DILocation(line: 776, column: 2, scope: !2563)
!2604 = !DILocation(line: 777, column: 17, scope: !2563)
!2605 = !DILocation(line: 777, column: 34, scope: !2563)
!2606 = !DILocation(line: 777, column: 2, scope: !2563)
!2607 = !DILocation(line: 778, column: 21, scope: !2563)
!2608 = !DILocation(line: 778, column: 37, scope: !2563)
!2609 = !DILocation(line: 778, column: 2, scope: !2563)
!2610 = !DILocation(line: 779, column: 17, scope: !2563)
!2611 = !DILocation(line: 779, column: 35, scope: !2563)
!2612 = !DILocation(line: 779, column: 2, scope: !2563)
!2613 = !DILocation(line: 780, column: 21, scope: !2563)
!2614 = !DILocation(line: 780, column: 51, scope: !2563)
!2615 = !DILocation(line: 780, column: 57, scope: !2563)
!2616 = !{!1557, !1560, i64 40}
!2617 = !DILocation(line: 780, column: 38, scope: !2563)
!2618 = !DILocation(line: 780, column: 2, scope: !2563)
!2619 = !DILocation(line: 781, column: 1, scope: !2563)
!2620 = distinct !DISubprogram(name: "print_rttevent_fields_json", scope: !2, file: !2, line: 783, type: !2621, scopeLine: 785, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2623)
!2621 = !DISubroutineType(types: !2622)
!2622 = !{null, !686, !1538}
!2623 = !{!2624, !2625}
!2624 = !DILocalVariable(name: "ctx", arg: 1, scope: !2620, file: !2, line: 783, type: !686)
!2625 = !DILocalVariable(name: "re", arg: 2, scope: !2620, file: !2, line: 784, type: !1538)
!2626 = !DILocation(line: 783, column: 55, scope: !2620)
!2627 = !DILocation(line: 784, column: 36, scope: !2620)
!2628 = !DILocation(line: 786, column: 18, scope: !2620)
!2629 = !DILocation(line: 786, column: 30, scope: !2620)
!2630 = !DILocation(line: 786, column: 34, scope: !2620)
!2631 = !DILocation(line: 786, column: 2, scope: !2620)
!2632 = !DILocation(line: 787, column: 18, scope: !2620)
!2633 = !DILocation(line: 787, column: 34, scope: !2620)
!2634 = !DILocation(line: 787, column: 38, scope: !2620)
!2635 = !DILocation(line: 787, column: 2, scope: !2620)
!2636 = !DILocation(line: 788, column: 18, scope: !2620)
!2637 = !DILocation(line: 788, column: 39, scope: !2620)
!2638 = !DILocation(line: 788, column: 43, scope: !2620)
!2639 = !{!1556, !754, i64 80}
!2640 = !DILocation(line: 788, column: 2, scope: !2620)
!2641 = !DILocation(line: 789, column: 18, scope: !2620)
!2642 = !DILocation(line: 789, column: 37, scope: !2620)
!2643 = !DILocation(line: 789, column: 41, scope: !2620)
!2644 = !{!1556, !754, i64 88}
!2645 = !DILocation(line: 789, column: 2, scope: !2620)
!2646 = !DILocation(line: 790, column: 18, scope: !2620)
!2647 = !DILocation(line: 790, column: 38, scope: !2620)
!2648 = !DILocation(line: 790, column: 42, scope: !2620)
!2649 = !{!1556, !754, i64 96}
!2650 = !DILocation(line: 790, column: 2, scope: !2620)
!2651 = !DILocation(line: 791, column: 18, scope: !2620)
!2652 = !DILocation(line: 791, column: 36, scope: !2620)
!2653 = !DILocation(line: 791, column: 40, scope: !2620)
!2654 = !{!1556, !754, i64 104}
!2655 = !DILocation(line: 791, column: 2, scope: !2620)
!2656 = !DILocation(line: 792, column: 19, scope: !2620)
!2657 = !DILocation(line: 792, column: 43, scope: !2620)
!2658 = !DILocation(line: 792, column: 47, scope: !2620)
!2659 = !{!1556, !755, i64 112}
!2660 = !DILocation(line: 792, column: 2, scope: !2620)
!2661 = !DILocation(line: 793, column: 1, scope: !2620)
!2662 = distinct !DISubprogram(name: "print_flowevent_fields_json", scope: !2, file: !2, line: 795, type: !2663, scopeLine: 797, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2667)
!2663 = !DISubroutineType(types: !2664)
!2664 = !{null, !686, !2665}
!2665 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2666, size: 64)
!2666 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !209)
!2667 = !{!2668, !2669}
!2668 = !DILocalVariable(name: "ctx", arg: 1, scope: !2662, file: !2, line: 795, type: !686)
!2669 = !DILocalVariable(name: "fe", arg: 2, scope: !2662, file: !2, line: 796, type: !2665)
!2670 = !DILocation(line: 795, column: 56, scope: !2662)
!2671 = !DILocation(line: 796, column: 31, scope: !2662)
!2672 = !DILocation(line: 798, column: 21, scope: !2662)
!2673 = !DILocation(line: 799, column: 24, scope: !2662)
!2674 = !DILocation(line: 799, column: 28, scope: !2662)
!2675 = !{!2676, !743, i64 60}
!2676 = !{!"flow_event", !754, i64 0, !754, i64 8, !1557, i64 16, !743, i64 60, !743, i64 61, !743, i64 62, !743, i64 63}
!2677 = !DILocation(line: 799, column: 7, scope: !2662)
!2678 = !DILocation(line: 798, column: 2, scope: !2662)
!2679 = !DILocation(line: 800, column: 21, scope: !2662)
!2680 = !DILocation(line: 801, column: 26, scope: !2662)
!2681 = !DILocation(line: 801, column: 30, scope: !2662)
!2682 = !{!2676, !743, i64 61}
!2683 = !DILocation(line: 801, column: 7, scope: !2662)
!2684 = !DILocation(line: 800, column: 2, scope: !2662)
!2685 = !DILocation(line: 802, column: 21, scope: !2662)
!2686 = !DILocation(line: 802, column: 61, scope: !2662)
!2687 = !DILocation(line: 802, column: 65, scope: !2662)
!2688 = !{!2676, !743, i64 62}
!2689 = !DILocation(line: 802, column: 42, scope: !2662)
!2690 = !DILocation(line: 802, column: 2, scope: !2662)
!2691 = !DILocation(line: 803, column: 1, scope: !2662)
!2692 = !DISubprogram(name: "jsonw_end_object", scope: !688, file: !688, line: 71, type: !1970, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2693)
!2693 = !{!2694}
!2694 = !DILocalVariable(name: "self", arg: 1, scope: !2692, file: !688, line: 71, type: !686)
!2695 = !DISubprogram(name: "jsonw_u64_field", scope: !688, file: !688, line: 57, type: !2696, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2700)
!2696 = !DISubroutineType(types: !2697)
!2697 = !{null, !686, !379, !2698}
!2698 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !173, line: 27, baseType: !2699)
!2699 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !139, line: 48, baseType: !145)
!2700 = !{!2701, !2702, !2703}
!2701 = !DILocalVariable(name: "self", arg: 1, scope: !2695, file: !688, line: 57, type: !686)
!2702 = !DILocalVariable(name: "prop", arg: 2, scope: !2695, file: !688, line: 57, type: !379)
!2703 = !DILocalVariable(name: "num", arg: 3, scope: !2695, file: !688, line: 57, type: !2698)
!2704 = !DISubprogram(name: "jsonw_string_field", scope: !688, file: !688, line: 53, type: !2705, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2707)
!2705 = !DISubroutineType(types: !2706)
!2706 = !{null, !686, !379, !379}
!2707 = !{!2708, !2709, !2710}
!2708 = !DILocalVariable(name: "self", arg: 1, scope: !2704, file: !688, line: 53, type: !686)
!2709 = !DILocalVariable(name: "prop", arg: 2, scope: !2704, file: !688, line: 53, type: !379)
!2710 = !DILocalVariable(name: "val", arg: 3, scope: !2704, file: !688, line: 53, type: !379)
!2711 = !DISubprogram(name: "jsonw_hu_field", scope: !688, file: !688, line: 60, type: !2712, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2714)
!2712 = !DISubroutineType(types: !2713)
!2713 = !{null, !686, !379, !147}
!2714 = !{!2715, !2716, !2717}
!2715 = !DILocalVariable(name: "self", arg: 1, scope: !2711, file: !688, line: 60, type: !686)
!2716 = !DILocalVariable(name: "prop", arg: 2, scope: !2711, file: !688, line: 60, type: !379)
!2717 = !DILocalVariable(name: "num", arg: 3, scope: !2711, file: !688, line: 60, type: !147)
!2718 = !DISubprogram(name: "jsonw_bool_field", scope: !688, file: !688, line: 54, type: !2719, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2721)
!2719 = !DISubroutineType(types: !2720)
!2720 = !{null, !686, !379, !203}
!2721 = !{!2722, !2723, !2724}
!2722 = !DILocalVariable(name: "self", arg: 1, scope: !2718, file: !688, line: 54, type: !686)
!2723 = !DILocalVariable(name: "prop", arg: 2, scope: !2718, file: !688, line: 54, type: !379)
!2724 = !DILocalVariable(name: "value", arg: 3, scope: !2718, file: !688, line: 54, type: !203)
!2725 = !DISubprogram(name: "bpf_object__open", scope: !70, file: !70, line: 153, type: !2726, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2728)
!2726 = !DISubroutineType(types: !2727)
!2727 = !{!808, !379}
!2728 = !{!2729}
!2729 = !DILocalVariable(name: "path", arg: 1, scope: !2725, file: !70, line: 153, type: !379)
!2730 = distinct !DISubprogram(name: "init_rodata", scope: !2, file: !2, line: 323, type: !2731, scopeLine: 324, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2733)
!2731 = !DISubroutineType(types: !2732)
!2732 = !{!312, !808, !141, !358}
!2733 = !{!2734, !2735, !2736, !2737}
!2734 = !DILocalVariable(name: "obj", arg: 1, scope: !2730, file: !2, line: 323, type: !808)
!2735 = !DILocalVariable(name: "src", arg: 2, scope: !2730, file: !2, line: 323, type: !141)
!2736 = !DILocalVariable(name: "size", arg: 3, scope: !2730, file: !2, line: 323, type: !358)
!2737 = !DILocalVariable(name: "map", scope: !2730, file: !2, line: 325, type: !2738)
!2738 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2739, size: 64)
!2739 = !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_map", file: !70, line: 513, flags: DIFlagFwdDecl)
!2740 = !DILocation(line: 323, column: 43, scope: !2730)
!2741 = !DILocation(line: 323, column: 54, scope: !2730)
!2742 = !DILocation(line: 323, column: 66, scope: !2730)
!2743 = !DILocation(line: 325, column: 2, scope: !2730)
!2744 = !DILocation(line: 325, column: 18, scope: !2730)
!2745 = !DILocation(line: 326, column: 2, scope: !2746)
!2746 = distinct !DILexicalBlock(scope: !2730, file: !2, line: 326, column: 2)
!2747 = !DILocation(line: 326, column: 2, scope: !2748)
!2748 = distinct !DILexicalBlock(scope: !2746, file: !2, line: 326, column: 2)
!2749 = !DILocation(line: 327, column: 28, scope: !2750)
!2750 = distinct !DILexicalBlock(scope: !2751, file: !2, line: 327, column: 7)
!2751 = distinct !DILexicalBlock(scope: !2748, file: !2, line: 326, column: 37)
!2752 = !DILocation(line: 327, column: 14, scope: !2750)
!2753 = !DILocation(line: 327, column: 7, scope: !2750)
!2754 = !DILocation(line: 327, column: 7, scope: !2751)
!2755 = !DILocation(line: 328, column: 38, scope: !2750)
!2756 = !DILocation(line: 328, column: 43, scope: !2750)
!2757 = !DILocation(line: 328, column: 48, scope: !2750)
!2758 = !DILocation(line: 328, column: 11, scope: !2750)
!2759 = !DILocation(line: 328, column: 4, scope: !2750)
!2760 = !DILocation(line: 329, column: 2, scope: !2751)
!2761 = distinct !{!2761, !2745, !2762, !991}
!2762 = !DILocation(line: 329, column: 2, scope: !2746)
!2763 = !DILocation(line: 332, column: 2, scope: !2730)
!2764 = !DILocation(line: 333, column: 1, scope: !2730)
!2765 = distinct !DISubprogram(name: "set_programs_to_load", scope: !2, file: !2, line: 865, type: !1769, scopeLine: 867, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2766)
!2766 = !{!2767, !2768, !2769, !2772}
!2767 = !DILocalVariable(name: "obj", arg: 1, scope: !2765, file: !2, line: 865, type: !808)
!2768 = !DILocalVariable(name: "config", arg: 2, scope: !2765, file: !2, line: 866, type: !699)
!2769 = !DILocalVariable(name: "prog", scope: !2765, file: !2, line: 868, type: !2770)
!2770 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2771, size: 64)
!2771 = !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_program", file: !70, line: 231, flags: DIFlagFwdDecl)
!2772 = !DILocalVariable(name: "unload_prog", scope: !2765, file: !2, line: 869, type: !314)
!2773 = !DILocation(line: 865, column: 52, scope: !2765)
!2774 = !DILocation(line: 866, column: 26, scope: !2765)
!2775 = !DILocation(line: 868, column: 2, scope: !2765)
!2776 = !DILocation(line: 868, column: 22, scope: !2765)
!2777 = !DILocation(line: 869, column: 2, scope: !2765)
!2778 = !DILocation(line: 869, column: 8, scope: !2765)
!2779 = !DILocation(line: 870, column: 10, scope: !2765)
!2780 = !DILocation(line: 870, column: 18, scope: !2765)
!2781 = !DILocation(line: 870, column: 3, scope: !2765)
!2782 = !DILocation(line: 870, column: 53, scope: !2765)
!2783 = !DILocation(line: 874, column: 42, scope: !2765)
!2784 = !DILocation(line: 874, column: 47, scope: !2765)
!2785 = !DILocation(line: 874, column: 9, scope: !2765)
!2786 = !DILocation(line: 874, column: 7, scope: !2765)
!2787 = !DILocation(line: 875, column: 23, scope: !2788)
!2788 = distinct !DILexicalBlock(scope: !2765, file: !2, line: 875, column: 6)
!2789 = !DILocation(line: 875, column: 6, scope: !2788)
!2790 = !DILocation(line: 875, column: 6, scope: !2765)
!2791 = !DILocation(line: 876, column: 27, scope: !2788)
!2792 = !DILocation(line: 876, column: 10, scope: !2788)
!2793 = !DILocation(line: 876, column: 3, scope: !2788)
!2794 = !DILocation(line: 878, column: 35, scope: !2765)
!2795 = !DILocation(line: 878, column: 9, scope: !2765)
!2796 = !DILocation(line: 878, column: 2, scope: !2765)
!2797 = !DILocation(line: 879, column: 1, scope: !2765)
!2798 = !DISubprogram(name: "bpf_object__load", scope: !70, file: !70, line: 216, type: !2799, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2801)
!2799 = !DISubroutineType(types: !2800)
!2800 = !{!312, !808}
!2801 = !{!2802}
!2802 = !DILocalVariable(name: "obj", arg: 1, scope: !2798, file: !70, line: 216, type: !808)
!2803 = distinct !DISubprogram(name: "tc_attach", scope: !2, file: !2, line: 395, type: !2804, scopeLine: 399, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2808)
!2804 = !DISubroutineType(types: !2805)
!2805 = !{!312, !808, !312, !69, !379, !2806, !2807}
!2806 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !713, size: 64)
!2807 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !203, size: 64)
!2808 = !{!2809, !2810, !2811, !2812, !2813, !2814, !2815, !2816, !2817, !2818, !2819}
!2809 = !DILocalVariable(name: "obj", arg: 1, scope: !2803, file: !2, line: 395, type: !808)
!2810 = !DILocalVariable(name: "ifindex", arg: 2, scope: !2803, file: !2, line: 395, type: !312)
!2811 = !DILocalVariable(name: "attach_point", arg: 3, scope: !2803, file: !2, line: 396, type: !69)
!2812 = !DILocalVariable(name: "prog_name", arg: 4, scope: !2803, file: !2, line: 397, type: !379)
!2813 = !DILocalVariable(name: "opts", arg: 5, scope: !2803, file: !2, line: 397, type: !2806)
!2814 = !DILocalVariable(name: "new_hook", arg: 6, scope: !2803, file: !2, line: 398, type: !2807)
!2815 = !DILocalVariable(name: "err", scope: !2803, file: !2, line: 400, type: !312)
!2816 = !DILocalVariable(name: "prog_fd", scope: !2803, file: !2, line: 401, type: !312)
!2817 = !DILocalVariable(name: "created_hook", scope: !2803, file: !2, line: 402, type: !203)
!2818 = !DILocalVariable(name: "hook", scope: !2803, file: !2, line: 403, type: !2048)
!2819 = !DILabel(scope: !2803, name: "err_after_hook", file: !2, line: 429)
!2820 = !DILocation(line: 395, column: 41, scope: !2803)
!2821 = !DILocation(line: 395, column: 50, scope: !2803)
!2822 = !DILocation(line: 396, column: 33, scope: !2803)
!2823 = !DILocation(line: 397, column: 20, scope: !2803)
!2824 = !DILocation(line: 397, column: 51, scope: !2803)
!2825 = !DILocation(line: 398, column: 14, scope: !2803)
!2826 = !DILocation(line: 400, column: 2, scope: !2803)
!2827 = !DILocation(line: 400, column: 6, scope: !2803)
!2828 = !DILocation(line: 401, column: 2, scope: !2803)
!2829 = !DILocation(line: 401, column: 6, scope: !2803)
!2830 = !DILocation(line: 402, column: 2, scope: !2803)
!2831 = !DILocation(line: 402, column: 7, scope: !2803)
!2832 = !DILocation(line: 403, column: 2, scope: !2803)
!2833 = !DILocation(line: 403, column: 2, scope: !2834)
!2834 = distinct !DILexicalBlock(scope: !2803, file: !2, line: 403, column: 2)
!2835 = !DILocation(line: 406, column: 8, scope: !2803)
!2836 = !DILocation(line: 406, column: 6, scope: !2803)
!2837 = !DILocation(line: 407, column: 6, scope: !2838)
!2838 = distinct !DILexicalBlock(scope: !2803, file: !2, line: 407, column: 6)
!2839 = !DILocation(line: 407, column: 10, scope: !2838)
!2840 = !DILocation(line: 407, column: 6, scope: !2803)
!2841 = !DILocation(line: 408, column: 16, scope: !2838)
!2842 = !DILocation(line: 408, column: 3, scope: !2838)
!2843 = !DILocation(line: 409, column: 11, scope: !2844)
!2844 = distinct !DILexicalBlock(scope: !2838, file: !2, line: 409, column: 11)
!2845 = !DILocation(line: 409, column: 11, scope: !2838)
!2846 = !DILocation(line: 410, column: 10, scope: !2844)
!2847 = !DILocation(line: 410, column: 3, scope: !2844)
!2848 = !DILocation(line: 413, column: 36, scope: !2803)
!2849 = !DILocation(line: 413, column: 41, scope: !2803)
!2850 = !DILocation(line: 413, column: 3, scope: !2803)
!2851 = !DILocation(line: 412, column: 12, scope: !2803)
!2852 = !DILocation(line: 412, column: 10, scope: !2803)
!2853 = !DILocation(line: 414, column: 6, scope: !2854)
!2854 = distinct !DILexicalBlock(scope: !2803, file: !2, line: 414, column: 6)
!2855 = !DILocation(line: 414, column: 14, scope: !2854)
!2856 = !DILocation(line: 414, column: 6, scope: !2803)
!2857 = !DILocation(line: 415, column: 9, scope: !2858)
!2858 = distinct !DILexicalBlock(scope: !2854, file: !2, line: 414, column: 19)
!2859 = !DILocation(line: 415, column: 7, scope: !2858)
!2860 = !DILocation(line: 416, column: 3, scope: !2858)
!2861 = !DILocation(line: 419, column: 18, scope: !2803)
!2862 = !DILocation(line: 419, column: 2, scope: !2803)
!2863 = !DILocation(line: 419, column: 8, scope: !2803)
!2864 = !DILocation(line: 419, column: 16, scope: !2803)
!2865 = !DILocation(line: 420, column: 2, scope: !2803)
!2866 = !DILocation(line: 420, column: 8, scope: !2803)
!2867 = !DILocation(line: 420, column: 16, scope: !2803)
!2868 = !DILocation(line: 421, column: 29, scope: !2803)
!2869 = !DILocation(line: 421, column: 8, scope: !2803)
!2870 = !DILocation(line: 421, column: 6, scope: !2803)
!2871 = !DILocation(line: 422, column: 6, scope: !2872)
!2872 = distinct !DILexicalBlock(scope: !2803, file: !2, line: 422, column: 6)
!2873 = !DILocation(line: 422, column: 6, scope: !2803)
!2874 = !DILocation(line: 423, column: 3, scope: !2872)
!2875 = !DILocation(line: 425, column: 6, scope: !2876)
!2876 = distinct !DILexicalBlock(scope: !2803, file: !2, line: 425, column: 6)
!2877 = !DILocation(line: 425, column: 6, scope: !2803)
!2878 = !DILocation(line: 426, column: 15, scope: !2876)
!2879 = !DILocation(line: 426, column: 4, scope: !2876)
!2880 = !DILocation(line: 426, column: 13, scope: !2876)
!2881 = !DILocation(line: 426, column: 3, scope: !2876)
!2882 = !DILocation(line: 427, column: 9, scope: !2803)
!2883 = !DILocation(line: 427, column: 15, scope: !2803)
!2884 = !DILocation(line: 427, column: 2, scope: !2803)
!2885 = !DILocation(line: 429, column: 1, scope: !2803)
!2886 = !DILocation(line: 435, column: 6, scope: !2887)
!2887 = distinct !DILexicalBlock(scope: !2803, file: !2, line: 435, column: 6)
!2888 = !DILocation(line: 435, column: 6, scope: !2803)
!2889 = !DILocation(line: 436, column: 8, scope: !2890)
!2890 = distinct !DILexicalBlock(scope: !2887, file: !2, line: 435, column: 20)
!2891 = !DILocation(line: 436, column: 21, scope: !2890)
!2892 = !DILocation(line: 437, column: 3, scope: !2890)
!2893 = !DILocation(line: 438, column: 2, scope: !2890)
!2894 = !DILocation(line: 439, column: 9, scope: !2803)
!2895 = !DILocation(line: 439, column: 2, scope: !2803)
!2896 = !DILocation(line: 440, column: 1, scope: !2803)
!2897 = distinct !DISubprogram(name: "xdp_attach", scope: !2, file: !2, line: 340, type: !2898, scopeLine: 342, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2900)
!2898 = !DISubroutineType(types: !2899)
!2899 = !{!312, !808, !379, !312, !195}
!2900 = !{!2901, !2902, !2903, !2904, !2905, !2906, !2907, !2908}
!2901 = !DILocalVariable(name: "obj", arg: 1, scope: !2897, file: !2, line: 340, type: !808)
!2902 = !DILocalVariable(name: "prog_name", arg: 2, scope: !2897, file: !2, line: 340, type: !379)
!2903 = !DILocalVariable(name: "ifindex", arg: 3, scope: !2897, file: !2, line: 341, type: !312)
!2904 = !DILocalVariable(name: "xdp_flags", arg: 4, scope: !2897, file: !2, line: 341, type: !195)
!2905 = !DILocalVariable(name: "prog", scope: !2897, file: !2, line: 343, type: !2770)
!2906 = !DILocalVariable(name: "prog_fd", scope: !2897, file: !2, line: 344, type: !312)
!2907 = !DILocalVariable(name: "err", scope: !2897, file: !2, line: 344, type: !312)
!2908 = !DILocalVariable(name: "prog_id", scope: !2897, file: !2, line: 345, type: !195)
!2909 = !DILocation(line: 340, column: 42, scope: !2897)
!2910 = !DILocation(line: 340, column: 59, scope: !2897)
!2911 = !DILocation(line: 341, column: 13, scope: !2897)
!2912 = !DILocation(line: 341, column: 28, scope: !2897)
!2913 = !DILocation(line: 343, column: 2, scope: !2897)
!2914 = !DILocation(line: 343, column: 22, scope: !2897)
!2915 = !DILocation(line: 344, column: 2, scope: !2897)
!2916 = !DILocation(line: 344, column: 6, scope: !2897)
!2917 = !DILocation(line: 344, column: 15, scope: !2897)
!2918 = !DILocation(line: 345, column: 2, scope: !2897)
!2919 = !DILocation(line: 345, column: 8, scope: !2897)
!2920 = !DILocation(line: 347, column: 6, scope: !2921)
!2921 = distinct !DILexicalBlock(scope: !2897, file: !2, line: 347, column: 6)
!2922 = !DILocation(line: 347, column: 6, scope: !2897)
!2923 = !DILocation(line: 348, column: 43, scope: !2921)
!2924 = !DILocation(line: 348, column: 48, scope: !2921)
!2925 = !DILocation(line: 348, column: 10, scope: !2921)
!2926 = !DILocation(line: 348, column: 8, scope: !2921)
!2927 = !DILocation(line: 348, column: 3, scope: !2921)
!2928 = !DILocation(line: 350, column: 35, scope: !2921)
!2929 = !DILocation(line: 350, column: 10, scope: !2921)
!2930 = !DILocation(line: 350, column: 8, scope: !2921)
!2931 = !DILocation(line: 352, column: 28, scope: !2897)
!2932 = !DILocation(line: 352, column: 12, scope: !2897)
!2933 = !DILocation(line: 352, column: 10, scope: !2897)
!2934 = !DILocation(line: 353, column: 6, scope: !2935)
!2935 = distinct !DILexicalBlock(scope: !2897, file: !2, line: 353, column: 6)
!2936 = !DILocation(line: 353, column: 14, scope: !2935)
!2937 = !DILocation(line: 353, column: 6, scope: !2897)
!2938 = !DILocation(line: 354, column: 10, scope: !2935)
!2939 = !DILocation(line: 354, column: 3, scope: !2935)
!2940 = !DILocation(line: 356, column: 28, scope: !2897)
!2941 = !DILocation(line: 356, column: 37, scope: !2897)
!2942 = !DILocation(line: 356, column: 46, scope: !2897)
!2943 = !DILocation(line: 356, column: 8, scope: !2897)
!2944 = !DILocation(line: 356, column: 6, scope: !2897)
!2945 = !DILocation(line: 357, column: 6, scope: !2946)
!2946 = distinct !DILexicalBlock(scope: !2897, file: !2, line: 357, column: 6)
!2947 = !DILocation(line: 357, column: 6, scope: !2897)
!2948 = !DILocation(line: 358, column: 10, scope: !2946)
!2949 = !DILocation(line: 358, column: 3, scope: !2946)
!2950 = !DILocation(line: 360, column: 28, scope: !2897)
!2951 = !DILocation(line: 360, column: 47, scope: !2897)
!2952 = !DILocation(line: 360, column: 8, scope: !2897)
!2953 = !DILocation(line: 360, column: 6, scope: !2897)
!2954 = !DILocation(line: 361, column: 6, scope: !2955)
!2955 = distinct !DILexicalBlock(scope: !2897, file: !2, line: 361, column: 6)
!2956 = !DILocation(line: 361, column: 6, scope: !2897)
!2957 = !DILocation(line: 362, column: 23, scope: !2958)
!2958 = distinct !DILexicalBlock(scope: !2955, file: !2, line: 361, column: 11)
!2959 = !DILocation(line: 362, column: 36, scope: !2958)
!2960 = !DILocation(line: 362, column: 3, scope: !2958)
!2961 = !DILocation(line: 363, column: 10, scope: !2958)
!2962 = !DILocation(line: 363, column: 3, scope: !2958)
!2963 = !DILocation(line: 366, column: 9, scope: !2897)
!2964 = !DILocation(line: 366, column: 2, scope: !2897)
!2965 = !DILocation(line: 367, column: 1, scope: !2897)
!2966 = distinct !DISubprogram(name: "print_xdp_error_hints", scope: !2, file: !2, line: 886, type: !2967, scopeLine: 887, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2969)
!2967 = !DISubroutineType(types: !2968)
!2968 = !{null, !305, !312}
!2969 = !{!2970, !2971}
!2970 = !DILocalVariable(name: "stream", arg: 1, scope: !2966, file: !2, line: 886, type: !305)
!2971 = !DILocalVariable(name: "err", arg: 2, scope: !2966, file: !2, line: 886, type: !312)
!2972 = !DILocation(line: 886, column: 41, scope: !2966)
!2973 = !DILocation(line: 886, column: 53, scope: !2966)
!2974 = !DILocation(line: 888, column: 8, scope: !2966)
!2975 = !DILocation(line: 888, column: 12, scope: !2966)
!2976 = !DILocation(line: 888, column: 18, scope: !2966)
!2977 = !DILocation(line: 888, column: 25, scope: !2966)
!2978 = !DILocation(line: 888, column: 24, scope: !2966)
!2979 = !DILocation(line: 888, column: 6, scope: !2966)
!2980 = !DILocation(line: 889, column: 10, scope: !2966)
!2981 = !DILocation(line: 889, column: 2, scope: !2966)
!2982 = !DILocation(line: 892, column: 11, scope: !2983)
!2983 = distinct !DILexicalBlock(scope: !2966, file: !2, line: 889, column: 15)
!2984 = !DILocation(line: 892, column: 3, scope: !2983)
!2985 = !DILocation(line: 894, column: 3, scope: !2983)
!2986 = !DILocation(line: 896, column: 11, scope: !2983)
!2987 = !DILocation(line: 896, column: 3, scope: !2983)
!2988 = !DILocation(line: 897, column: 3, scope: !2983)
!2989 = !DILocation(line: 899, column: 1, scope: !2966)
!2990 = !DISubprogram(name: "bpf_object__next_map", scope: !70, file: !70, line: 687, type: !2991, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2995)
!2991 = !DISubroutineType(types: !2992)
!2992 = !{!2738, !1894, !2993}
!2993 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2994, size: 64)
!2994 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2739)
!2995 = !{!2996, !2997}
!2996 = !DILocalVariable(name: "obj", arg: 1, scope: !2990, file: !70, line: 687, type: !1894)
!2997 = !DILocalVariable(name: "map", arg: 2, scope: !2990, file: !70, line: 687, type: !2993)
!2998 = !DISubprogram(name: "strstr", scope: !1986, file: !1986, line: 350, type: !2999, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3001)
!2999 = !DISubroutineType(types: !3000)
!3000 = !{!314, !379, !379}
!3001 = !{!3002, !3003}
!3002 = !DILocalVariable(name: "__haystack", arg: 1, scope: !2998, file: !1986, line: 350, type: !379)
!3003 = !DILocalVariable(name: "__needle", arg: 2, scope: !2998, file: !1986, line: 350, type: !379)
!3004 = !DISubprogram(name: "bpf_map__name", scope: !70, file: !70, line: 712, type: !3005, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3007)
!3005 = !DISubroutineType(types: !3006)
!3006 = !{!379, !2993}
!3007 = !{!3008}
!3008 = !DILocalVariable(name: "map", arg: 1, scope: !3004, file: !70, line: 712, type: !2993)
!3009 = !DISubprogram(name: "bpf_map__set_initial_value", scope: !70, file: !70, line: 746, type: !3010, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3012)
!3010 = !DISubroutineType(types: !3011)
!3011 = !{!312, !2738, !1950, !358}
!3012 = !{!3013, !3014, !3015}
!3013 = !DILocalVariable(name: "map", arg: 1, scope: !3009, file: !70, line: 746, type: !2738)
!3014 = !DILocalVariable(name: "data", arg: 2, scope: !3009, file: !70, line: 746, type: !1950)
!3015 = !DILocalVariable(name: "size", arg: 3, scope: !3009, file: !70, line: 746, type: !358)
!3016 = !DISubprogram(name: "bpf_object__find_program_by_name", scope: !70, file: !70, line: 235, type: !3017, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3019)
!3017 = !DISubroutineType(types: !3018)
!3018 = !{!2770, !1894, !379}
!3019 = !{!3020, !3021}
!3020 = !DILocalVariable(name: "obj", arg: 1, scope: !3016, file: !70, line: 235, type: !1894)
!3021 = !DILocalVariable(name: "name", arg: 2, scope: !3016, file: !70, line: 235, type: !379)
!3022 = !DISubprogram(name: "bpf_program__set_autoload", scope: !70, file: !70, line: 292, type: !3023, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3025)
!3023 = !DISubroutineType(types: !3024)
!3024 = !{!312, !2770, !203}
!3025 = !{!3026, !3027}
!3026 = !DILocalVariable(name: "prog", arg: 1, scope: !3022, file: !70, line: 292, type: !2770)
!3027 = !DILocalVariable(name: "autoload", arg: 2, scope: !3022, file: !70, line: 292, type: !203)
!3028 = !DISubprogram(name: "bpf_tc_hook_create", scope: !70, file: !70, line: 877, type: !3029, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3032)
!3029 = !DISubroutineType(types: !3030)
!3030 = !{!312, !3031}
!3031 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2048, size: 64)
!3032 = !{!3033}
!3033 = !DILocalVariable(name: "hook", arg: 1, scope: !3028, file: !70, line: 877, type: !3031)
!3034 = !DISubprogram(name: "bpf_program__fd", scope: !70, file: !70, line: 334, type: !3035, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3039)
!3035 = !DISubroutineType(types: !3036)
!3036 = !{!312, !3037}
!3037 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3038, size: 64)
!3038 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2771)
!3039 = !{!3040}
!3040 = !DILocalVariable(name: "prog", arg: 1, scope: !3034, file: !70, line: 334, type: !3037)
!3041 = !DISubprogram(name: "bpf_tc_attach", scope: !70, file: !70, line: 879, type: !3042, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3046)
!3042 = !DISubroutineType(types: !3043)
!3043 = !{!312, !3044, !2806}
!3044 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3045, size: 64)
!3045 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2048)
!3046 = !{!3047, !3048}
!3047 = !DILocalVariable(name: "hook", arg: 1, scope: !3041, file: !70, line: 879, type: !3044)
!3048 = !DILocalVariable(name: "opts", arg: 2, scope: !3041, file: !70, line: 879, type: !2806)
!3049 = !DISubprogram(name: "bpf_tc_hook_destroy", scope: !70, file: !70, line: 878, type: !3029, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3050)
!3050 = !{!3051}
!3051 = !DILocalVariable(name: "hook", arg: 1, scope: !3049, file: !70, line: 878, type: !3031)
!3052 = !DISubprogram(name: "bpf_object__next_program", scope: !70, file: !70, line: 265, type: !3053, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3055)
!3053 = !DISubroutineType(types: !3054)
!3054 = !{!2770, !1894, !2770}
!3055 = !{!3056, !3057}
!3056 = !DILocalVariable(name: "obj", arg: 1, scope: !3052, file: !70, line: 265, type: !1894)
!3057 = !DILocalVariable(name: "prog", arg: 2, scope: !3052, file: !70, line: 265, type: !2770)
!3058 = !DISubprogram(name: "bpf_set_link_xdp_fd", scope: !70, file: !70, line: 836, type: !3059, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3061)
!3059 = !DISubroutineType(types: !3060)
!3060 = !{!312, !312, !312, !195}
!3061 = !{!3062, !3063, !3064}
!3062 = !DILocalVariable(name: "ifindex", arg: 1, scope: !3058, file: !70, line: 836, type: !312)
!3063 = !DILocalVariable(name: "fd", arg: 2, scope: !3058, file: !70, line: 836, type: !312)
!3064 = !DILocalVariable(name: "flags", arg: 3, scope: !3058, file: !70, line: 836, type: !195)
!3065 = !DISubprogram(name: "bpf_get_link_xdp_id", scope: !70, file: !70, line: 839, type: !3066, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3069)
!3066 = !DISubroutineType(types: !3067)
!3067 = !{!312, !312, !3068, !195}
!3068 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !195, size: 64)
!3069 = !{!3070, !3071, !3072}
!3070 = !DILocalVariable(name: "ifindex", arg: 1, scope: !3065, file: !70, line: 839, type: !312)
!3071 = !DILocalVariable(name: "prog_id", arg: 2, scope: !3065, file: !70, line: 839, type: !3068)
!3072 = !DILocalVariable(name: "flags", arg: 3, scope: !3065, file: !70, line: 839, type: !195)
!3073 = !DISubprogram(name: "pthread_create", scope: !3074, file: !3074, line: 202, type: !3075, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3091)
!3074 = !DIFile(filename: "/usr/include/pthread.h", directory: "", checksumkind: CSK_MD5, checksum: "5205981c6f80cc3dc1e81231df63d8ef")
!3075 = !DISubroutineType(types: !3076)
!3076 = !{!312, !3077, !3079, !3087, !3090}
!3077 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !3078)
!3078 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1775, size: 64)
!3079 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !3080)
!3080 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3081, size: 64)
!3081 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !3082)
!3082 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_attr_t", file: !1776, line: 62, baseType: !3083)
!3083 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "pthread_attr_t", file: !1776, line: 56, size: 320, elements: !3084)
!3084 = !{!3085, !3086}
!3085 = !DIDerivedType(tag: DW_TAG_member, name: "__size", scope: !3083, file: !1776, line: 58, baseType: !285, size: 288)
!3086 = !DIDerivedType(tag: DW_TAG_member, name: "__align", scope: !3083, file: !1776, line: 59, baseType: !334, size: 64)
!3087 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3088, size: 64)
!3088 = !DISubroutineType(types: !3089)
!3089 = !{!141, !141}
!3090 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !141)
!3091 = !{!3092, !3093, !3094, !3095}
!3092 = !DILocalVariable(name: "__newthread", arg: 1, scope: !3073, file: !3074, line: 202, type: !3077)
!3093 = !DILocalVariable(name: "__attr", arg: 2, scope: !3073, file: !3074, line: 202, type: !3079)
!3094 = !DILocalVariable(name: "__start_routine", arg: 3, scope: !3073, file: !3074, line: 202, type: !3087)
!3095 = !DILocalVariable(name: "__arg", arg: 4, scope: !3073, file: !3074, line: 202, type: !3090)
!3096 = distinct !DISubprogram(name: "periodic_map_cleanup", scope: !2, file: !2, line: 585, type: !3088, scopeLine: 586, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !3097)
!3097 = !{!3098, !3099, !3101}
!3098 = !DILocalVariable(name: "args", arg: 1, scope: !3096, file: !2, line: 585, type: !141)
!3099 = !DILocalVariable(name: "argp", scope: !3096, file: !2, line: 587, type: !3100)
!3100 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1778, size: 64)
!3101 = !DILocalVariable(name: "interval", scope: !3096, file: !2, line: 588, type: !2451)
!3102 = !DILocation(line: 585, column: 41, scope: !3096)
!3103 = !DILocation(line: 587, column: 2, scope: !3096)
!3104 = !DILocation(line: 587, column: 27, scope: !3096)
!3105 = !DILocation(line: 587, column: 34, scope: !3096)
!3106 = !DILocation(line: 588, column: 2, scope: !3096)
!3107 = !DILocation(line: 588, column: 18, scope: !3096)
!3108 = !DILocation(line: 589, column: 20, scope: !3096)
!3109 = !DILocation(line: 589, column: 26, scope: !3096)
!3110 = !DILocation(line: 589, column: 43, scope: !3096)
!3111 = !DILocation(line: 589, column: 11, scope: !3096)
!3112 = !DILocation(line: 589, column: 18, scope: !3096)
!3113 = !DILocation(line: 590, column: 21, scope: !3096)
!3114 = !DILocation(line: 590, column: 27, scope: !3096)
!3115 = !DILocation(line: 590, column: 44, scope: !3096)
!3116 = !DILocation(line: 590, column: 11, scope: !3096)
!3117 = !DILocation(line: 590, column: 19, scope: !3096)
!3118 = !DILocation(line: 592, column: 2, scope: !3096)
!3119 = !DILocation(line: 592, column: 9, scope: !3096)
!3120 = !DILocation(line: 593, column: 13, scope: !3121)
!3121 = distinct !DILexicalBlock(scope: !3096, file: !2, line: 592, column: 23)
!3122 = !DILocation(line: 593, column: 19, scope: !3121)
!3123 = !DILocation(line: 593, column: 3, scope: !3121)
!3124 = !DILocation(line: 595, column: 13, scope: !3121)
!3125 = !DILocation(line: 595, column: 19, scope: !3121)
!3126 = !DILocation(line: 595, column: 3, scope: !3121)
!3127 = !DILocation(line: 597, column: 3, scope: !3121)
!3128 = distinct !{!3128, !3118, !3129, !991}
!3129 = !DILocation(line: 598, column: 2, scope: !3096)
!3130 = !DILocation(line: 599, column: 2, scope: !3096)
!3131 = distinct !DISubprogram(name: "clean_map", scope: !2, file: !2, line: 528, type: !3132, scopeLine: 530, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !3137)
!3132 = !DISubroutineType(types: !3133)
!3133 = !{!312, !312, !358, !358, !3134}
!3134 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3135, size: 64)
!3135 = !DISubroutineType(types: !3136)
!3136 = !{!203, !141, !141, !143}
!3137 = !{!3138, !3139, !3140, !3141, !3142, !3143, !3144, !3145, !3146, !3147, !3148, !3149, !3150}
!3138 = !DILocalVariable(name: "map_fd", arg: 1, scope: !3131, file: !2, line: 528, type: !312)
!3139 = !DILocalVariable(name: "key_size", arg: 2, scope: !3131, file: !2, line: 528, type: !358)
!3140 = !DILocalVariable(name: "value_size", arg: 3, scope: !3131, file: !2, line: 528, type: !358)
!3141 = !DILocalVariable(name: "del_decision_func", arg: 4, scope: !3131, file: !2, line: 529, type: !3134)
!3142 = !DILocalVariable(name: "removed", scope: !3131, file: !2, line: 531, type: !312)
!3143 = !DILocalVariable(name: "key", scope: !3131, file: !2, line: 532, type: !141)
!3144 = !DILocalVariable(name: "prev_key", scope: !3131, file: !2, line: 532, type: !141)
!3145 = !DILocalVariable(name: "value", scope: !3131, file: !2, line: 532, type: !141)
!3146 = !DILocalVariable(name: "delete_prev", scope: !3131, file: !2, line: 533, type: !203)
!3147 = !DILocalVariable(name: "now_nsec", scope: !3131, file: !2, line: 534, type: !143)
!3148 = !DILocalVariable(name: "entries", scope: !3131, file: !2, line: 537, type: !312)
!3149 = !DILocalVariable(name: "duration", scope: !3131, file: !2, line: 538, type: !143)
!3150 = !DILabel(scope: !3131, name: "cleanup", file: !2, line: 578)
!3151 = !DILocation(line: 528, column: 26, scope: !3131)
!3152 = !DILocation(line: 528, column: 41, scope: !3131)
!3153 = !DILocation(line: 528, column: 58, scope: !3131)
!3154 = !DILocation(line: 529, column: 15, scope: !3131)
!3155 = !DILocation(line: 531, column: 2, scope: !3131)
!3156 = !DILocation(line: 531, column: 6, scope: !3131)
!3157 = !DILocation(line: 532, column: 2, scope: !3131)
!3158 = !DILocation(line: 532, column: 8, scope: !3131)
!3159 = !DILocation(line: 532, column: 14, scope: !3131)
!3160 = !DILocation(line: 532, column: 25, scope: !3131)
!3161 = !DILocation(line: 533, column: 2, scope: !3131)
!3162 = !DILocation(line: 533, column: 7, scope: !3131)
!3163 = !DILocation(line: 534, column: 2, scope: !3131)
!3164 = !DILocation(line: 534, column: 8, scope: !3131)
!3165 = !DILocation(line: 534, column: 19, scope: !3131)
!3166 = !DILocation(line: 537, column: 2, scope: !3131)
!3167 = !DILocation(line: 537, column: 6, scope: !3131)
!3168 = !DILocation(line: 538, column: 2, scope: !3131)
!3169 = !DILocation(line: 538, column: 8, scope: !3131)
!3170 = !DILocation(line: 541, column: 6, scope: !3171)
!3171 = distinct !DILexicalBlock(scope: !3131, file: !2, line: 541, column: 6)
!3172 = !DILocation(line: 541, column: 15, scope: !3171)
!3173 = !DILocation(line: 541, column: 6, scope: !3131)
!3174 = !DILocation(line: 542, column: 11, scope: !3171)
!3175 = !DILocation(line: 542, column: 10, scope: !3171)
!3176 = !DILocation(line: 542, column: 3, scope: !3171)
!3177 = !DILocation(line: 544, column: 15, scope: !3131)
!3178 = !DILocation(line: 544, column: 8, scope: !3131)
!3179 = !DILocation(line: 544, column: 6, scope: !3131)
!3180 = !DILocation(line: 545, column: 20, scope: !3131)
!3181 = !DILocation(line: 545, column: 13, scope: !3131)
!3182 = !DILocation(line: 545, column: 11, scope: !3131)
!3183 = !DILocation(line: 546, column: 17, scope: !3131)
!3184 = !DILocation(line: 546, column: 10, scope: !3131)
!3185 = !DILocation(line: 546, column: 8, scope: !3131)
!3186 = !DILocation(line: 547, column: 7, scope: !3187)
!3187 = distinct !DILexicalBlock(scope: !3131, file: !2, line: 547, column: 6)
!3188 = !DILocation(line: 547, column: 11, scope: !3187)
!3189 = !DILocation(line: 547, column: 15, scope: !3187)
!3190 = !DILocation(line: 547, column: 24, scope: !3187)
!3191 = !DILocation(line: 547, column: 28, scope: !3187)
!3192 = !DILocation(line: 547, column: 6, scope: !3131)
!3193 = !DILocation(line: 548, column: 11, scope: !3194)
!3194 = distinct !DILexicalBlock(scope: !3187, file: !2, line: 547, column: 35)
!3195 = !DILocation(line: 549, column: 3, scope: !3194)
!3196 = !DILocation(line: 553, column: 2, scope: !3131)
!3197 = !DILocation(line: 553, column: 30, scope: !3131)
!3198 = !DILocation(line: 553, column: 38, scope: !3131)
!3199 = !DILocation(line: 553, column: 48, scope: !3131)
!3200 = !DILocation(line: 553, column: 9, scope: !3131)
!3201 = !DILocation(line: 553, column: 53, scope: !3131)
!3202 = !DILocation(line: 554, column: 7, scope: !3203)
!3203 = distinct !DILexicalBlock(scope: !3204, file: !2, line: 554, column: 7)
!3204 = distinct !DILexicalBlock(scope: !3131, file: !2, line: 553, column: 59)
!3205 = !DILocation(line: 554, column: 7, scope: !3204)
!3206 = !DILocation(line: 555, column: 24, scope: !3207)
!3207 = distinct !DILexicalBlock(scope: !3203, file: !2, line: 554, column: 20)
!3208 = !DILocation(line: 555, column: 32, scope: !3207)
!3209 = !DILocation(line: 555, column: 4, scope: !3207)
!3210 = !DILocation(line: 556, column: 11, scope: !3207)
!3211 = !DILocation(line: 557, column: 16, scope: !3207)
!3212 = !DILocation(line: 558, column: 3, scope: !3207)
!3213 = !DILocation(line: 560, column: 27, scope: !3214)
!3214 = distinct !DILexicalBlock(scope: !3204, file: !2, line: 560, column: 7)
!3215 = !DILocation(line: 560, column: 35, scope: !3214)
!3216 = !DILocation(line: 560, column: 40, scope: !3214)
!3217 = !DILocation(line: 560, column: 7, scope: !3214)
!3218 = !DILocation(line: 560, column: 47, scope: !3214)
!3219 = !DILocation(line: 560, column: 7, scope: !3204)
!3220 = !DILocation(line: 561, column: 18, scope: !3214)
!3221 = !DILocation(line: 561, column: 36, scope: !3214)
!3222 = !DILocation(line: 561, column: 41, scope: !3214)
!3223 = !DILocation(line: 561, column: 48, scope: !3214)
!3224 = !DILocation(line: 561, column: 16, scope: !3214)
!3225 = !DILocation(line: 561, column: 4, scope: !3214)
!3226 = !DILocation(line: 563, column: 10, scope: !3204)
!3227 = !DILocation(line: 565, column: 10, scope: !3204)
!3228 = !DILocation(line: 565, column: 20, scope: !3204)
!3229 = !DILocation(line: 565, column: 25, scope: !3204)
!3230 = !DILocation(line: 565, column: 3, scope: !3204)
!3231 = distinct !{!3231, !3196, !3232, !991}
!3232 = !DILocation(line: 566, column: 2, scope: !3131)
!3233 = !DILocation(line: 567, column: 6, scope: !3234)
!3234 = distinct !DILexicalBlock(scope: !3131, file: !2, line: 567, column: 6)
!3235 = !DILocation(line: 567, column: 6, scope: !3131)
!3236 = !DILocation(line: 568, column: 23, scope: !3237)
!3237 = distinct !DILexicalBlock(scope: !3234, file: !2, line: 567, column: 19)
!3238 = !DILocation(line: 568, column: 31, scope: !3237)
!3239 = !DILocation(line: 568, column: 3, scope: !3237)
!3240 = !DILocation(line: 569, column: 10, scope: !3237)
!3241 = !DILocation(line: 570, column: 2, scope: !3237)
!3242 = !DILocation(line: 572, column: 13, scope: !3131)
!3243 = !DILocation(line: 572, column: 44, scope: !3131)
!3244 = !DILocation(line: 572, column: 42, scope: !3131)
!3245 = !DILocation(line: 572, column: 11, scope: !3131)
!3246 = !DILocation(line: 573, column: 10, scope: !3131)
!3247 = !DILocation(line: 575, column: 3, scope: !3131)
!3248 = !DILocation(line: 575, column: 11, scope: !3131)
!3249 = !DILocation(line: 575, column: 20, scope: !3131)
!3250 = !DILocation(line: 575, column: 29, scope: !3131)
!3251 = !DILocation(line: 575, column: 38, scope: !3131)
!3252 = !DILocation(line: 576, column: 3, scope: !3131)
!3253 = !DILocation(line: 576, column: 12, scope: !3131)
!3254 = !DILocation(line: 573, column: 2, scope: !3131)
!3255 = !DILocation(line: 578, column: 1, scope: !3131)
!3256 = !DILocation(line: 579, column: 7, scope: !3131)
!3257 = !DILocation(line: 579, column: 2, scope: !3131)
!3258 = !DILocation(line: 580, column: 7, scope: !3131)
!3259 = !DILocation(line: 580, column: 2, scope: !3131)
!3260 = !DILocation(line: 581, column: 7, scope: !3131)
!3261 = !DILocation(line: 581, column: 2, scope: !3131)
!3262 = !DILocation(line: 582, column: 9, scope: !3131)
!3263 = !DILocation(line: 582, column: 2, scope: !3131)
!3264 = !DILocation(line: 583, column: 1, scope: !3131)
!3265 = distinct !DISubprogram(name: "packet_ts_timeout", scope: !2, file: !2, line: 492, type: !3135, scopeLine: 493, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !3266)
!3266 = !{!3267, !3268, !3269, !3270}
!3267 = !DILocalVariable(name: "key_ptr", arg: 1, scope: !3265, file: !2, line: 492, type: !141)
!3268 = !DILocalVariable(name: "val_ptr", arg: 2, scope: !3265, file: !2, line: 492, type: !141)
!3269 = !DILocalVariable(name: "now", arg: 3, scope: !3265, file: !2, line: 492, type: !143)
!3270 = !DILocalVariable(name: "ts", scope: !3265, file: !2, line: 494, type: !143)
!3271 = !DILocation(line: 492, column: 37, scope: !3265)
!3272 = !DILocation(line: 492, column: 52, scope: !3265)
!3273 = !DILocation(line: 492, column: 67, scope: !3265)
!3274 = !DILocation(line: 494, column: 2, scope: !3265)
!3275 = !DILocation(line: 494, column: 8, scope: !3265)
!3276 = !DILocation(line: 494, column: 23, scope: !3265)
!3277 = !DILocation(line: 494, column: 13, scope: !3265)
!3278 = !DILocation(line: 495, column: 6, scope: !3279)
!3279 = distinct !DILexicalBlock(scope: !3265, file: !2, line: 495, column: 6)
!3280 = !DILocation(line: 495, column: 12, scope: !3279)
!3281 = !DILocation(line: 495, column: 10, scope: !3279)
!3282 = !DILocation(line: 495, column: 15, scope: !3279)
!3283 = !DILocation(line: 495, column: 18, scope: !3279)
!3284 = !DILocation(line: 495, column: 24, scope: !3279)
!3285 = !DILocation(line: 495, column: 22, scope: !3279)
!3286 = !DILocation(line: 495, column: 27, scope: !3279)
!3287 = !DILocation(line: 495, column: 6, scope: !3265)
!3288 = !DILocation(line: 496, column: 3, scope: !3279)
!3289 = !DILocation(line: 497, column: 2, scope: !3265)
!3290 = !DILocation(line: 498, column: 1, scope: !3265)
!3291 = distinct !DISubprogram(name: "flow_timeout", scope: !2, file: !2, line: 500, type: !3135, scopeLine: 501, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !3292)
!3292 = !{!3293, !3294, !3295, !3296, !3297}
!3293 = !DILocalVariable(name: "key_ptr", arg: 1, scope: !3291, file: !2, line: 500, type: !141)
!3294 = !DILocalVariable(name: "val_ptr", arg: 2, scope: !3291, file: !2, line: 500, type: !141)
!3295 = !DILocalVariable(name: "now", arg: 3, scope: !3291, file: !2, line: 500, type: !143)
!3296 = !DILocalVariable(name: "fe", scope: !3291, file: !2, line: 502, type: !209)
!3297 = !DILocalVariable(name: "f_state", scope: !3291, file: !2, line: 503, type: !3298)
!3298 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3299, size: 64)
!3299 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "flow_state", file: !45, line: 82, size: 512, elements: !3300)
!3300 = !{!3301, !3302, !3303, !3304, !3305, !3306, !3307, !3308, !3309, !3310, !3311}
!3301 = !DIDerivedType(tag: DW_TAG_member, name: "min_rtt", scope: !3299, file: !45, line: 83, baseType: !143, size: 64)
!3302 = !DIDerivedType(tag: DW_TAG_member, name: "srtt", scope: !3299, file: !45, line: 84, baseType: !143, size: 64, offset: 64)
!3303 = !DIDerivedType(tag: DW_TAG_member, name: "last_timestamp", scope: !3299, file: !45, line: 85, baseType: !143, size: 64, offset: 128)
!3304 = !DIDerivedType(tag: DW_TAG_member, name: "sent_pkts", scope: !3299, file: !45, line: 86, baseType: !143, size: 64, offset: 192)
!3305 = !DIDerivedType(tag: DW_TAG_member, name: "sent_bytes", scope: !3299, file: !45, line: 87, baseType: !143, size: 64, offset: 256)
!3306 = !DIDerivedType(tag: DW_TAG_member, name: "rec_pkts", scope: !3299, file: !45, line: 88, baseType: !143, size: 64, offset: 320)
!3307 = !DIDerivedType(tag: DW_TAG_member, name: "rec_bytes", scope: !3299, file: !45, line: 89, baseType: !143, size: 64, offset: 384)
!3308 = !DIDerivedType(tag: DW_TAG_member, name: "last_id", scope: !3299, file: !45, line: 90, baseType: !195, size: 32, offset: 448)
!3309 = !DIDerivedType(tag: DW_TAG_member, name: "has_opened", scope: !3299, file: !45, line: 91, baseType: !203, size: 8, offset: 480)
!3310 = !DIDerivedType(tag: DW_TAG_member, name: "opening_reason", scope: !3299, file: !45, line: 92, baseType: !52, size: 8, offset: 488)
!3311 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !3299, file: !45, line: 93, baseType: !187, size: 16, offset: 496)
!3312 = !DILocation(line: 500, column: 32, scope: !3291)
!3313 = !DILocation(line: 500, column: 47, scope: !3291)
!3314 = !DILocation(line: 500, column: 62, scope: !3291)
!3315 = !DILocation(line: 502, column: 2, scope: !3291)
!3316 = !DILocation(line: 502, column: 20, scope: !3291)
!3317 = !DILocation(line: 503, column: 2, scope: !3291)
!3318 = !DILocation(line: 503, column: 21, scope: !3291)
!3319 = !DILocation(line: 503, column: 31, scope: !3291)
!3320 = !DILocation(line: 505, column: 6, scope: !3321)
!3321 = distinct !DILexicalBlock(scope: !3291, file: !2, line: 505, column: 6)
!3322 = !DILocation(line: 505, column: 12, scope: !3321)
!3323 = !DILocation(line: 505, column: 21, scope: !3321)
!3324 = !{!3325, !754, i64 16}
!3325 = !{!"flow_state", !754, i64 0, !754, i64 8, !754, i64 16, !754, i64 24, !754, i64 32, !754, i64 40, !754, i64 48, !756, i64 56, !755, i64 60, !743, i64 61, !1560, i64 62}
!3326 = !DILocation(line: 505, column: 10, scope: !3321)
!3327 = !DILocation(line: 505, column: 36, scope: !3321)
!3328 = !DILocation(line: 506, column: 6, scope: !3321)
!3329 = !DILocation(line: 506, column: 12, scope: !3321)
!3330 = !DILocation(line: 506, column: 21, scope: !3321)
!3331 = !DILocation(line: 506, column: 10, scope: !3321)
!3332 = !DILocation(line: 506, column: 36, scope: !3321)
!3333 = !DILocation(line: 505, column: 6, scope: !3291)
!3334 = !DILocation(line: 507, column: 7, scope: !3335)
!3335 = distinct !DILexicalBlock(scope: !3336, file: !2, line: 507, column: 7)
!3336 = distinct !DILexicalBlock(scope: !3321, file: !2, line: 506, column: 53)
!3337 = !DILocation(line: 507, column: 24, scope: !3335)
!3338 = !DILocation(line: 507, column: 27, scope: !3335)
!3339 = !DILocation(line: 507, column: 36, scope: !3335)
!3340 = !{!3325, !755, i64 60}
!3341 = !DILocation(line: 507, column: 7, scope: !3336)
!3342 = !DILocation(line: 508, column: 7, scope: !3343)
!3343 = distinct !DILexicalBlock(scope: !3335, file: !2, line: 507, column: 48)
!3344 = !DILocation(line: 508, column: 18, scope: !3343)
!3345 = !{!2676, !754, i64 0}
!3346 = !DILocation(line: 509, column: 19, scope: !3343)
!3347 = !DILocation(line: 509, column: 7, scope: !3343)
!3348 = !DILocation(line: 509, column: 17, scope: !3343)
!3349 = !{!2676, !754, i64 8}
!3350 = !DILocation(line: 510, column: 21, scope: !3343)
!3351 = !DILocation(line: 510, column: 27, scope: !3343)
!3352 = !DILocation(line: 510, column: 4, scope: !3343)
!3353 = !DILocation(line: 511, column: 7, scope: !3343)
!3354 = !DILocation(line: 511, column: 23, scope: !3343)
!3355 = !DILocation(line: 512, column: 7, scope: !3343)
!3356 = !DILocation(line: 512, column: 14, scope: !3343)
!3357 = !DILocation(line: 513, column: 7, scope: !3343)
!3358 = !DILocation(line: 513, column: 14, scope: !3343)
!3359 = !DILocation(line: 514, column: 4, scope: !3343)
!3360 = !DILocation(line: 515, column: 3, scope: !3343)
!3361 = !DILocation(line: 516, column: 3, scope: !3336)
!3362 = !DILocation(line: 518, column: 2, scope: !3291)
!3363 = !DILocation(line: 519, column: 1, scope: !3291)
!3364 = !DISubprogram(name: "nanosleep", scope: !2407, file: !2407, line: 272, type: !3365, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3369)
!3365 = !DISubroutineType(types: !3366)
!3366 = !{!312, !3367, !2478}
!3367 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3368, size: 64)
!3368 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2451)
!3369 = !{!3370, !3371}
!3370 = !DILocalVariable(name: "__requested_time", arg: 1, scope: !3364, file: !2407, line: 272, type: !3367)
!3371 = !DILocalVariable(name: "__remaining", arg: 2, scope: !3364, file: !2407, line: 272, type: !2478)
!3372 = !DISubprogram(name: "pthread_exit", scope: !3074, file: !3074, line: 211, type: !3373, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized, retainedNodes: !3375)
!3373 = !DISubroutineType(types: !3374)
!3374 = !{null, !141}
!3375 = !{!3376}
!3376 = !DILocalVariable(name: "__retval", arg: 1, scope: !3372, file: !3074, line: 211, type: !141)
!3377 = !DISubprogram(name: "malloc", scope: !2225, file: !2225, line: 540, type: !3378, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3380)
!3378 = !DISubroutineType(types: !3379)
!3379 = !{!141, !140}
!3380 = !{!3381}
!3381 = !DILocalVariable(name: "__size", arg: 1, scope: !3377, file: !2225, line: 540, type: !140)
!3382 = !DISubprogram(name: "bpf_map_get_next_key", scope: !3383, file: !3383, line: 247, type: !3384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3386)
!3383 = !DIFile(filename: "../lib/libbpf-install/usr/include/bpf/bpf.h", directory: "/home/demo/bpf-examples/pping", checksumkind: CSK_MD5, checksum: "3b49c7bbfbc51285f35c0eb0c7ab9250")
!3384 = !DISubroutineType(types: !3385)
!3385 = !{!312, !312, !1950, !141}
!3386 = !{!3387, !3388, !3389}
!3387 = !DILocalVariable(name: "fd", arg: 1, scope: !3382, file: !3383, line: 247, type: !312)
!3388 = !DILocalVariable(name: "key", arg: 2, scope: !3382, file: !3383, line: 247, type: !1950)
!3389 = !DILocalVariable(name: "next_key", arg: 3, scope: !3382, file: !3383, line: 247, type: !141)
!3390 = !DISubprogram(name: "bpf_map_delete_elem", scope: !3383, file: !3383, line: 246, type: !3391, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3393)
!3391 = !DISubroutineType(types: !3392)
!3392 = !{!312, !312, !1950}
!3393 = !{!3394, !3395}
!3394 = !DILocalVariable(name: "fd", arg: 1, scope: !3390, file: !3383, line: 246, type: !312)
!3395 = !DILocalVariable(name: "key", arg: 2, scope: !3390, file: !3383, line: 246, type: !1950)
!3396 = !DISubprogram(name: "bpf_map_lookup_elem", scope: !3383, file: !3383, line: 239, type: !3384, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3397)
!3397 = !{!3398, !3399, !3400}
!3398 = !DILocalVariable(name: "fd", arg: 1, scope: !3396, file: !3383, line: 239, type: !312)
!3399 = !DILocalVariable(name: "key", arg: 2, scope: !3396, file: !3383, line: 239, type: !1950)
!3400 = !DILocalVariable(name: "value", arg: 3, scope: !3396, file: !3383, line: 239, type: !141)
!3401 = !DISubprogram(name: "free", scope: !2225, file: !2225, line: 555, type: !3373, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3402)
!3402 = !{!3403}
!3403 = !DILocalVariable(name: "__ptr", arg: 1, scope: !3401, file: !2225, line: 555, type: !141)
!3404 = distinct !DISubprogram(name: "reverse_flow", scope: !45, file: !45, line: 167, type: !3405, scopeLine: 168, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !3408)
!3405 = !DISubroutineType(types: !3406)
!3406 = !{null, !3407, !3407}
!3407 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !159, size: 64)
!3408 = !{!3409, !3410}
!3409 = !DILocalVariable(name: "dest", arg: 1, scope: !3404, file: !45, line: 167, type: !3407)
!3410 = !DILocalVariable(name: "src", arg: 2, scope: !3404, file: !45, line: 167, type: !3407)
!3411 = !DILocation(line: 167, column: 48, scope: !3404)
!3412 = !DILocation(line: 167, column: 76, scope: !3404)
!3413 = !DILocation(line: 169, column: 14, scope: !3404)
!3414 = !DILocation(line: 169, column: 19, scope: !3404)
!3415 = !DILocation(line: 169, column: 2, scope: !3404)
!3416 = !DILocation(line: 169, column: 8, scope: !3404)
!3417 = !DILocation(line: 169, column: 12, scope: !3404)
!3418 = !DILocation(line: 170, column: 16, scope: !3404)
!3419 = !DILocation(line: 170, column: 21, scope: !3404)
!3420 = !DILocation(line: 170, column: 2, scope: !3404)
!3421 = !DILocation(line: 170, column: 8, scope: !3404)
!3422 = !DILocation(line: 170, column: 14, scope: !3404)
!3423 = !DILocation(line: 171, column: 2, scope: !3404)
!3424 = !DILocation(line: 171, column: 8, scope: !3404)
!3425 = !DILocation(line: 171, column: 16, scope: !3404)
!3426 = !DILocation(line: 171, column: 21, scope: !3404)
!3427 = !{i64 0, i64 16, !779, i64 0, i64 16, !779, i64 0, i64 16, !779, i64 16, i64 2, !2267, i64 18, i64 2, !2267}
!3428 = !DILocation(line: 172, column: 2, scope: !3404)
!3429 = !DILocation(line: 172, column: 8, scope: !3404)
!3430 = !DILocation(line: 172, column: 16, scope: !3404)
!3431 = !DILocation(line: 172, column: 21, scope: !3404)
!3432 = !DILocation(line: 173, column: 2, scope: !3404)
!3433 = !DILocation(line: 173, column: 8, scope: !3404)
!3434 = !DILocation(line: 173, column: 17, scope: !3404)
!3435 = !{!1557, !743, i64 43}
!3436 = !DILocation(line: 174, column: 1, scope: !3404)
!3437 = distinct !DISubprogram(name: "warn_map_full", scope: !2, file: !2, line: 824, type: !3438, scopeLine: 825, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !3442)
!3438 = !DISubroutineType(types: !3439)
!3439 = !{null, !3440}
!3440 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3441, size: 64)
!3441 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !219)
!3442 = !{!3443}
!3443 = !DILocalVariable(name: "e", arg: 1, scope: !3437, file: !2, line: 824, type: !3440)
!3444 = !DILocation(line: 824, column: 56, scope: !3437)
!3445 = !DILocation(line: 826, column: 20, scope: !3437)
!3446 = !DILocation(line: 826, column: 28, scope: !3437)
!3447 = !DILocation(line: 826, column: 31, scope: !3437)
!3448 = !{!3449, !754, i64 8}
!3449 = !{!"map_full_event", !754, i64 0, !754, i64 8, !1557, i64 16, !743, i64 60, !743, i64 61}
!3450 = !DILocation(line: 826, column: 2, scope: !3437)
!3451 = !DILocation(line: 827, column: 10, scope: !3437)
!3452 = !DILocation(line: 828, column: 3, scope: !3437)
!3453 = !DILocation(line: 828, column: 6, scope: !3437)
!3454 = !{!3449, !743, i64 60}
!3455 = !DILocation(line: 828, column: 10, scope: !3437)
!3456 = !DILocation(line: 827, column: 2, scope: !3437)
!3457 = !DILocation(line: 829, column: 25, scope: !3437)
!3458 = !DILocation(line: 829, column: 34, scope: !3437)
!3459 = !DILocation(line: 829, column: 37, scope: !3437)
!3460 = !DILocation(line: 829, column: 2, scope: !3437)
!3461 = !DILocation(line: 830, column: 10, scope: !3437)
!3462 = !DILocation(line: 830, column: 2, scope: !3437)
!3463 = !DILocation(line: 831, column: 1, scope: !3437)
!3464 = !DISubprogram(name: "bpf_tc_query", scope: !70, file: !70, line: 883, type: !3042, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3465)
!3465 = !{!3466, !3467}
!3466 = !DILocalVariable(name: "hook", arg: 1, scope: !3464, file: !70, line: 883, type: !3044)
!3467 = !DILocalVariable(name: "opts", arg: 2, scope: !3464, file: !70, line: 883, type: !2806)
!3468 = !DISubprogram(name: "bpf_tc_detach", scope: !70, file: !70, line: 881, type: !3469, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3471)
!3469 = !DISubroutineType(types: !3470)
!3470 = !{!312, !3044, !2038}
!3471 = !{!3472, !3473}
!3472 = !DILocalVariable(name: "hook", arg: 1, scope: !3468, file: !70, line: 881, type: !3044)
!3473 = !DILocalVariable(name: "opts", arg: 2, scope: !3468, file: !70, line: 881, type: !2038)
