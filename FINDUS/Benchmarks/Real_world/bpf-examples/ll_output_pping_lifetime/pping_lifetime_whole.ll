; ModuleID = 'llvm-link'
source_filename = "llvm-link"
target datalayout = "e-m:e-p:64:64-i64:64-i128:128-n32:64-S128"
target triple = "bpf"

%struct.option = type { ptr, i32, ptr, i32 }
%struct.anon.3 = type { ptr, ptr, ptr, ptr }
%struct.anon.6 = type { ptr, ptr, ptr }
%struct.bpf_config = type { i64, i64, i8, i8, i8, i8, i32 }
%struct.pping_config = type { %struct.bpf_config, %struct.bpf_tc_opts, %struct.bpf_tc_opts, i64, ptr, ptr, ptr, ptr, ptr, ptr, i32, i32, i32, i32, [16 x i8], i32, i8, i8 }
%struct.bpf_tc_opts = type { i64, i32, i32, i32, i32, i32 }
%struct.timespec = type { i64, i64 }
%struct.rtt_event = type { i64, i64, %struct.network_tuple, i32, i64, i64, i64, i64, i64, i64, i8, [7 x i8] }
%struct.network_tuple = type { %struct.flow_address, %struct.flow_address, i16, i8, i8 }
%struct.flow_address = type { %struct.in6_addr, i16, i16 }
%struct.in6_addr = type { %union.anon }
%union.anon = type { [4 x i32] }
%struct.flow_event = type { i64, i64, %struct.network_tuple, i8, i8, i8, i8 }
%struct.map_cleanup_args = type { i64, i32, i32 }
%struct.bpf_tc_hook = type { i64, i32, i32, i32 }
%struct.map_full_event = type { i64, i64, %struct.network_tuple, i8, [3 x i8] }
%struct.flow_state = type { i64, i64, i64, i64, i64, i64, i64, i32, i8, i8, i16 }
%struct.parsing_context = type { ptr, ptr, %struct.hdr_cursor, i32, i32, i8 }
%struct.hdr_cursor = type { ptr }
%struct.__sk_buff = type { i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, [5 x i32], i32, i32, i32, i32, i32, i32, i32, i32, [4 x i32], [4 x i32], i32, i32, i32, %struct.hdr_cursor, i64, i32, i32, %struct.hdr_cursor, i32 }
%struct.xdp_md = type { i32, i32, i32, i32, i32, i32 }
%struct.packet_info = type { %struct.hdr_cursor, %struct.hdr_cursor, i64, i32, %struct.packet_id, %struct.packet_id, i8, i8, i8, i8 }
%struct.packet_id = type { %struct.network_tuple, i32 }
%struct.iphdr = type { i8, i8, i16, i16, i16, i8, i8, i16, %union.anon.8 }
%union.anon.8 = type { %struct.anon.9 }
%struct.anon.9 = type { i32, i32 }
%struct.ipv6hdr = type { i8, [3 x i8], i16, i8, i8, %union.anon.11 }
%union.anon.11 = type { %struct.anon.12 }
%struct.anon.12 = type { %struct.in6_addr, %struct.in6_addr }
%struct.bpf_fib_lookup = type { i8, i8, i16, i16, i16, i32, %union.anon.19, %union.anon, %union.anon, i16, i16, [6 x i8], [6 x i8] }
%union.anon.19 = type { i32 }
%struct.tcphdr = type { i16, i16, i32, i32, i16, i16, i16, i16 }
%struct.icmp6hdr = type { i8, i8, i16, %union.anon.18 }
%union.anon.18 = type { [1 x i32] }
%struct.anon.16 = type { i16, i16 }
%struct.icmphdr = type { i8, i8, i16, %union.anon.19 }
%struct.ipv6_opt_hdr = type { i8, i8 }
%struct.ethhdr = type { [6 x i8], [6 x i8], i16 }
%struct.collect_vlans = type { [2 x i16] }

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
@llvm.compiler.used = appending global [7 x ptr] [ptr @_license, ptr @pping_tc_egress, ptr @pping_tc_ingress, ptr @pping_xdp_ingress, ptr @packet_ts, ptr @flow_state, ptr @events], section "llvm.metadata"
@_license = dso_local global [4 x i8] c"GPL\00", section "license", align 1, !dbg !691
@packet_ts = dso_local global %struct.anon.3 zeroinitializer, section ".maps", align 8, !dbg !749
@flow_state = dso_local global %struct.anon.3 zeroinitializer, section ".maps", align 8, !dbg !780
@events = dso_local global %struct.anon.6 zeroinitializer, section ".maps", align 8, !dbg !803
@bpf_ktime_get_ns = internal global ptr inttoptr (i64 5 to ptr), align 8, !dbg !812
@config = internal constant %struct.bpf_config zeroinitializer, align 8, !dbg !818
@bpf_map_lookup_elem.2 = internal global ptr inttoptr (i64 1 to ptr), align 8, !dbg !831
@bpf_map_update_elem = internal global ptr inttoptr (i64 2 to ptr), align 8, !dbg !838
@last_warn_time = internal global [2 x i64] zeroinitializer, align 8, !dbg !843
@bpf_perf_event_output = internal global ptr inttoptr (i64 25 to ptr), align 8, !dbg !847
@bpf_fib_lookup = internal global ptr inttoptr (i64 69 to ptr), align 8, !dbg !852
@bpf_map_delete_elem.1 = internal global ptr inttoptr (i64 3 to ptr), align 8, !dbg !888

; Function Attrs: nounwind
define dso_local ptr @tracked_protocols_to_str(ptr noundef %0) #0 !dbg !898 {
  %2 = alloca ptr, align 8
  %3 = alloca i8, align 1
  %4 = alloca i8, align 1
  store ptr %0, ptr %2, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %2, metadata !940, metadata !DIExpression()), !dbg !947
  call void @llvm.lifetime.start.p0(i64 1, ptr %3) #14, !dbg !948
  call void @llvm.dbg.declare(metadata ptr %3, metadata !941, metadata !DIExpression()), !dbg !949
  %5 = load ptr, ptr %2, align 8, !dbg !950, !tbaa !943
  %6 = getelementptr inbounds %struct.pping_config, ptr %5, i32 0, i32 0, !dbg !951
  %7 = getelementptr inbounds %struct.bpf_config, ptr %6, i32 0, i32 3, !dbg !952
  %8 = load i8, ptr %7, align 1, !dbg !952, !tbaa !953, !range !961, !noundef !962
  %9 = trunc i8 %8 to i1, !dbg !952
  %10 = zext i1 %9 to i8, !dbg !949
  store i8 %10, ptr %3, align 1, !dbg !949, !tbaa !963
  call void @llvm.lifetime.start.p0(i64 1, ptr %4) #14, !dbg !964
  call void @llvm.dbg.declare(metadata ptr %4, metadata !942, metadata !DIExpression()), !dbg !965
  %11 = load ptr, ptr %2, align 8, !dbg !966, !tbaa !943
  %12 = getelementptr inbounds %struct.pping_config, ptr %11, i32 0, i32 0, !dbg !967
  %13 = getelementptr inbounds %struct.bpf_config, ptr %12, i32 0, i32 4, !dbg !968
  %14 = load i8, ptr %13, align 2, !dbg !968, !tbaa !969, !range !961, !noundef !962
  %15 = trunc i8 %14 to i1, !dbg !968
  %16 = zext i1 %15 to i8, !dbg !965
  store i8 %16, ptr %4, align 1, !dbg !965, !tbaa !963
  %17 = load i8, ptr %3, align 1, !dbg !970, !tbaa !963, !range !961, !noundef !962
  %18 = trunc i8 %17 to i1, !dbg !970
  br i1 %18, label %19, label %23, !dbg !971

19:                                               ; preds = %1
  %20 = load i8, ptr %4, align 1, !dbg !972, !tbaa !963, !range !961, !noundef !962
  %21 = trunc i8 %20 to i1, !dbg !972
  br i1 %21, label %22, label %23, !dbg !970

22:                                               ; preds = %19
  br label %28, !dbg !970

23:                                               ; preds = %19, %1
  %24 = load i8, ptr %3, align 1, !dbg !973, !tbaa !963, !range !961, !noundef !962
  %25 = trunc i8 %24 to i1, !dbg !973
  %26 = zext i1 %25 to i64, !dbg !973
  %27 = select i1 %25, ptr @.str.1, ptr @.str.2, !dbg !973
  br label %28, !dbg !970

28:                                               ; preds = %23, %22
  %29 = phi ptr [ @.str, %22 ], [ %27, %23 ], !dbg !970
  call void @llvm.lifetime.end.p0(i64 1, ptr %4) #14, !dbg !974
  call void @llvm.lifetime.end.p0(i64 1, ptr %3) #14, !dbg !974
  ret ptr %29, !dbg !975
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.start.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nocallback nofree nosync nounwind willreturn memory(argmem: readwrite)
declare void @llvm.lifetime.end.p0(i64 immarg, ptr nocapture) #2

; Function Attrs: nounwind
define dso_local ptr @output_format_to_str(i32 noundef %0) #0 !dbg !976 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store i32 %0, ptr %3, align 4, !tbaa !981
  call void @llvm.dbg.declare(metadata ptr %3, metadata !980, metadata !DIExpression()), !dbg !982
  %4 = load i32, ptr %3, align 4, !dbg !983, !tbaa !981
  switch i32 %4, label %8 [
    i32 0, label %5
    i32 1, label %6
    i32 2, label %7
  ], !dbg !984

5:                                                ; preds = %1
  store ptr @.str.3, ptr %2, align 8, !dbg !985
  br label %9, !dbg !985

6:                                                ; preds = %1
  store ptr @.str.4, ptr %2, align 8, !dbg !987
  br label %9, !dbg !987

7:                                                ; preds = %1
  store ptr @.str.5, ptr %2, align 8, !dbg !988
  br label %9, !dbg !988

8:                                                ; preds = %1
  store ptr @.str.6, ptr %2, align 8, !dbg !989
  br label %9, !dbg !989

9:                                                ; preds = %8, %7, %6, %5
  %10 = load ptr, ptr %2, align 8, !dbg !990
  ret ptr %10, !dbg !990
}

; Function Attrs: nounwind
define dso_local void @abort_program(i32 noundef %0) #0 !dbg !991 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4, !tbaa !996
  call void @llvm.dbg.declare(metadata ptr %2, metadata !995, metadata !DIExpression()), !dbg !997
  store volatile i32 0, ptr @keep_running, align 4, !dbg !998, !tbaa !996
  ret void, !dbg !999
}

; Function Attrs: nounwind
define dso_local i32 @main(i32 noundef %0, ptr noundef %1) #0 !dbg !1000 {
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
  store i32 %0, ptr %4, align 4, !tbaa !996
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1005, metadata !DIExpression()), !dbg !1019
  store ptr %1, ptr %5, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1006, metadata !DIExpression()), !dbg !1020
  call void @llvm.lifetime.start.p0(i64 4, ptr %6) #14, !dbg !1021
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1007, metadata !DIExpression()), !dbg !1022
  store i32 0, ptr %6, align 4, !dbg !1022, !tbaa !996
  call void @llvm.lifetime.start.p0(i64 4, ptr %7) #14, !dbg !1021
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1008, metadata !DIExpression()), !dbg !1023
  call void @llvm.lifetime.start.p0(i64 8, ptr %8) #14, !dbg !1024
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1009, metadata !DIExpression()), !dbg !1025
  store ptr null, ptr %8, align 8, !dbg !1025, !tbaa !943
  call void @llvm.lifetime.start.p0(i64 8, ptr %9) #14, !dbg !1026
  call void @llvm.dbg.declare(metadata ptr %9, metadata !1012, metadata !DIExpression()), !dbg !1027
  store ptr null, ptr %9, align 8, !dbg !1027, !tbaa !943
  call void @llvm.lifetime.start.p0(i64 32, ptr %10) #14, !dbg !1028
  call void @llvm.dbg.declare(metadata ptr %10, metadata !1015, metadata !DIExpression()), !dbg !1028
  call void @llvm.memset.p0.i64(ptr align 8 %10, i8 0, i64 32, i1 false), !dbg !1029
  call void @llvm.memset.p0.i64(ptr align 8 %10, i8 0, i64 32, i1 false), !dbg !1029
  %14 = getelementptr inbounds %struct.bpf_tc_opts, ptr %10, i32 0, i32 0, !dbg !1029
  store i64 32, ptr %14, align 8, !dbg !1029, !tbaa !1031
  call void @llvm.lifetime.start.p0(i64 32, ptr %11) #14, !dbg !1032
  call void @llvm.dbg.declare(metadata ptr %11, metadata !1016, metadata !DIExpression()), !dbg !1032
  call void @llvm.memset.p0.i64(ptr align 8 %11, i8 0, i64 32, i1 false), !dbg !1033
  call void @llvm.memset.p0.i64(ptr align 8 %11, i8 0, i64 32, i1 false), !dbg !1033
  %15 = getelementptr inbounds %struct.bpf_tc_opts, ptr %11, i32 0, i32 0, !dbg !1033
  store i64 32, ptr %15, align 8, !dbg !1033, !tbaa !1031
  call void @llvm.lifetime.start.p0(i64 184, ptr %12) #14, !dbg !1035
  call void @llvm.dbg.declare(metadata ptr %12, metadata !1017, metadata !DIExpression()), !dbg !1036
  %16 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 0, !dbg !1037
  %17 = getelementptr inbounds %struct.bpf_config, ptr %16, i32 0, i32 0, !dbg !1038
  store i64 100000000, ptr %17, align 8, !dbg !1038, !tbaa !1039
  %18 = getelementptr inbounds %struct.bpf_config, ptr %16, i32 0, i32 1, !dbg !1038
  store i64 0, ptr %18, align 8, !dbg !1038, !tbaa !1040
  %19 = getelementptr inbounds %struct.bpf_config, ptr %16, i32 0, i32 2, !dbg !1038
  store i8 0, ptr %19, align 8, !dbg !1038, !tbaa !1041
  %20 = getelementptr inbounds %struct.bpf_config, ptr %16, i32 0, i32 3, !dbg !1038
  store i8 0, ptr %20, align 1, !dbg !1038, !tbaa !1042
  %21 = getelementptr inbounds %struct.bpf_config, ptr %16, i32 0, i32 4, !dbg !1038
  store i8 0, ptr %21, align 2, !dbg !1038, !tbaa !1043
  %22 = getelementptr inbounds %struct.bpf_config, ptr %16, i32 0, i32 5, !dbg !1038
  store i8 0, ptr %22, align 1, !dbg !1038, !tbaa !1044
  %23 = getelementptr inbounds %struct.bpf_config, ptr %16, i32 0, i32 6, !dbg !1038
  store i32 0, ptr %23, align 4, !dbg !1038, !tbaa !1045
  %24 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 1, !dbg !1037
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %24, ptr align 8 %10, i64 32, i1 false), !dbg !1046, !tbaa.struct !1047
  %25 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 2, !dbg !1037
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %25, ptr align 8 %11, i64 32, i1 false), !dbg !1049, !tbaa.struct !1047
  %26 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 3, !dbg !1037
  store i64 1000000000, ptr %26, align 8, !dbg !1037, !tbaa !1050
  %27 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 4, !dbg !1037
  store ptr @.str.7, ptr %27, align 8, !dbg !1037, !tbaa !1051
  %28 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 5, !dbg !1037
  store ptr @.str.8, ptr %28, align 8, !dbg !1037, !tbaa !1052
  %29 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 6, !dbg !1037
  store ptr @.str.9, ptr %29, align 8, !dbg !1037, !tbaa !1053
  %30 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 7, !dbg !1037
  store ptr @.str.10, ptr %30, align 8, !dbg !1037, !tbaa !1054
  %31 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 8, !dbg !1037
  store ptr @.str.11, ptr %31, align 8, !dbg !1037, !tbaa !1055
  %32 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 9, !dbg !1037
  store ptr @.str.12, ptr %32, align 8, !dbg !1037, !tbaa !1056
  %33 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 10, !dbg !1037
  store i32 1, ptr %33, align 8, !dbg !1037, !tbaa !1057
  %34 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 11, !dbg !1037
  store i32 0, ptr %34, align 4, !dbg !1037, !tbaa !1058
  %35 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 12, !dbg !1037
  store i32 0, ptr %35, align 8, !dbg !1037, !tbaa !1059
  %36 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 13, !dbg !1037
  store i32 0, ptr %36, align 4, !dbg !1037, !tbaa !1060
  %37 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 14, !dbg !1037
  call void @llvm.memset.p0.i64(ptr align 8 %37, i8 0, i64 16, i1 false), !dbg !1037
  %38 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 15, !dbg !1037
  store i32 0, ptr %38, align 8, !dbg !1037, !tbaa !1061
  %39 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 16, !dbg !1037
  store i8 0, ptr %39, align 4, !dbg !1037, !tbaa !1062
  %40 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 17, !dbg !1037
  store i8 0, ptr %40, align 1, !dbg !1037, !tbaa !1063
  %41 = call i32 @geteuid() #14, !dbg !1064
  %42 = icmp ne i32 %41, 0, !dbg !1066
  br i1 %42, label %43, label %45, !dbg !1067

43:                                               ; preds = %2
  %44 = call i32 (ptr, ...) @printf(ptr noundef @.str.13), !dbg !1068
  store i32 1, ptr %3, align 4, !dbg !1070
  store i32 1, ptr %13, align 4
  br label %237, !dbg !1070

45:                                               ; preds = %2
  %46 = call i32 @set_rlimit(i64 noundef -1), !dbg !1071
  store i32 %46, ptr %6, align 4, !dbg !1072, !tbaa !996
  %47 = load i32, ptr %6, align 4, !dbg !1073, !tbaa !996
  %48 = icmp ne i32 %47, 0, !dbg !1073
  br i1 %48, label %49, label %54, !dbg !1075

49:                                               ; preds = %45
  %50 = load ptr, ptr @stderr, align 8, !dbg !1076, !tbaa !943
  %51 = load i32, ptr %6, align 4, !dbg !1078, !tbaa !996
  %52 = call ptr @get_libbpf_strerror(i32 noundef %51), !dbg !1079
  %53 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %50, ptr noundef @.str.14, ptr noundef %52), !dbg !1080
  store i32 1, ptr %3, align 4, !dbg !1081
  store i32 1, ptr %13, align 4
  br label %237, !dbg !1081

54:                                               ; preds = %45
  %55 = load i32, ptr %4, align 4, !dbg !1082, !tbaa !996
  %56 = load ptr, ptr %5, align 8, !dbg !1083, !tbaa !943
  %57 = call i32 @parse_arguments(i32 noundef %55, ptr noundef %56, ptr noundef %12), !dbg !1084
  store i32 %57, ptr %6, align 4, !dbg !1085, !tbaa !996
  %58 = load i32, ptr %6, align 4, !dbg !1086, !tbaa !996
  %59 = icmp ne i32 %58, 0, !dbg !1086
  br i1 %59, label %60, label %66, !dbg !1088

60:                                               ; preds = %54
  %61 = load ptr, ptr @stderr, align 8, !dbg !1089, !tbaa !943
  %62 = load i32, ptr %6, align 4, !dbg !1091, !tbaa !996
  %63 = call ptr @get_libbpf_strerror(i32 noundef %62), !dbg !1092
  %64 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %61, ptr noundef @.str.15, ptr noundef %63), !dbg !1093
  %65 = load ptr, ptr %5, align 8, !dbg !1094, !tbaa !943
  call void @print_usage(ptr noundef %65), !dbg !1095
  store i32 1, ptr %3, align 4, !dbg !1096
  store i32 1, ptr %13, align 4
  br label %237, !dbg !1096

66:                                               ; preds = %54
  %67 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 0, !dbg !1097
  %68 = getelementptr inbounds %struct.bpf_config, ptr %67, i32 0, i32 3, !dbg !1099
  %69 = load i8, ptr %68, align 1, !dbg !1099, !tbaa !953, !range !961, !noundef !962
  %70 = trunc i8 %69 to i1, !dbg !1099
  br i1 %70, label %79, label %71, !dbg !1100

71:                                               ; preds = %66
  %72 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 0, !dbg !1101
  %73 = getelementptr inbounds %struct.bpf_config, ptr %72, i32 0, i32 4, !dbg !1102
  %74 = load i8, ptr %73, align 2, !dbg !1102, !tbaa !969, !range !961, !noundef !962
  %75 = trunc i8 %74 to i1, !dbg !1102
  br i1 %75, label %79, label %76, !dbg !1103

76:                                               ; preds = %71
  %77 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 0, !dbg !1104
  %78 = getelementptr inbounds %struct.bpf_config, ptr %77, i32 0, i32 3, !dbg !1105
  store i8 1, ptr %78, align 1, !dbg !1106, !tbaa !953
  br label %79, !dbg !1107

79:                                               ; preds = %76, %71, %66
  %80 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 0, !dbg !1108
  %81 = getelementptr inbounds %struct.bpf_config, ptr %80, i32 0, i32 4, !dbg !1110
  %82 = load i8, ptr %81, align 2, !dbg !1110, !tbaa !969, !range !961, !noundef !962
  %83 = trunc i8 %82 to i1, !dbg !1110
  br i1 %83, label %84, label %91, !dbg !1111

84:                                               ; preds = %79
  %85 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 15, !dbg !1112
  %86 = load i32, ptr %85, align 8, !dbg !1112, !tbaa !1061
  %87 = icmp eq i32 %86, 2, !dbg !1113
  br i1 %87, label %88, label %91, !dbg !1114

88:                                               ; preds = %84
  %89 = load ptr, ptr @stderr, align 8, !dbg !1115, !tbaa !943
  %90 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %89, ptr noundef @.str.16), !dbg !1116
  br label %91, !dbg !1116

91:                                               ; preds = %88, %84, %79
  %92 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 15, !dbg !1117
  %93 = load i32, ptr %92, align 8, !dbg !1117, !tbaa !1061
  switch i32 %93, label %97 [
    i32 0, label %94
    i32 1, label %95
    i32 2, label %96
  ], !dbg !1118

94:                                               ; preds = %91
  store ptr @print_event_standard, ptr @print_event_func, align 8, !dbg !1119, !tbaa !943
  br label %97, !dbg !1121

95:                                               ; preds = %91
  store ptr @print_event_json, ptr @print_event_func, align 8, !dbg !1122, !tbaa !943
  br label %97, !dbg !1123

96:                                               ; preds = %91
  store ptr @print_event_ppviz, ptr @print_event_func, align 8, !dbg !1124, !tbaa !943
  br label %97, !dbg !1125

97:                                               ; preds = %96, %95, %94, %91
  %98 = load ptr, ptr @stderr, align 8, !dbg !1126, !tbaa !943
  %99 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 15, !dbg !1127
  %100 = load i32, ptr %99, align 8, !dbg !1127, !tbaa !1061
  %101 = call ptr @output_format_to_str(i32 noundef %100), !dbg !1128
  %102 = call ptr @tracked_protocols_to_str(ptr noundef %12), !dbg !1129
  %103 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 14, !dbg !1130
  %104 = getelementptr inbounds [16 x i8], ptr %103, i64 0, i64 0, !dbg !1131
  %105 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %98, ptr noundef @.str.17, ptr noundef %101, ptr noundef %102, ptr noundef %104), !dbg !1132
  %106 = call i32 @load_attach_bpfprogs(ptr noundef %8, ptr noundef %12), !dbg !1133
  store i32 %106, ptr %6, align 4, !dbg !1134, !tbaa !996
  %107 = load i32, ptr %6, align 4, !dbg !1135, !tbaa !996
  %108 = icmp ne i32 %107, 0, !dbg !1135
  br i1 %108, label %109, label %114, !dbg !1137

109:                                              ; preds = %97
  %110 = load ptr, ptr @stderr, align 8, !dbg !1138, !tbaa !943
  %111 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 4, !dbg !1140
  %112 = load ptr, ptr %111, align 8, !dbg !1140, !tbaa !1051
  %113 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %110, ptr noundef @.str.18, ptr noundef %112), !dbg !1141
  store i32 1, ptr %3, align 4, !dbg !1142
  store i32 1, ptr %13, align 4
  br label %237, !dbg !1142

114:                                              ; preds = %97
  %115 = load ptr, ptr %8, align 8, !dbg !1143, !tbaa !943
  %116 = call i32 @setup_periodical_map_cleaning(ptr noundef %115, ptr noundef %12), !dbg !1144
  store i32 %116, ptr %6, align 4, !dbg !1145, !tbaa !996
  %117 = load i32, ptr %6, align 4, !dbg !1146, !tbaa !996
  %118 = icmp ne i32 %117, 0, !dbg !1146
  br i1 %118, label %119, label %124, !dbg !1148

119:                                              ; preds = %114
  %120 = load ptr, ptr @stderr, align 8, !dbg !1149, !tbaa !943
  %121 = load i32, ptr %6, align 4, !dbg !1151, !tbaa !996
  %122 = call ptr @get_libbpf_strerror(i32 noundef %121), !dbg !1152
  %123 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %120, ptr noundef @.str.19, ptr noundef %122), !dbg !1153
  br label %174, !dbg !1154

124:                                              ; preds = %114
  %125 = load ptr, ptr %8, align 8, !dbg !1155, !tbaa !943
  %126 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 9, !dbg !1155
  %127 = load ptr, ptr %126, align 8, !dbg !1155, !tbaa !1056
  %128 = call i32 @bpf_object__find_map_fd_by_name(ptr noundef %125, ptr noundef %127), !dbg !1155
  %129 = call ptr @perf_buffer__new(i32 noundef %128, i64 noundef 64, ptr noundef @handle_event, ptr noundef @handle_missed_events, ptr noundef null, ptr noundef null), !dbg !1155
  store ptr %129, ptr %9, align 8, !dbg !1156, !tbaa !943
  %130 = load ptr, ptr %9, align 8, !dbg !1157, !tbaa !943
  %131 = call i64 @libbpf_get_error(ptr noundef %130), !dbg !1158
  %132 = trunc i64 %131 to i32, !dbg !1158
  store i32 %132, ptr %6, align 4, !dbg !1159, !tbaa !996
  %133 = load i32, ptr %6, align 4, !dbg !1160, !tbaa !996
  %134 = icmp ne i32 %133, 0, !dbg !1160
  br i1 %134, label %135, label %142, !dbg !1162

135:                                              ; preds = %124
  %136 = load ptr, ptr @stderr, align 8, !dbg !1163, !tbaa !943
  %137 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 9, !dbg !1165
  %138 = load ptr, ptr %137, align 8, !dbg !1165, !tbaa !1056
  %139 = load i32, ptr %6, align 4, !dbg !1166, !tbaa !996
  %140 = call ptr @get_libbpf_strerror(i32 noundef %139), !dbg !1167
  %141 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %136, ptr noundef @.str.20, ptr noundef %138, ptr noundef %140), !dbg !1168
  br label %174, !dbg !1169

142:                                              ; preds = %124
  %143 = call ptr @signal(i32 noundef 2, ptr noundef @abort_program) #14, !dbg !1170
  %144 = call ptr @signal(i32 noundef 15, ptr noundef @abort_program) #14, !dbg !1171
  br label %145, !dbg !1172

145:                                              ; preds = %162, %142
  %146 = load volatile i32, ptr @keep_running, align 4, !dbg !1173, !tbaa !996
  %147 = icmp ne i32 %146, 0, !dbg !1172
  br i1 %147, label %148, label %163, !dbg !1172

148:                                              ; preds = %145
  %149 = load ptr, ptr %9, align 8, !dbg !1174, !tbaa !943
  %150 = call i32 @perf_buffer__poll(ptr noundef %149, i32 noundef 100), !dbg !1177
  store i32 %150, ptr %6, align 4, !dbg !1178, !tbaa !996
  %151 = icmp slt i32 %150, 0, !dbg !1179
  br i1 %151, label %152, label %162, !dbg !1180

152:                                              ; preds = %148
  %153 = load volatile i32, ptr @keep_running, align 4, !dbg !1181, !tbaa !996
  %154 = icmp ne i32 %153, 0, !dbg !1181
  br i1 %154, label %155, label %161, !dbg !1184

155:                                              ; preds = %152
  %156 = load ptr, ptr @stderr, align 8, !dbg !1185, !tbaa !943
  %157 = load i32, ptr %6, align 4, !dbg !1186, !tbaa !996
  %158 = sub nsw i32 0, %157, !dbg !1187
  %159 = call ptr @get_libbpf_strerror(i32 noundef %158), !dbg !1188
  %160 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %156, ptr noundef @.str.21, ptr noundef %159), !dbg !1189
  br label %161, !dbg !1189

161:                                              ; preds = %155, %152
  br label %163, !dbg !1190

162:                                              ; preds = %148
  br label %145, !dbg !1172, !llvm.loop !1191

163:                                              ; preds = %161, %145
  %164 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 15, !dbg !1194
  %165 = load i32, ptr %164, align 8, !dbg !1194, !tbaa !1061
  %166 = icmp eq i32 %165, 1, !dbg !1196
  br i1 %166, label %167, label %172, !dbg !1197

167:                                              ; preds = %163
  %168 = load ptr, ptr @json_ctx, align 8, !dbg !1198, !tbaa !943
  %169 = icmp ne ptr %168, null, !dbg !1198
  br i1 %169, label %170, label %172, !dbg !1199

170:                                              ; preds = %167
  %171 = load ptr, ptr @json_ctx, align 8, !dbg !1200, !tbaa !943
  call void @jsonw_end_array(ptr noundef %171), !dbg !1202
  call void @jsonw_destroy(ptr noundef @json_ctx), !dbg !1203
  br label %172, !dbg !1204

172:                                              ; preds = %170, %167, %163
  %173 = load ptr, ptr %9, align 8, !dbg !1205, !tbaa !943
  call void @perf_buffer__free(ptr noundef %173), !dbg !1206
  br label %174, !dbg !1206

174:                                              ; preds = %172, %135, %119
  call void @llvm.dbg.label(metadata !1018), !dbg !1207
  %175 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 5, !dbg !1208
  %176 = load ptr, ptr %175, align 8, !dbg !1208, !tbaa !1052
  %177 = call i32 @strcmp(ptr noundef %176, ptr noundef @.str.8) #15, !dbg !1210
  %178 = icmp eq i32 %177, 0, !dbg !1211
  br i1 %178, label %179, label %187, !dbg !1212

179:                                              ; preds = %174
  %180 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 11, !dbg !1213
  %181 = load i32, ptr %180, align 4, !dbg !1213, !tbaa !1058
  %182 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 10, !dbg !1214
  %183 = load i32, ptr %182, align 8, !dbg !1214, !tbaa !1057
  %184 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 12, !dbg !1215
  %185 = load i32, ptr %184, align 8, !dbg !1215, !tbaa !1059
  %186 = call i32 @xdp_detach(i32 noundef %181, i32 noundef %183, i32 noundef %185), !dbg !1216
  store i32 %186, ptr %7, align 4, !dbg !1217, !tbaa !996
  br label %192, !dbg !1218

187:                                              ; preds = %174
  %188 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 11, !dbg !1219
  %189 = load i32, ptr %188, align 4, !dbg !1219, !tbaa !1058
  %190 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 1, !dbg !1220
  %191 = call i32 @tc_detach(i32 noundef %189, i32 noundef 1, ptr noundef %190, i1 noundef zeroext false), !dbg !1221
  store i32 %191, ptr %7, align 4, !dbg !1222, !tbaa !996
  br label %192

192:                                              ; preds = %187, %179
  %193 = load i32, ptr %7, align 4, !dbg !1223, !tbaa !996
  %194 = icmp ne i32 %193, 0, !dbg !1223
  br i1 %194, label %195, label %202, !dbg !1225

195:                                              ; preds = %192
  %196 = load ptr, ptr @stderr, align 8, !dbg !1226, !tbaa !943
  %197 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 14, !dbg !1227
  %198 = getelementptr inbounds [16 x i8], ptr %197, i64 0, i64 0, !dbg !1228
  %199 = load i32, ptr %7, align 4, !dbg !1229, !tbaa !996
  %200 = call ptr @get_libbpf_strerror(i32 noundef %199), !dbg !1230
  %201 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %196, ptr noundef @.str.22, ptr noundef %198, ptr noundef %200), !dbg !1231
  br label %202, !dbg !1231

202:                                              ; preds = %195, %192
  %203 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 11, !dbg !1232
  %204 = load i32, ptr %203, align 4, !dbg !1232, !tbaa !1058
  %205 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 2, !dbg !1233
  %206 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 16, !dbg !1234
  %207 = load i8, ptr %206, align 4, !dbg !1234, !tbaa !1062, !range !961, !noundef !962
  %208 = trunc i8 %207 to i1, !dbg !1234
  br i1 %208, label %209, label %213, !dbg !1235

209:                                              ; preds = %202
  %210 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 17, !dbg !1236
  %211 = load i8, ptr %210, align 1, !dbg !1236, !tbaa !1063, !range !961, !noundef !962
  %212 = trunc i8 %211 to i1, !dbg !1236
  br label %213

213:                                              ; preds = %209, %202
  %214 = phi i1 [ false, %202 ], [ %212, %209 ], !dbg !1237
  %215 = call i32 @tc_detach(i32 noundef %204, i32 noundef 2, ptr noundef %205, i1 noundef zeroext %214), !dbg !1238
  store i32 %215, ptr %7, align 4, !dbg !1239, !tbaa !996
  %216 = load i32, ptr %7, align 4, !dbg !1240, !tbaa !996
  %217 = icmp ne i32 %216, 0, !dbg !1240
  br i1 %217, label %218, label %225, !dbg !1242

218:                                              ; preds = %213
  %219 = load ptr, ptr @stderr, align 8, !dbg !1243, !tbaa !943
  %220 = getelementptr inbounds %struct.pping_config, ptr %12, i32 0, i32 14, !dbg !1244
  %221 = getelementptr inbounds [16 x i8], ptr %220, i64 0, i64 0, !dbg !1245
  %222 = load i32, ptr %7, align 4, !dbg !1246, !tbaa !996
  %223 = call ptr @get_libbpf_strerror(i32 noundef %222), !dbg !1247
  %224 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %219, ptr noundef @.str.23, ptr noundef %221, ptr noundef %223), !dbg !1248
  br label %225, !dbg !1248

225:                                              ; preds = %218, %213
  %226 = load i32, ptr %6, align 4, !dbg !1249, !tbaa !996
  %227 = icmp ne i32 %226, 0, !dbg !1250
  br i1 %227, label %228, label %231, !dbg !1251

228:                                              ; preds = %225
  %229 = load volatile i32, ptr @keep_running, align 4, !dbg !1252, !tbaa !996
  %230 = icmp ne i32 %229, 0, !dbg !1252
  br i1 %230, label %234, label %231, !dbg !1253

231:                                              ; preds = %228, %225
  %232 = load i32, ptr %7, align 4, !dbg !1254, !tbaa !996
  %233 = icmp ne i32 %232, 0, !dbg !1255
  br label %234, !dbg !1253

234:                                              ; preds = %231, %228
  %235 = phi i1 [ true, %228 ], [ %233, %231 ]
  %236 = zext i1 %235 to i32, !dbg !1253
  store i32 %236, ptr %3, align 4, !dbg !1256
  store i32 1, ptr %13, align 4
  br label %237, !dbg !1256

237:                                              ; preds = %234, %109, %60, %49, %43
  call void @llvm.lifetime.end.p0(i64 184, ptr %12) #14, !dbg !1257
  call void @llvm.lifetime.end.p0(i64 32, ptr %11) #14, !dbg !1257
  call void @llvm.lifetime.end.p0(i64 32, ptr %10) #14, !dbg !1257
  call void @llvm.lifetime.end.p0(i64 8, ptr %9) #14, !dbg !1257
  call void @llvm.lifetime.end.p0(i64 8, ptr %8) #14, !dbg !1257
  call void @llvm.lifetime.end.p0(i64 4, ptr %7) #14, !dbg !1257
  call void @llvm.lifetime.end.p0(i64 4, ptr %6) #14, !dbg !1257
  %238 = load i32, ptr %3, align 4, !dbg !1257
  ret i32 %238, !dbg !1257
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: write)
declare void @llvm.memset.p0.i64(ptr nocapture writeonly, i8, i64, i1 immarg) #3

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #4

; Function Attrs: nounwind
declare !dbg !1258 dso_local i32 @geteuid() #0

declare !dbg !1263 dso_local i32 @printf(ptr noundef, ...) #5

; Function Attrs: nounwind
define internal i32 @set_rlimit(i64 noundef %0) #0 !dbg !1268 {
  %2 = alloca i64, align 8
  %3 = alloca %struct.timespec, align 8
  store i64 %0, ptr %2, align 8, !tbaa !1048
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1272, metadata !DIExpression()), !dbg !1279
  call void @llvm.lifetime.start.p0(i64 16, ptr %3) #14, !dbg !1280
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1273, metadata !DIExpression()), !dbg !1281
  %4 = getelementptr inbounds %struct.timespec, ptr %3, i32 0, i32 0, !dbg !1282
  %5 = load i64, ptr %2, align 8, !dbg !1283, !tbaa !1048
  store i64 %5, ptr %4, align 8, !dbg !1282, !tbaa !1284
  %6 = getelementptr inbounds %struct.timespec, ptr %3, i32 0, i32 1, !dbg !1282
  %7 = load i64, ptr %2, align 8, !dbg !1286, !tbaa !1048
  store i64 %7, ptr %6, align 8, !dbg !1282, !tbaa !1287
  %8 = call i32 @setrlimit(i32 noundef 8, ptr noundef %3) #14, !dbg !1288
  %9 = icmp ne i32 %8, 0, !dbg !1288
  br i1 %9, label %11, label %10, !dbg !1289

10:                                               ; preds = %1
  br label %15, !dbg !1289

11:                                               ; preds = %1
  %12 = call ptr @__errno_location() #16, !dbg !1290
  %13 = load i32, ptr %12, align 4, !dbg !1290, !tbaa !996
  %14 = sub nsw i32 0, %13, !dbg !1291
  br label %15, !dbg !1289

15:                                               ; preds = %11, %10
  %16 = phi i32 [ 0, %10 ], [ %14, %11 ], !dbg !1289
  call void @llvm.lifetime.end.p0(i64 16, ptr %3) #14, !dbg !1292
  ret i32 %16, !dbg !1293
}

; Function Attrs: nounwind
define internal ptr @get_libbpf_strerror(i32 noundef %0) #0 !dbg !376 {
  %2 = alloca i32, align 4
  store i32 %0, ptr %2, align 4, !tbaa !996
  call void @llvm.dbg.declare(metadata ptr %2, metadata !382, metadata !DIExpression()), !dbg !1294
  %3 = load i32, ptr %2, align 4, !dbg !1295, !tbaa !996
  %4 = call i32 @libbpf_strerror(i32 noundef %3, ptr noundef @get_libbpf_strerror.buf, i64 noundef 200), !dbg !1296
  ret ptr @get_libbpf_strerror.buf, !dbg !1297
}

declare !dbg !1298 dso_local i32 @fprintf(ptr noundef, ptr noundef, ...) #5

; Function Attrs: nounwind
define internal i32 @parse_arguments(i32 noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !1304 {
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
  store i32 %0, ptr %5, align 4, !tbaa !996
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1308, metadata !DIExpression()), !dbg !1317
  store ptr %1, ptr %6, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1309, metadata !DIExpression()), !dbg !1318
  store ptr %2, ptr %7, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1310, metadata !DIExpression()), !dbg !1319
  call void @llvm.lifetime.start.p0(i64 4, ptr %8) #14, !dbg !1320
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1311, metadata !DIExpression()), !dbg !1321
  call void @llvm.lifetime.start.p0(i64 4, ptr %9) #14, !dbg !1320
  call void @llvm.dbg.declare(metadata ptr %9, metadata !1312, metadata !DIExpression()), !dbg !1322
  call void @llvm.lifetime.start.p0(i64 8, ptr %10) #14, !dbg !1323
  call void @llvm.dbg.declare(metadata ptr %10, metadata !1313, metadata !DIExpression()), !dbg !1324
  call void @llvm.lifetime.start.p0(i64 8, ptr %11) #14, !dbg !1323
  call void @llvm.dbg.declare(metadata ptr %11, metadata !1315, metadata !DIExpression()), !dbg !1325
  call void @llvm.lifetime.start.p0(i64 8, ptr %12) #14, !dbg !1323
  call void @llvm.dbg.declare(metadata ptr %12, metadata !1316, metadata !DIExpression()), !dbg !1326
  %14 = load ptr, ptr %7, align 8, !dbg !1327, !tbaa !943
  %15 = getelementptr inbounds %struct.pping_config, ptr %14, i32 0, i32 11, !dbg !1328
  store i32 0, ptr %15, align 4, !dbg !1329, !tbaa !1058
  %16 = load ptr, ptr %7, align 8, !dbg !1330, !tbaa !943
  %17 = getelementptr inbounds %struct.pping_config, ptr %16, i32 0, i32 0, !dbg !1331
  %18 = getelementptr inbounds %struct.bpf_config, ptr %17, i32 0, i32 5, !dbg !1332
  store i8 1, ptr %18, align 1, !dbg !1333, !tbaa !1334
  %19 = load ptr, ptr %7, align 8, !dbg !1335, !tbaa !943
  %20 = getelementptr inbounds %struct.pping_config, ptr %19, i32 0, i32 16, !dbg !1336
  store i8 0, ptr %20, align 4, !dbg !1337, !tbaa !1062
  %21 = load ptr, ptr %7, align 8, !dbg !1338, !tbaa !943
  %22 = getelementptr inbounds %struct.pping_config, ptr %21, i32 0, i32 0, !dbg !1339
  %23 = getelementptr inbounds %struct.bpf_config, ptr %22, i32 0, i32 3, !dbg !1340
  store i8 0, ptr %23, align 1, !dbg !1341, !tbaa !953
  %24 = load ptr, ptr %7, align 8, !dbg !1342, !tbaa !943
  %25 = getelementptr inbounds %struct.pping_config, ptr %24, i32 0, i32 0, !dbg !1343
  %26 = getelementptr inbounds %struct.bpf_config, ptr %25, i32 0, i32 4, !dbg !1344
  store i8 0, ptr %26, align 2, !dbg !1345, !tbaa !969
  br label %27, !dbg !1346

27:                                               ; preds = %205, %3
  %28 = load i32, ptr %5, align 4, !dbg !1347, !tbaa !996
  %29 = load ptr, ptr %6, align 8, !dbg !1348, !tbaa !943
  %30 = call i32 @getopt_long(i32 noundef %28, ptr noundef %29, ptr noundef @.str.24, ptr noundef @long_options, ptr noundef null) #14, !dbg !1349
  store i32 %30, ptr %9, align 4, !dbg !1350, !tbaa !996
  %31 = icmp ne i32 %30, -1, !dbg !1351
  br i1 %31, label %32, label %206, !dbg !1346

32:                                               ; preds = %27
  %33 = load i32, ptr %9, align 4, !dbg !1352, !tbaa !996
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
  ], !dbg !1354

34:                                               ; preds = %32
  %35 = load ptr, ptr @optarg, align 8, !dbg !1355, !tbaa !943
  %36 = call i64 @strlen(ptr noundef %35) #15, !dbg !1358
  %37 = icmp ugt i64 %36, 16, !dbg !1359
  br i1 %37, label %38, label %41, !dbg !1360

38:                                               ; preds = %34
  %39 = load ptr, ptr @stderr, align 8, !dbg !1361, !tbaa !943
  %40 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %39, ptr noundef @.str.25), !dbg !1363
  store i32 -22, ptr %4, align 4, !dbg !1364
  store i32 1, ptr %13, align 4
  br label %215, !dbg !1364

41:                                               ; preds = %34
  %42 = load ptr, ptr %7, align 8, !dbg !1365, !tbaa !943
  %43 = getelementptr inbounds %struct.pping_config, ptr %42, i32 0, i32 14, !dbg !1366
  %44 = getelementptr inbounds [16 x i8], ptr %43, i64 0, i64 0, !dbg !1365
  %45 = load ptr, ptr @optarg, align 8, !dbg !1367, !tbaa !943
  %46 = call ptr @strncpy(ptr noundef %44, ptr noundef %45, i64 noundef 16) #14, !dbg !1368
  %47 = load ptr, ptr %7, align 8, !dbg !1369, !tbaa !943
  %48 = getelementptr inbounds %struct.pping_config, ptr %47, i32 0, i32 14, !dbg !1370
  %49 = getelementptr inbounds [16 x i8], ptr %48, i64 0, i64 0, !dbg !1369
  %50 = call i32 @if_nametoindex(ptr noundef %49) #14, !dbg !1371
  %51 = load ptr, ptr %7, align 8, !dbg !1372, !tbaa !943
  %52 = getelementptr inbounds %struct.pping_config, ptr %51, i32 0, i32 11, !dbg !1373
  store i32 %50, ptr %52, align 4, !dbg !1374, !tbaa !1058
  %53 = load ptr, ptr %7, align 8, !dbg !1375, !tbaa !943
  %54 = getelementptr inbounds %struct.pping_config, ptr %53, i32 0, i32 11, !dbg !1377
  %55 = load i32, ptr %54, align 4, !dbg !1377, !tbaa !1058
  %56 = icmp eq i32 %55, 0, !dbg !1378
  br i1 %56, label %57, label %69, !dbg !1379

57:                                               ; preds = %41
  %58 = call ptr @__errno_location() #16, !dbg !1380
  %59 = load i32, ptr %58, align 4, !dbg !1380, !tbaa !996
  %60 = sub nsw i32 0, %59, !dbg !1382
  store i32 %60, ptr %8, align 4, !dbg !1383, !tbaa !996
  %61 = load ptr, ptr @stderr, align 8, !dbg !1384, !tbaa !943
  %62 = load ptr, ptr %7, align 8, !dbg !1385, !tbaa !943
  %63 = getelementptr inbounds %struct.pping_config, ptr %62, i32 0, i32 14, !dbg !1386
  %64 = getelementptr inbounds [16 x i8], ptr %63, i64 0, i64 0, !dbg !1385
  %65 = load i32, ptr %8, align 4, !dbg !1387, !tbaa !996
  %66 = call ptr @get_libbpf_strerror(i32 noundef %65), !dbg !1388
  %67 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %61, ptr noundef @.str.26, ptr noundef %64, ptr noundef %66), !dbg !1389
  %68 = load i32, ptr %8, align 4, !dbg !1390, !tbaa !996
  store i32 %68, ptr %4, align 4, !dbg !1391
  store i32 1, ptr %13, align 4
  br label %215, !dbg !1391

69:                                               ; preds = %41
  br label %205, !dbg !1392

70:                                               ; preds = %32
  %71 = load ptr, ptr @optarg, align 8, !dbg !1393, !tbaa !943
  %72 = call i32 @parse_bounded_double(ptr noundef %10, ptr noundef %71, double noundef 0.000000e+00, double noundef 6.048000e+08, ptr noundef @.str.27), !dbg !1394
  store i32 %72, ptr %8, align 4, !dbg !1395, !tbaa !996
  %73 = load i32, ptr %8, align 4, !dbg !1396, !tbaa !996
  %74 = icmp ne i32 %73, 0, !dbg !1396
  br i1 %74, label %75, label %76, !dbg !1398

75:                                               ; preds = %70
  store i32 -22, ptr %4, align 4, !dbg !1399
  store i32 1, ptr %13, align 4
  br label %215, !dbg !1399

76:                                               ; preds = %70
  %77 = load double, ptr %10, align 8, !dbg !1400, !tbaa !1401
  %78 = fmul double %77, 1.000000e+06, !dbg !1403
  %79 = fptoui double %78 to i64, !dbg !1400
  %80 = load ptr, ptr %7, align 8, !dbg !1404, !tbaa !943
  %81 = getelementptr inbounds %struct.pping_config, ptr %80, i32 0, i32 0, !dbg !1405
  %82 = getelementptr inbounds %struct.bpf_config, ptr %81, i32 0, i32 0, !dbg !1406
  store i64 %79, ptr %82, align 8, !dbg !1407, !tbaa !1408
  br label %205, !dbg !1409

83:                                               ; preds = %32
  %84 = load ptr, ptr @optarg, align 8, !dbg !1410, !tbaa !943
  %85 = call i32 @parse_bounded_double(ptr noundef %12, ptr noundef %84, double noundef 0.000000e+00, double noundef 1.000000e+04, ptr noundef @.str.28), !dbg !1411
  store i32 %85, ptr %8, align 4, !dbg !1412, !tbaa !996
  %86 = load i32, ptr %8, align 4, !dbg !1413, !tbaa !996
  %87 = icmp ne i32 %86, 0, !dbg !1413
  br i1 %87, label %88, label %89, !dbg !1415

88:                                               ; preds = %83
  store i32 -22, ptr %4, align 4, !dbg !1416
  store i32 1, ptr %13, align 4
  br label %215, !dbg !1416

89:                                               ; preds = %83
  %90 = load double, ptr %12, align 8, !dbg !1417, !tbaa !1401
  %91 = fmul double %90, 6.553600e+04, !dbg !1417
  %92 = fptoui double %91 to i64, !dbg !1417
  %93 = load ptr, ptr %7, align 8, !dbg !1418, !tbaa !943
  %94 = getelementptr inbounds %struct.pping_config, ptr %93, i32 0, i32 0, !dbg !1419
  %95 = getelementptr inbounds %struct.bpf_config, ptr %94, i32 0, i32 1, !dbg !1420
  store i64 %92, ptr %95, align 8, !dbg !1421, !tbaa !1422
  br label %205, !dbg !1423

96:                                               ; preds = %32
  %97 = load ptr, ptr @optarg, align 8, !dbg !1424, !tbaa !943
  %98 = call i32 @strcmp(ptr noundef %97, ptr noundef @.str.29) #15, !dbg !1426
  %99 = icmp eq i32 %98, 0, !dbg !1427
  br i1 %99, label %100, label %104, !dbg !1428

100:                                              ; preds = %96
  %101 = load ptr, ptr %7, align 8, !dbg !1429, !tbaa !943
  %102 = getelementptr inbounds %struct.pping_config, ptr %101, i32 0, i32 0, !dbg !1431
  %103 = getelementptr inbounds %struct.bpf_config, ptr %102, i32 0, i32 2, !dbg !1432
  store i8 0, ptr %103, align 8, !dbg !1433, !tbaa !1434
  br label %116, !dbg !1435

104:                                              ; preds = %96
  %105 = load ptr, ptr @optarg, align 8, !dbg !1436, !tbaa !943
  %106 = call i32 @strcmp(ptr noundef %105, ptr noundef @.str.30) #15, !dbg !1438
  %107 = icmp eq i32 %106, 0, !dbg !1439
  br i1 %107, label %108, label %112, !dbg !1440

108:                                              ; preds = %104
  %109 = load ptr, ptr %7, align 8, !dbg !1441, !tbaa !943
  %110 = getelementptr inbounds %struct.pping_config, ptr %109, i32 0, i32 0, !dbg !1443
  %111 = getelementptr inbounds %struct.bpf_config, ptr %110, i32 0, i32 2, !dbg !1444
  store i8 1, ptr %111, align 8, !dbg !1445, !tbaa !1434
  br label %115, !dbg !1446

112:                                              ; preds = %104
  %113 = load ptr, ptr @stderr, align 8, !dbg !1447, !tbaa !943
  %114 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %113, ptr noundef @.str.31), !dbg !1449
  store i32 -22, ptr %4, align 4, !dbg !1450
  store i32 1, ptr %13, align 4
  br label %215, !dbg !1450

115:                                              ; preds = %108
  br label %116

116:                                              ; preds = %115, %100
  br label %205, !dbg !1451

117:                                              ; preds = %32
  %118 = load ptr, ptr @optarg, align 8, !dbg !1452, !tbaa !943
  %119 = call i32 @parse_bounded_double(ptr noundef %11, ptr noundef %118, double noundef 0.000000e+00, double noundef 6.048000e+05, ptr noundef @.str.32), !dbg !1453
  store i32 %119, ptr %8, align 4, !dbg !1454, !tbaa !996
  %120 = load i32, ptr %8, align 4, !dbg !1455, !tbaa !996
  %121 = icmp ne i32 %120, 0, !dbg !1455
  br i1 %121, label %122, label %123, !dbg !1457

122:                                              ; preds = %117
  store i32 -22, ptr %4, align 4, !dbg !1458
  store i32 1, ptr %13, align 4
  br label %215, !dbg !1458

123:                                              ; preds = %117
  %124 = load double, ptr %11, align 8, !dbg !1459, !tbaa !1401
  %125 = fmul double %124, 1.000000e+09, !dbg !1460
  %126 = fptoui double %125 to i64, !dbg !1459
  %127 = load ptr, ptr %7, align 8, !dbg !1461, !tbaa !943
  %128 = getelementptr inbounds %struct.pping_config, ptr %127, i32 0, i32 3, !dbg !1462
  store i64 %126, ptr %128, align 8, !dbg !1463, !tbaa !1050
  br label %205, !dbg !1464

129:                                              ; preds = %32
  %130 = load ptr, ptr @optarg, align 8, !dbg !1465, !tbaa !943
  %131 = call i32 @strcmp(ptr noundef %130, ptr noundef @.str.3) #15, !dbg !1467
  %132 = icmp eq i32 %131, 0, !dbg !1468
  br i1 %132, label %133, label %136, !dbg !1469

133:                                              ; preds = %129
  %134 = load ptr, ptr %7, align 8, !dbg !1470, !tbaa !943
  %135 = getelementptr inbounds %struct.pping_config, ptr %134, i32 0, i32 15, !dbg !1472
  store i32 0, ptr %135, align 8, !dbg !1473, !tbaa !1061
  br label %155, !dbg !1474

136:                                              ; preds = %129
  %137 = load ptr, ptr @optarg, align 8, !dbg !1475, !tbaa !943
  %138 = call i32 @strcmp(ptr noundef %137, ptr noundef @.str.4) #15, !dbg !1477
  %139 = icmp eq i32 %138, 0, !dbg !1478
  br i1 %139, label %140, label %143, !dbg !1479

140:                                              ; preds = %136
  %141 = load ptr, ptr %7, align 8, !dbg !1480, !tbaa !943
  %142 = getelementptr inbounds %struct.pping_config, ptr %141, i32 0, i32 15, !dbg !1482
  store i32 1, ptr %142, align 8, !dbg !1483, !tbaa !1061
  br label %154, !dbg !1484

143:                                              ; preds = %136
  %144 = load ptr, ptr @optarg, align 8, !dbg !1485, !tbaa !943
  %145 = call i32 @strcmp(ptr noundef %144, ptr noundef @.str.5) #15, !dbg !1487
  %146 = icmp eq i32 %145, 0, !dbg !1488
  br i1 %146, label %147, label %150, !dbg !1489

147:                                              ; preds = %143
  %148 = load ptr, ptr %7, align 8, !dbg !1490, !tbaa !943
  %149 = getelementptr inbounds %struct.pping_config, ptr %148, i32 0, i32 15, !dbg !1492
  store i32 2, ptr %149, align 8, !dbg !1493, !tbaa !1061
  br label %153, !dbg !1494

150:                                              ; preds = %143
  %151 = load ptr, ptr @stderr, align 8, !dbg !1495, !tbaa !943
  %152 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %151, ptr noundef @.str.33), !dbg !1497
  store i32 -22, ptr %4, align 4, !dbg !1498
  store i32 1, ptr %13, align 4
  br label %215, !dbg !1498

153:                                              ; preds = %147
  br label %154

154:                                              ; preds = %153, %140
  br label %155

155:                                              ; preds = %154, %133
  br label %205, !dbg !1499

156:                                              ; preds = %32
  %157 = load ptr, ptr @optarg, align 8, !dbg !1500, !tbaa !943
  %158 = call i32 @strcmp(ptr noundef %157, ptr noundef @.str.34) #15, !dbg !1502
  %159 = icmp eq i32 %158, 0, !dbg !1503
  br i1 %159, label %160, label %163, !dbg !1504

160:                                              ; preds = %156
  %161 = load ptr, ptr %7, align 8, !dbg !1505, !tbaa !943
  %162 = getelementptr inbounds %struct.pping_config, ptr %161, i32 0, i32 5, !dbg !1507
  store ptr @.str.8, ptr %162, align 8, !dbg !1508, !tbaa !1052
  br label %174, !dbg !1509

163:                                              ; preds = %156
  %164 = load ptr, ptr @optarg, align 8, !dbg !1510, !tbaa !943
  %165 = call i32 @strcmp(ptr noundef %164, ptr noundef @.str.35) #15, !dbg !1512
  %166 = icmp eq i32 %165, 0, !dbg !1513
  br i1 %166, label %167, label %170, !dbg !1514

167:                                              ; preds = %163
  %168 = load ptr, ptr %7, align 8, !dbg !1515, !tbaa !943
  %169 = getelementptr inbounds %struct.pping_config, ptr %168, i32 0, i32 5, !dbg !1517
  store ptr @.str.36, ptr %169, align 8, !dbg !1518, !tbaa !1052
  br label %173, !dbg !1519

170:                                              ; preds = %163
  %171 = load ptr, ptr @stderr, align 8, !dbg !1520, !tbaa !943
  %172 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %171, ptr noundef @.str.37), !dbg !1522
  store i32 -22, ptr %4, align 4, !dbg !1523
  store i32 1, ptr %13, align 4
  br label %215, !dbg !1523

173:                                              ; preds = %167
  br label %174

174:                                              ; preds = %173, %160
  br label %205, !dbg !1524

175:                                              ; preds = %32
  %176 = load ptr, ptr %7, align 8, !dbg !1525, !tbaa !943
  %177 = getelementptr inbounds %struct.pping_config, ptr %176, i32 0, i32 0, !dbg !1526
  %178 = getelementptr inbounds %struct.bpf_config, ptr %177, i32 0, i32 5, !dbg !1527
  store i8 0, ptr %178, align 1, !dbg !1528, !tbaa !1334
  br label %205, !dbg !1529

179:                                              ; preds = %32
  %180 = load ptr, ptr %7, align 8, !dbg !1530, !tbaa !943
  %181 = getelementptr inbounds %struct.pping_config, ptr %180, i32 0, i32 16, !dbg !1531
  store i8 1, ptr %181, align 4, !dbg !1532, !tbaa !1062
  %182 = load ptr, ptr %7, align 8, !dbg !1533, !tbaa !943
  %183 = getelementptr inbounds %struct.pping_config, ptr %182, i32 0, i32 10, !dbg !1534
  %184 = load i32, ptr %183, align 8, !dbg !1535, !tbaa !1057
  %185 = and i32 %184, -2, !dbg !1535
  store i32 %185, ptr %183, align 8, !dbg !1535, !tbaa !1057
  br label %205, !dbg !1536

186:                                              ; preds = %32
  %187 = load ptr, ptr %7, align 8, !dbg !1537, !tbaa !943
  %188 = getelementptr inbounds %struct.pping_config, ptr %187, i32 0, i32 0, !dbg !1538
  %189 = getelementptr inbounds %struct.bpf_config, ptr %188, i32 0, i32 3, !dbg !1539
  store i8 1, ptr %189, align 1, !dbg !1540, !tbaa !953
  br label %205, !dbg !1541

190:                                              ; preds = %32
  %191 = load ptr, ptr %7, align 8, !dbg !1542, !tbaa !943
  %192 = getelementptr inbounds %struct.pping_config, ptr %191, i32 0, i32 0, !dbg !1543
  %193 = getelementptr inbounds %struct.bpf_config, ptr %192, i32 0, i32 4, !dbg !1544
  store i8 1, ptr %193, align 2, !dbg !1545, !tbaa !969
  br label %205, !dbg !1546

194:                                              ; preds = %32
  %195 = call i32 (ptr, ...) @printf(ptr noundef @.str.38), !dbg !1547
  %196 = load ptr, ptr %6, align 8, !dbg !1548, !tbaa !943
  call void @print_usage(ptr noundef %196), !dbg !1549
  call void @exit(i32 noundef 0) #17, !dbg !1550
  unreachable, !dbg !1550

197:                                              ; preds = %32
  %198 = load ptr, ptr @stderr, align 8, !dbg !1551, !tbaa !943
  %199 = load ptr, ptr %6, align 8, !dbg !1552, !tbaa !943
  %200 = load i32, ptr @optind, align 4, !dbg !1553, !tbaa !996
  %201 = sext i32 %200 to i64, !dbg !1552
  %202 = getelementptr inbounds ptr, ptr %199, i64 %201, !dbg !1552
  %203 = load ptr, ptr %202, align 8, !dbg !1552, !tbaa !943
  %204 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %198, ptr noundef @.str.39, ptr noundef %203), !dbg !1554
  store i32 -22, ptr %4, align 4, !dbg !1555
  store i32 1, ptr %13, align 4
  br label %215, !dbg !1555

205:                                              ; preds = %190, %186, %179, %175, %174, %155, %123, %116, %89, %76, %69
  br label %27, !dbg !1346, !llvm.loop !1556

206:                                              ; preds = %27
  %207 = load ptr, ptr %7, align 8, !dbg !1558, !tbaa !943
  %208 = getelementptr inbounds %struct.pping_config, ptr %207, i32 0, i32 11, !dbg !1560
  %209 = load i32, ptr %208, align 4, !dbg !1560, !tbaa !1058
  %210 = icmp eq i32 %209, 0, !dbg !1561
  br i1 %210, label %211, label %214, !dbg !1562

211:                                              ; preds = %206
  %212 = load ptr, ptr @stderr, align 8, !dbg !1563, !tbaa !943
  %213 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %212, ptr noundef @.str.40), !dbg !1565
  store i32 -22, ptr %4, align 4, !dbg !1566
  store i32 1, ptr %13, align 4
  br label %215, !dbg !1566

214:                                              ; preds = %206
  store i32 0, ptr %4, align 4, !dbg !1567
  store i32 1, ptr %13, align 4
  br label %215, !dbg !1567

215:                                              ; preds = %214, %211, %197, %170, %150, %122, %112, %88, %75, %57, %38
  call void @llvm.lifetime.end.p0(i64 8, ptr %12) #14, !dbg !1568
  call void @llvm.lifetime.end.p0(i64 8, ptr %11) #14, !dbg !1568
  call void @llvm.lifetime.end.p0(i64 8, ptr %10) #14, !dbg !1568
  call void @llvm.lifetime.end.p0(i64 4, ptr %9) #14, !dbg !1568
  call void @llvm.lifetime.end.p0(i64 4, ptr %8) #14, !dbg !1568
  %216 = load i32, ptr %4, align 4, !dbg !1568
  ret i32 %216, !dbg !1568
}

; Function Attrs: nounwind
define internal void @print_usage(ptr noundef %0) #0 !dbg !1569 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1573, metadata !DIExpression()), !dbg !1575
  call void @llvm.lifetime.start.p0(i64 4, ptr %3) #14, !dbg !1576
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1574, metadata !DIExpression()), !dbg !1577
  %4 = load ptr, ptr @__doc__, align 8, !dbg !1578, !tbaa !943
  %5 = call i32 (ptr, ...) @printf(ptr noundef @.str.52, ptr noundef %4), !dbg !1579
  %6 = call i32 (ptr, ...) @printf(ptr noundef @.str.53), !dbg !1580
  %7 = load ptr, ptr %2, align 8, !dbg !1581, !tbaa !943
  %8 = getelementptr inbounds ptr, ptr %7, i64 0, !dbg !1581
  %9 = load ptr, ptr %8, align 8, !dbg !1581, !tbaa !943
  %10 = call i32 (ptr, ...) @printf(ptr noundef @.str.54, ptr noundef %9), !dbg !1582
  %11 = call i32 (ptr, ...) @printf(ptr noundef @.str.55), !dbg !1583
  store i32 0, ptr %3, align 4, !dbg !1584, !tbaa !996
  br label %12, !dbg !1586

12:                                               ; preds = %49, %1
  %13 = load i32, ptr %3, align 4, !dbg !1587, !tbaa !996
  %14 = sext i32 %13 to i64, !dbg !1589
  %15 = getelementptr inbounds [13 x %struct.option], ptr @long_options, i64 0, i64 %14, !dbg !1589
  %16 = getelementptr inbounds %struct.option, ptr %15, i32 0, i32 0, !dbg !1590
  %17 = load ptr, ptr %16, align 8, !dbg !1590, !tbaa !1591
  %18 = icmp ne ptr %17, null, !dbg !1593
  br i1 %18, label %19, label %52, !dbg !1594

19:                                               ; preds = %12
  %20 = load i32, ptr %3, align 4, !dbg !1595, !tbaa !996
  %21 = sext i32 %20 to i64, !dbg !1597
  %22 = getelementptr inbounds [13 x %struct.option], ptr @long_options, i64 0, i64 %21, !dbg !1597
  %23 = getelementptr inbounds %struct.option, ptr %22, i32 0, i32 0, !dbg !1598
  %24 = load ptr, ptr %23, align 8, !dbg !1598, !tbaa !1591
  %25 = call i32 (ptr, ...) @printf(ptr noundef @.str.56, ptr noundef %24), !dbg !1599
  %26 = load i32, ptr %3, align 4, !dbg !1600, !tbaa !996
  %27 = sext i32 %26 to i64, !dbg !1602
  %28 = getelementptr inbounds [13 x %struct.option], ptr @long_options, i64 0, i64 %27, !dbg !1602
  %29 = getelementptr inbounds %struct.option, ptr %28, i32 0, i32 2, !dbg !1603
  %30 = load ptr, ptr %29, align 8, !dbg !1603, !tbaa !1604
  %31 = icmp ne ptr %30, null, !dbg !1605
  br i1 %31, label %32, label %40, !dbg !1606

32:                                               ; preds = %19
  %33 = load i32, ptr %3, align 4, !dbg !1607, !tbaa !996
  %34 = sext i32 %33 to i64, !dbg !1608
  %35 = getelementptr inbounds [13 x %struct.option], ptr @long_options, i64 0, i64 %34, !dbg !1608
  %36 = getelementptr inbounds %struct.option, ptr %35, i32 0, i32 2, !dbg !1609
  %37 = load ptr, ptr %36, align 8, !dbg !1609, !tbaa !1604
  %38 = load i32, ptr %37, align 4, !dbg !1610, !tbaa !996
  %39 = call i32 (ptr, ...) @printf(ptr noundef @.str.57, i32 noundef %38), !dbg !1611
  br label %47, !dbg !1611

40:                                               ; preds = %19
  %41 = load i32, ptr %3, align 4, !dbg !1612, !tbaa !996
  %42 = sext i32 %41 to i64, !dbg !1613
  %43 = getelementptr inbounds [13 x %struct.option], ptr @long_options, i64 0, i64 %42, !dbg !1613
  %44 = getelementptr inbounds %struct.option, ptr %43, i32 0, i32 3, !dbg !1614
  %45 = load i32, ptr %44, align 8, !dbg !1614, !tbaa !1615
  %46 = call i32 (ptr, ...) @printf(ptr noundef @.str.58, i32 noundef %45), !dbg !1616
  br label %47

47:                                               ; preds = %40, %32
  %48 = call i32 (ptr, ...) @printf(ptr noundef @.str.53), !dbg !1617
  br label %49, !dbg !1618

49:                                               ; preds = %47
  %50 = load i32, ptr %3, align 4, !dbg !1619, !tbaa !996
  %51 = add nsw i32 %50, 1, !dbg !1619
  store i32 %51, ptr %3, align 4, !dbg !1619, !tbaa !996
  br label %12, !dbg !1620, !llvm.loop !1621

52:                                               ; preds = %12
  %53 = call i32 (ptr, ...) @printf(ptr noundef @.str.53), !dbg !1623
  call void @llvm.lifetime.end.p0(i64 4, ptr %3) #14, !dbg !1624
  ret void, !dbg !1624
}

; Function Attrs: nounwind
define internal void @print_event_standard(ptr noundef %0) #0 !dbg !1625 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1627, metadata !DIExpression()), !dbg !1628
  %3 = load ptr, ptr %2, align 8, !dbg !1629, !tbaa !943
  %4 = load i64, ptr %3, align 8, !dbg !1631, !tbaa !981
  %5 = icmp eq i64 %4, 2, !dbg !1632
  br i1 %5, label %6, label %37, !dbg !1633

6:                                                ; preds = %1
  %7 = load ptr, ptr @stdout, align 8, !dbg !1634, !tbaa !943
  %8 = load ptr, ptr %2, align 8, !dbg !1636, !tbaa !943
  %9 = getelementptr inbounds %struct.rtt_event, ptr %8, i32 0, i32 1, !dbg !1637
  %10 = load i64, ptr %9, align 8, !dbg !1637, !tbaa !981
  call void @print_ns_datetime(ptr noundef %7, i64 noundef %10), !dbg !1638
  %11 = load ptr, ptr %2, align 8, !dbg !1639, !tbaa !943
  %12 = getelementptr inbounds %struct.rtt_event, ptr %11, i32 0, i32 4, !dbg !1640
  %13 = load i64, ptr %12, align 8, !dbg !1640, !tbaa !981
  %14 = udiv i64 %13, 1000000, !dbg !1641
  %15 = load ptr, ptr %2, align 8, !dbg !1642, !tbaa !943
  %16 = getelementptr inbounds %struct.rtt_event, ptr %15, i32 0, i32 4, !dbg !1643
  %17 = load i64, ptr %16, align 8, !dbg !1643, !tbaa !981
  %18 = urem i64 %17, 1000000, !dbg !1644
  %19 = load ptr, ptr %2, align 8, !dbg !1645, !tbaa !943
  %20 = getelementptr inbounds %struct.rtt_event, ptr %19, i32 0, i32 5, !dbg !1646
  %21 = load i64, ptr %20, align 8, !dbg !1646, !tbaa !981
  %22 = udiv i64 %21, 1000000, !dbg !1647
  %23 = load ptr, ptr %2, align 8, !dbg !1648, !tbaa !943
  %24 = getelementptr inbounds %struct.rtt_event, ptr %23, i32 0, i32 5, !dbg !1649
  %25 = load i64, ptr %24, align 8, !dbg !1649, !tbaa !981
  %26 = urem i64 %25, 1000000, !dbg !1650
  %27 = load ptr, ptr %2, align 8, !dbg !1651, !tbaa !943
  %28 = getelementptr inbounds %struct.rtt_event, ptr %27, i32 0, i32 2, !dbg !1652
  %29 = getelementptr inbounds %struct.network_tuple, ptr %28, i32 0, i32 2, !dbg !1653
  %30 = load i16, ptr %29, align 8, !dbg !1653, !tbaa !981
  %31 = call ptr @proto_to_str(i16 noundef zeroext %30), !dbg !1654
  %32 = call i32 (ptr, ...) @printf(ptr noundef @.str.60, i64 noundef %14, i64 noundef %18, i64 noundef %22, i64 noundef %26, ptr noundef %31), !dbg !1655
  %33 = load ptr, ptr @stdout, align 8, !dbg !1656, !tbaa !943
  %34 = load ptr, ptr %2, align 8, !dbg !1657, !tbaa !943
  %35 = getelementptr inbounds %struct.rtt_event, ptr %34, i32 0, i32 2, !dbg !1658
  call void @print_flow_ppvizformat(ptr noundef %33, ptr noundef %35), !dbg !1659
  %36 = call i32 (ptr, ...) @printf(ptr noundef @.str.53), !dbg !1660
  br label %69, !dbg !1661

37:                                               ; preds = %1
  %38 = load ptr, ptr %2, align 8, !dbg !1662, !tbaa !943
  %39 = load i64, ptr %38, align 8, !dbg !1664, !tbaa !981
  %40 = icmp eq i64 %39, 1, !dbg !1665
  br i1 %40, label %41, label %68, !dbg !1666

41:                                               ; preds = %37
  %42 = load ptr, ptr @stdout, align 8, !dbg !1667, !tbaa !943
  %43 = load ptr, ptr %2, align 8, !dbg !1669, !tbaa !943
  %44 = getelementptr inbounds %struct.flow_event, ptr %43, i32 0, i32 1, !dbg !1670
  %45 = load i64, ptr %44, align 8, !dbg !1670, !tbaa !981
  call void @print_ns_datetime(ptr noundef %42, i64 noundef %45), !dbg !1671
  %46 = load ptr, ptr %2, align 8, !dbg !1672, !tbaa !943
  %47 = getelementptr inbounds %struct.rtt_event, ptr %46, i32 0, i32 2, !dbg !1673
  %48 = getelementptr inbounds %struct.network_tuple, ptr %47, i32 0, i32 2, !dbg !1674
  %49 = load i16, ptr %48, align 8, !dbg !1674, !tbaa !981
  %50 = call ptr @proto_to_str(i16 noundef zeroext %49), !dbg !1675
  %51 = call i32 (ptr, ...) @printf(ptr noundef @.str.61, ptr noundef %50), !dbg !1676
  %52 = load ptr, ptr @stdout, align 8, !dbg !1677, !tbaa !943
  %53 = load ptr, ptr %2, align 8, !dbg !1678, !tbaa !943
  %54 = getelementptr inbounds %struct.flow_event, ptr %53, i32 0, i32 2, !dbg !1679
  call void @print_flow_ppvizformat(ptr noundef %52, ptr noundef %54), !dbg !1680
  %55 = load ptr, ptr %2, align 8, !dbg !1681, !tbaa !943
  %56 = getelementptr inbounds %struct.flow_event, ptr %55, i32 0, i32 3, !dbg !1682
  %57 = load i8, ptr %56, align 4, !dbg !1682, !tbaa !981
  %58 = call ptr @flowevent_to_str(i8 noundef zeroext %57), !dbg !1683
  %59 = load ptr, ptr %2, align 8, !dbg !1684, !tbaa !943
  %60 = getelementptr inbounds %struct.flow_event, ptr %59, i32 0, i32 4, !dbg !1685
  %61 = load i8, ptr %60, align 1, !dbg !1685, !tbaa !981
  %62 = call ptr @eventreason_to_str(i8 noundef zeroext %61), !dbg !1686
  %63 = load ptr, ptr %2, align 8, !dbg !1687, !tbaa !943
  %64 = getelementptr inbounds %struct.flow_event, ptr %63, i32 0, i32 5, !dbg !1688
  %65 = load i8, ptr %64, align 2, !dbg !1688, !tbaa !981
  %66 = call ptr @eventsource_to_str(i8 noundef zeroext %65), !dbg !1689
  %67 = call i32 (ptr, ...) @printf(ptr noundef @.str.62, ptr noundef %58, ptr noundef %62, ptr noundef %66), !dbg !1690
  br label %68, !dbg !1691

68:                                               ; preds = %41, %37
  br label %69

69:                                               ; preds = %68, %6
  ret void, !dbg !1692
}

; Function Attrs: nounwind
define internal void @print_event_json(ptr noundef %0) #0 !dbg !1693 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1695, metadata !DIExpression()), !dbg !1696
  %3 = load ptr, ptr %2, align 8, !dbg !1697, !tbaa !943
  %4 = load i64, ptr %3, align 8, !dbg !1699, !tbaa !981
  %5 = icmp ne i64 %4, 2, !dbg !1700
  br i1 %5, label %6, label %11, !dbg !1701

6:                                                ; preds = %1
  %7 = load ptr, ptr %2, align 8, !dbg !1702, !tbaa !943
  %8 = load i64, ptr %7, align 8, !dbg !1703, !tbaa !981
  %9 = icmp ne i64 %8, 1, !dbg !1704
  br i1 %9, label %10, label %11, !dbg !1705

10:                                               ; preds = %6
  br label %33, !dbg !1706

11:                                               ; preds = %6, %1
  %12 = load ptr, ptr @json_ctx, align 8, !dbg !1707, !tbaa !943
  %13 = icmp ne ptr %12, null, !dbg !1707
  br i1 %13, label %18, label %14, !dbg !1709

14:                                               ; preds = %11
  %15 = load ptr, ptr @stdout, align 8, !dbg !1710, !tbaa !943
  %16 = call ptr @jsonw_new(ptr noundef %15), !dbg !1712
  store ptr %16, ptr @json_ctx, align 8, !dbg !1713, !tbaa !943
  %17 = load ptr, ptr @json_ctx, align 8, !dbg !1714, !tbaa !943
  call void @jsonw_start_array(ptr noundef %17), !dbg !1715
  br label %18, !dbg !1716

18:                                               ; preds = %14, %11
  %19 = load ptr, ptr @json_ctx, align 8, !dbg !1717, !tbaa !943
  call void @jsonw_start_object(ptr noundef %19), !dbg !1718
  %20 = load ptr, ptr @json_ctx, align 8, !dbg !1719, !tbaa !943
  %21 = load ptr, ptr %2, align 8, !dbg !1720, !tbaa !943
  call void @print_common_fields_json(ptr noundef %20, ptr noundef %21), !dbg !1721
  %22 = load ptr, ptr %2, align 8, !dbg !1722, !tbaa !943
  %23 = load i64, ptr %22, align 8, !dbg !1724, !tbaa !981
  %24 = icmp eq i64 %23, 2, !dbg !1725
  br i1 %24, label %25, label %28, !dbg !1726

25:                                               ; preds = %18
  %26 = load ptr, ptr @json_ctx, align 8, !dbg !1727, !tbaa !943
  %27 = load ptr, ptr %2, align 8, !dbg !1728, !tbaa !943
  call void @print_rttevent_fields_json(ptr noundef %26, ptr noundef %27), !dbg !1729
  br label %31, !dbg !1729

28:                                               ; preds = %18
  %29 = load ptr, ptr @json_ctx, align 8, !dbg !1730, !tbaa !943
  %30 = load ptr, ptr %2, align 8, !dbg !1731, !tbaa !943
  call void @print_flowevent_fields_json(ptr noundef %29, ptr noundef %30), !dbg !1732
  br label %31

31:                                               ; preds = %28, %25
  %32 = load ptr, ptr @json_ctx, align 8, !dbg !1733, !tbaa !943
  call void @jsonw_end_object(ptr noundef %32), !dbg !1734
  br label %33, !dbg !1735

33:                                               ; preds = %31, %10
  ret void, !dbg !1735
}

; Function Attrs: nounwind
define internal void @print_event_ppviz(ptr noundef %0) #0 !dbg !1736 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  store ptr %0, ptr %2, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %2, metadata !1738, metadata !DIExpression()), !dbg !1743
  %5 = load ptr, ptr %2, align 8, !dbg !1744, !tbaa !943
  %6 = load i64, ptr %5, align 8, !dbg !1746, !tbaa !981
  %7 = icmp ne i64 %6, 2, !dbg !1747
  br i1 %7, label %8, label %9, !dbg !1748

8:                                                ; preds = %1
  br label %39, !dbg !1749

9:                                                ; preds = %1
  call void @llvm.lifetime.start.p0(i64 8, ptr %3) #14, !dbg !1750
  call void @llvm.dbg.declare(metadata ptr %3, metadata !1739, metadata !DIExpression()), !dbg !1751
  %10 = load ptr, ptr %2, align 8, !dbg !1752, !tbaa !943
  store ptr %10, ptr %3, align 8, !dbg !1751, !tbaa !943
  call void @llvm.lifetime.start.p0(i64 8, ptr %4) #14, !dbg !1753
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1742, metadata !DIExpression()), !dbg !1754
  %11 = load ptr, ptr %3, align 8, !dbg !1755, !tbaa !943
  %12 = getelementptr inbounds %struct.rtt_event, ptr %11, i32 0, i32 1, !dbg !1756
  %13 = load i64, ptr %12, align 8, !dbg !1756, !tbaa !1757
  %14 = call i64 @convert_monotonic_to_realtime(i64 noundef %13), !dbg !1763
  store i64 %14, ptr %4, align 8, !dbg !1754, !tbaa !1764
  %15 = load i64, ptr %4, align 8, !dbg !1765, !tbaa !1764
  %16 = udiv i64 %15, 1000000000, !dbg !1766
  %17 = load i64, ptr %4, align 8, !dbg !1767, !tbaa !1764
  %18 = urem i64 %17, 1000000000, !dbg !1768
  %19 = load ptr, ptr %3, align 8, !dbg !1769, !tbaa !943
  %20 = getelementptr inbounds %struct.rtt_event, ptr %19, i32 0, i32 4, !dbg !1770
  %21 = load i64, ptr %20, align 8, !dbg !1770, !tbaa !1771
  %22 = udiv i64 %21, 1000000000, !dbg !1772
  %23 = load ptr, ptr %3, align 8, !dbg !1773, !tbaa !943
  %24 = getelementptr inbounds %struct.rtt_event, ptr %23, i32 0, i32 4, !dbg !1774
  %25 = load i64, ptr %24, align 8, !dbg !1774, !tbaa !1771
  %26 = urem i64 %25, 1000000000, !dbg !1775
  %27 = load ptr, ptr %3, align 8, !dbg !1776, !tbaa !943
  %28 = getelementptr inbounds %struct.rtt_event, ptr %27, i32 0, i32 5, !dbg !1777
  %29 = load i64, ptr %28, align 8, !dbg !1777, !tbaa !1778
  %30 = udiv i64 %29, 1000000000, !dbg !1779
  %31 = load ptr, ptr %3, align 8, !dbg !1780, !tbaa !943
  %32 = getelementptr inbounds %struct.rtt_event, ptr %31, i32 0, i32 5, !dbg !1781
  %33 = load i64, ptr %32, align 8, !dbg !1781, !tbaa !1778
  %34 = call i32 (ptr, ...) @printf(ptr noundef @.str.97, i64 noundef %16, i64 noundef %18, i64 noundef %22, i64 noundef %26, i64 noundef %30, i64 noundef %33), !dbg !1782
  %35 = load ptr, ptr @stdout, align 8, !dbg !1783, !tbaa !943
  %36 = load ptr, ptr %3, align 8, !dbg !1784, !tbaa !943
  %37 = getelementptr inbounds %struct.rtt_event, ptr %36, i32 0, i32 2, !dbg !1785
  call void @print_flow_ppvizformat(ptr noundef %35, ptr noundef %37), !dbg !1786
  %38 = call i32 (ptr, ...) @printf(ptr noundef @.str.53), !dbg !1787
  call void @llvm.lifetime.end.p0(i64 8, ptr %4) #14, !dbg !1788
  call void @llvm.lifetime.end.p0(i64 8, ptr %3) #14, !dbg !1788
  br label %39, !dbg !1788

39:                                               ; preds = %9, %8
  ret void, !dbg !1788
}

; Function Attrs: nounwind
define internal i32 @load_attach_bpfprogs(ptr noundef %0, ptr noundef %1) #0 !dbg !1789 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1794, metadata !DIExpression()), !dbg !1799
  store ptr %1, ptr %5, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1795, metadata !DIExpression()), !dbg !1800
  call void @llvm.lifetime.start.p0(i64 4, ptr %6) #14, !dbg !1801
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1796, metadata !DIExpression()), !dbg !1802
  call void @llvm.lifetime.start.p0(i64 4, ptr %7) #14, !dbg !1801
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1797, metadata !DIExpression()), !dbg !1803
  %9 = load ptr, ptr %5, align 8, !dbg !1804, !tbaa !943
  %10 = getelementptr inbounds %struct.pping_config, ptr %9, i32 0, i32 4, !dbg !1805
  %11 = load ptr, ptr %10, align 8, !dbg !1805, !tbaa !1051
  %12 = call ptr @bpf_object__open(ptr noundef %11), !dbg !1806
  %13 = load ptr, ptr %4, align 8, !dbg !1807, !tbaa !943
  store ptr %12, ptr %13, align 8, !dbg !1808, !tbaa !943
  %14 = load ptr, ptr %4, align 8, !dbg !1809, !tbaa !943
  %15 = load ptr, ptr %14, align 8, !dbg !1810, !tbaa !943
  %16 = call i64 @libbpf_get_error(ptr noundef %15), !dbg !1811
  %17 = trunc i64 %16 to i32, !dbg !1811
  store i32 %17, ptr %6, align 4, !dbg !1812, !tbaa !996
  %18 = load i32, ptr %6, align 4, !dbg !1813, !tbaa !996
  %19 = icmp ne i32 %18, 0, !dbg !1813
  br i1 %19, label %20, label %29, !dbg !1815

20:                                               ; preds = %2
  %21 = load ptr, ptr @stderr, align 8, !dbg !1816, !tbaa !943
  %22 = load ptr, ptr %5, align 8, !dbg !1818, !tbaa !943
  %23 = getelementptr inbounds %struct.pping_config, ptr %22, i32 0, i32 4, !dbg !1819
  %24 = load ptr, ptr %23, align 8, !dbg !1819, !tbaa !1051
  %25 = load i32, ptr %6, align 4, !dbg !1820, !tbaa !996
  %26 = call ptr @get_libbpf_strerror(i32 noundef %25), !dbg !1821
  %27 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %21, ptr noundef @.str.98, ptr noundef %24, ptr noundef %26), !dbg !1822
  %28 = load i32, ptr %6, align 4, !dbg !1823, !tbaa !996
  store i32 %28, ptr %3, align 4, !dbg !1824
  store i32 1, ptr %8, align 4
  br label %182, !dbg !1824

29:                                               ; preds = %2
  %30 = load ptr, ptr %4, align 8, !dbg !1825, !tbaa !943
  %31 = load ptr, ptr %30, align 8, !dbg !1826, !tbaa !943
  %32 = load ptr, ptr %5, align 8, !dbg !1827, !tbaa !943
  %33 = getelementptr inbounds %struct.pping_config, ptr %32, i32 0, i32 0, !dbg !1828
  %34 = call i32 @init_rodata(ptr noundef %31, ptr noundef %33, i64 noundef 24), !dbg !1829
  store i32 %34, ptr %6, align 4, !dbg !1830, !tbaa !996
  %35 = load i32, ptr %6, align 4, !dbg !1831, !tbaa !996
  %36 = icmp ne i32 %35, 0, !dbg !1831
  br i1 %36, label %37, label %46, !dbg !1833

37:                                               ; preds = %29
  %38 = load ptr, ptr @stderr, align 8, !dbg !1834, !tbaa !943
  %39 = load ptr, ptr %5, align 8, !dbg !1836, !tbaa !943
  %40 = getelementptr inbounds %struct.pping_config, ptr %39, i32 0, i32 4, !dbg !1837
  %41 = load ptr, ptr %40, align 8, !dbg !1837, !tbaa !1051
  %42 = load i32, ptr %6, align 4, !dbg !1838, !tbaa !996
  %43 = call ptr @get_libbpf_strerror(i32 noundef %42), !dbg !1839
  %44 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %38, ptr noundef @.str.99, ptr noundef %41, ptr noundef %43), !dbg !1840
  %45 = load i32, ptr %6, align 4, !dbg !1841, !tbaa !996
  store i32 %45, ptr %3, align 4, !dbg !1842
  store i32 1, ptr %8, align 4
  br label %182, !dbg !1842

46:                                               ; preds = %29
  %47 = load ptr, ptr %4, align 8, !dbg !1843, !tbaa !943
  %48 = load ptr, ptr %47, align 8, !dbg !1844, !tbaa !943
  %49 = load ptr, ptr %5, align 8, !dbg !1845, !tbaa !943
  %50 = call i32 @set_programs_to_load(ptr noundef %48, ptr noundef %49), !dbg !1846
  %51 = load ptr, ptr %4, align 8, !dbg !1847, !tbaa !943
  %52 = load ptr, ptr %51, align 8, !dbg !1848, !tbaa !943
  %53 = call i32 @bpf_object__load(ptr noundef %52), !dbg !1849
  store i32 %53, ptr %6, align 4, !dbg !1850, !tbaa !996
  %54 = load i32, ptr %6, align 4, !dbg !1851, !tbaa !996
  %55 = icmp ne i32 %54, 0, !dbg !1851
  br i1 %55, label %56, label %65, !dbg !1853

56:                                               ; preds = %46
  %57 = load ptr, ptr @stderr, align 8, !dbg !1854, !tbaa !943
  %58 = load ptr, ptr %5, align 8, !dbg !1856, !tbaa !943
  %59 = getelementptr inbounds %struct.pping_config, ptr %58, i32 0, i32 4, !dbg !1857
  %60 = load ptr, ptr %59, align 8, !dbg !1857, !tbaa !1051
  %61 = load i32, ptr %6, align 4, !dbg !1858, !tbaa !996
  %62 = call ptr @get_libbpf_strerror(i32 noundef %61), !dbg !1859
  %63 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %57, ptr noundef @.str.100, ptr noundef %60, ptr noundef %62), !dbg !1860
  %64 = load i32, ptr %6, align 4, !dbg !1861, !tbaa !996
  store i32 %64, ptr %3, align 4, !dbg !1862
  store i32 1, ptr %8, align 4
  br label %182, !dbg !1862

65:                                               ; preds = %46
  %66 = load ptr, ptr %4, align 8, !dbg !1863, !tbaa !943
  %67 = load ptr, ptr %66, align 8, !dbg !1864, !tbaa !943
  %68 = load ptr, ptr %5, align 8, !dbg !1865, !tbaa !943
  %69 = getelementptr inbounds %struct.pping_config, ptr %68, i32 0, i32 11, !dbg !1866
  %70 = load i32, ptr %69, align 4, !dbg !1866, !tbaa !1058
  %71 = load ptr, ptr %5, align 8, !dbg !1867, !tbaa !943
  %72 = getelementptr inbounds %struct.pping_config, ptr %71, i32 0, i32 6, !dbg !1868
  %73 = load ptr, ptr %72, align 8, !dbg !1868, !tbaa !1053
  %74 = load ptr, ptr %5, align 8, !dbg !1869, !tbaa !943
  %75 = getelementptr inbounds %struct.pping_config, ptr %74, i32 0, i32 2, !dbg !1870
  %76 = load ptr, ptr %5, align 8, !dbg !1871, !tbaa !943
  %77 = getelementptr inbounds %struct.pping_config, ptr %76, i32 0, i32 17, !dbg !1872
  %78 = call i32 @tc_attach(ptr noundef %67, i32 noundef %70, i32 noundef 2, ptr noundef %73, ptr noundef %75, ptr noundef %77), !dbg !1873
  %79 = load ptr, ptr %5, align 8, !dbg !1874, !tbaa !943
  %80 = getelementptr inbounds %struct.pping_config, ptr %79, i32 0, i32 13, !dbg !1875
  store i32 %78, ptr %80, align 4, !dbg !1876, !tbaa !1060
  %81 = load ptr, ptr %5, align 8, !dbg !1877, !tbaa !943
  %82 = getelementptr inbounds %struct.pping_config, ptr %81, i32 0, i32 13, !dbg !1879
  %83 = load i32, ptr %82, align 4, !dbg !1879, !tbaa !1060
  %84 = icmp slt i32 %83, 0, !dbg !1880
  br i1 %84, label %85, label %98, !dbg !1881

85:                                               ; preds = %65
  %86 = load ptr, ptr @stderr, align 8, !dbg !1882, !tbaa !943
  %87 = load ptr, ptr %5, align 8, !dbg !1884, !tbaa !943
  %88 = getelementptr inbounds %struct.pping_config, ptr %87, i32 0, i32 14, !dbg !1885
  %89 = getelementptr inbounds [16 x i8], ptr %88, i64 0, i64 0, !dbg !1884
  %90 = load ptr, ptr %5, align 8, !dbg !1886, !tbaa !943
  %91 = getelementptr inbounds %struct.pping_config, ptr %90, i32 0, i32 13, !dbg !1887
  %92 = load i32, ptr %91, align 4, !dbg !1887, !tbaa !1060
  %93 = call ptr @get_libbpf_strerror(i32 noundef %92), !dbg !1888
  %94 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %86, ptr noundef @.str.101, ptr noundef %89, ptr noundef %93), !dbg !1889
  %95 = load ptr, ptr %5, align 8, !dbg !1890, !tbaa !943
  %96 = getelementptr inbounds %struct.pping_config, ptr %95, i32 0, i32 13, !dbg !1891
  %97 = load i32, ptr %96, align 4, !dbg !1891, !tbaa !1060
  store i32 %97, ptr %3, align 4, !dbg !1892
  store i32 1, ptr %8, align 4
  br label %182, !dbg !1892

98:                                               ; preds = %65
  %99 = load ptr, ptr %5, align 8, !dbg !1893, !tbaa !943
  %100 = getelementptr inbounds %struct.pping_config, ptr %99, i32 0, i32 5, !dbg !1895
  %101 = load ptr, ptr %100, align 8, !dbg !1895, !tbaa !1052
  %102 = call i32 @strcmp(ptr noundef %101, ptr noundef @.str.8) #15, !dbg !1896
  %103 = icmp eq i32 %102, 0, !dbg !1897
  br i1 %103, label %104, label %119, !dbg !1898

104:                                              ; preds = %98
  %105 = load ptr, ptr %4, align 8, !dbg !1899, !tbaa !943
  %106 = load ptr, ptr %105, align 8, !dbg !1900, !tbaa !943
  %107 = load ptr, ptr %5, align 8, !dbg !1901, !tbaa !943
  %108 = getelementptr inbounds %struct.pping_config, ptr %107, i32 0, i32 5, !dbg !1902
  %109 = load ptr, ptr %108, align 8, !dbg !1902, !tbaa !1052
  %110 = load ptr, ptr %5, align 8, !dbg !1903, !tbaa !943
  %111 = getelementptr inbounds %struct.pping_config, ptr %110, i32 0, i32 11, !dbg !1904
  %112 = load i32, ptr %111, align 4, !dbg !1904, !tbaa !1058
  %113 = load ptr, ptr %5, align 8, !dbg !1905, !tbaa !943
  %114 = getelementptr inbounds %struct.pping_config, ptr %113, i32 0, i32 10, !dbg !1906
  %115 = load i32, ptr %114, align 8, !dbg !1906, !tbaa !1057
  %116 = call i32 @xdp_attach(ptr noundef %106, ptr noundef %109, i32 noundef %112, i32 noundef %115), !dbg !1907
  %117 = load ptr, ptr %5, align 8, !dbg !1908, !tbaa !943
  %118 = getelementptr inbounds %struct.pping_config, ptr %117, i32 0, i32 12, !dbg !1909
  store i32 %116, ptr %118, align 8, !dbg !1910, !tbaa !1059
  br label %133, !dbg !1908

119:                                              ; preds = %98
  %120 = load ptr, ptr %4, align 8, !dbg !1911, !tbaa !943
  %121 = load ptr, ptr %120, align 8, !dbg !1912, !tbaa !943
  %122 = load ptr, ptr %5, align 8, !dbg !1913, !tbaa !943
  %123 = getelementptr inbounds %struct.pping_config, ptr %122, i32 0, i32 11, !dbg !1914
  %124 = load i32, ptr %123, align 4, !dbg !1914, !tbaa !1058
  %125 = load ptr, ptr %5, align 8, !dbg !1915, !tbaa !943
  %126 = getelementptr inbounds %struct.pping_config, ptr %125, i32 0, i32 5, !dbg !1916
  %127 = load ptr, ptr %126, align 8, !dbg !1916, !tbaa !1052
  %128 = load ptr, ptr %5, align 8, !dbg !1917, !tbaa !943
  %129 = getelementptr inbounds %struct.pping_config, ptr %128, i32 0, i32 1, !dbg !1918
  %130 = call i32 @tc_attach(ptr noundef %121, i32 noundef %124, i32 noundef 1, ptr noundef %127, ptr noundef %129, ptr noundef null), !dbg !1919
  %131 = load ptr, ptr %5, align 8, !dbg !1920, !tbaa !943
  %132 = getelementptr inbounds %struct.pping_config, ptr %131, i32 0, i32 12, !dbg !1921
  store i32 %130, ptr %132, align 8, !dbg !1922, !tbaa !1059
  br label %133

133:                                              ; preds = %119, %104
  %134 = load ptr, ptr %5, align 8, !dbg !1923, !tbaa !943
  %135 = getelementptr inbounds %struct.pping_config, ptr %134, i32 0, i32 12, !dbg !1925
  %136 = load i32, ptr %135, align 8, !dbg !1925, !tbaa !1059
  %137 = icmp slt i32 %136, 0, !dbg !1926
  br i1 %137, label %138, label %158, !dbg !1927

138:                                              ; preds = %133
  %139 = load ptr, ptr @stderr, align 8, !dbg !1928, !tbaa !943
  %140 = load ptr, ptr %5, align 8, !dbg !1930, !tbaa !943
  %141 = getelementptr inbounds %struct.pping_config, ptr %140, i32 0, i32 14, !dbg !1931
  %142 = getelementptr inbounds [16 x i8], ptr %141, i64 0, i64 0, !dbg !1930
  %143 = load i32, ptr %6, align 4, !dbg !1932, !tbaa !996
  %144 = call ptr @get_libbpf_strerror(i32 noundef %143), !dbg !1933
  %145 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %139, ptr noundef @.str.102, ptr noundef %142, ptr noundef %144), !dbg !1934
  %146 = load ptr, ptr %5, align 8, !dbg !1935, !tbaa !943
  %147 = getelementptr inbounds %struct.pping_config, ptr %146, i32 0, i32 12, !dbg !1936
  %148 = load i32, ptr %147, align 8, !dbg !1936, !tbaa !1059
  store i32 %148, ptr %6, align 4, !dbg !1937, !tbaa !996
  %149 = load ptr, ptr %5, align 8, !dbg !1938, !tbaa !943
  %150 = getelementptr inbounds %struct.pping_config, ptr %149, i32 0, i32 5, !dbg !1940
  %151 = load ptr, ptr %150, align 8, !dbg !1940, !tbaa !1052
  %152 = call i32 @strcmp(ptr noundef %151, ptr noundef @.str.8) #15, !dbg !1941
  %153 = icmp eq i32 %152, 0, !dbg !1942
  br i1 %153, label %154, label %157, !dbg !1943

154:                                              ; preds = %138
  %155 = load ptr, ptr @stderr, align 8, !dbg !1944, !tbaa !943
  %156 = load i32, ptr %6, align 4, !dbg !1945, !tbaa !996
  call void @print_xdp_error_hints(ptr noundef %155, i32 noundef %156), !dbg !1946
  br label %157, !dbg !1946

157:                                              ; preds = %154, %138
  br label %159, !dbg !1947

158:                                              ; preds = %133
  store i32 0, ptr %3, align 4, !dbg !1948
  store i32 1, ptr %8, align 4
  br label %182, !dbg !1948

159:                                              ; preds = %157
  call void @llvm.dbg.label(metadata !1798), !dbg !1949
  %160 = load ptr, ptr %5, align 8, !dbg !1950, !tbaa !943
  %161 = getelementptr inbounds %struct.pping_config, ptr %160, i32 0, i32 11, !dbg !1951
  %162 = load i32, ptr %161, align 4, !dbg !1951, !tbaa !1058
  %163 = load ptr, ptr %5, align 8, !dbg !1952, !tbaa !943
  %164 = getelementptr inbounds %struct.pping_config, ptr %163, i32 0, i32 2, !dbg !1953
  %165 = load ptr, ptr %5, align 8, !dbg !1954, !tbaa !943
  %166 = getelementptr inbounds %struct.pping_config, ptr %165, i32 0, i32 17, !dbg !1955
  %167 = load i8, ptr %166, align 1, !dbg !1955, !tbaa !1063, !range !961, !noundef !962
  %168 = trunc i8 %167 to i1, !dbg !1955
  %169 = call i32 @tc_detach(i32 noundef %162, i32 noundef 2, ptr noundef %164, i1 noundef zeroext %168), !dbg !1956
  store i32 %169, ptr %7, align 4, !dbg !1957, !tbaa !996
  %170 = load i32, ptr %7, align 4, !dbg !1958, !tbaa !996
  %171 = icmp ne i32 %170, 0, !dbg !1958
  br i1 %171, label %172, label %180, !dbg !1960

172:                                              ; preds = %159
  %173 = load ptr, ptr @stderr, align 8, !dbg !1961, !tbaa !943
  %174 = load ptr, ptr %5, align 8, !dbg !1962, !tbaa !943
  %175 = getelementptr inbounds %struct.pping_config, ptr %174, i32 0, i32 14, !dbg !1963
  %176 = getelementptr inbounds [16 x i8], ptr %175, i64 0, i64 0, !dbg !1962
  %177 = load i32, ptr %7, align 4, !dbg !1964, !tbaa !996
  %178 = call ptr @get_libbpf_strerror(i32 noundef %177), !dbg !1965
  %179 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %173, ptr noundef @.str.103, ptr noundef %176, ptr noundef %178), !dbg !1966
  br label %180, !dbg !1966

180:                                              ; preds = %172, %159
  %181 = load i32, ptr %6, align 4, !dbg !1967, !tbaa !996
  store i32 %181, ptr %3, align 4, !dbg !1968
  store i32 1, ptr %8, align 4
  br label %182, !dbg !1968

182:                                              ; preds = %180, %158, %85, %56, %37, %20
  call void @llvm.lifetime.end.p0(i64 4, ptr %7) #14, !dbg !1969
  call void @llvm.lifetime.end.p0(i64 4, ptr %6) #14, !dbg !1969
  %183 = load i32, ptr %3, align 4, !dbg !1969
  ret i32 %183, !dbg !1969
}

; Function Attrs: nounwind
define internal i32 @setup_periodical_map_cleaning(ptr noundef %0, ptr noundef %1) #0 !dbg !1970 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i64, align 8
  %7 = alloca %struct.map_cleanup_args, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %4, metadata !1974, metadata !DIExpression()), !dbg !1986
  store ptr %1, ptr %5, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %5, metadata !1975, metadata !DIExpression()), !dbg !1987
  call void @llvm.lifetime.start.p0(i64 8, ptr %6) #14, !dbg !1988
  call void @llvm.dbg.declare(metadata ptr %6, metadata !1976, metadata !DIExpression()), !dbg !1989
  call void @llvm.lifetime.start.p0(i64 16, ptr %7) #14, !dbg !1990
  call void @llvm.dbg.declare(metadata ptr %7, metadata !1979, metadata !DIExpression()), !dbg !1991
  %10 = getelementptr inbounds %struct.map_cleanup_args, ptr %7, i32 0, i32 0, !dbg !1992
  %11 = load ptr, ptr %5, align 8, !dbg !1993, !tbaa !943
  %12 = getelementptr inbounds %struct.pping_config, ptr %11, i32 0, i32 3, !dbg !1994
  %13 = load i64, ptr %12, align 8, !dbg !1994, !tbaa !1050
  store i64 %13, ptr %10, align 8, !dbg !1992, !tbaa !1995
  %14 = getelementptr inbounds %struct.map_cleanup_args, ptr %7, i32 0, i32 1, !dbg !1992
  store i32 0, ptr %14, align 8, !dbg !1992, !tbaa !1997
  %15 = getelementptr inbounds %struct.map_cleanup_args, ptr %7, i32 0, i32 2, !dbg !1992
  store i32 0, ptr %15, align 4, !dbg !1992, !tbaa !1998
  call void @llvm.lifetime.start.p0(i64 4, ptr %8) #14, !dbg !1999
  call void @llvm.dbg.declare(metadata ptr %8, metadata !1985, metadata !DIExpression()), !dbg !2000
  %16 = getelementptr inbounds %struct.map_cleanup_args, ptr %7, i32 0, i32 0, !dbg !2001
  %17 = load i64, ptr %16, align 8, !dbg !2001, !tbaa !1995
  %18 = icmp ne i64 %17, 0, !dbg !2003
  br i1 %18, label %22, label %19, !dbg !2004

19:                                               ; preds = %2
  %20 = load ptr, ptr @stderr, align 8, !dbg !2005, !tbaa !943
  %21 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %20, ptr noundef @.str.107), !dbg !2007
  store i32 0, ptr %3, align 4, !dbg !2008
  store i32 1, ptr %9, align 4
  br label %75, !dbg !2008

22:                                               ; preds = %2
  %23 = load ptr, ptr %4, align 8, !dbg !2009, !tbaa !943
  %24 = load ptr, ptr %5, align 8, !dbg !2010, !tbaa !943
  %25 = getelementptr inbounds %struct.pping_config, ptr %24, i32 0, i32 7, !dbg !2011
  %26 = load ptr, ptr %25, align 8, !dbg !2011, !tbaa !1054
  %27 = call i32 @bpf_object__find_map_fd_by_name(ptr noundef %23, ptr noundef %26), !dbg !2012
  %28 = getelementptr inbounds %struct.map_cleanup_args, ptr %7, i32 0, i32 1, !dbg !2013
  store i32 %27, ptr %28, align 8, !dbg !2014, !tbaa !1997
  %29 = getelementptr inbounds %struct.map_cleanup_args, ptr %7, i32 0, i32 1, !dbg !2015
  %30 = load i32, ptr %29, align 8, !dbg !2015, !tbaa !1997
  %31 = icmp slt i32 %30, 0, !dbg !2017
  br i1 %31, label %32, label %43, !dbg !2018

32:                                               ; preds = %22
  %33 = load ptr, ptr @stderr, align 8, !dbg !2019, !tbaa !943
  %34 = load ptr, ptr %5, align 8, !dbg !2021, !tbaa !943
  %35 = getelementptr inbounds %struct.pping_config, ptr %34, i32 0, i32 7, !dbg !2022
  %36 = load ptr, ptr %35, align 8, !dbg !2022, !tbaa !1054
  %37 = getelementptr inbounds %struct.map_cleanup_args, ptr %7, i32 0, i32 1, !dbg !2023
  %38 = load i32, ptr %37, align 8, !dbg !2023, !tbaa !1997
  %39 = call ptr @get_libbpf_strerror(i32 noundef %38), !dbg !2024
  %40 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %33, ptr noundef @.str.108, ptr noundef %36, ptr noundef %39), !dbg !2025
  %41 = getelementptr inbounds %struct.map_cleanup_args, ptr %7, i32 0, i32 1, !dbg !2026
  %42 = load i32, ptr %41, align 8, !dbg !2026, !tbaa !1997
  store i32 %42, ptr %3, align 4, !dbg !2027
  store i32 1, ptr %9, align 4
  br label %75, !dbg !2027

43:                                               ; preds = %22
  %44 = load ptr, ptr %4, align 8, !dbg !2028, !tbaa !943
  %45 = load ptr, ptr %5, align 8, !dbg !2029, !tbaa !943
  %46 = getelementptr inbounds %struct.pping_config, ptr %45, i32 0, i32 8, !dbg !2030
  %47 = load ptr, ptr %46, align 8, !dbg !2030, !tbaa !1055
  %48 = call i32 @bpf_object__find_map_fd_by_name(ptr noundef %44, ptr noundef %47), !dbg !2031
  %49 = getelementptr inbounds %struct.map_cleanup_args, ptr %7, i32 0, i32 2, !dbg !2032
  store i32 %48, ptr %49, align 4, !dbg !2033, !tbaa !1998
  %50 = getelementptr inbounds %struct.map_cleanup_args, ptr %7, i32 0, i32 2, !dbg !2034
  %51 = load i32, ptr %50, align 4, !dbg !2034, !tbaa !1998
  %52 = icmp slt i32 %51, 0, !dbg !2036
  br i1 %52, label %53, label %64, !dbg !2037

53:                                               ; preds = %43
  %54 = load ptr, ptr @stderr, align 8, !dbg !2038, !tbaa !943
  %55 = load ptr, ptr %5, align 8, !dbg !2040, !tbaa !943
  %56 = getelementptr inbounds %struct.pping_config, ptr %55, i32 0, i32 8, !dbg !2041
  %57 = load ptr, ptr %56, align 8, !dbg !2041, !tbaa !1055
  %58 = getelementptr inbounds %struct.map_cleanup_args, ptr %7, i32 0, i32 2, !dbg !2042
  %59 = load i32, ptr %58, align 4, !dbg !2042, !tbaa !1998
  %60 = call ptr @get_libbpf_strerror(i32 noundef %59), !dbg !2043
  %61 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %54, ptr noundef @.str.108, ptr noundef %57, ptr noundef %60), !dbg !2044
  %62 = getelementptr inbounds %struct.map_cleanup_args, ptr %7, i32 0, i32 2, !dbg !2045
  %63 = load i32, ptr %62, align 4, !dbg !2045, !tbaa !1998
  store i32 %63, ptr %3, align 4, !dbg !2046
  store i32 1, ptr %9, align 4
  br label %75, !dbg !2046

64:                                               ; preds = %43
  %65 = call i32 @pthread_create(ptr noundef %6, ptr noundef null, ptr noundef @periodic_map_cleanup, ptr noundef %7) #14, !dbg !2047
  store i32 %65, ptr %8, align 4, !dbg !2048, !tbaa !996
  %66 = load i32, ptr %8, align 4, !dbg !2049, !tbaa !996
  %67 = icmp ne i32 %66, 0, !dbg !2049
  br i1 %67, label %68, label %74, !dbg !2051

68:                                               ; preds = %64
  %69 = load ptr, ptr @stderr, align 8, !dbg !2052, !tbaa !943
  %70 = load i32, ptr %8, align 4, !dbg !2054, !tbaa !996
  %71 = call ptr @get_libbpf_strerror(i32 noundef %70), !dbg !2055
  %72 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %69, ptr noundef @.str.109, ptr noundef %71), !dbg !2056
  %73 = load i32, ptr %8, align 4, !dbg !2057, !tbaa !996
  store i32 %73, ptr %3, align 4, !dbg !2058
  store i32 1, ptr %9, align 4
  br label %75, !dbg !2058

74:                                               ; preds = %64
  store i32 0, ptr %3, align 4, !dbg !2059
  store i32 1, ptr %9, align 4
  br label %75, !dbg !2059

75:                                               ; preds = %74, %68, %53, %32, %19
  call void @llvm.lifetime.end.p0(i64 4, ptr %8) #14, !dbg !2060
  call void @llvm.lifetime.end.p0(i64 16, ptr %7) #14, !dbg !2060
  call void @llvm.lifetime.end.p0(i64 8, ptr %6) #14, !dbg !2060
  %76 = load i32, ptr %3, align 4, !dbg !2060
  ret i32 %76, !dbg !2060
}

declare !dbg !2061 dso_local i32 @bpf_object__find_map_fd_by_name(ptr noundef, ptr noundef) #5

; Function Attrs: nounwind
define internal void @handle_event(ptr noundef %0, i32 noundef %1, ptr noundef %2, i32 noundef %3) #0 !dbg !2069 {
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2073, metadata !DIExpression()), !dbg !2078
  store i32 %1, ptr %6, align 4, !tbaa !996
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2074, metadata !DIExpression()), !dbg !2079
  store ptr %2, ptr %7, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2075, metadata !DIExpression()), !dbg !2080
  store i32 %3, ptr %8, align 4, !tbaa !996
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2076, metadata !DIExpression()), !dbg !2081
  call void @llvm.lifetime.start.p0(i64 8, ptr %9) #14, !dbg !2082
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2077, metadata !DIExpression()), !dbg !2083
  %11 = load ptr, ptr %7, align 8, !dbg !2084, !tbaa !943
  store ptr %11, ptr %9, align 8, !dbg !2083, !tbaa !943
  %12 = load i32, ptr %8, align 4, !dbg !2085, !tbaa !996
  %13 = zext i32 %12 to i64, !dbg !2085
  %14 = icmp ult i64 %13, 8, !dbg !2087
  br i1 %14, label %15, label %16, !dbg !2088

15:                                               ; preds = %4
  store i32 1, ptr %10, align 4
  br label %30, !dbg !2089

16:                                               ; preds = %4
  %17 = load ptr, ptr %9, align 8, !dbg !2090, !tbaa !943
  %18 = load i64, ptr %17, align 8, !dbg !2091, !tbaa !981
  switch i64 %18, label %24 [
    i64 3, label %19
    i64 2, label %21
    i64 1, label %21
  ], !dbg !2092

19:                                               ; preds = %16
  %20 = load ptr, ptr %9, align 8, !dbg !2093, !tbaa !943
  call void @warn_map_full(ptr noundef %20), !dbg !2095
  br label %29, !dbg !2096

21:                                               ; preds = %16, %16
  %22 = load ptr, ptr @print_event_func, align 8, !dbg !2097, !tbaa !943
  %23 = load ptr, ptr %9, align 8, !dbg !2098, !tbaa !943
  call void %22(ptr noundef %23), !dbg !2097
  br label %29, !dbg !2099

24:                                               ; preds = %16
  %25 = load ptr, ptr @stderr, align 8, !dbg !2100, !tbaa !943
  %26 = load ptr, ptr %9, align 8, !dbg !2101, !tbaa !943
  %27 = load i64, ptr %26, align 8, !dbg !2102, !tbaa !981
  %28 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %25, ptr noundef @.str.111, i64 noundef %27), !dbg !2103
  br label %29, !dbg !2104

29:                                               ; preds = %24, %21, %19
  store i32 0, ptr %10, align 4, !dbg !2105
  br label %30, !dbg !2105

30:                                               ; preds = %29, %15
  call void @llvm.lifetime.end.p0(i64 8, ptr %9) #14, !dbg !2105
  %31 = load i32, ptr %10, align 4
  switch i32 %31, label %33 [
    i32 0, label %32
    i32 1, label %32
  ]

32:                                               ; preds = %30, %30
  ret void, !dbg !2105

33:                                               ; preds = %30
  unreachable
}

; Function Attrs: nounwind
define internal void @handle_missed_events(ptr noundef %0, i32 noundef %1, i64 noundef %2) #0 !dbg !2106 {
  %4 = alloca ptr, align 8
  %5 = alloca i32, align 4
  %6 = alloca i64, align 8
  store ptr %0, ptr %4, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2110, metadata !DIExpression()), !dbg !2113
  store i32 %1, ptr %5, align 4, !tbaa !996
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2111, metadata !DIExpression()), !dbg !2114
  store i64 %2, ptr %6, align 8, !tbaa !1764
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2112, metadata !DIExpression()), !dbg !2115
  %7 = load ptr, ptr @stderr, align 8, !dbg !2116, !tbaa !943
  %8 = load i64, ptr %6, align 8, !dbg !2117, !tbaa !1764
  %9 = load i32, ptr %5, align 4, !dbg !2118, !tbaa !996
  %10 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %7, ptr noundef @.str.114, i64 noundef %8, i32 noundef %9), !dbg !2119
  ret void, !dbg !2120
}

declare !dbg !2121 dso_local ptr @perf_buffer__new(i32 noundef, i64 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #5

declare !dbg !2149 dso_local i64 @libbpf_get_error(ptr noundef) #5

; Function Attrs: nounwind
declare !dbg !2154 dso_local ptr @signal(i32 noundef, ptr noundef) #0

declare !dbg !2163 dso_local i32 @perf_buffer__poll(ptr noundef, i32 noundef) #5

declare !dbg !2169 dso_local void @jsonw_end_array(ptr noundef) #5

declare !dbg !2174 dso_local void @jsonw_destroy(ptr noundef) #5

declare !dbg !2180 dso_local void @perf_buffer__free(ptr noundef) #5

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.label(metadata) #1

; Function Attrs: nounwind willreturn memory(read)
declare !dbg !2185 dso_local i32 @strcmp(ptr noundef, ptr noundef) #6

; Function Attrs: nounwind
define internal i32 @xdp_detach(i32 noundef %0, i32 noundef %1, i32 noundef %2) #0 !dbg !2192 {
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store i32 %0, ptr %5, align 4, !tbaa !996
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2196, metadata !DIExpression()), !dbg !2201
  store i32 %1, ptr %6, align 4, !tbaa !996
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2197, metadata !DIExpression()), !dbg !2202
  store i32 %2, ptr %7, align 4, !tbaa !996
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2198, metadata !DIExpression()), !dbg !2203
  call void @llvm.lifetime.start.p0(i64 4, ptr %8) #14, !dbg !2204
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2199, metadata !DIExpression()), !dbg !2205
  call void @llvm.lifetime.start.p0(i64 4, ptr %9) #14, !dbg !2206
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2200, metadata !DIExpression()), !dbg !2207
  %11 = load i32, ptr %5, align 4, !dbg !2208, !tbaa !996
  %12 = load i32, ptr %6, align 4, !dbg !2209, !tbaa !996
  %13 = call i32 @bpf_get_link_xdp_id(i32 noundef %11, ptr noundef %8, i32 noundef %12), !dbg !2210
  store i32 %13, ptr %9, align 4, !dbg !2211, !tbaa !996
  %14 = load i32, ptr %9, align 4, !dbg !2212, !tbaa !996
  %15 = icmp ne i32 %14, 0, !dbg !2212
  br i1 %15, label %16, label %18, !dbg !2214

16:                                               ; preds = %3
  %17 = load i32, ptr %9, align 4, !dbg !2215, !tbaa !996
  store i32 %17, ptr %4, align 4, !dbg !2216
  store i32 1, ptr %10, align 4
  br label %34, !dbg !2216

18:                                               ; preds = %3
  %19 = load i32, ptr %8, align 4, !dbg !2217, !tbaa !996
  %20 = icmp ne i32 %19, 0, !dbg !2217
  br i1 %20, label %22, label %21, !dbg !2219

21:                                               ; preds = %18
  store i32 0, ptr %4, align 4, !dbg !2220
  store i32 1, ptr %10, align 4
  br label %34, !dbg !2220

22:                                               ; preds = %18
  %23 = load i32, ptr %7, align 4, !dbg !2222, !tbaa !996
  %24 = icmp ne i32 %23, 0, !dbg !2222
  br i1 %24, label %25, label %30, !dbg !2224

25:                                               ; preds = %22
  %26 = load i32, ptr %8, align 4, !dbg !2225, !tbaa !996
  %27 = load i32, ptr %7, align 4, !dbg !2226, !tbaa !996
  %28 = icmp ne i32 %26, %27, !dbg !2227
  br i1 %28, label %29, label %30, !dbg !2228

29:                                               ; preds = %25
  store i32 -2, ptr %4, align 4, !dbg !2229
  store i32 1, ptr %10, align 4
  br label %34, !dbg !2229

30:                                               ; preds = %25, %22
  %31 = load i32, ptr %5, align 4, !dbg !2230, !tbaa !996
  %32 = load i32, ptr %6, align 4, !dbg !2231, !tbaa !996
  %33 = call i32 @bpf_set_link_xdp_fd(i32 noundef %31, i32 noundef -1, i32 noundef %32), !dbg !2232
  store i32 %33, ptr %4, align 4, !dbg !2233
  store i32 1, ptr %10, align 4
  br label %34, !dbg !2233

34:                                               ; preds = %30, %29, %21, %16
  call void @llvm.lifetime.end.p0(i64 4, ptr %9) #14, !dbg !2234
  call void @llvm.lifetime.end.p0(i64 4, ptr %8) #14, !dbg !2234
  %35 = load i32, ptr %4, align 4, !dbg !2234
  ret i32 %35, !dbg !2234
}

; Function Attrs: nounwind
define internal i32 @tc_detach(i32 noundef %0, i32 noundef %1, ptr noundef %2, i1 noundef zeroext %3) #0 !dbg !2235 {
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
  store i32 %0, ptr %6, align 4, !tbaa !996
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2241, metadata !DIExpression()), !dbg !2255
  store i32 %1, ptr %7, align 4, !tbaa !981
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2242, metadata !DIExpression()), !dbg !2256
  store ptr %2, ptr %8, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2243, metadata !DIExpression()), !dbg !2257
  %15 = zext i1 %3 to i8
  store i8 %15, ptr %9, align 1, !tbaa !963
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2244, metadata !DIExpression()), !dbg !2258
  call void @llvm.lifetime.start.p0(i64 4, ptr %10) #14, !dbg !2259
  call void @llvm.dbg.declare(metadata ptr %10, metadata !2245, metadata !DIExpression()), !dbg !2260
  call void @llvm.lifetime.start.p0(i64 4, ptr %11) #14, !dbg !2261
  call void @llvm.dbg.declare(metadata ptr %11, metadata !2246, metadata !DIExpression()), !dbg !2262
  store i32 0, ptr %11, align 4, !dbg !2262, !tbaa !996
  call void @llvm.lifetime.start.p0(i64 24, ptr %12) #14, !dbg !2263
  call void @llvm.dbg.declare(metadata ptr %12, metadata !2247, metadata !DIExpression()), !dbg !2263
  call void @llvm.memset.p0.i64(ptr align 8 %12, i8 0, i64 24, i1 false), !dbg !2264
  %16 = getelementptr inbounds %struct.bpf_tc_hook, ptr %12, i32 0, i32 0, !dbg !2264
  store i64 24, ptr %16, align 8, !dbg !2264, !tbaa !2266
  %17 = getelementptr inbounds %struct.bpf_tc_hook, ptr %12, i32 0, i32 1, !dbg !2264
  %18 = load i32, ptr %6, align 4, !dbg !2264, !tbaa !996
  store i32 %18, ptr %17, align 8, !dbg !2264, !tbaa !2268
  %19 = getelementptr inbounds %struct.bpf_tc_hook, ptr %12, i32 0, i32 2, !dbg !2264
  %20 = load i32, ptr %7, align 4, !dbg !2264, !tbaa !981
  store i32 %20, ptr %19, align 4, !dbg !2264, !tbaa !2269
  %21 = getelementptr inbounds %struct.bpf_tc_hook, ptr %12, i32 0, i32 3, !dbg !2264
  store i32 0, ptr %21, align 8, !dbg !2264, !tbaa !2270
  call void @llvm.lifetime.start.p0(i64 32, ptr %13) #14, !dbg !2271
  call void @llvm.dbg.declare(metadata ptr %13, metadata !2254, metadata !DIExpression()), !dbg !2271
  call void @llvm.memset.p0.i64(ptr align 8 %13, i8 0, i64 32, i1 false), !dbg !2272
  %22 = getelementptr inbounds %struct.bpf_tc_opts, ptr %13, i32 0, i32 0, !dbg !2272
  store i64 32, ptr %22, align 8, !dbg !2272, !tbaa !1031
  %23 = getelementptr inbounds %struct.bpf_tc_opts, ptr %13, i32 0, i32 1, !dbg !2272
  store i32 0, ptr %23, align 8, !dbg !2272, !tbaa !2274
  %24 = getelementptr inbounds %struct.bpf_tc_opts, ptr %13, i32 0, i32 2, !dbg !2272
  store i32 0, ptr %24, align 4, !dbg !2272, !tbaa !2275
  %25 = getelementptr inbounds %struct.bpf_tc_opts, ptr %13, i32 0, i32 3, !dbg !2272
  store i32 0, ptr %25, align 8, !dbg !2272, !tbaa !2276
  %26 = getelementptr inbounds %struct.bpf_tc_opts, ptr %13, i32 0, i32 4, !dbg !2272
  %27 = load ptr, ptr %8, align 8, !dbg !2272, !tbaa !943
  %28 = getelementptr inbounds %struct.bpf_tc_opts, ptr %27, i32 0, i32 4, !dbg !2272
  %29 = load i32, ptr %28, align 4, !dbg !2272, !tbaa !2277
  store i32 %29, ptr %26, align 4, !dbg !2272, !tbaa !2277
  %30 = getelementptr inbounds %struct.bpf_tc_opts, ptr %13, i32 0, i32 5, !dbg !2272
  %31 = load ptr, ptr %8, align 8, !dbg !2272, !tbaa !943
  %32 = getelementptr inbounds %struct.bpf_tc_opts, ptr %31, i32 0, i32 5, !dbg !2272
  %33 = load i32, ptr %32, align 8, !dbg !2272, !tbaa !2278
  store i32 %33, ptr %30, align 8, !dbg !2272, !tbaa !2278
  %34 = call i32 @bpf_tc_query(ptr noundef %12, ptr noundef %13), !dbg !2279
  store i32 %34, ptr %10, align 4, !dbg !2280, !tbaa !996
  %35 = load i32, ptr %10, align 4, !dbg !2281, !tbaa !996
  %36 = icmp ne i32 %35, 0, !dbg !2281
  br i1 %36, label %37, label %39, !dbg !2283

37:                                               ; preds = %4
  %38 = load i32, ptr %10, align 4, !dbg !2284, !tbaa !996
  store i32 %38, ptr %5, align 4, !dbg !2285
  store i32 1, ptr %14, align 4
  br label %67, !dbg !2285

39:                                               ; preds = %4
  %40 = load ptr, ptr %8, align 8, !dbg !2286, !tbaa !943
  %41 = getelementptr inbounds %struct.bpf_tc_opts, ptr %40, i32 0, i32 3, !dbg !2288
  %42 = load i32, ptr %41, align 8, !dbg !2288, !tbaa !2276
  %43 = getelementptr inbounds %struct.bpf_tc_opts, ptr %13, i32 0, i32 3, !dbg !2289
  %44 = load i32, ptr %43, align 8, !dbg !2289, !tbaa !2276
  %45 = icmp ne i32 %42, %44, !dbg !2290
  br i1 %45, label %46, label %47, !dbg !2291

46:                                               ; preds = %39
  store i32 -2, ptr %5, align 4, !dbg !2292
  store i32 1, ptr %14, align 4
  br label %67, !dbg !2292

47:                                               ; preds = %39
  %48 = getelementptr inbounds %struct.bpf_tc_opts, ptr %13, i32 0, i32 1, !dbg !2293
  store i32 0, ptr %48, align 8, !dbg !2294, !tbaa !2274
  %49 = getelementptr inbounds %struct.bpf_tc_opts, ptr %13, i32 0, i32 3, !dbg !2295
  store i32 0, ptr %49, align 8, !dbg !2296, !tbaa !2276
  %50 = getelementptr inbounds %struct.bpf_tc_opts, ptr %13, i32 0, i32 2, !dbg !2297
  store i32 0, ptr %50, align 4, !dbg !2298, !tbaa !2275
  %51 = call i32 @bpf_tc_detach(ptr noundef %12, ptr noundef %13), !dbg !2299
  store i32 %51, ptr %10, align 4, !dbg !2300, !tbaa !996
  %52 = load i8, ptr %9, align 1, !dbg !2301, !tbaa !963, !range !961, !noundef !962
  %53 = trunc i8 %52 to i1, !dbg !2301
  br i1 %53, label %54, label %57, !dbg !2303

54:                                               ; preds = %47
  %55 = getelementptr inbounds %struct.bpf_tc_hook, ptr %12, i32 0, i32 2, !dbg !2304
  store i32 3, ptr %55, align 4, !dbg !2306, !tbaa !2269
  %56 = call i32 @bpf_tc_hook_destroy(ptr noundef %12), !dbg !2307
  store i32 %56, ptr %11, align 4, !dbg !2308, !tbaa !996
  br label %57, !dbg !2309

57:                                               ; preds = %54, %47
  %58 = load i8, ptr %9, align 1, !dbg !2310, !tbaa !963, !range !961, !noundef !962
  %59 = trunc i8 %58 to i1, !dbg !2310
  br i1 %59, label %60, label %62, !dbg !2310

60:                                               ; preds = %57
  %61 = load i32, ptr %11, align 4, !dbg !2311, !tbaa !996
  br label %64, !dbg !2310

62:                                               ; preds = %57
  %63 = load i32, ptr %10, align 4, !dbg !2312, !tbaa !996
  br label %64, !dbg !2310

64:                                               ; preds = %62, %60
  %65 = phi i32 [ %61, %60 ], [ %63, %62 ], !dbg !2310
  store i32 %65, ptr %10, align 4, !dbg !2313, !tbaa !996
  %66 = load i32, ptr %10, align 4, !dbg !2314, !tbaa !996
  store i32 %66, ptr %5, align 4, !dbg !2315
  store i32 1, ptr %14, align 4
  br label %67, !dbg !2315

67:                                               ; preds = %64, %46, %37
  call void @llvm.lifetime.end.p0(i64 32, ptr %13) #14, !dbg !2316
  call void @llvm.lifetime.end.p0(i64 24, ptr %12) #14, !dbg !2316
  call void @llvm.lifetime.end.p0(i64 4, ptr %11) #14, !dbg !2316
  call void @llvm.lifetime.end.p0(i64 4, ptr %10) #14, !dbg !2316
  %68 = load i32, ptr %5, align 4, !dbg !2316
  ret i32 %68, !dbg !2316
}

declare !dbg !2317 dso_local i32 @bpf_tc_query(ptr noundef, ptr noundef) #5

declare !dbg !2326 dso_local i32 @bpf_tc_detach(ptr noundef, ptr noundef) #5

declare !dbg !2332 dso_local i32 @bpf_tc_hook_destroy(ptr noundef) #5

declare !dbg !2338 dso_local i32 @bpf_get_link_xdp_id(i32 noundef, ptr noundef, i32 noundef) #5

declare !dbg !2345 dso_local i32 @bpf_set_link_xdp_fd(i32 noundef, i32 noundef, i32 noundef) #5

; Function Attrs: nounwind
define internal void @warn_map_full(ptr noundef %0) #0 !dbg !2352 {
  %2 = alloca ptr, align 8
  store ptr %0, ptr %2, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %2, metadata !2358, metadata !DIExpression()), !dbg !2359
  %3 = load ptr, ptr @stderr, align 8, !dbg !2360, !tbaa !943
  %4 = load ptr, ptr %2, align 8, !dbg !2361, !tbaa !943
  %5 = getelementptr inbounds %struct.map_full_event, ptr %4, i32 0, i32 1, !dbg !2362
  %6 = load i64, ptr %5, align 8, !dbg !2362, !tbaa !2363
  call void @print_ns_datetime(ptr noundef %3, i64 noundef %6), !dbg !2365
  %7 = load ptr, ptr @stderr, align 8, !dbg !2366, !tbaa !943
  %8 = load ptr, ptr %2, align 8, !dbg !2367, !tbaa !943
  %9 = getelementptr inbounds %struct.map_full_event, ptr %8, i32 0, i32 3, !dbg !2368
  %10 = load i8, ptr %9, align 4, !dbg !2368, !tbaa !2369
  %11 = zext i8 %10 to i32, !dbg !2367
  %12 = icmp eq i32 %11, 0, !dbg !2370
  %13 = zext i1 %12 to i64, !dbg !2367
  %14 = select i1 %12, ptr @.str.113, ptr @.str.81, !dbg !2367
  %15 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %7, ptr noundef @.str.112, ptr noundef %14), !dbg !2371
  %16 = load ptr, ptr @stderr, align 8, !dbg !2372, !tbaa !943
  %17 = load ptr, ptr %2, align 8, !dbg !2373, !tbaa !943
  %18 = getelementptr inbounds %struct.map_full_event, ptr %17, i32 0, i32 2, !dbg !2374
  call void @print_flow_ppvizformat(ptr noundef %16, ptr noundef %18), !dbg !2375
  %19 = load ptr, ptr @stderr, align 8, !dbg !2376, !tbaa !943
  %20 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %19, ptr noundef @.str.53), !dbg !2377
  ret void, !dbg !2378
}

; Function Attrs: nounwind
define internal void @print_ns_datetime(ptr noundef %0, i64 noundef %1) #0 !dbg !2379 {
  %3 = alloca ptr, align 8
  %4 = alloca i64, align 8
  %5 = alloca [9 x i8], align 1
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store ptr %0, ptr %3, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2383, metadata !DIExpression()), !dbg !2391
  store i64 %1, ptr %4, align 8, !tbaa !1764
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2384, metadata !DIExpression()), !dbg !2392
  call void @llvm.lifetime.start.p0(i64 9, ptr %5) #14, !dbg !2393
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2385, metadata !DIExpression()), !dbg !2394
  call void @llvm.lifetime.start.p0(i64 8, ptr %6) #14, !dbg !2395
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2386, metadata !DIExpression()), !dbg !2396
  %8 = load i64, ptr %4, align 8, !dbg !2397, !tbaa !1764
  %9 = call i64 @convert_monotonic_to_realtime(i64 noundef %8), !dbg !2398
  store i64 %9, ptr %6, align 8, !dbg !2396, !tbaa !1764
  call void @llvm.lifetime.start.p0(i64 8, ptr %7) #14, !dbg !2399
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2387, metadata !DIExpression()), !dbg !2400
  %10 = load i64, ptr %6, align 8, !dbg !2401, !tbaa !1764
  %11 = udiv i64 %10, 1000000000, !dbg !2402
  store i64 %11, ptr %7, align 8, !dbg !2400, !tbaa !1048
  %12 = getelementptr inbounds [9 x i8], ptr %5, i64 0, i64 0, !dbg !2403
  %13 = call ptr @localtime(ptr noundef %7) #14, !dbg !2404
  %14 = call i64 @strftime(ptr noundef %12, i64 noundef 9, ptr noundef @.str.63, ptr noundef %13) #14, !dbg !2405
  %15 = load ptr, ptr %3, align 8, !dbg !2406, !tbaa !943
  %16 = getelementptr inbounds [9 x i8], ptr %5, i64 0, i64 0, !dbg !2407
  %17 = load i64, ptr %6, align 8, !dbg !2408, !tbaa !1764
  %18 = urem i64 %17, 1000000000, !dbg !2409
  %19 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %15, ptr noundef @.str.64, ptr noundef %16, i64 noundef %18), !dbg !2410
  call void @llvm.lifetime.end.p0(i64 8, ptr %7) #14, !dbg !2411
  call void @llvm.lifetime.end.p0(i64 8, ptr %6) #14, !dbg !2411
  call void @llvm.lifetime.end.p0(i64 9, ptr %5) #14, !dbg !2411
  ret void, !dbg !2411
}

; Function Attrs: nounwind
define internal void @print_flow_ppvizformat(ptr noundef %0, ptr noundef %1) #0 !dbg !2412 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca [46 x i8], align 1
  %6 = alloca [46 x i8], align 1
  store ptr %0, ptr %3, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2418, metadata !DIExpression()), !dbg !2422
  store ptr %1, ptr %4, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2419, metadata !DIExpression()), !dbg !2423
  call void @llvm.lifetime.start.p0(i64 46, ptr %5) #14, !dbg !2424
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2420, metadata !DIExpression()), !dbg !2425
  call void @llvm.lifetime.start.p0(i64 46, ptr %6) #14, !dbg !2426
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2421, metadata !DIExpression()), !dbg !2427
  %7 = getelementptr inbounds [46 x i8], ptr %5, i64 0, i64 0, !dbg !2428
  %8 = load ptr, ptr %4, align 8, !dbg !2429, !tbaa !943
  %9 = getelementptr inbounds %struct.network_tuple, ptr %8, i32 0, i32 3, !dbg !2430
  %10 = load i8, ptr %9, align 2, !dbg !2430, !tbaa !2431
  %11 = zext i8 %10 to i32, !dbg !2429
  %12 = load ptr, ptr %4, align 8, !dbg !2432, !tbaa !943
  %13 = getelementptr inbounds %struct.network_tuple, ptr %12, i32 0, i32 0, !dbg !2433
  %14 = getelementptr inbounds %struct.flow_address, ptr %13, i32 0, i32 0, !dbg !2434
  %15 = call i32 @format_ip_address(ptr noundef %7, i64 noundef 46, i32 noundef %11, ptr noundef %14), !dbg !2435
  %16 = getelementptr inbounds [46 x i8], ptr %6, i64 0, i64 0, !dbg !2436
  %17 = load ptr, ptr %4, align 8, !dbg !2437, !tbaa !943
  %18 = getelementptr inbounds %struct.network_tuple, ptr %17, i32 0, i32 3, !dbg !2438
  %19 = load i8, ptr %18, align 2, !dbg !2438, !tbaa !2431
  %20 = zext i8 %19 to i32, !dbg !2437
  %21 = load ptr, ptr %4, align 8, !dbg !2439, !tbaa !943
  %22 = getelementptr inbounds %struct.network_tuple, ptr %21, i32 0, i32 1, !dbg !2440
  %23 = getelementptr inbounds %struct.flow_address, ptr %22, i32 0, i32 0, !dbg !2441
  %24 = call i32 @format_ip_address(ptr noundef %16, i64 noundef 46, i32 noundef %20, ptr noundef %23), !dbg !2442
  %25 = load ptr, ptr %3, align 8, !dbg !2443, !tbaa !943
  %26 = getelementptr inbounds [46 x i8], ptr %5, i64 0, i64 0, !dbg !2444
  %27 = load ptr, ptr %4, align 8, !dbg !2445, !tbaa !943
  %28 = getelementptr inbounds %struct.network_tuple, ptr %27, i32 0, i32 0, !dbg !2445
  %29 = getelementptr inbounds %struct.flow_address, ptr %28, i32 0, i32 1, !dbg !2445
  %30 = load i16, ptr %29, align 4, !dbg !2445, !tbaa !2446
  %31 = call i16 @__bswap_16(i16 noundef zeroext %30), !dbg !2445
  %32 = zext i16 %31 to i32, !dbg !2445
  %33 = getelementptr inbounds [46 x i8], ptr %6, i64 0, i64 0, !dbg !2447
  %34 = load ptr, ptr %4, align 8, !dbg !2448, !tbaa !943
  %35 = getelementptr inbounds %struct.network_tuple, ptr %34, i32 0, i32 1, !dbg !2448
  %36 = getelementptr inbounds %struct.flow_address, ptr %35, i32 0, i32 1, !dbg !2448
  %37 = load i16, ptr %36, align 4, !dbg !2448, !tbaa !2449
  %38 = call i16 @__bswap_16(i16 noundef zeroext %37), !dbg !2448
  %39 = zext i16 %38 to i32, !dbg !2448
  %40 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %25, ptr noundef @.str.67, ptr noundef %26, i32 noundef %32, ptr noundef %33, i32 noundef %39), !dbg !2450
  call void @llvm.lifetime.end.p0(i64 46, ptr %6) #14, !dbg !2451
  call void @llvm.lifetime.end.p0(i64 46, ptr %5) #14, !dbg !2451
  ret void, !dbg !2451
}

; Function Attrs: nounwind
define internal i32 @format_ip_address(ptr noundef %0, i64 noundef %1, i32 noundef %2, ptr noundef %3) #0 !dbg !2452 {
  %5 = alloca i32, align 4
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  store ptr %0, ptr %6, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2458, metadata !DIExpression()), !dbg !2462
  store i64 %1, ptr %7, align 8, !tbaa !1048
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2459, metadata !DIExpression()), !dbg !2463
  store i32 %2, ptr %8, align 4, !tbaa !996
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2460, metadata !DIExpression()), !dbg !2464
  store ptr %3, ptr %9, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2461, metadata !DIExpression()), !dbg !2465
  %10 = load i32, ptr %8, align 4, !dbg !2466, !tbaa !996
  %11 = icmp eq i32 %10, 2, !dbg !2468
  br i1 %11, label %12, label %29, !dbg !2469

12:                                               ; preds = %4
  %13 = load i32, ptr %8, align 4, !dbg !2470, !tbaa !996
  %14 = load ptr, ptr %9, align 8, !dbg !2471, !tbaa !943
  %15 = getelementptr inbounds %struct.in6_addr, ptr %14, i32 0, i32 0, !dbg !2472
  %16 = getelementptr inbounds [16 x i8], ptr %15, i64 0, i64 12, !dbg !2471
  %17 = load ptr, ptr %6, align 8, !dbg !2473, !tbaa !943
  %18 = load i64, ptr %7, align 8, !dbg !2474, !tbaa !1048
  %19 = trunc i64 %18 to i32, !dbg !2474
  %20 = call ptr @inet_ntop(i32 noundef %13, ptr noundef %16, ptr noundef %17, i32 noundef %19) #14, !dbg !2475
  %21 = icmp ne ptr %20, null, !dbg !2475
  br i1 %21, label %22, label %26, !dbg !2475

22:                                               ; preds = %12
  %23 = call ptr @__errno_location() #16, !dbg !2476
  %24 = load i32, ptr %23, align 4, !dbg !2476, !tbaa !996
  %25 = sub nsw i32 0, %24, !dbg !2477
  br label %27, !dbg !2475

26:                                               ; preds = %12
  br label %27, !dbg !2475

27:                                               ; preds = %26, %22
  %28 = phi i32 [ %25, %22 ], [ 0, %26 ], !dbg !2475
  store i32 %28, ptr %5, align 4, !dbg !2478
  br label %49, !dbg !2478

29:                                               ; preds = %4
  %30 = load i32, ptr %8, align 4, !dbg !2479, !tbaa !996
  %31 = icmp eq i32 %30, 10, !dbg !2481
  br i1 %31, label %32, label %47, !dbg !2482

32:                                               ; preds = %29
  %33 = load i32, ptr %8, align 4, !dbg !2483, !tbaa !996
  %34 = load ptr, ptr %9, align 8, !dbg !2484, !tbaa !943
  %35 = load ptr, ptr %6, align 8, !dbg !2485, !tbaa !943
  %36 = load i64, ptr %7, align 8, !dbg !2486, !tbaa !1048
  %37 = trunc i64 %36 to i32, !dbg !2486
  %38 = call ptr @inet_ntop(i32 noundef %33, ptr noundef %34, ptr noundef %35, i32 noundef %37) #14, !dbg !2487
  %39 = icmp ne ptr %38, null, !dbg !2487
  br i1 %39, label %40, label %44, !dbg !2487

40:                                               ; preds = %32
  %41 = call ptr @__errno_location() #16, !dbg !2488
  %42 = load i32, ptr %41, align 4, !dbg !2488, !tbaa !996
  %43 = sub nsw i32 0, %42, !dbg !2489
  br label %45, !dbg !2487

44:                                               ; preds = %32
  br label %45, !dbg !2487

45:                                               ; preds = %44, %40
  %46 = phi i32 [ %43, %40 ], [ 0, %44 ], !dbg !2487
  store i32 %46, ptr %5, align 4, !dbg !2490
  br label %49, !dbg !2490

47:                                               ; preds = %29
  br label %48

48:                                               ; preds = %47
  store i32 -22, ptr %5, align 4, !dbg !2491
  br label %49, !dbg !2491

49:                                               ; preds = %48, %45, %27
  %50 = load i32, ptr %5, align 4, !dbg !2492
  ret i32 %50, !dbg !2492
}

; Function Attrs: inlinehint nounwind
define internal i16 @__bswap_16(i16 noundef zeroext %0) #7 !dbg !2493 {
  %2 = alloca i16, align 2
  store i16 %0, ptr %2, align 2, !tbaa !2499
  call void @llvm.dbg.declare(metadata ptr %2, metadata !2498, metadata !DIExpression()), !dbg !2500
  %3 = load i16, ptr %2, align 2, !dbg !2501, !tbaa !2499
  %4 = zext i16 %3 to i32, !dbg !2501
  %5 = ashr i32 %4, 8, !dbg !2501
  %6 = and i32 %5, 255, !dbg !2501
  %7 = load i16, ptr %2, align 2, !dbg !2501, !tbaa !2499
  %8 = zext i16 %7 to i32, !dbg !2501
  %9 = and i32 %8, 255, !dbg !2501
  %10 = shl i32 %9, 8, !dbg !2501
  %11 = or i32 %6, %10, !dbg !2501
  %12 = trunc i32 %11 to i16, !dbg !2501
  ret i16 %12, !dbg !2502
}

; Function Attrs: nounwind
declare !dbg !2503 dso_local ptr @inet_ntop(i32 noundef, ptr noundef, ptr noundef, i32 noundef) #0

; Function Attrs: nounwind willreturn memory(none)
declare !dbg !2517 dso_local ptr @__errno_location() #8

; Function Attrs: nounwind
define internal i64 @convert_monotonic_to_realtime(i64 noundef %0) #0 !dbg !521 {
  %2 = alloca i64, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i32, align 4
  store i64 %0, ptr %3, align 8, !tbaa !1764
  call void @llvm.dbg.declare(metadata ptr %3, metadata !525, metadata !DIExpression()), !dbg !2521
  call void @llvm.lifetime.start.p0(i64 8, ptr %4) #14, !dbg !2522
  call void @llvm.dbg.declare(metadata ptr %4, metadata !526, metadata !DIExpression()), !dbg !2523
  %7 = call i64 @get_time_ns(i32 noundef 1), !dbg !2524
  store i64 %7, ptr %4, align 8, !dbg !2523, !tbaa !1764
  call void @llvm.lifetime.start.p0(i64 8, ptr %5) #14, !dbg !2525
  call void @llvm.dbg.declare(metadata ptr %5, metadata !527, metadata !DIExpression()), !dbg !2526
  %8 = load i64, ptr @convert_monotonic_to_realtime.offset, align 8, !dbg !2527, !tbaa !1764
  %9 = icmp eq i64 %8, 0, !dbg !2529
  br i1 %9, label %19, label %10, !dbg !2530

10:                                               ; preds = %1
  %11 = load i64, ptr %4, align 8, !dbg !2531, !tbaa !1764
  %12 = load i64, ptr @convert_monotonic_to_realtime.offset_updated, align 8, !dbg !2532, !tbaa !1764
  %13 = icmp ugt i64 %11, %12, !dbg !2533
  br i1 %13, label %14, label %31, !dbg !2534

14:                                               ; preds = %10
  %15 = load i64, ptr %4, align 8, !dbg !2535, !tbaa !1764
  %16 = load i64, ptr @convert_monotonic_to_realtime.offset_updated, align 8, !dbg !2536, !tbaa !1764
  %17 = sub i64 %15, %16, !dbg !2537
  %18 = icmp ugt i64 %17, 1000000000, !dbg !2538
  br i1 %18, label %19, label %31, !dbg !2539

19:                                               ; preds = %14, %1
  %20 = call i64 @get_time_ns(i32 noundef 1), !dbg !2540
  store i64 %20, ptr %4, align 8, !dbg !2542, !tbaa !1764
  %21 = call i64 @get_time_ns(i32 noundef 0), !dbg !2543
  store i64 %21, ptr %5, align 8, !dbg !2544, !tbaa !1764
  %22 = load i64, ptr %5, align 8, !dbg !2545, !tbaa !1764
  %23 = load i64, ptr %4, align 8, !dbg !2547, !tbaa !1764
  %24 = icmp ult i64 %22, %23, !dbg !2548
  br i1 %24, label %25, label %26, !dbg !2549

25:                                               ; preds = %19
  store i64 0, ptr %2, align 8, !dbg !2550
  store i32 1, ptr %6, align 4
  br label %35, !dbg !2550

26:                                               ; preds = %19
  %27 = load i64, ptr %5, align 8, !dbg !2551, !tbaa !1764
  %28 = load i64, ptr %4, align 8, !dbg !2552, !tbaa !1764
  %29 = sub i64 %27, %28, !dbg !2553
  store i64 %29, ptr @convert_monotonic_to_realtime.offset, align 8, !dbg !2554, !tbaa !1764
  %30 = load i64, ptr %4, align 8, !dbg !2555, !tbaa !1764
  store i64 %30, ptr @convert_monotonic_to_realtime.offset_updated, align 8, !dbg !2556, !tbaa !1764
  br label %31, !dbg !2557

31:                                               ; preds = %26, %14, %10
  %32 = load i64, ptr %3, align 8, !dbg !2558, !tbaa !1764
  %33 = load i64, ptr @convert_monotonic_to_realtime.offset, align 8, !dbg !2559, !tbaa !1764
  %34 = add i64 %32, %33, !dbg !2560
  store i64 %34, ptr %2, align 8, !dbg !2561
  store i32 1, ptr %6, align 4
  br label %35, !dbg !2561

35:                                               ; preds = %31, %25
  call void @llvm.lifetime.end.p0(i64 8, ptr %5) #14, !dbg !2562
  call void @llvm.lifetime.end.p0(i64 8, ptr %4) #14, !dbg !2562
  %36 = load i64, ptr %2, align 8, !dbg !2562
  ret i64 %36, !dbg !2562
}

; Function Attrs: nounwind
declare !dbg !2563 dso_local ptr @localtime(ptr noundef) #0

; Function Attrs: nounwind
declare !dbg !2586 dso_local i64 @strftime(ptr noundef, i64 noundef, ptr noundef, ptr noundef) #0

; Function Attrs: nounwind
define internal i64 @get_time_ns(i32 noundef %0) #0 !dbg !2598 {
  %2 = alloca i64, align 8
  %3 = alloca i32, align 4
  %4 = alloca %struct.timespec, align 8
  %5 = alloca i32, align 4
  store i32 %0, ptr %3, align 4, !tbaa !996
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2605, metadata !DIExpression()), !dbg !2613
  call void @llvm.lifetime.start.p0(i64 16, ptr %4) #14, !dbg !2614
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2606, metadata !DIExpression()), !dbg !2615
  %6 = load i32, ptr %3, align 4, !dbg !2616, !tbaa !996
  %7 = call i32 @clock_gettime(i32 noundef %6, ptr noundef %4) #14, !dbg !2618
  %8 = icmp ne i32 %7, 0, !dbg !2619
  br i1 %8, label %9, label %10, !dbg !2620

9:                                                ; preds = %1
  store i64 0, ptr %2, align 8, !dbg !2621
  store i32 1, ptr %5, align 4
  br label %17, !dbg !2621

10:                                               ; preds = %1
  %11 = getelementptr inbounds %struct.timespec, ptr %4, i32 0, i32 0, !dbg !2622
  %12 = load i64, ptr %11, align 8, !dbg !2622, !tbaa !2623
  %13 = mul i64 %12, 1000000000, !dbg !2625
  %14 = getelementptr inbounds %struct.timespec, ptr %4, i32 0, i32 1, !dbg !2626
  %15 = load i64, ptr %14, align 8, !dbg !2626, !tbaa !2627
  %16 = add i64 %13, %15, !dbg !2628
  store i64 %16, ptr %2, align 8, !dbg !2629
  store i32 1, ptr %5, align 4
  br label %17, !dbg !2629

17:                                               ; preds = %10, %9
  call void @llvm.lifetime.end.p0(i64 16, ptr %4) #14, !dbg !2630
  %18 = load i64, ptr %2, align 8, !dbg !2630
  ret i64 %18, !dbg !2630
}

; Function Attrs: nounwind
declare !dbg !2631 dso_local i32 @clock_gettime(i32 noundef, ptr noundef) #0

; Function Attrs: nounwind
define internal ptr @periodic_map_cleanup(ptr noundef %0) #0 !dbg !2638 {
  %2 = alloca ptr, align 8
  %3 = alloca ptr, align 8
  %4 = alloca %struct.timespec, align 8
  store ptr %0, ptr %2, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %2, metadata !2642, metadata !DIExpression()), !dbg !2646
  call void @llvm.lifetime.start.p0(i64 8, ptr %3) #14, !dbg !2647
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2643, metadata !DIExpression()), !dbg !2648
  %5 = load ptr, ptr %2, align 8, !dbg !2649, !tbaa !943
  store ptr %5, ptr %3, align 8, !dbg !2648, !tbaa !943
  call void @llvm.lifetime.start.p0(i64 16, ptr %4) #14, !dbg !2650
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2645, metadata !DIExpression()), !dbg !2651
  %6 = load ptr, ptr %3, align 8, !dbg !2652, !tbaa !943
  %7 = getelementptr inbounds %struct.map_cleanup_args, ptr %6, i32 0, i32 0, !dbg !2653
  %8 = load i64, ptr %7, align 8, !dbg !2653, !tbaa !1995
  %9 = udiv i64 %8, 1000000000, !dbg !2654
  %10 = getelementptr inbounds %struct.timespec, ptr %4, i32 0, i32 0, !dbg !2655
  store i64 %9, ptr %10, align 8, !dbg !2656, !tbaa !2623
  %11 = load ptr, ptr %3, align 8, !dbg !2657, !tbaa !943
  %12 = getelementptr inbounds %struct.map_cleanup_args, ptr %11, i32 0, i32 0, !dbg !2658
  %13 = load i64, ptr %12, align 8, !dbg !2658, !tbaa !1995
  %14 = urem i64 %13, 1000000000, !dbg !2659
  %15 = getelementptr inbounds %struct.timespec, ptr %4, i32 0, i32 1, !dbg !2660
  store i64 %14, ptr %15, align 8, !dbg !2661, !tbaa !2627
  br label %16, !dbg !2662

16:                                               ; preds = %19, %1
  %17 = load volatile i32, ptr @keep_running, align 4, !dbg !2663, !tbaa !996
  %18 = icmp ne i32 %17, 0, !dbg !2662
  br i1 %18, label %19, label %29, !dbg !2662

19:                                               ; preds = %16
  %20 = load ptr, ptr %3, align 8, !dbg !2664, !tbaa !943
  %21 = getelementptr inbounds %struct.map_cleanup_args, ptr %20, i32 0, i32 1, !dbg !2666
  %22 = load i32, ptr %21, align 8, !dbg !2666, !tbaa !1997
  %23 = call i32 @clean_map(i32 noundef %22, i64 noundef 48, i64 noundef 8, ptr noundef @packet_ts_timeout), !dbg !2667
  %24 = load ptr, ptr %3, align 8, !dbg !2668, !tbaa !943
  %25 = getelementptr inbounds %struct.map_cleanup_args, ptr %24, i32 0, i32 2, !dbg !2669
  %26 = load i32, ptr %25, align 4, !dbg !2669, !tbaa !1998
  %27 = call i32 @clean_map(i32 noundef %26, i64 noundef 44, i64 noundef 64, ptr noundef @flow_timeout), !dbg !2670
  %28 = call i32 @nanosleep(ptr noundef %4, ptr noundef null), !dbg !2671
  br label %16, !dbg !2662, !llvm.loop !2672

29:                                               ; preds = %16
  call void @pthread_exit(ptr noundef null) #18, !dbg !2674
  unreachable, !dbg !2674
}

; Function Attrs: nounwind
declare !dbg !2675 dso_local i32 @pthread_create(ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

; Function Attrs: nounwind
define internal i1 @packet_ts_timeout(ptr noundef %0, ptr noundef %1, i64 noundef %2) #0 !dbg !2696 {
  %4 = alloca i1, align 1
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %5, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2700, metadata !DIExpression()), !dbg !2704
  store ptr %1, ptr %6, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2701, metadata !DIExpression()), !dbg !2705
  store i64 %2, ptr %7, align 8, !tbaa !1764
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2702, metadata !DIExpression()), !dbg !2706
  call void @llvm.lifetime.start.p0(i64 8, ptr %8) #14, !dbg !2707
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2703, metadata !DIExpression()), !dbg !2708
  %10 = load ptr, ptr %6, align 8, !dbg !2709, !tbaa !943
  %11 = load i64, ptr %10, align 8, !dbg !2710, !tbaa !1764
  store i64 %11, ptr %8, align 8, !dbg !2708, !tbaa !1764
  %12 = load i64, ptr %7, align 8, !dbg !2711, !tbaa !1764
  %13 = load i64, ptr %8, align 8, !dbg !2713, !tbaa !1764
  %14 = icmp ugt i64 %12, %13, !dbg !2714
  br i1 %14, label %15, label %21, !dbg !2715

15:                                               ; preds = %3
  %16 = load i64, ptr %7, align 8, !dbg !2716, !tbaa !1764
  %17 = load i64, ptr %8, align 8, !dbg !2717, !tbaa !1764
  %18 = sub i64 %16, %17, !dbg !2718
  %19 = icmp ugt i64 %18, 10000000000, !dbg !2719
  br i1 %19, label %20, label %21, !dbg !2720

20:                                               ; preds = %15
  store i1 true, ptr %4, align 1, !dbg !2721
  store i32 1, ptr %9, align 4
  br label %22, !dbg !2721

21:                                               ; preds = %15, %3
  store i1 false, ptr %4, align 1, !dbg !2722
  store i32 1, ptr %9, align 4
  br label %22, !dbg !2722

22:                                               ; preds = %21, %20
  call void @llvm.lifetime.end.p0(i64 8, ptr %8) #14, !dbg !2723
  %23 = load i1, ptr %4, align 1, !dbg !2723
  ret i1 %23, !dbg !2723
}

; Function Attrs: nounwind
define internal i32 @clean_map(i32 noundef %0, i64 noundef %1, i64 noundef %2, ptr noundef %3) #0 !dbg !2724 {
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
  store i32 %0, ptr %6, align 4, !tbaa !996
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2729, metadata !DIExpression()), !dbg !2742
  store i64 %1, ptr %7, align 8, !tbaa !1048
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2730, metadata !DIExpression()), !dbg !2743
  store i64 %2, ptr %8, align 8, !tbaa !1048
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2731, metadata !DIExpression()), !dbg !2744
  store ptr %3, ptr %9, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2732, metadata !DIExpression()), !dbg !2745
  call void @llvm.lifetime.start.p0(i64 4, ptr %10) #14, !dbg !2746
  call void @llvm.dbg.declare(metadata ptr %10, metadata !2733, metadata !DIExpression()), !dbg !2747
  store i32 0, ptr %10, align 4, !dbg !2747, !tbaa !996
  call void @llvm.lifetime.start.p0(i64 8, ptr %11) #14, !dbg !2748
  call void @llvm.dbg.declare(metadata ptr %11, metadata !2734, metadata !DIExpression()), !dbg !2749
  call void @llvm.lifetime.start.p0(i64 8, ptr %12) #14, !dbg !2748
  call void @llvm.dbg.declare(metadata ptr %12, metadata !2735, metadata !DIExpression()), !dbg !2750
  call void @llvm.lifetime.start.p0(i64 8, ptr %13) #14, !dbg !2748
  call void @llvm.dbg.declare(metadata ptr %13, metadata !2736, metadata !DIExpression()), !dbg !2751
  call void @llvm.lifetime.start.p0(i64 1, ptr %14) #14, !dbg !2752
  call void @llvm.dbg.declare(metadata ptr %14, metadata !2737, metadata !DIExpression()), !dbg !2753
  store i8 0, ptr %14, align 1, !dbg !2753, !tbaa !963
  call void @llvm.lifetime.start.p0(i64 8, ptr %15) #14, !dbg !2754
  call void @llvm.dbg.declare(metadata ptr %15, metadata !2738, metadata !DIExpression()), !dbg !2755
  %19 = call i64 @get_time_ns(i32 noundef 1), !dbg !2756
  store i64 %19, ptr %15, align 8, !dbg !2755, !tbaa !1764
  call void @llvm.lifetime.start.p0(i64 4, ptr %16) #14, !dbg !2757
  call void @llvm.dbg.declare(metadata ptr %16, metadata !2739, metadata !DIExpression()), !dbg !2758
  store i32 0, ptr %16, align 4, !dbg !2758, !tbaa !996
  call void @llvm.lifetime.start.p0(i64 8, ptr %17) #14, !dbg !2759
  call void @llvm.dbg.declare(metadata ptr %17, metadata !2740, metadata !DIExpression()), !dbg !2760
  %20 = load i64, ptr %15, align 8, !dbg !2761, !tbaa !1764
  %21 = icmp eq i64 %20, 0, !dbg !2763
  br i1 %21, label %22, label %26, !dbg !2764

22:                                               ; preds = %4
  %23 = call ptr @__errno_location() #16, !dbg !2765
  %24 = load i32, ptr %23, align 4, !dbg !2765, !tbaa !996
  %25 = sub nsw i32 0, %24, !dbg !2766
  store i32 %25, ptr %5, align 4, !dbg !2767
  store i32 1, ptr %18, align 4
  br label %104, !dbg !2767

26:                                               ; preds = %4
  %27 = load i64, ptr %7, align 8, !dbg !2768, !tbaa !1048
  %28 = call noalias ptr @malloc(i64 noundef %27) #19, !dbg !2769
  store ptr %28, ptr %11, align 8, !dbg !2770, !tbaa !943
  %29 = load i64, ptr %7, align 8, !dbg !2771, !tbaa !1048
  %30 = call noalias ptr @malloc(i64 noundef %29) #19, !dbg !2772
  store ptr %30, ptr %12, align 8, !dbg !2773, !tbaa !943
  %31 = load i64, ptr %8, align 8, !dbg !2774, !tbaa !1048
  %32 = call noalias ptr @malloc(i64 noundef %31) #19, !dbg !2775
  store ptr %32, ptr %13, align 8, !dbg !2776, !tbaa !943
  %33 = load ptr, ptr %11, align 8, !dbg !2777, !tbaa !943
  %34 = icmp ne ptr %33, null, !dbg !2777
  br i1 %34, label %35, label %41, !dbg !2779

35:                                               ; preds = %26
  %36 = load ptr, ptr %12, align 8, !dbg !2780, !tbaa !943
  %37 = icmp ne ptr %36, null, !dbg !2780
  br i1 %37, label %38, label %41, !dbg !2781

38:                                               ; preds = %35
  %39 = load ptr, ptr %13, align 8, !dbg !2782, !tbaa !943
  %40 = icmp ne ptr %39, null, !dbg !2782
  br i1 %40, label %42, label %41, !dbg !2783

41:                                               ; preds = %38, %35, %26
  store i32 -12, ptr %10, align 4, !dbg !2784, !tbaa !996
  br label %99, !dbg !2786

42:                                               ; preds = %38
  br label %43, !dbg !2787

43:                                               ; preds = %71, %42
  %44 = load i32, ptr %6, align 4, !dbg !2788, !tbaa !996
  %45 = load ptr, ptr %12, align 8, !dbg !2789, !tbaa !943
  %46 = load ptr, ptr %11, align 8, !dbg !2790, !tbaa !943
  %47 = call i32 @bpf_map_get_next_key(i32 noundef %44, ptr noundef %45, ptr noundef %46), !dbg !2791
  %48 = icmp eq i32 %47, 0, !dbg !2792
  br i1 %48, label %49, label %77, !dbg !2787

49:                                               ; preds = %43
  %50 = load i8, ptr %14, align 1, !dbg !2793, !tbaa !963, !range !961, !noundef !962
  %51 = trunc i8 %50 to i1, !dbg !2793
  br i1 %51, label %52, label %58, !dbg !2796

52:                                               ; preds = %49
  %53 = load i32, ptr %6, align 4, !dbg !2797, !tbaa !996
  %54 = load ptr, ptr %12, align 8, !dbg !2799, !tbaa !943
  %55 = call i32 @bpf_map_delete_elem(i32 noundef %53, ptr noundef %54), !dbg !2800
  %56 = load i32, ptr %10, align 4, !dbg !2801, !tbaa !996
  %57 = add nsw i32 %56, 1, !dbg !2801
  store i32 %57, ptr %10, align 4, !dbg !2801, !tbaa !996
  store i8 0, ptr %14, align 1, !dbg !2802, !tbaa !963
  br label %58, !dbg !2803

58:                                               ; preds = %52, %49
  %59 = load i32, ptr %6, align 4, !dbg !2804, !tbaa !996
  %60 = load ptr, ptr %11, align 8, !dbg !2806, !tbaa !943
  %61 = load ptr, ptr %13, align 8, !dbg !2807, !tbaa !943
  %62 = call i32 @bpf_map_lookup_elem(i32 noundef %59, ptr noundef %60, ptr noundef %61), !dbg !2808
  %63 = icmp eq i32 %62, 0, !dbg !2809
  br i1 %63, label %64, label %71, !dbg !2810

64:                                               ; preds = %58
  %65 = load ptr, ptr %9, align 8, !dbg !2811, !tbaa !943
  %66 = load ptr, ptr %11, align 8, !dbg !2812, !tbaa !943
  %67 = load ptr, ptr %13, align 8, !dbg !2813, !tbaa !943
  %68 = load i64, ptr %15, align 8, !dbg !2814, !tbaa !1764
  %69 = call i1 %65(ptr noundef %66, ptr noundef %67, i64 noundef %68), !dbg !2811
  %70 = zext i1 %69 to i8, !dbg !2815
  store i8 %70, ptr %14, align 1, !dbg !2815, !tbaa !963
  br label %71, !dbg !2816

71:                                               ; preds = %64, %58
  %72 = load i32, ptr %16, align 4, !dbg !2817, !tbaa !996
  %73 = add nsw i32 %72, 1, !dbg !2817
  store i32 %73, ptr %16, align 4, !dbg !2817, !tbaa !996
  %74 = load ptr, ptr %12, align 8, !dbg !2818, !tbaa !943
  %75 = load ptr, ptr %11, align 8, !dbg !2819, !tbaa !943
  %76 = load i64, ptr %7, align 8, !dbg !2820, !tbaa !1048
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %74, ptr align 1 %75, i64 %76, i1 false), !dbg !2821
  br label %43, !dbg !2787, !llvm.loop !2822

77:                                               ; preds = %43
  %78 = load i8, ptr %14, align 1, !dbg !2824, !tbaa !963, !range !961, !noundef !962
  %79 = trunc i8 %78 to i1, !dbg !2824
  br i1 %79, label %80, label %86, !dbg !2826

80:                                               ; preds = %77
  %81 = load i32, ptr %6, align 4, !dbg !2827, !tbaa !996
  %82 = load ptr, ptr %12, align 8, !dbg !2829, !tbaa !943
  %83 = call i32 @bpf_map_delete_elem(i32 noundef %81, ptr noundef %82), !dbg !2830
  %84 = load i32, ptr %10, align 4, !dbg !2831, !tbaa !996
  %85 = add nsw i32 %84, 1, !dbg !2831
  store i32 %85, ptr %10, align 4, !dbg !2831, !tbaa !996
  br label %86, !dbg !2832

86:                                               ; preds = %80, %77
  %87 = call i64 @get_time_ns(i32 noundef 1), !dbg !2833
  %88 = load i64, ptr %15, align 8, !dbg !2834, !tbaa !1764
  %89 = sub i64 %87, %88, !dbg !2835
  store i64 %89, ptr %17, align 8, !dbg !2836, !tbaa !1764
  %90 = load ptr, ptr @stderr, align 8, !dbg !2837, !tbaa !943
  %91 = load i32, ptr %6, align 4, !dbg !2838, !tbaa !996
  %92 = load i32, ptr %16, align 4, !dbg !2839, !tbaa !996
  %93 = load i32, ptr %10, align 4, !dbg !2840, !tbaa !996
  %94 = load i64, ptr %17, align 8, !dbg !2841, !tbaa !1764
  %95 = udiv i64 %94, 1000000000, !dbg !2842
  %96 = load i64, ptr %17, align 8, !dbg !2843, !tbaa !1764
  %97 = urem i64 %96, 1000000000, !dbg !2844
  %98 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %90, ptr noundef @.str.110, i32 noundef %91, i32 noundef %92, i32 noundef %93, i64 noundef %95, i64 noundef %97), !dbg !2845
  br label %99, !dbg !2845

99:                                               ; preds = %86, %41
  call void @llvm.dbg.label(metadata !2741), !dbg !2846
  %100 = load ptr, ptr %11, align 8, !dbg !2847, !tbaa !943
  call void @free(ptr noundef %100) #14, !dbg !2848
  %101 = load ptr, ptr %12, align 8, !dbg !2849, !tbaa !943
  call void @free(ptr noundef %101) #14, !dbg !2850
  %102 = load ptr, ptr %13, align 8, !dbg !2851, !tbaa !943
  call void @free(ptr noundef %102) #14, !dbg !2852
  %103 = load i32, ptr %10, align 4, !dbg !2853, !tbaa !996
  store i32 %103, ptr %5, align 4, !dbg !2854
  store i32 1, ptr %18, align 4
  br label %104, !dbg !2854

104:                                              ; preds = %99, %22
  call void @llvm.lifetime.end.p0(i64 8, ptr %17) #14, !dbg !2855
  call void @llvm.lifetime.end.p0(i64 4, ptr %16) #14, !dbg !2855
  call void @llvm.lifetime.end.p0(i64 8, ptr %15) #14, !dbg !2855
  call void @llvm.lifetime.end.p0(i64 1, ptr %14) #14, !dbg !2855
  call void @llvm.lifetime.end.p0(i64 8, ptr %13) #14, !dbg !2855
  call void @llvm.lifetime.end.p0(i64 8, ptr %12) #14, !dbg !2855
  call void @llvm.lifetime.end.p0(i64 8, ptr %11) #14, !dbg !2855
  call void @llvm.lifetime.end.p0(i64 4, ptr %10) #14, !dbg !2855
  %105 = load i32, ptr %5, align 4, !dbg !2855
  ret i32 %105, !dbg !2855
}

; Function Attrs: nounwind
define internal i1 @flow_timeout(ptr noundef %0, ptr noundef %1, i64 noundef %2) #0 !dbg !2856 {
  %4 = alloca i1, align 1
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca %struct.flow_event, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %5, metadata !2858, metadata !DIExpression()), !dbg !2877
  store ptr %1, ptr %6, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %6, metadata !2859, metadata !DIExpression()), !dbg !2878
  store i64 %2, ptr %7, align 8, !tbaa !1764
  call void @llvm.dbg.declare(metadata ptr %7, metadata !2860, metadata !DIExpression()), !dbg !2879
  call void @llvm.lifetime.start.p0(i64 64, ptr %8) #14, !dbg !2880
  call void @llvm.dbg.declare(metadata ptr %8, metadata !2861, metadata !DIExpression()), !dbg !2881
  call void @llvm.lifetime.start.p0(i64 8, ptr %9) #14, !dbg !2882
  call void @llvm.dbg.declare(metadata ptr %9, metadata !2862, metadata !DIExpression()), !dbg !2883
  %11 = load ptr, ptr %6, align 8, !dbg !2884, !tbaa !943
  store ptr %11, ptr %9, align 8, !dbg !2883, !tbaa !943
  %12 = load i64, ptr %7, align 8, !dbg !2885, !tbaa !1764
  %13 = load ptr, ptr %9, align 8, !dbg !2887, !tbaa !943
  %14 = getelementptr inbounds %struct.flow_state, ptr %13, i32 0, i32 2, !dbg !2888
  %15 = load i64, ptr %14, align 8, !dbg !2888, !tbaa !2889
  %16 = icmp ugt i64 %12, %15, !dbg !2891
  br i1 %16, label %17, label %43, !dbg !2892

17:                                               ; preds = %3
  %18 = load i64, ptr %7, align 8, !dbg !2893, !tbaa !1764
  %19 = load ptr, ptr %9, align 8, !dbg !2894, !tbaa !943
  %20 = getelementptr inbounds %struct.flow_state, ptr %19, i32 0, i32 2, !dbg !2895
  %21 = load i64, ptr %20, align 8, !dbg !2895, !tbaa !2889
  %22 = sub i64 %18, %21, !dbg !2896
  %23 = icmp ugt i64 %22, 300000000000, !dbg !2897
  br i1 %23, label %24, label %43, !dbg !2898

24:                                               ; preds = %17
  %25 = load ptr, ptr @print_event_func, align 8, !dbg !2899, !tbaa !943
  %26 = icmp ne ptr %25, null, !dbg !2899
  br i1 %26, label %27, label %42, !dbg !2902

27:                                               ; preds = %24
  %28 = load ptr, ptr %9, align 8, !dbg !2903, !tbaa !943
  %29 = getelementptr inbounds %struct.flow_state, ptr %28, i32 0, i32 8, !dbg !2904
  %30 = load i8, ptr %29, align 4, !dbg !2904, !tbaa !2905, !range !961, !noundef !962
  %31 = trunc i8 %30 to i1, !dbg !2904
  br i1 %31, label %32, label %42, !dbg !2906

32:                                               ; preds = %27
  %33 = getelementptr inbounds %struct.flow_event, ptr %8, i32 0, i32 0, !dbg !2907
  store i64 1, ptr %33, align 8, !dbg !2909, !tbaa !2910
  %34 = load i64, ptr %7, align 8, !dbg !2912, !tbaa !1764
  %35 = getelementptr inbounds %struct.flow_event, ptr %8, i32 0, i32 1, !dbg !2913
  store i64 %34, ptr %35, align 8, !dbg !2914, !tbaa !2915
  %36 = getelementptr inbounds %struct.flow_event, ptr %8, i32 0, i32 2, !dbg !2916
  %37 = load ptr, ptr %5, align 8, !dbg !2917, !tbaa !943
  call void @reverse_flow(ptr noundef %36, ptr noundef %37), !dbg !2918
  %38 = getelementptr inbounds %struct.flow_event, ptr %8, i32 0, i32 3, !dbg !2919
  store i8 2, ptr %38, align 4, !dbg !2920, !tbaa !2921
  %39 = getelementptr inbounds %struct.flow_event, ptr %8, i32 0, i32 4, !dbg !2922
  store i8 5, ptr %39, align 1, !dbg !2923, !tbaa !2924
  %40 = getelementptr inbounds %struct.flow_event, ptr %8, i32 0, i32 5, !dbg !2925
  store i8 2, ptr %40, align 2, !dbg !2926, !tbaa !2927
  %41 = load ptr, ptr @print_event_func, align 8, !dbg !2928, !tbaa !943
  call void %41(ptr noundef %8), !dbg !2928
  br label %42, !dbg !2929

42:                                               ; preds = %32, %27, %24
  store i1 true, ptr %4, align 1, !dbg !2930
  store i32 1, ptr %10, align 4
  br label %44, !dbg !2930

43:                                               ; preds = %17, %3
  store i1 false, ptr %4, align 1, !dbg !2931
  store i32 1, ptr %10, align 4
  br label %44, !dbg !2931

44:                                               ; preds = %43, %42
  call void @llvm.lifetime.end.p0(i64 8, ptr %9) #14, !dbg !2932
  call void @llvm.lifetime.end.p0(i64 64, ptr %8) #14, !dbg !2932
  %45 = load i1, ptr %4, align 1, !dbg !2932
  ret i1 %45, !dbg !2932
}

declare !dbg !2933 dso_local i32 @nanosleep(ptr noundef, ptr noundef) #5

; Function Attrs: noreturn
declare !dbg !2941 dso_local void @pthread_exit(ptr noundef) #9

; Function Attrs: nounwind
define internal void @reverse_flow(ptr noundef %0, ptr noundef %1) #0 !dbg !2946 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %3, metadata !2951, metadata !DIExpression()), !dbg !2953
  store ptr %1, ptr %4, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %4, metadata !2952, metadata !DIExpression()), !dbg !2954
  %5 = load ptr, ptr %4, align 8, !dbg !2955, !tbaa !943
  %6 = getelementptr inbounds %struct.network_tuple, ptr %5, i32 0, i32 3, !dbg !2956
  %7 = load i8, ptr %6, align 2, !dbg !2956, !tbaa !2431
  %8 = load ptr, ptr %3, align 8, !dbg !2957, !tbaa !943
  %9 = getelementptr inbounds %struct.network_tuple, ptr %8, i32 0, i32 3, !dbg !2958
  store i8 %7, ptr %9, align 2, !dbg !2959, !tbaa !2431
  %10 = load ptr, ptr %4, align 8, !dbg !2960, !tbaa !943
  %11 = getelementptr inbounds %struct.network_tuple, ptr %10, i32 0, i32 2, !dbg !2961
  %12 = load i16, ptr %11, align 4, !dbg !2961, !tbaa !2962
  %13 = load ptr, ptr %3, align 8, !dbg !2963, !tbaa !943
  %14 = getelementptr inbounds %struct.network_tuple, ptr %13, i32 0, i32 2, !dbg !2964
  store i16 %12, ptr %14, align 4, !dbg !2965, !tbaa !2962
  %15 = load ptr, ptr %3, align 8, !dbg !2966, !tbaa !943
  %16 = getelementptr inbounds %struct.network_tuple, ptr %15, i32 0, i32 0, !dbg !2967
  %17 = load ptr, ptr %4, align 8, !dbg !2968, !tbaa !943
  %18 = getelementptr inbounds %struct.network_tuple, ptr %17, i32 0, i32 1, !dbg !2969
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %16, ptr align 4 %18, i64 20, i1 false), !dbg !2969, !tbaa.struct !2970
  %19 = load ptr, ptr %3, align 8, !dbg !2971, !tbaa !943
  %20 = getelementptr inbounds %struct.network_tuple, ptr %19, i32 0, i32 1, !dbg !2972
  %21 = load ptr, ptr %4, align 8, !dbg !2973, !tbaa !943
  %22 = getelementptr inbounds %struct.network_tuple, ptr %21, i32 0, i32 0, !dbg !2974
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %20, ptr align 4 %22, i64 20, i1 false), !dbg !2974, !tbaa.struct !2970
  %23 = load ptr, ptr %3, align 8, !dbg !2975, !tbaa !943
  %24 = getelementptr inbounds %struct.network_tuple, ptr %23, i32 0, i32 4, !dbg !2976
  store i8 0, ptr %24, align 1, !dbg !2977, !tbaa !2978
  ret void, !dbg !2979
}

; Function Attrs: nounwind allocsize(0)
declare !dbg !2980 dso_local noalias ptr @malloc(i64 noundef) #10

declare !dbg !2986 dso_local i32 @bpf_map_get_next_key(i32 noundef, ptr noundef, ptr noundef) #5

declare !dbg !2994 dso_local i32 @bpf_map_delete_elem(i32 noundef, ptr noundef) #5

declare !dbg !3000 dso_local i32 @bpf_map_lookup_elem(i32 noundef, ptr noundef, ptr noundef) #5

; Function Attrs: nounwind
declare !dbg !3005 dso_local void @free(ptr noundef) #0

declare !dbg !3008 dso_local ptr @bpf_object__open(ptr noundef) #5

; Function Attrs: nounwind
define internal i32 @init_rodata(ptr noundef %0, ptr noundef %1, i64 noundef %2) #0 !dbg !3013 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i64, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %5, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %5, metadata !3017, metadata !DIExpression()), !dbg !3023
  store ptr %1, ptr %6, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %6, metadata !3018, metadata !DIExpression()), !dbg !3024
  store i64 %2, ptr %7, align 8, !tbaa !1048
  call void @llvm.dbg.declare(metadata ptr %7, metadata !3019, metadata !DIExpression()), !dbg !3025
  call void @llvm.lifetime.start.p0(i64 8, ptr %8) #14, !dbg !3026
  call void @llvm.dbg.declare(metadata ptr %8, metadata !3020, metadata !DIExpression()), !dbg !3027
  store ptr null, ptr %8, align 8, !dbg !3027, !tbaa !943
  %10 = load ptr, ptr %5, align 8, !dbg !3028, !tbaa !943
  %11 = call ptr @bpf_object__next_map(ptr noundef %10, ptr noundef null), !dbg !3028
  store ptr %11, ptr %8, align 8, !dbg !3028, !tbaa !943
  br label %12, !dbg !3028

12:                                               ; preds = %26, %3
  %13 = load ptr, ptr %8, align 8, !dbg !3030, !tbaa !943
  %14 = icmp ne ptr %13, null, !dbg !3030
  br i1 %14, label %15, label %30, !dbg !3028

15:                                               ; preds = %12
  %16 = load ptr, ptr %8, align 8, !dbg !3032, !tbaa !943
  %17 = call ptr @bpf_map__name(ptr noundef %16), !dbg !3035
  %18 = call ptr @strstr(ptr noundef %17, ptr noundef @.str.104) #15, !dbg !3036
  %19 = icmp ne ptr %18, null, !dbg !3036
  br i1 %19, label %20, label %25, !dbg !3037

20:                                               ; preds = %15
  %21 = load ptr, ptr %8, align 8, !dbg !3038, !tbaa !943
  %22 = load ptr, ptr %6, align 8, !dbg !3039, !tbaa !943
  %23 = load i64, ptr %7, align 8, !dbg !3040, !tbaa !1048
  %24 = call i32 @bpf_map__set_initial_value(ptr noundef %21, ptr noundef %22, i64 noundef %23), !dbg !3041
  store i32 %24, ptr %4, align 4, !dbg !3042
  store i32 1, ptr %9, align 4
  br label %31, !dbg !3042

25:                                               ; preds = %15
  br label %26, !dbg !3043

26:                                               ; preds = %25
  %27 = load ptr, ptr %5, align 8, !dbg !3030, !tbaa !943
  %28 = load ptr, ptr %8, align 8, !dbg !3030, !tbaa !943
  %29 = call ptr @bpf_object__next_map(ptr noundef %27, ptr noundef %28), !dbg !3030
  store ptr %29, ptr %8, align 8, !dbg !3030, !tbaa !943
  br label %12, !dbg !3030, !llvm.loop !3044

30:                                               ; preds = %12
  store i32 -22, ptr %4, align 4, !dbg !3046
  store i32 1, ptr %9, align 4
  br label %31, !dbg !3046

31:                                               ; preds = %30, %20
  call void @llvm.lifetime.end.p0(i64 8, ptr %8) #14, !dbg !3047
  %32 = load i32, ptr %4, align 4, !dbg !3047
  ret i32 %32, !dbg !3047
}

; Function Attrs: nounwind
define internal i32 @set_programs_to_load(ptr noundef %0, ptr noundef %1) #0 !dbg !3048 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %4, metadata !3050, metadata !DIExpression()), !dbg !3056
  store ptr %1, ptr %5, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %5, metadata !3051, metadata !DIExpression()), !dbg !3057
  call void @llvm.lifetime.start.p0(i64 8, ptr %6) #14, !dbg !3058
  call void @llvm.dbg.declare(metadata ptr %6, metadata !3052, metadata !DIExpression()), !dbg !3059
  call void @llvm.lifetime.start.p0(i64 8, ptr %7) #14, !dbg !3060
  call void @llvm.dbg.declare(metadata ptr %7, metadata !3055, metadata !DIExpression()), !dbg !3061
  %9 = load ptr, ptr %5, align 8, !dbg !3062, !tbaa !943
  %10 = getelementptr inbounds %struct.pping_config, ptr %9, i32 0, i32 5, !dbg !3063
  %11 = load ptr, ptr %10, align 8, !dbg !3063, !tbaa !1052
  %12 = call i32 @strcmp(ptr noundef %11, ptr noundef @.str.8) #15, !dbg !3064
  %13 = icmp ne i32 %12, 0, !dbg !3065
  %14 = zext i1 %13 to i64, !dbg !3064
  %15 = select i1 %13, ptr @.str.8, ptr @.str.36, !dbg !3064
  store ptr %15, ptr %7, align 8, !dbg !3061, !tbaa !943
  %16 = load ptr, ptr %4, align 8, !dbg !3066, !tbaa !943
  %17 = load ptr, ptr %7, align 8, !dbg !3067, !tbaa !943
  %18 = call ptr @bpf_object__find_program_by_name(ptr noundef %16, ptr noundef %17), !dbg !3068
  store ptr %18, ptr %6, align 8, !dbg !3069, !tbaa !943
  %19 = load ptr, ptr %6, align 8, !dbg !3070, !tbaa !943
  %20 = call i64 @libbpf_get_error(ptr noundef %19), !dbg !3072
  %21 = icmp ne i64 %20, 0, !dbg !3072
  br i1 %21, label %22, label %26, !dbg !3073

22:                                               ; preds = %2
  %23 = load ptr, ptr %6, align 8, !dbg !3074, !tbaa !943
  %24 = call i64 @libbpf_get_error(ptr noundef %23), !dbg !3075
  %25 = trunc i64 %24 to i32, !dbg !3075
  store i32 %25, ptr %3, align 4, !dbg !3076
  store i32 1, ptr %8, align 4
  br label %29, !dbg !3076

26:                                               ; preds = %2
  %27 = load ptr, ptr %6, align 8, !dbg !3077, !tbaa !943
  %28 = call i32 @bpf_program__set_autoload(ptr noundef %27, i1 noundef zeroext false), !dbg !3078
  store i32 %28, ptr %3, align 4, !dbg !3079
  store i32 1, ptr %8, align 4
  br label %29, !dbg !3079

29:                                               ; preds = %26, %22
  call void @llvm.lifetime.end.p0(i64 8, ptr %7) #14, !dbg !3080
  call void @llvm.lifetime.end.p0(i64 8, ptr %6) #14, !dbg !3080
  %30 = load i32, ptr %3, align 4, !dbg !3080
  ret i32 %30, !dbg !3080
}

declare !dbg !3081 dso_local i32 @bpf_object__load(ptr noundef) #5

; Function Attrs: nounwind
define internal i32 @tc_attach(ptr noundef %0, i32 noundef %1, i32 noundef %2, ptr noundef %3, ptr noundef %4, ptr noundef %5) #0 !dbg !3086 {
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
  store ptr %0, ptr %8, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %8, metadata !3091, metadata !DIExpression()), !dbg !3102
  store i32 %1, ptr %9, align 4, !tbaa !996
  call void @llvm.dbg.declare(metadata ptr %9, metadata !3092, metadata !DIExpression()), !dbg !3103
  store i32 %2, ptr %10, align 4, !tbaa !981
  call void @llvm.dbg.declare(metadata ptr %10, metadata !3093, metadata !DIExpression()), !dbg !3104
  store ptr %3, ptr %11, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %11, metadata !3094, metadata !DIExpression()), !dbg !3105
  store ptr %4, ptr %12, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %12, metadata !3095, metadata !DIExpression()), !dbg !3106
  store ptr %5, ptr %13, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %13, metadata !3096, metadata !DIExpression()), !dbg !3107
  call void @llvm.lifetime.start.p0(i64 4, ptr %14) #14, !dbg !3108
  call void @llvm.dbg.declare(metadata ptr %14, metadata !3097, metadata !DIExpression()), !dbg !3109
  call void @llvm.lifetime.start.p0(i64 4, ptr %15) #14, !dbg !3110
  call void @llvm.dbg.declare(metadata ptr %15, metadata !3098, metadata !DIExpression()), !dbg !3111
  call void @llvm.lifetime.start.p0(i64 1, ptr %16) #14, !dbg !3112
  call void @llvm.dbg.declare(metadata ptr %16, metadata !3099, metadata !DIExpression()), !dbg !3113
  store i8 1, ptr %16, align 1, !dbg !3113, !tbaa !963
  call void @llvm.lifetime.start.p0(i64 24, ptr %17) #14, !dbg !3114
  call void @llvm.dbg.declare(metadata ptr %17, metadata !3100, metadata !DIExpression()), !dbg !3114
  call void @llvm.memset.p0.i64(ptr align 8 %17, i8 0, i64 24, i1 false), !dbg !3115
  %19 = getelementptr inbounds %struct.bpf_tc_hook, ptr %17, i32 0, i32 0, !dbg !3115
  store i64 24, ptr %19, align 8, !dbg !3115, !tbaa !2266
  %20 = getelementptr inbounds %struct.bpf_tc_hook, ptr %17, i32 0, i32 1, !dbg !3115
  %21 = load i32, ptr %9, align 4, !dbg !3115, !tbaa !996
  store i32 %21, ptr %20, align 8, !dbg !3115, !tbaa !2268
  %22 = getelementptr inbounds %struct.bpf_tc_hook, ptr %17, i32 0, i32 2, !dbg !3115
  %23 = load i32, ptr %10, align 4, !dbg !3115, !tbaa !981
  store i32 %23, ptr %22, align 4, !dbg !3115, !tbaa !2269
  %24 = getelementptr inbounds %struct.bpf_tc_hook, ptr %17, i32 0, i32 3, !dbg !3115
  store i32 0, ptr %24, align 8, !dbg !3115, !tbaa !2270
  %25 = call i32 @bpf_tc_hook_create(ptr noundef %17), !dbg !3117
  store i32 %25, ptr %14, align 4, !dbg !3118, !tbaa !996
  %26 = load i32, ptr %14, align 4, !dbg !3119, !tbaa !996
  %27 = icmp eq i32 %26, -17, !dbg !3121
  br i1 %27, label %28, label %29, !dbg !3122

28:                                               ; preds = %6
  store i8 0, ptr %16, align 1, !dbg !3123, !tbaa !963
  br label %35, !dbg !3124

29:                                               ; preds = %6
  %30 = load i32, ptr %14, align 4, !dbg !3125, !tbaa !996
  %31 = icmp ne i32 %30, 0, !dbg !3125
  br i1 %31, label %32, label %34, !dbg !3127

32:                                               ; preds = %29
  %33 = load i32, ptr %14, align 4, !dbg !3128, !tbaa !996
  store i32 %33, ptr %7, align 4, !dbg !3129
  store i32 1, ptr %18, align 4
  br label %75, !dbg !3129

34:                                               ; preds = %29
  br label %35

35:                                               ; preds = %34, %28
  %36 = load ptr, ptr %8, align 8, !dbg !3130, !tbaa !943
  %37 = load ptr, ptr %11, align 8, !dbg !3131, !tbaa !943
  %38 = call ptr @bpf_object__find_program_by_name(ptr noundef %36, ptr noundef %37), !dbg !3132
  %39 = call i32 @bpf_program__fd(ptr noundef %38), !dbg !3133
  store i32 %39, ptr %15, align 4, !dbg !3134, !tbaa !996
  %40 = load i32, ptr %15, align 4, !dbg !3135, !tbaa !996
  %41 = icmp slt i32 %40, 0, !dbg !3137
  br i1 %41, label %42, label %44, !dbg !3138

42:                                               ; preds = %35
  %43 = load i32, ptr %15, align 4, !dbg !3139, !tbaa !996
  store i32 %43, ptr %14, align 4, !dbg !3141, !tbaa !996
  br label %67, !dbg !3142

44:                                               ; preds = %35
  %45 = load i32, ptr %15, align 4, !dbg !3143, !tbaa !996
  %46 = load ptr, ptr %12, align 8, !dbg !3144, !tbaa !943
  %47 = getelementptr inbounds %struct.bpf_tc_opts, ptr %46, i32 0, i32 1, !dbg !3145
  store i32 %45, ptr %47, align 8, !dbg !3146, !tbaa !2274
  %48 = load ptr, ptr %12, align 8, !dbg !3147, !tbaa !943
  %49 = getelementptr inbounds %struct.bpf_tc_opts, ptr %48, i32 0, i32 3, !dbg !3148
  store i32 0, ptr %49, align 8, !dbg !3149, !tbaa !2276
  %50 = load ptr, ptr %12, align 8, !dbg !3150, !tbaa !943
  %51 = call i32 @bpf_tc_attach(ptr noundef %17, ptr noundef %50), !dbg !3151
  store i32 %51, ptr %14, align 4, !dbg !3152, !tbaa !996
  %52 = load i32, ptr %14, align 4, !dbg !3153, !tbaa !996
  %53 = icmp ne i32 %52, 0, !dbg !3153
  br i1 %53, label %54, label %55, !dbg !3155

54:                                               ; preds = %44
  br label %67, !dbg !3156

55:                                               ; preds = %44
  %56 = load ptr, ptr %13, align 8, !dbg !3157, !tbaa !943
  %57 = icmp ne ptr %56, null, !dbg !3157
  br i1 %57, label %58, label %63, !dbg !3159

58:                                               ; preds = %55
  %59 = load i8, ptr %16, align 1, !dbg !3160, !tbaa !963, !range !961, !noundef !962
  %60 = trunc i8 %59 to i1, !dbg !3160
  %61 = load ptr, ptr %13, align 8, !dbg !3161, !tbaa !943
  %62 = zext i1 %60 to i8, !dbg !3162
  store i8 %62, ptr %61, align 1, !dbg !3162, !tbaa !963
  br label %63, !dbg !3163

63:                                               ; preds = %58, %55
  %64 = load ptr, ptr %12, align 8, !dbg !3164, !tbaa !943
  %65 = getelementptr inbounds %struct.bpf_tc_opts, ptr %64, i32 0, i32 3, !dbg !3165
  %66 = load i32, ptr %65, align 8, !dbg !3165, !tbaa !2276
  store i32 %66, ptr %7, align 4, !dbg !3166
  store i32 1, ptr %18, align 4
  br label %75, !dbg !3166

67:                                               ; preds = %54, %42
  call void @llvm.dbg.label(metadata !3101), !dbg !3167
  %68 = load i8, ptr %16, align 1, !dbg !3168, !tbaa !963, !range !961, !noundef !962
  %69 = trunc i8 %68 to i1, !dbg !3168
  br i1 %69, label %70, label %73, !dbg !3170

70:                                               ; preds = %67
  %71 = getelementptr inbounds %struct.bpf_tc_hook, ptr %17, i32 0, i32 2, !dbg !3171
  store i32 3, ptr %71, align 4, !dbg !3173, !tbaa !2269
  %72 = call i32 @bpf_tc_hook_destroy(ptr noundef %17), !dbg !3174
  br label %73, !dbg !3175

73:                                               ; preds = %70, %67
  %74 = load i32, ptr %14, align 4, !dbg !3176, !tbaa !996
  store i32 %74, ptr %7, align 4, !dbg !3177
  store i32 1, ptr %18, align 4
  br label %75, !dbg !3177

75:                                               ; preds = %73, %63, %32
  call void @llvm.lifetime.end.p0(i64 24, ptr %17) #14, !dbg !3178
  call void @llvm.lifetime.end.p0(i64 1, ptr %16) #14, !dbg !3178
  call void @llvm.lifetime.end.p0(i64 4, ptr %15) #14, !dbg !3178
  call void @llvm.lifetime.end.p0(i64 4, ptr %14) #14, !dbg !3178
  %76 = load i32, ptr %7, align 4, !dbg !3178
  ret i32 %76, !dbg !3178
}

; Function Attrs: nounwind
define internal i32 @xdp_attach(ptr noundef %0, ptr noundef %1, i32 noundef %2, i32 noundef %3) #0 !dbg !3179 {
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
  store ptr %0, ptr %6, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %6, metadata !3183, metadata !DIExpression()), !dbg !3191
  store ptr %1, ptr %7, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %7, metadata !3184, metadata !DIExpression()), !dbg !3192
  store i32 %2, ptr %8, align 4, !tbaa !996
  call void @llvm.dbg.declare(metadata ptr %8, metadata !3185, metadata !DIExpression()), !dbg !3193
  store i32 %3, ptr %9, align 4, !tbaa !996
  call void @llvm.dbg.declare(metadata ptr %9, metadata !3186, metadata !DIExpression()), !dbg !3194
  call void @llvm.lifetime.start.p0(i64 8, ptr %10) #14, !dbg !3195
  call void @llvm.dbg.declare(metadata ptr %10, metadata !3187, metadata !DIExpression()), !dbg !3196
  call void @llvm.lifetime.start.p0(i64 4, ptr %11) #14, !dbg !3197
  call void @llvm.dbg.declare(metadata ptr %11, metadata !3188, metadata !DIExpression()), !dbg !3198
  call void @llvm.lifetime.start.p0(i64 4, ptr %12) #14, !dbg !3197
  call void @llvm.dbg.declare(metadata ptr %12, metadata !3189, metadata !DIExpression()), !dbg !3199
  call void @llvm.lifetime.start.p0(i64 4, ptr %13) #14, !dbg !3200
  call void @llvm.dbg.declare(metadata ptr %13, metadata !3190, metadata !DIExpression()), !dbg !3201
  %15 = load ptr, ptr %7, align 8, !dbg !3202, !tbaa !943
  %16 = icmp ne ptr %15, null, !dbg !3202
  br i1 %16, label %17, label %21, !dbg !3204

17:                                               ; preds = %4
  %18 = load ptr, ptr %6, align 8, !dbg !3205, !tbaa !943
  %19 = load ptr, ptr %7, align 8, !dbg !3206, !tbaa !943
  %20 = call ptr @bpf_object__find_program_by_name(ptr noundef %18, ptr noundef %19), !dbg !3207
  store ptr %20, ptr %10, align 8, !dbg !3208, !tbaa !943
  br label %24, !dbg !3209

21:                                               ; preds = %4
  %22 = load ptr, ptr %6, align 8, !dbg !3210, !tbaa !943
  %23 = call ptr @bpf_object__next_program(ptr noundef %22, ptr noundef null), !dbg !3211
  store ptr %23, ptr %10, align 8, !dbg !3212, !tbaa !943
  br label %24

24:                                               ; preds = %21, %17
  %25 = load ptr, ptr %10, align 8, !dbg !3213, !tbaa !943
  %26 = call i32 @bpf_program__fd(ptr noundef %25), !dbg !3214
  store i32 %26, ptr %11, align 4, !dbg !3215, !tbaa !996
  %27 = load i32, ptr %11, align 4, !dbg !3216, !tbaa !996
  %28 = icmp slt i32 %27, 0, !dbg !3218
  br i1 %28, label %29, label %31, !dbg !3219

29:                                               ; preds = %24
  %30 = load i32, ptr %11, align 4, !dbg !3220, !tbaa !996
  store i32 %30, ptr %5, align 4, !dbg !3221
  store i32 1, ptr %14, align 4
  br label %53, !dbg !3221

31:                                               ; preds = %24
  %32 = load i32, ptr %8, align 4, !dbg !3222, !tbaa !996
  %33 = load i32, ptr %11, align 4, !dbg !3223, !tbaa !996
  %34 = load i32, ptr %9, align 4, !dbg !3224, !tbaa !996
  %35 = call i32 @bpf_set_link_xdp_fd(i32 noundef %32, i32 noundef %33, i32 noundef %34), !dbg !3225
  store i32 %35, ptr %12, align 4, !dbg !3226, !tbaa !996
  %36 = load i32, ptr %12, align 4, !dbg !3227, !tbaa !996
  %37 = icmp ne i32 %36, 0, !dbg !3227
  br i1 %37, label %38, label %40, !dbg !3229

38:                                               ; preds = %31
  %39 = load i32, ptr %12, align 4, !dbg !3230, !tbaa !996
  store i32 %39, ptr %5, align 4, !dbg !3231
  store i32 1, ptr %14, align 4
  br label %53, !dbg !3231

40:                                               ; preds = %31
  %41 = load i32, ptr %8, align 4, !dbg !3232, !tbaa !996
  %42 = load i32, ptr %9, align 4, !dbg !3233, !tbaa !996
  %43 = call i32 @bpf_get_link_xdp_id(i32 noundef %41, ptr noundef %13, i32 noundef %42), !dbg !3234
  store i32 %43, ptr %12, align 4, !dbg !3235, !tbaa !996
  %44 = load i32, ptr %12, align 4, !dbg !3236, !tbaa !996
  %45 = icmp ne i32 %44, 0, !dbg !3236
  br i1 %45, label %46, label %51, !dbg !3238

46:                                               ; preds = %40
  %47 = load i32, ptr %8, align 4, !dbg !3239, !tbaa !996
  %48 = load i32, ptr %9, align 4, !dbg !3241, !tbaa !996
  %49 = call i32 @bpf_set_link_xdp_fd(i32 noundef %47, i32 noundef -1, i32 noundef %48), !dbg !3242
  %50 = load i32, ptr %12, align 4, !dbg !3243, !tbaa !996
  store i32 %50, ptr %5, align 4, !dbg !3244
  store i32 1, ptr %14, align 4
  br label %53, !dbg !3244

51:                                               ; preds = %40
  %52 = load i32, ptr %13, align 4, !dbg !3245, !tbaa !996
  store i32 %52, ptr %5, align 4, !dbg !3246
  store i32 1, ptr %14, align 4
  br label %53, !dbg !3246

53:                                               ; preds = %51, %46, %38, %29
  call void @llvm.lifetime.end.p0(i64 4, ptr %13) #14, !dbg !3247
  call void @llvm.lifetime.end.p0(i64 4, ptr %12) #14, !dbg !3247
  call void @llvm.lifetime.end.p0(i64 4, ptr %11) #14, !dbg !3247
  call void @llvm.lifetime.end.p0(i64 8, ptr %10) #14, !dbg !3247
  %54 = load i32, ptr %5, align 4, !dbg !3247
  ret i32 %54, !dbg !3247
}

; Function Attrs: nounwind
define internal void @print_xdp_error_hints(ptr noundef %0, i32 noundef %1) #0 !dbg !3248 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %3, metadata !3252, metadata !DIExpression()), !dbg !3254
  store i32 %1, ptr %4, align 4, !tbaa !996
  call void @llvm.dbg.declare(metadata ptr %4, metadata !3253, metadata !DIExpression()), !dbg !3255
  %5 = load i32, ptr %4, align 4, !dbg !3256, !tbaa !996
  %6 = icmp sgt i32 %5, 0, !dbg !3257
  br i1 %6, label %7, label %9, !dbg !3256

7:                                                ; preds = %2
  %8 = load i32, ptr %4, align 4, !dbg !3258, !tbaa !996
  br label %12, !dbg !3256

9:                                                ; preds = %2
  %10 = load i32, ptr %4, align 4, !dbg !3259, !tbaa !996
  %11 = sub nsw i32 0, %10, !dbg !3260
  br label %12, !dbg !3256

12:                                               ; preds = %9, %7
  %13 = phi i32 [ %8, %7 ], [ %11, %9 ], !dbg !3256
  store i32 %13, ptr %4, align 4, !dbg !3261, !tbaa !996
  %14 = load i32, ptr %4, align 4, !dbg !3262, !tbaa !996
  switch i32 %14, label %21 [
    i32 16, label %15
    i32 17, label %15
    i32 95, label %18
  ], !dbg !3263

15:                                               ; preds = %12, %12
  %16 = load ptr, ptr %3, align 8, !dbg !3264, !tbaa !943
  %17 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %16, ptr noundef @.str.105), !dbg !3266
  br label %21, !dbg !3267

18:                                               ; preds = %12
  %19 = load ptr, ptr %3, align 8, !dbg !3268, !tbaa !943
  %20 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %19, ptr noundef @.str.106), !dbg !3269
  br label %21, !dbg !3270

21:                                               ; preds = %18, %15, %12
  ret void, !dbg !3271
}

declare !dbg !3272 dso_local ptr @bpf_object__find_program_by_name(ptr noundef, ptr noundef) #5

declare !dbg !3278 dso_local ptr @bpf_object__next_program(ptr noundef, ptr noundef) #5

declare !dbg !3284 dso_local i32 @bpf_program__fd(ptr noundef) #5

declare !dbg !3291 dso_local i32 @bpf_tc_hook_create(ptr noundef) #5

declare !dbg !3294 dso_local i32 @bpf_tc_attach(ptr noundef, ptr noundef) #5

declare !dbg !3298 dso_local i32 @bpf_program__set_autoload(ptr noundef, i1 noundef zeroext) #5

declare !dbg !3304 dso_local ptr @bpf_object__next_map(ptr noundef, ptr noundef) #5

declare !dbg !3312 dso_local ptr @bpf_map__name(ptr noundef) #5

; Function Attrs: nounwind willreturn memory(read)
declare !dbg !3317 dso_local ptr @strstr(ptr noundef, ptr noundef) #6

declare !dbg !3323 dso_local i32 @bpf_map__set_initial_value(ptr noundef, ptr noundef, i64 noundef) #5

declare !dbg !3330 dso_local ptr @jsonw_new(ptr noundef) #5

declare !dbg !3335 dso_local void @jsonw_start_array(ptr noundef) #5

declare !dbg !3338 dso_local void @jsonw_start_object(ptr noundef) #5

; Function Attrs: nounwind
define internal void @print_common_fields_json(ptr noundef %0, ptr noundef %1) #0 !dbg !3341 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca [46 x i8], align 1
  %7 = alloca [46 x i8], align 1
  store ptr %0, ptr %3, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %3, metadata !3345, metadata !DIExpression()), !dbg !3350
  store ptr %1, ptr %4, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %4, metadata !3346, metadata !DIExpression()), !dbg !3351
  call void @llvm.lifetime.start.p0(i64 8, ptr %5) #14, !dbg !3352
  call void @llvm.dbg.declare(metadata ptr %5, metadata !3347, metadata !DIExpression()), !dbg !3353
  %8 = load ptr, ptr %4, align 8, !dbg !3354, !tbaa !943
  %9 = getelementptr inbounds %struct.rtt_event, ptr %8, i32 0, i32 2, !dbg !3355
  store ptr %9, ptr %5, align 8, !dbg !3353, !tbaa !943
  call void @llvm.lifetime.start.p0(i64 46, ptr %6) #14, !dbg !3356
  call void @llvm.dbg.declare(metadata ptr %6, metadata !3348, metadata !DIExpression()), !dbg !3357
  call void @llvm.lifetime.start.p0(i64 46, ptr %7) #14, !dbg !3358
  call void @llvm.dbg.declare(metadata ptr %7, metadata !3349, metadata !DIExpression()), !dbg !3359
  %10 = getelementptr inbounds [46 x i8], ptr %6, i64 0, i64 0, !dbg !3360
  %11 = load ptr, ptr %5, align 8, !dbg !3361, !tbaa !943
  %12 = getelementptr inbounds %struct.network_tuple, ptr %11, i32 0, i32 3, !dbg !3362
  %13 = load i8, ptr %12, align 2, !dbg !3362, !tbaa !2431
  %14 = zext i8 %13 to i32, !dbg !3361
  %15 = load ptr, ptr %5, align 8, !dbg !3363, !tbaa !943
  %16 = getelementptr inbounds %struct.network_tuple, ptr %15, i32 0, i32 0, !dbg !3364
  %17 = getelementptr inbounds %struct.flow_address, ptr %16, i32 0, i32 0, !dbg !3365
  %18 = call i32 @format_ip_address(ptr noundef %10, i64 noundef 46, i32 noundef %14, ptr noundef %17), !dbg !3366
  %19 = getelementptr inbounds [46 x i8], ptr %7, i64 0, i64 0, !dbg !3367
  %20 = load ptr, ptr %5, align 8, !dbg !3368, !tbaa !943
  %21 = getelementptr inbounds %struct.network_tuple, ptr %20, i32 0, i32 3, !dbg !3369
  %22 = load i8, ptr %21, align 2, !dbg !3369, !tbaa !2431
  %23 = zext i8 %22 to i32, !dbg !3368
  %24 = load ptr, ptr %5, align 8, !dbg !3370, !tbaa !943
  %25 = getelementptr inbounds %struct.network_tuple, ptr %24, i32 0, i32 1, !dbg !3371
  %26 = getelementptr inbounds %struct.flow_address, ptr %25, i32 0, i32 0, !dbg !3372
  %27 = call i32 @format_ip_address(ptr noundef %19, i64 noundef 46, i32 noundef %23, ptr noundef %26), !dbg !3373
  %28 = load ptr, ptr %3, align 8, !dbg !3374, !tbaa !943
  %29 = load ptr, ptr %4, align 8, !dbg !3375, !tbaa !943
  %30 = getelementptr inbounds %struct.rtt_event, ptr %29, i32 0, i32 1, !dbg !3376
  %31 = load i64, ptr %30, align 8, !dbg !3376, !tbaa !981
  %32 = call i64 @convert_monotonic_to_realtime(i64 noundef %31), !dbg !3377
  call void @jsonw_u64_field(ptr noundef %28, ptr noundef @.str.81, i64 noundef %32), !dbg !3378
  %33 = load ptr, ptr %3, align 8, !dbg !3379, !tbaa !943
  %34 = getelementptr inbounds [46 x i8], ptr %6, i64 0, i64 0, !dbg !3380
  call void @jsonw_string_field(ptr noundef %33, ptr noundef @.str.82, ptr noundef %34), !dbg !3381
  %35 = load ptr, ptr %3, align 8, !dbg !3382, !tbaa !943
  %36 = load ptr, ptr %5, align 8, !dbg !3383, !tbaa !943
  %37 = getelementptr inbounds %struct.network_tuple, ptr %36, i32 0, i32 0, !dbg !3383
  %38 = getelementptr inbounds %struct.flow_address, ptr %37, i32 0, i32 1, !dbg !3383
  %39 = load i16, ptr %38, align 4, !dbg !3383, !tbaa !2446
  %40 = call i16 @__bswap_16(i16 noundef zeroext %39), !dbg !3383
  call void @jsonw_hu_field(ptr noundef %35, ptr noundef @.str.83, i16 noundef zeroext %40), !dbg !3384
  %41 = load ptr, ptr %3, align 8, !dbg !3385, !tbaa !943
  %42 = getelementptr inbounds [46 x i8], ptr %7, i64 0, i64 0, !dbg !3386
  call void @jsonw_string_field(ptr noundef %41, ptr noundef @.str.84, ptr noundef %42), !dbg !3387
  %43 = load ptr, ptr %3, align 8, !dbg !3388, !tbaa !943
  %44 = load ptr, ptr %5, align 8, !dbg !3389, !tbaa !943
  %45 = getelementptr inbounds %struct.network_tuple, ptr %44, i32 0, i32 1, !dbg !3389
  %46 = getelementptr inbounds %struct.flow_address, ptr %45, i32 0, i32 1, !dbg !3389
  %47 = load i16, ptr %46, align 4, !dbg !3389, !tbaa !2449
  %48 = call i16 @__bswap_16(i16 noundef zeroext %47), !dbg !3389
  call void @jsonw_hu_field(ptr noundef %43, ptr noundef @.str.85, i16 noundef zeroext %48), !dbg !3390
  %49 = load ptr, ptr %3, align 8, !dbg !3391, !tbaa !943
  %50 = load ptr, ptr %5, align 8, !dbg !3392, !tbaa !943
  %51 = getelementptr inbounds %struct.network_tuple, ptr %50, i32 0, i32 2, !dbg !3393
  %52 = load i16, ptr %51, align 4, !dbg !3393, !tbaa !2962
  %53 = call ptr @proto_to_str(i16 noundef zeroext %52), !dbg !3394
  call void @jsonw_string_field(ptr noundef %49, ptr noundef @.str.86, ptr noundef %53), !dbg !3395
  call void @llvm.lifetime.end.p0(i64 46, ptr %7) #14, !dbg !3396
  call void @llvm.lifetime.end.p0(i64 46, ptr %6) #14, !dbg !3396
  call void @llvm.lifetime.end.p0(i64 8, ptr %5) #14, !dbg !3396
  ret void, !dbg !3396
}

; Function Attrs: nounwind
define internal void @print_rttevent_fields_json(ptr noundef %0, ptr noundef %1) #0 !dbg !3397 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %3, metadata !3401, metadata !DIExpression()), !dbg !3403
  store ptr %1, ptr %4, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %4, metadata !3402, metadata !DIExpression()), !dbg !3404
  %5 = load ptr, ptr %3, align 8, !dbg !3405, !tbaa !943
  %6 = load ptr, ptr %4, align 8, !dbg !3406, !tbaa !943
  %7 = getelementptr inbounds %struct.rtt_event, ptr %6, i32 0, i32 4, !dbg !3407
  %8 = load i64, ptr %7, align 8, !dbg !3407, !tbaa !1771
  call void @jsonw_u64_field(ptr noundef %5, ptr noundef @.str.87, i64 noundef %8), !dbg !3408
  %9 = load ptr, ptr %3, align 8, !dbg !3409, !tbaa !943
  %10 = load ptr, ptr %4, align 8, !dbg !3410, !tbaa !943
  %11 = getelementptr inbounds %struct.rtt_event, ptr %10, i32 0, i32 5, !dbg !3411
  %12 = load i64, ptr %11, align 8, !dbg !3411, !tbaa !1778
  call void @jsonw_u64_field(ptr noundef %9, ptr noundef @.str.88, i64 noundef %12), !dbg !3412
  %13 = load ptr, ptr %3, align 8, !dbg !3413, !tbaa !943
  %14 = load ptr, ptr %4, align 8, !dbg !3414, !tbaa !943
  %15 = getelementptr inbounds %struct.rtt_event, ptr %14, i32 0, i32 6, !dbg !3415
  %16 = load i64, ptr %15, align 8, !dbg !3415, !tbaa !3416
  call void @jsonw_u64_field(ptr noundef %13, ptr noundef @.str.89, i64 noundef %16), !dbg !3417
  %17 = load ptr, ptr %3, align 8, !dbg !3418, !tbaa !943
  %18 = load ptr, ptr %4, align 8, !dbg !3419, !tbaa !943
  %19 = getelementptr inbounds %struct.rtt_event, ptr %18, i32 0, i32 7, !dbg !3420
  %20 = load i64, ptr %19, align 8, !dbg !3420, !tbaa !3421
  call void @jsonw_u64_field(ptr noundef %17, ptr noundef @.str.90, i64 noundef %20), !dbg !3422
  %21 = load ptr, ptr %3, align 8, !dbg !3423, !tbaa !943
  %22 = load ptr, ptr %4, align 8, !dbg !3424, !tbaa !943
  %23 = getelementptr inbounds %struct.rtt_event, ptr %22, i32 0, i32 8, !dbg !3425
  %24 = load i64, ptr %23, align 8, !dbg !3425, !tbaa !3426
  call void @jsonw_u64_field(ptr noundef %21, ptr noundef @.str.91, i64 noundef %24), !dbg !3427
  %25 = load ptr, ptr %3, align 8, !dbg !3428, !tbaa !943
  %26 = load ptr, ptr %4, align 8, !dbg !3429, !tbaa !943
  %27 = getelementptr inbounds %struct.rtt_event, ptr %26, i32 0, i32 9, !dbg !3430
  %28 = load i64, ptr %27, align 8, !dbg !3430, !tbaa !3431
  call void @jsonw_u64_field(ptr noundef %25, ptr noundef @.str.92, i64 noundef %28), !dbg !3432
  %29 = load ptr, ptr %3, align 8, !dbg !3433, !tbaa !943
  %30 = load ptr, ptr %4, align 8, !dbg !3434, !tbaa !943
  %31 = getelementptr inbounds %struct.rtt_event, ptr %30, i32 0, i32 10, !dbg !3435
  %32 = load i8, ptr %31, align 8, !dbg !3435, !tbaa !3436, !range !961, !noundef !962
  %33 = trunc i8 %32 to i1, !dbg !3435
  call void @jsonw_bool_field(ptr noundef %29, ptr noundef @.str.93, i1 noundef zeroext %33), !dbg !3437
  ret void, !dbg !3438
}

; Function Attrs: nounwind
define internal void @print_flowevent_fields_json(ptr noundef %0, ptr noundef %1) #0 !dbg !3439 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %3, metadata !3445, metadata !DIExpression()), !dbg !3447
  store ptr %1, ptr %4, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %4, metadata !3446, metadata !DIExpression()), !dbg !3448
  %5 = load ptr, ptr %3, align 8, !dbg !3449, !tbaa !943
  %6 = load ptr, ptr %4, align 8, !dbg !3450, !tbaa !943
  %7 = getelementptr inbounds %struct.flow_event, ptr %6, i32 0, i32 3, !dbg !3451
  %8 = load i8, ptr %7, align 4, !dbg !3451, !tbaa !2921
  %9 = call ptr @flowevent_to_str(i8 noundef zeroext %8), !dbg !3452
  call void @jsonw_string_field(ptr noundef %5, ptr noundef @.str.94, ptr noundef %9), !dbg !3453
  %10 = load ptr, ptr %3, align 8, !dbg !3454, !tbaa !943
  %11 = load ptr, ptr %4, align 8, !dbg !3455, !tbaa !943
  %12 = getelementptr inbounds %struct.flow_event, ptr %11, i32 0, i32 4, !dbg !3456
  %13 = load i8, ptr %12, align 1, !dbg !3456, !tbaa !2924
  %14 = call ptr @eventreason_to_str(i8 noundef zeroext %13), !dbg !3457
  call void @jsonw_string_field(ptr noundef %10, ptr noundef @.str.95, ptr noundef %14), !dbg !3458
  %15 = load ptr, ptr %3, align 8, !dbg !3459, !tbaa !943
  %16 = load ptr, ptr %4, align 8, !dbg !3460, !tbaa !943
  %17 = getelementptr inbounds %struct.flow_event, ptr %16, i32 0, i32 5, !dbg !3461
  %18 = load i8, ptr %17, align 2, !dbg !3461, !tbaa !2927
  %19 = call ptr @eventsource_to_str(i8 noundef zeroext %18), !dbg !3462
  call void @jsonw_string_field(ptr noundef %15, ptr noundef @.str.96, ptr noundef %19), !dbg !3463
  ret void, !dbg !3464
}

declare !dbg !3465 dso_local void @jsonw_end_object(ptr noundef) #5

; Function Attrs: nounwind
define internal ptr @flowevent_to_str(i8 noundef zeroext %0) #0 !dbg !3468 {
  %2 = alloca ptr, align 8
  %3 = alloca i8, align 1
  store i8 %0, ptr %3, align 1, !tbaa !981
  call void @llvm.dbg.declare(metadata ptr %3, metadata !3472, metadata !DIExpression()), !dbg !3473
  %4 = load i8, ptr %3, align 1, !dbg !3474, !tbaa !981
  %5 = zext i8 %4 to i32, !dbg !3474
  switch i32 %5, label %9 [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %8
    i32 3, label %8
  ], !dbg !3475

6:                                                ; preds = %1
  store ptr @.str.68, ptr %2, align 8, !dbg !3476
  br label %10, !dbg !3476

7:                                                ; preds = %1
  store ptr @.str.69, ptr %2, align 8, !dbg !3478
  br label %10, !dbg !3478

8:                                                ; preds = %1, %1
  store ptr @.str.70, ptr %2, align 8, !dbg !3479
  br label %10, !dbg !3479

9:                                                ; preds = %1
  store ptr @.str.71, ptr %2, align 8, !dbg !3480
  br label %10, !dbg !3480

10:                                               ; preds = %9, %8, %7, %6
  %11 = load ptr, ptr %2, align 8, !dbg !3481
  ret ptr %11, !dbg !3481
}

declare !dbg !3482 dso_local void @jsonw_string_field(ptr noundef, ptr noundef, ptr noundef) #5

; Function Attrs: nounwind
define internal ptr @eventreason_to_str(i8 noundef zeroext %0) #0 !dbg !3489 {
  %2 = alloca ptr, align 8
  %3 = alloca i8, align 1
  store i8 %0, ptr %3, align 1, !tbaa !981
  call void @llvm.dbg.declare(metadata ptr %3, metadata !3493, metadata !DIExpression()), !dbg !3494
  %4 = load i8, ptr %3, align 1, !dbg !3495, !tbaa !981
  %5 = zext i8 %4 to i32, !dbg !3495
  switch i32 %5, label %12 [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %8
    i32 3, label %9
    i32 4, label %10
    i32 5, label %11
  ], !dbg !3496

6:                                                ; preds = %1
  store ptr @.str.72, ptr %2, align 8, !dbg !3497
  br label %13, !dbg !3497

7:                                                ; preds = %1
  store ptr @.str.73, ptr %2, align 8, !dbg !3499
  br label %13, !dbg !3499

8:                                                ; preds = %1
  store ptr @.str.74, ptr %2, align 8, !dbg !3500
  br label %13, !dbg !3500

9:                                                ; preds = %1
  store ptr @.str.75, ptr %2, align 8, !dbg !3501
  br label %13, !dbg !3501

10:                                               ; preds = %1
  store ptr @.str.76, ptr %2, align 8, !dbg !3502
  br label %13, !dbg !3502

11:                                               ; preds = %1
  store ptr @.str.77, ptr %2, align 8, !dbg !3503
  br label %13, !dbg !3503

12:                                               ; preds = %1
  store ptr @.str.71, ptr %2, align 8, !dbg !3504
  br label %13, !dbg !3504

13:                                               ; preds = %12, %11, %10, %9, %8, %7, %6
  %14 = load ptr, ptr %2, align 8, !dbg !3505
  ret ptr %14, !dbg !3505
}

; Function Attrs: nounwind
define internal ptr @eventsource_to_str(i8 noundef zeroext %0) #0 !dbg !3506 {
  %2 = alloca ptr, align 8
  %3 = alloca i8, align 1
  store i8 %0, ptr %3, align 1, !tbaa !981
  call void @llvm.dbg.declare(metadata ptr %3, metadata !3510, metadata !DIExpression()), !dbg !3511
  %4 = load i8, ptr %3, align 1, !dbg !3512, !tbaa !981
  %5 = zext i8 %4 to i32, !dbg !3512
  switch i32 %5, label %9 [
    i32 0, label %6
    i32 1, label %7
    i32 2, label %8
  ], !dbg !3513

6:                                                ; preds = %1
  store ptr @.str.78, ptr %2, align 8, !dbg !3514
  br label %10, !dbg !3514

7:                                                ; preds = %1
  store ptr @.str.79, ptr %2, align 8, !dbg !3516
  br label %10, !dbg !3516

8:                                                ; preds = %1
  store ptr @.str.80, ptr %2, align 8, !dbg !3517
  br label %10, !dbg !3517

9:                                                ; preds = %1
  store ptr @.str.71, ptr %2, align 8, !dbg !3518
  br label %10, !dbg !3518

10:                                               ; preds = %9, %8, %7, %6
  %11 = load ptr, ptr %2, align 8, !dbg !3519
  ret ptr %11, !dbg !3519
}

declare !dbg !3520 dso_local void @jsonw_u64_field(ptr noundef, ptr noundef, i64 noundef) #5

declare !dbg !3529 dso_local void @jsonw_bool_field(ptr noundef, ptr noundef, i1 noundef zeroext) #5

declare !dbg !3536 dso_local void @jsonw_hu_field(ptr noundef, ptr noundef, i16 noundef zeroext) #5

; Function Attrs: nounwind
define internal ptr @proto_to_str(i16 noundef zeroext %0) #0 !dbg !532 {
  %2 = alloca ptr, align 8
  %3 = alloca i16, align 2
  store i16 %0, ptr %3, align 2, !tbaa !2499
  call void @llvm.dbg.declare(metadata ptr %3, metadata !536, metadata !DIExpression()), !dbg !3543
  %4 = load i16, ptr %3, align 2, !dbg !3544, !tbaa !2499
  %5 = zext i16 %4 to i32, !dbg !3544
  switch i32 %5, label %9 [
    i32 6, label %6
    i32 1, label %7
    i32 58, label %8
  ], !dbg !3545

6:                                                ; preds = %1
  store ptr @.str.1, ptr %2, align 8, !dbg !3546
  br label %13, !dbg !3546

7:                                                ; preds = %1
  store ptr @.str.2, ptr %2, align 8, !dbg !3548
  br label %13, !dbg !3548

8:                                                ; preds = %1
  store ptr @.str.65, ptr %2, align 8, !dbg !3549
  br label %13, !dbg !3549

9:                                                ; preds = %1
  %10 = load i16, ptr %3, align 2, !dbg !3550, !tbaa !2499
  %11 = zext i16 %10 to i32, !dbg !3550
  %12 = call i32 (ptr, i64, ptr, ...) @snprintf(ptr noundef @proto_to_str.buf, i64 noundef 8, ptr noundef @.str.66, i32 noundef %11) #14, !dbg !3551
  store ptr @proto_to_str.buf, ptr %2, align 8, !dbg !3552
  br label %13, !dbg !3552

13:                                               ; preds = %9, %8, %7, %6
  %14 = load ptr, ptr %2, align 8, !dbg !3553
  ret ptr %14, !dbg !3553
}

; Function Attrs: nounwind
declare !dbg !3554 dso_local i32 @snprintf(ptr noundef, i64 noundef, ptr noundef, ...) #0

; Function Attrs: nounwind
declare !dbg !3561 dso_local i32 @getopt_long(i32 noundef, ptr noundef, ptr noundef, ptr noundef, ptr noundef) #0

; Function Attrs: nounwind willreturn memory(read)
declare !dbg !3573 dso_local i64 @strlen(ptr noundef) #6

; Function Attrs: nounwind
declare !dbg !3578 dso_local ptr @strncpy(ptr noundef, ptr noundef, i64 noundef) #0

; Function Attrs: nounwind
declare !dbg !3585 dso_local i32 @if_nametoindex(ptr noundef) #0

; Function Attrs: nounwind
define internal i32 @parse_bounded_double(ptr noundef %0, ptr noundef %1, double noundef %2, double noundef %3, ptr noundef %4) #0 !dbg !3591 {
  %6 = alloca i32, align 4
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca ptr, align 8
  %12 = alloca ptr, align 8
  %13 = alloca i32, align 4
  store ptr %0, ptr %7, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %7, metadata !3596, metadata !DIExpression()), !dbg !3602
  store ptr %1, ptr %8, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %8, metadata !3597, metadata !DIExpression()), !dbg !3603
  store double %2, ptr %9, align 8, !tbaa !1401
  call void @llvm.dbg.declare(metadata ptr %9, metadata !3598, metadata !DIExpression()), !dbg !3604
  store double %3, ptr %10, align 8, !tbaa !1401
  call void @llvm.dbg.declare(metadata ptr %10, metadata !3599, metadata !DIExpression()), !dbg !3605
  store ptr %4, ptr %11, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %11, metadata !3600, metadata !DIExpression()), !dbg !3606
  call void @llvm.lifetime.start.p0(i64 8, ptr %12) #14, !dbg !3607
  call void @llvm.dbg.declare(metadata ptr %12, metadata !3601, metadata !DIExpression()), !dbg !3608
  %14 = load ptr, ptr %8, align 8, !dbg !3609, !tbaa !943
  %15 = call double @strtod(ptr noundef %14, ptr noundef %12) #14, !dbg !3610
  %16 = load ptr, ptr %7, align 8, !dbg !3611, !tbaa !943
  store double %15, ptr %16, align 8, !dbg !3612, !tbaa !1401
  %17 = load ptr, ptr %8, align 8, !dbg !3613, !tbaa !943
  %18 = call i64 @strlen(ptr noundef %17) #15, !dbg !3615
  %19 = load ptr, ptr %12, align 8, !dbg !3616, !tbaa !943
  %20 = load ptr, ptr %8, align 8, !dbg !3617, !tbaa !943
  %21 = ptrtoint ptr %19 to i64, !dbg !3618
  %22 = ptrtoint ptr %20 to i64, !dbg !3618
  %23 = sub i64 %21, %22, !dbg !3618
  %24 = icmp ne i64 %18, %23, !dbg !3619
  br i1 %24, label %25, label %30, !dbg !3620

25:                                               ; preds = %5
  %26 = load ptr, ptr @stderr, align 8, !dbg !3621, !tbaa !943
  %27 = load ptr, ptr %11, align 8, !dbg !3623, !tbaa !943
  %28 = load ptr, ptr %8, align 8, !dbg !3624, !tbaa !943
  %29 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %26, ptr noundef @.str.50, ptr noundef %27, ptr noundef %28), !dbg !3625
  store i32 -22, ptr %6, align 4, !dbg !3626
  store i32 1, ptr %13, align 4
  br label %47, !dbg !3626

30:                                               ; preds = %5
  %31 = load ptr, ptr %7, align 8, !dbg !3627, !tbaa !943
  %32 = load double, ptr %31, align 8, !dbg !3629, !tbaa !1401
  %33 = load double, ptr %9, align 8, !dbg !3630, !tbaa !1401
  %34 = fcmp olt double %32, %33, !dbg !3631
  br i1 %34, label %40, label %35, !dbg !3632

35:                                               ; preds = %30
  %36 = load ptr, ptr %7, align 8, !dbg !3633, !tbaa !943
  %37 = load double, ptr %36, align 8, !dbg !3634, !tbaa !1401
  %38 = load double, ptr %10, align 8, !dbg !3635, !tbaa !1401
  %39 = fcmp ogt double %37, %38, !dbg !3636
  br i1 %39, label %40, label %46, !dbg !3637

40:                                               ; preds = %35, %30
  %41 = load ptr, ptr @stderr, align 8, !dbg !3638, !tbaa !943
  %42 = load ptr, ptr %11, align 8, !dbg !3640, !tbaa !943
  %43 = load double, ptr %9, align 8, !dbg !3641, !tbaa !1401
  %44 = load double, ptr %10, align 8, !dbg !3642, !tbaa !1401
  %45 = call i32 (ptr, ptr, ...) @fprintf(ptr noundef %41, ptr noundef @.str.51, ptr noundef %42, double noundef %43, double noundef %44), !dbg !3643
  store i32 -22, ptr %6, align 4, !dbg !3644
  store i32 1, ptr %13, align 4
  br label %47, !dbg !3644

46:                                               ; preds = %35
  store i32 0, ptr %6, align 4, !dbg !3645
  store i32 1, ptr %13, align 4
  br label %47, !dbg !3645

47:                                               ; preds = %46, %40, %25
  call void @llvm.lifetime.end.p0(i64 8, ptr %12) #14, !dbg !3646
  %48 = load i32, ptr %6, align 4, !dbg !3646
  ret i32 %48, !dbg !3646
}

; Function Attrs: noreturn nounwind
declare !dbg !3647 dso_local void @exit(i32 noundef) #11

; Function Attrs: nounwind
declare !dbg !3650 dso_local double @strtod(ptr noundef, ptr noundef) #0

declare !dbg !3656 dso_local i32 @libbpf_strerror(i32 noundef, ptr noundef, i64 noundef) #5

; Function Attrs: nounwind
declare !dbg !3663 dso_local i32 @setrlimit(i32 noundef, ptr noundef) #0

; Function Attrs: nounwind
define dso_local i32 @pping_tc_egress(ptr noundef %0) #0 section "tc" !dbg !3673 {
  %2 = alloca ptr, align 8
  %3 = alloca %struct.parsing_context, align 8
  store ptr %0, ptr %2, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %2, metadata !3765, metadata !DIExpression()), !dbg !3779
  call void @llvm.lifetime.start.p0(i64 40, ptr %3) #14, !dbg !3780
  call void @llvm.dbg.declare(metadata ptr %3, metadata !3766, metadata !DIExpression()), !dbg !3781
  %4 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 0, !dbg !3782
  %5 = load ptr, ptr %2, align 8, !dbg !3783, !tbaa !943
  %6 = getelementptr inbounds %struct.__sk_buff, ptr %5, i32 0, i32 15, !dbg !3784
  %7 = load i32, ptr %6, align 4, !dbg !3784, !tbaa !3785
  %8 = zext i32 %7 to i64, !dbg !3787
  %9 = inttoptr i64 %8 to ptr, !dbg !3788
  store ptr %9, ptr %4, align 8, !dbg !3782, !tbaa !3789
  %10 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 1, !dbg !3782
  %11 = load ptr, ptr %2, align 8, !dbg !3792, !tbaa !943
  %12 = getelementptr inbounds %struct.__sk_buff, ptr %11, i32 0, i32 16, !dbg !3793
  %13 = load i32, ptr %12, align 8, !dbg !3793, !tbaa !3794
  %14 = zext i32 %13 to i64, !dbg !3795
  %15 = inttoptr i64 %14 to ptr, !dbg !3796
  store ptr %15, ptr %10, align 8, !dbg !3782, !tbaa !3797
  %16 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 2, !dbg !3782
  %17 = getelementptr inbounds %struct.hdr_cursor, ptr %16, i32 0, i32 0, !dbg !3798
  %18 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 0, !dbg !3799
  %19 = load ptr, ptr %18, align 8, !dbg !3799, !tbaa !3789
  store ptr %19, ptr %17, align 8, !dbg !3798, !tbaa !3800
  %20 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 3, !dbg !3782
  %21 = load ptr, ptr %2, align 8, !dbg !3801, !tbaa !943
  %22 = getelementptr inbounds %struct.__sk_buff, ptr %21, i32 0, i32 0, !dbg !3802
  %23 = load i32, ptr %22, align 8, !dbg !3802, !tbaa !3803
  store i32 %23, ptr %20, align 8, !dbg !3782, !tbaa !3804
  %24 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 4, !dbg !3782
  store i32 0, ptr %24, align 4, !dbg !3782, !tbaa !3805
  %25 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 5, !dbg !3782
  store i8 1, ptr %25, align 8, !dbg !3782, !tbaa !3806
  %26 = load ptr, ptr %2, align 8, !dbg !3807, !tbaa !943
  call void @pping(ptr noundef %26, ptr noundef %3), !dbg !3808
  call void @llvm.lifetime.end.p0(i64 40, ptr %3) #14, !dbg !3809
  ret i32 -1, !dbg !3810
}

; Function Attrs: nounwind
define dso_local i32 @pping_tc_ingress(ptr noundef %0) #0 section "tc" !dbg !3811 {
  %2 = alloca ptr, align 8
  %3 = alloca %struct.parsing_context, align 8
  store ptr %0, ptr %2, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %2, metadata !3813, metadata !DIExpression()), !dbg !3815
  call void @llvm.lifetime.start.p0(i64 40, ptr %3) #14, !dbg !3816
  call void @llvm.dbg.declare(metadata ptr %3, metadata !3814, metadata !DIExpression()), !dbg !3817
  %4 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 0, !dbg !3818
  %5 = load ptr, ptr %2, align 8, !dbg !3819, !tbaa !943
  %6 = getelementptr inbounds %struct.__sk_buff, ptr %5, i32 0, i32 15, !dbg !3820
  %7 = load i32, ptr %6, align 4, !dbg !3820, !tbaa !3785
  %8 = zext i32 %7 to i64, !dbg !3821
  %9 = inttoptr i64 %8 to ptr, !dbg !3822
  store ptr %9, ptr %4, align 8, !dbg !3818, !tbaa !3789
  %10 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 1, !dbg !3818
  %11 = load ptr, ptr %2, align 8, !dbg !3823, !tbaa !943
  %12 = getelementptr inbounds %struct.__sk_buff, ptr %11, i32 0, i32 16, !dbg !3824
  %13 = load i32, ptr %12, align 8, !dbg !3824, !tbaa !3794
  %14 = zext i32 %13 to i64, !dbg !3825
  %15 = inttoptr i64 %14 to ptr, !dbg !3826
  store ptr %15, ptr %10, align 8, !dbg !3818, !tbaa !3797
  %16 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 2, !dbg !3818
  %17 = getelementptr inbounds %struct.hdr_cursor, ptr %16, i32 0, i32 0, !dbg !3827
  %18 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 0, !dbg !3828
  %19 = load ptr, ptr %18, align 8, !dbg !3828, !tbaa !3789
  store ptr %19, ptr %17, align 8, !dbg !3827, !tbaa !3800
  %20 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 3, !dbg !3818
  %21 = load ptr, ptr %2, align 8, !dbg !3829, !tbaa !943
  %22 = getelementptr inbounds %struct.__sk_buff, ptr %21, i32 0, i32 0, !dbg !3830
  %23 = load i32, ptr %22, align 8, !dbg !3830, !tbaa !3803
  store i32 %23, ptr %20, align 8, !dbg !3818, !tbaa !3804
  %24 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 4, !dbg !3818
  %25 = load ptr, ptr %2, align 8, !dbg !3831, !tbaa !943
  %26 = getelementptr inbounds %struct.__sk_buff, ptr %25, i32 0, i32 9, !dbg !3832
  %27 = load i32, ptr %26, align 4, !dbg !3832, !tbaa !3833
  store i32 %27, ptr %24, align 4, !dbg !3818, !tbaa !3805
  %28 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 5, !dbg !3818
  store i8 0, ptr %28, align 8, !dbg !3818, !tbaa !3806
  %29 = load ptr, ptr %2, align 8, !dbg !3834, !tbaa !943
  call void @pping(ptr noundef %29, ptr noundef %3), !dbg !3835
  call void @llvm.lifetime.end.p0(i64 40, ptr %3) #14, !dbg !3836
  ret i32 -1, !dbg !3837
}

; Function Attrs: nounwind
define dso_local i32 @pping_xdp_ingress(ptr noundef %0) #0 section "xdp" !dbg !3838 {
  %2 = alloca ptr, align 8
  %3 = alloca %struct.parsing_context, align 8
  store ptr %0, ptr %2, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %2, metadata !3851, metadata !DIExpression()), !dbg !3853
  call void @llvm.lifetime.start.p0(i64 40, ptr %3) #14, !dbg !3854
  call void @llvm.dbg.declare(metadata ptr %3, metadata !3852, metadata !DIExpression()), !dbg !3855
  %4 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 0, !dbg !3856
  %5 = load ptr, ptr %2, align 8, !dbg !3857, !tbaa !943
  %6 = getelementptr inbounds %struct.xdp_md, ptr %5, i32 0, i32 0, !dbg !3858
  %7 = load i32, ptr %6, align 4, !dbg !3858, !tbaa !3859
  %8 = zext i32 %7 to i64, !dbg !3861
  %9 = inttoptr i64 %8 to ptr, !dbg !3862
  store ptr %9, ptr %4, align 8, !dbg !3856, !tbaa !3789
  %10 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 1, !dbg !3856
  %11 = load ptr, ptr %2, align 8, !dbg !3863, !tbaa !943
  %12 = getelementptr inbounds %struct.xdp_md, ptr %11, i32 0, i32 1, !dbg !3864
  %13 = load i32, ptr %12, align 4, !dbg !3864, !tbaa !3865
  %14 = zext i32 %13 to i64, !dbg !3866
  %15 = inttoptr i64 %14 to ptr, !dbg !3867
  store ptr %15, ptr %10, align 8, !dbg !3856, !tbaa !3797
  %16 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 2, !dbg !3856
  %17 = getelementptr inbounds %struct.hdr_cursor, ptr %16, i32 0, i32 0, !dbg !3868
  %18 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 0, !dbg !3869
  %19 = load ptr, ptr %18, align 8, !dbg !3869, !tbaa !3789
  store ptr %19, ptr %17, align 8, !dbg !3868, !tbaa !3800
  %20 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 3, !dbg !3856
  %21 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 1, !dbg !3870
  %22 = load ptr, ptr %21, align 8, !dbg !3870, !tbaa !3797
  %23 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 0, !dbg !3871
  %24 = load ptr, ptr %23, align 8, !dbg !3871, !tbaa !3789
  %25 = ptrtoint ptr %22 to i64, !dbg !3872
  %26 = ptrtoint ptr %24 to i64, !dbg !3872
  %27 = sub i64 %25, %26, !dbg !3872
  %28 = trunc i64 %27 to i32, !dbg !3873
  store i32 %28, ptr %20, align 8, !dbg !3856, !tbaa !3804
  %29 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 4, !dbg !3856
  %30 = load ptr, ptr %2, align 8, !dbg !3874, !tbaa !943
  %31 = getelementptr inbounds %struct.xdp_md, ptr %30, i32 0, i32 3, !dbg !3875
  %32 = load i32, ptr %31, align 4, !dbg !3875, !tbaa !3876
  store i32 %32, ptr %29, align 4, !dbg !3856, !tbaa !3805
  %33 = getelementptr inbounds %struct.parsing_context, ptr %3, i32 0, i32 5, !dbg !3856
  store i8 0, ptr %33, align 8, !dbg !3856, !tbaa !3806
  %34 = load ptr, ptr %2, align 8, !dbg !3877, !tbaa !943
  call void @pping(ptr noundef %34, ptr noundef %3), !dbg !3878
  call void @llvm.lifetime.end.p0(i64 40, ptr %3) #14, !dbg !3879
  ret i32 2, !dbg !3880
}

; Function Attrs: nounwind
define internal void @pping(ptr noundef %0, ptr noundef %1) #0 !dbg !3881 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca %struct.packet_info, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i8, align 1
  %9 = alloca i32, align 4
  store ptr %0, ptr %3, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %3, metadata !3886, metadata !DIExpression()), !dbg !4045
  store ptr %1, ptr %4, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %4, metadata !3887, metadata !DIExpression()), !dbg !4046
  call void @llvm.lifetime.start.p0(i64 128, ptr %5) #14, !dbg !4047
  call void @llvm.dbg.declare(metadata ptr %5, metadata !3888, metadata !DIExpression()), !dbg !4048
  call void @llvm.memset.p0.i64(ptr align 8 %5, i8 0, i64 128, i1 false), !dbg !4048
  call void @llvm.lifetime.start.p0(i64 8, ptr %6) #14, !dbg !4049
  call void @llvm.dbg.declare(metadata ptr %6, metadata !4042, metadata !DIExpression()), !dbg !4050
  call void @llvm.lifetime.start.p0(i64 8, ptr %7) #14, !dbg !4049
  call void @llvm.dbg.declare(metadata ptr %7, metadata !4043, metadata !DIExpression()), !dbg !4051
  call void @llvm.lifetime.start.p0(i64 1, ptr %8) #14, !dbg !4052
  call void @llvm.dbg.declare(metadata ptr %8, metadata !4044, metadata !DIExpression()), !dbg !4053
  %10 = load ptr, ptr %4, align 8, !dbg !4054, !tbaa !943
  %11 = call i32 @parse_packet_identifier(ptr noundef %10, ptr noundef %5), !dbg !4056
  %12 = icmp slt i32 %11, 0, !dbg !4057
  br i1 %12, label %13, label %14, !dbg !4058

13:                                               ; preds = %2
  store i32 1, ptr %9, align 4
  br label %30, !dbg !4059

14:                                               ; preds = %2
  %15 = load ptr, ptr %3, align 8, !dbg !4060, !tbaa !943
  %16 = call ptr @update_flow(ptr noundef %15, ptr noundef %5, ptr noundef %8), !dbg !4061
  store ptr %16, ptr %6, align 8, !dbg !4062, !tbaa !943
  %17 = load ptr, ptr %6, align 8, !dbg !4063, !tbaa !943
  %18 = load ptr, ptr %3, align 8, !dbg !4064, !tbaa !943
  %19 = load ptr, ptr %4, align 8, !dbg !4065, !tbaa !943
  %20 = load i8, ptr %8, align 1, !dbg !4066, !tbaa !963, !range !961, !noundef !962
  %21 = trunc i8 %20 to i1, !dbg !4066
  call void @pping_timestamp_packet(ptr noundef %17, ptr noundef %18, ptr noundef %19, ptr noundef %5, i1 noundef zeroext %21), !dbg !4067
  %22 = load ptr, ptr %3, align 8, !dbg !4068, !tbaa !943
  %23 = call ptr @update_rev_flow(ptr noundef %22, ptr noundef %5), !dbg !4069
  store ptr %23, ptr %7, align 8, !dbg !4070, !tbaa !943
  %24 = load ptr, ptr %7, align 8, !dbg !4071, !tbaa !943
  %25 = load ptr, ptr %3, align 8, !dbg !4072, !tbaa !943
  %26 = load ptr, ptr %4, align 8, !dbg !4073, !tbaa !943
  call void @pping_match_packet(ptr noundef %24, ptr noundef %25, ptr noundef %26, ptr noundef %5), !dbg !4074
  %27 = load ptr, ptr %3, align 8, !dbg !4075, !tbaa !943
  %28 = load ptr, ptr %6, align 8, !dbg !4076, !tbaa !943
  %29 = load ptr, ptr %7, align 8, !dbg !4077, !tbaa !943
  call void @delete_closed_flows(ptr noundef %27, ptr noundef %5, ptr noundef %28, ptr noundef %29), !dbg !4078
  store i32 0, ptr %9, align 4, !dbg !4079
  br label %30, !dbg !4079

30:                                               ; preds = %14, %13
  call void @llvm.lifetime.end.p0(i64 1, ptr %8) #14, !dbg !4079
  call void @llvm.lifetime.end.p0(i64 8, ptr %7) #14, !dbg !4079
  call void @llvm.lifetime.end.p0(i64 8, ptr %6) #14, !dbg !4079
  call void @llvm.lifetime.end.p0(i64 128, ptr %5) #14, !dbg !4079
  %31 = load i32, ptr %9, align 4
  switch i32 %31, label %33 [
    i32 0, label %32
    i32 1, label %32
  ]

32:                                               ; preds = %30, %30
  ret void, !dbg !4079

33:                                               ; preds = %30
  unreachable
}

; Function Attrs: nounwind
define internal i32 @parse_packet_identifier(ptr noundef %0, ptr noundef %1) #0 !dbg !4080 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %4, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %4, metadata !4085, metadata !DIExpression()), !dbg !4098
  store ptr %1, ptr %5, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %5, metadata !4086, metadata !DIExpression()), !dbg !4099
  call void @llvm.lifetime.start.p0(i64 4, ptr %6) #14, !dbg !4100
  call void @llvm.dbg.declare(metadata ptr %6, metadata !4087, metadata !DIExpression()), !dbg !4101
  call void @llvm.lifetime.start.p0(i64 4, ptr %7) #14, !dbg !4100
  call void @llvm.dbg.declare(metadata ptr %7, metadata !4088, metadata !DIExpression()), !dbg !4102
  call void @llvm.lifetime.start.p0(i64 8, ptr %8) #14, !dbg !4103
  call void @llvm.dbg.declare(metadata ptr %8, metadata !4089, metadata !DIExpression()), !dbg !4104
  %10 = load ptr, ptr @bpf_ktime_get_ns, align 8, !dbg !4105, !tbaa !943
  %11 = call i64 %10(), !dbg !4105
  %12 = load ptr, ptr %5, align 8, !dbg !4106, !tbaa !943
  %13 = getelementptr inbounds %struct.packet_info, ptr %12, i32 0, i32 2, !dbg !4107
  store i64 %11, ptr %13, align 8, !dbg !4108, !tbaa !4109
  %14 = load ptr, ptr %4, align 8, !dbg !4112, !tbaa !943
  %15 = getelementptr inbounds %struct.parsing_context, ptr %14, i32 0, i32 2, !dbg !4113
  %16 = load ptr, ptr %4, align 8, !dbg !4114, !tbaa !943
  %17 = getelementptr inbounds %struct.parsing_context, ptr %16, i32 0, i32 1, !dbg !4115
  %18 = load ptr, ptr %17, align 8, !dbg !4115, !tbaa !3797
  %19 = call i32 @parse_ethhdr(ptr noundef %15, ptr noundef %18, ptr noundef %8), !dbg !4116
  store i32 %19, ptr %6, align 4, !dbg !4117, !tbaa !996
  %20 = load i32, ptr %6, align 4, !dbg !4118, !tbaa !996
  %21 = icmp eq i32 %20, 8, !dbg !4120
  br i1 %21, label %22, label %40, !dbg !4121

22:                                               ; preds = %2
  %23 = load ptr, ptr %5, align 8, !dbg !4122, !tbaa !943
  %24 = getelementptr inbounds %struct.packet_info, ptr %23, i32 0, i32 4, !dbg !4124
  %25 = getelementptr inbounds %struct.packet_id, ptr %24, i32 0, i32 0, !dbg !4125
  %26 = getelementptr inbounds %struct.network_tuple, ptr %25, i32 0, i32 3, !dbg !4126
  store i8 2, ptr %26, align 2, !dbg !4127, !tbaa !4128
  %27 = load ptr, ptr %4, align 8, !dbg !4129, !tbaa !943
  %28 = getelementptr inbounds %struct.parsing_context, ptr %27, i32 0, i32 2, !dbg !4130
  %29 = load ptr, ptr %4, align 8, !dbg !4131, !tbaa !943
  %30 = getelementptr inbounds %struct.parsing_context, ptr %29, i32 0, i32 1, !dbg !4132
  %31 = load ptr, ptr %30, align 8, !dbg !4132, !tbaa !3797
  %32 = load ptr, ptr %5, align 8, !dbg !4133, !tbaa !943
  %33 = getelementptr inbounds %struct.packet_info, ptr %32, i32 0, i32 0, !dbg !4134
  %34 = call i32 @parse_iphdr(ptr noundef %28, ptr noundef %31, ptr noundef %33), !dbg !4135
  %35 = trunc i32 %34 to i16, !dbg !4135
  %36 = load ptr, ptr %5, align 8, !dbg !4136, !tbaa !943
  %37 = getelementptr inbounds %struct.packet_info, ptr %36, i32 0, i32 4, !dbg !4137
  %38 = getelementptr inbounds %struct.packet_id, ptr %37, i32 0, i32 0, !dbg !4138
  %39 = getelementptr inbounds %struct.network_tuple, ptr %38, i32 0, i32 2, !dbg !4139
  store i16 %35, ptr %39, align 4, !dbg !4140, !tbaa !4141
  br label %63, !dbg !4142

40:                                               ; preds = %2
  %41 = load i32, ptr %6, align 4, !dbg !4143, !tbaa !996
  %42 = icmp eq i32 %41, 56710, !dbg !4145
  br i1 %42, label %43, label %61, !dbg !4146

43:                                               ; preds = %40
  %44 = load ptr, ptr %5, align 8, !dbg !4147, !tbaa !943
  %45 = getelementptr inbounds %struct.packet_info, ptr %44, i32 0, i32 4, !dbg !4149
  %46 = getelementptr inbounds %struct.packet_id, ptr %45, i32 0, i32 0, !dbg !4150
  %47 = getelementptr inbounds %struct.network_tuple, ptr %46, i32 0, i32 3, !dbg !4151
  store i8 10, ptr %47, align 2, !dbg !4152, !tbaa !4128
  %48 = load ptr, ptr %4, align 8, !dbg !4153, !tbaa !943
  %49 = getelementptr inbounds %struct.parsing_context, ptr %48, i32 0, i32 2, !dbg !4154
  %50 = load ptr, ptr %4, align 8, !dbg !4155, !tbaa !943
  %51 = getelementptr inbounds %struct.parsing_context, ptr %50, i32 0, i32 1, !dbg !4156
  %52 = load ptr, ptr %51, align 8, !dbg !4156, !tbaa !3797
  %53 = load ptr, ptr %5, align 8, !dbg !4157, !tbaa !943
  %54 = getelementptr inbounds %struct.packet_info, ptr %53, i32 0, i32 0, !dbg !4158
  %55 = call i32 @parse_ip6hdr(ptr noundef %49, ptr noundef %52, ptr noundef %54), !dbg !4159
  %56 = trunc i32 %55 to i16, !dbg !4159
  %57 = load ptr, ptr %5, align 8, !dbg !4160, !tbaa !943
  %58 = getelementptr inbounds %struct.packet_info, ptr %57, i32 0, i32 4, !dbg !4161
  %59 = getelementptr inbounds %struct.packet_id, ptr %58, i32 0, i32 0, !dbg !4162
  %60 = getelementptr inbounds %struct.network_tuple, ptr %59, i32 0, i32 2, !dbg !4163
  store i16 %56, ptr %60, align 4, !dbg !4164, !tbaa !4141
  br label %62, !dbg !4165

61:                                               ; preds = %40
  store i32 -1, ptr %3, align 4, !dbg !4166
  store i32 1, ptr %9, align 4
  br label %194, !dbg !4166

62:                                               ; preds = %43
  br label %63

63:                                               ; preds = %62, %22
  %64 = load volatile i8, ptr getelementptr inbounds (%struct.bpf_config, ptr @config, i32 0, i32 3), align 1, !dbg !4168, !tbaa !1042, !range !961, !noundef !962
  %65 = trunc i8 %64 to i1, !dbg !4168
  br i1 %65, label %66, label %78, !dbg !4170

66:                                               ; preds = %63
  %67 = load ptr, ptr %5, align 8, !dbg !4171, !tbaa !943
  %68 = getelementptr inbounds %struct.packet_info, ptr %67, i32 0, i32 4, !dbg !4172
  %69 = getelementptr inbounds %struct.packet_id, ptr %68, i32 0, i32 0, !dbg !4173
  %70 = getelementptr inbounds %struct.network_tuple, ptr %69, i32 0, i32 2, !dbg !4174
  %71 = load i16, ptr %70, align 4, !dbg !4174, !tbaa !4141
  %72 = zext i16 %71 to i32, !dbg !4171
  %73 = icmp eq i32 %72, 6, !dbg !4175
  br i1 %73, label %74, label %78, !dbg !4176

74:                                               ; preds = %66
  %75 = load ptr, ptr %4, align 8, !dbg !4177, !tbaa !943
  %76 = load ptr, ptr %5, align 8, !dbg !4178, !tbaa !943
  %77 = call i32 @parse_tcp_identifier(ptr noundef %75, ptr noundef %76), !dbg !4179
  store i32 %77, ptr %7, align 4, !dbg !4180, !tbaa !996
  br label %127, !dbg !4181

78:                                               ; preds = %66, %63
  %79 = load volatile i8, ptr getelementptr inbounds (%struct.bpf_config, ptr @config, i32 0, i32 4), align 2, !dbg !4182, !tbaa !1043, !range !961, !noundef !962
  %80 = trunc i8 %79 to i1, !dbg !4182
  br i1 %80, label %81, label %101, !dbg !4184

81:                                               ; preds = %78
  %82 = load ptr, ptr %5, align 8, !dbg !4185, !tbaa !943
  %83 = getelementptr inbounds %struct.packet_info, ptr %82, i32 0, i32 4, !dbg !4186
  %84 = getelementptr inbounds %struct.packet_id, ptr %83, i32 0, i32 0, !dbg !4187
  %85 = getelementptr inbounds %struct.network_tuple, ptr %84, i32 0, i32 2, !dbg !4188
  %86 = load i16, ptr %85, align 4, !dbg !4188, !tbaa !4141
  %87 = zext i16 %86 to i32, !dbg !4185
  %88 = icmp eq i32 %87, 58, !dbg !4189
  br i1 %88, label %89, label %101, !dbg !4190

89:                                               ; preds = %81
  %90 = load ptr, ptr %5, align 8, !dbg !4191, !tbaa !943
  %91 = getelementptr inbounds %struct.packet_info, ptr %90, i32 0, i32 4, !dbg !4192
  %92 = getelementptr inbounds %struct.packet_id, ptr %91, i32 0, i32 0, !dbg !4193
  %93 = getelementptr inbounds %struct.network_tuple, ptr %92, i32 0, i32 3, !dbg !4194
  %94 = load i8, ptr %93, align 2, !dbg !4194, !tbaa !4128
  %95 = zext i8 %94 to i32, !dbg !4191
  %96 = icmp eq i32 %95, 10, !dbg !4195
  br i1 %96, label %97, label %101, !dbg !4196

97:                                               ; preds = %89
  %98 = load ptr, ptr %4, align 8, !dbg !4197, !tbaa !943
  %99 = load ptr, ptr %5, align 8, !dbg !4198, !tbaa !943
  %100 = call i32 @parse_icmp6_identifier(ptr noundef %98, ptr noundef %99), !dbg !4199
  store i32 %100, ptr %7, align 4, !dbg !4200, !tbaa !996
  br label %126, !dbg !4201

101:                                              ; preds = %89, %81, %78
  %102 = load volatile i8, ptr getelementptr inbounds (%struct.bpf_config, ptr @config, i32 0, i32 4), align 2, !dbg !4202, !tbaa !1043, !range !961, !noundef !962
  %103 = trunc i8 %102 to i1, !dbg !4202
  br i1 %103, label %104, label %124, !dbg !4204

104:                                              ; preds = %101
  %105 = load ptr, ptr %5, align 8, !dbg !4205, !tbaa !943
  %106 = getelementptr inbounds %struct.packet_info, ptr %105, i32 0, i32 4, !dbg !4206
  %107 = getelementptr inbounds %struct.packet_id, ptr %106, i32 0, i32 0, !dbg !4207
  %108 = getelementptr inbounds %struct.network_tuple, ptr %107, i32 0, i32 2, !dbg !4208
  %109 = load i16, ptr %108, align 4, !dbg !4208, !tbaa !4141
  %110 = zext i16 %109 to i32, !dbg !4205
  %111 = icmp eq i32 %110, 1, !dbg !4209
  br i1 %111, label %112, label %124, !dbg !4210

112:                                              ; preds = %104
  %113 = load ptr, ptr %5, align 8, !dbg !4211, !tbaa !943
  %114 = getelementptr inbounds %struct.packet_info, ptr %113, i32 0, i32 4, !dbg !4212
  %115 = getelementptr inbounds %struct.packet_id, ptr %114, i32 0, i32 0, !dbg !4213
  %116 = getelementptr inbounds %struct.network_tuple, ptr %115, i32 0, i32 3, !dbg !4214
  %117 = load i8, ptr %116, align 2, !dbg !4214, !tbaa !4128
  %118 = zext i8 %117 to i32, !dbg !4211
  %119 = icmp eq i32 %118, 2, !dbg !4215
  br i1 %119, label %120, label %124, !dbg !4216

120:                                              ; preds = %112
  %121 = load ptr, ptr %4, align 8, !dbg !4217, !tbaa !943
  %122 = load ptr, ptr %5, align 8, !dbg !4218, !tbaa !943
  %123 = call i32 @parse_icmp_identifier(ptr noundef %121, ptr noundef %122), !dbg !4219
  store i32 %123, ptr %7, align 4, !dbg !4220, !tbaa !996
  br label %125, !dbg !4221

124:                                              ; preds = %112, %104, %101
  store i32 -1, ptr %3, align 4, !dbg !4222
  store i32 1, ptr %9, align 4
  br label %194, !dbg !4222

125:                                              ; preds = %120
  br label %126

126:                                              ; preds = %125, %97
  br label %127

127:                                              ; preds = %126, %74
  %128 = load i32, ptr %7, align 4, !dbg !4223, !tbaa !996
  %129 = icmp ne i32 %128, 0, !dbg !4223
  br i1 %129, label %130, label %131, !dbg !4225

130:                                              ; preds = %127
  store i32 -1, ptr %3, align 4, !dbg !4226
  store i32 1, ptr %9, align 4
  br label %194, !dbg !4226

131:                                              ; preds = %127
  %132 = load ptr, ptr %5, align 8, !dbg !4227, !tbaa !943
  %133 = getelementptr inbounds %struct.packet_info, ptr %132, i32 0, i32 4, !dbg !4229
  %134 = getelementptr inbounds %struct.packet_id, ptr %133, i32 0, i32 0, !dbg !4230
  %135 = getelementptr inbounds %struct.network_tuple, ptr %134, i32 0, i32 3, !dbg !4231
  %136 = load i8, ptr %135, align 2, !dbg !4231, !tbaa !4128
  %137 = zext i8 %136 to i32, !dbg !4227
  %138 = icmp eq i32 %137, 2, !dbg !4232
  br i1 %138, label %139, label %162, !dbg !4233

139:                                              ; preds = %131
  %140 = load ptr, ptr %5, align 8, !dbg !4234, !tbaa !943
  %141 = getelementptr inbounds %struct.packet_info, ptr %140, i32 0, i32 4, !dbg !4236
  %142 = getelementptr inbounds %struct.packet_id, ptr %141, i32 0, i32 0, !dbg !4237
  %143 = getelementptr inbounds %struct.network_tuple, ptr %142, i32 0, i32 0, !dbg !4238
  %144 = getelementptr inbounds %struct.flow_address, ptr %143, i32 0, i32 0, !dbg !4239
  %145 = load ptr, ptr %5, align 8, !dbg !4240, !tbaa !943
  %146 = getelementptr inbounds %struct.packet_info, ptr %145, i32 0, i32 0, !dbg !4241
  %147 = load ptr, ptr %146, align 8, !dbg !4241, !tbaa !981
  %148 = getelementptr inbounds %struct.iphdr, ptr %147, i32 0, i32 8, !dbg !4242
  %149 = getelementptr inbounds %struct.anon.9, ptr %148, i32 0, i32 0, !dbg !4242
  %150 = load i32, ptr %149, align 4, !dbg !4242, !tbaa !981
  call void @map_ipv4_to_ipv6(ptr noundef %144, i32 noundef %150), !dbg !4243
  %151 = load ptr, ptr %5, align 8, !dbg !4244, !tbaa !943
  %152 = getelementptr inbounds %struct.packet_info, ptr %151, i32 0, i32 4, !dbg !4245
  %153 = getelementptr inbounds %struct.packet_id, ptr %152, i32 0, i32 0, !dbg !4246
  %154 = getelementptr inbounds %struct.network_tuple, ptr %153, i32 0, i32 1, !dbg !4247
  %155 = getelementptr inbounds %struct.flow_address, ptr %154, i32 0, i32 0, !dbg !4248
  %156 = load ptr, ptr %5, align 8, !dbg !4249, !tbaa !943
  %157 = getelementptr inbounds %struct.packet_info, ptr %156, i32 0, i32 0, !dbg !4250
  %158 = load ptr, ptr %157, align 8, !dbg !4250, !tbaa !981
  %159 = getelementptr inbounds %struct.iphdr, ptr %158, i32 0, i32 8, !dbg !4251
  %160 = getelementptr inbounds %struct.anon.9, ptr %159, i32 0, i32 1, !dbg !4251
  %161 = load i32, ptr %160, align 4, !dbg !4251, !tbaa !981
  call void @map_ipv4_to_ipv6(ptr noundef %155, i32 noundef %161), !dbg !4252
  br label %183, !dbg !4253

162:                                              ; preds = %131
  %163 = load ptr, ptr %5, align 8, !dbg !4254, !tbaa !943
  %164 = getelementptr inbounds %struct.packet_info, ptr %163, i32 0, i32 4, !dbg !4256
  %165 = getelementptr inbounds %struct.packet_id, ptr %164, i32 0, i32 0, !dbg !4257
  %166 = getelementptr inbounds %struct.network_tuple, ptr %165, i32 0, i32 0, !dbg !4258
  %167 = getelementptr inbounds %struct.flow_address, ptr %166, i32 0, i32 0, !dbg !4259
  %168 = load ptr, ptr %5, align 8, !dbg !4260, !tbaa !943
  %169 = getelementptr inbounds %struct.packet_info, ptr %168, i32 0, i32 0, !dbg !4261
  %170 = load ptr, ptr %169, align 8, !dbg !4261, !tbaa !981
  %171 = getelementptr inbounds %struct.ipv6hdr, ptr %170, i32 0, i32 5, !dbg !4262
  %172 = getelementptr inbounds %struct.anon.12, ptr %171, i32 0, i32 0, !dbg !4262
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %167, ptr align 4 %172, i64 16, i1 false), !dbg !4262, !tbaa.struct !4263
  %173 = load ptr, ptr %5, align 8, !dbg !4264, !tbaa !943
  %174 = getelementptr inbounds %struct.packet_info, ptr %173, i32 0, i32 4, !dbg !4265
  %175 = getelementptr inbounds %struct.packet_id, ptr %174, i32 0, i32 0, !dbg !4266
  %176 = getelementptr inbounds %struct.network_tuple, ptr %175, i32 0, i32 1, !dbg !4267
  %177 = getelementptr inbounds %struct.flow_address, ptr %176, i32 0, i32 0, !dbg !4268
  %178 = load ptr, ptr %5, align 8, !dbg !4269, !tbaa !943
  %179 = getelementptr inbounds %struct.packet_info, ptr %178, i32 0, i32 0, !dbg !4270
  %180 = load ptr, ptr %179, align 8, !dbg !4270, !tbaa !981
  %181 = getelementptr inbounds %struct.ipv6hdr, ptr %180, i32 0, i32 5, !dbg !4271
  %182 = getelementptr inbounds %struct.anon.12, ptr %181, i32 0, i32 1, !dbg !4271
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %177, ptr align 4 %182, i64 16, i1 false), !dbg !4271, !tbaa.struct !4263
  br label %183

183:                                              ; preds = %162, %139
  %184 = load ptr, ptr %5, align 8, !dbg !4272, !tbaa !943
  %185 = getelementptr inbounds %struct.packet_info, ptr %184, i32 0, i32 5, !dbg !4273
  %186 = getelementptr inbounds %struct.packet_id, ptr %185, i32 0, i32 0, !dbg !4274
  %187 = load ptr, ptr %5, align 8, !dbg !4275, !tbaa !943
  %188 = getelementptr inbounds %struct.packet_info, ptr %187, i32 0, i32 4, !dbg !4276
  %189 = getelementptr inbounds %struct.packet_id, ptr %188, i32 0, i32 0, !dbg !4277
  call void @reverse_flow.3(ptr noundef %186, ptr noundef %189), !dbg !4278
  %190 = load ptr, ptr %4, align 8, !dbg !4279, !tbaa !943
  %191 = call i32 @remaining_pkt_payload(ptr noundef %190), !dbg !4280
  %192 = load ptr, ptr %5, align 8, !dbg !4281, !tbaa !943
  %193 = getelementptr inbounds %struct.packet_info, ptr %192, i32 0, i32 3, !dbg !4282
  store i32 %191, ptr %193, align 8, !dbg !4283, !tbaa !4284
  store i32 0, ptr %3, align 4, !dbg !4285
  store i32 1, ptr %9, align 4
  br label %194, !dbg !4285

194:                                              ; preds = %183, %130, %124, %61
  call void @llvm.lifetime.end.p0(i64 8, ptr %8) #14, !dbg !4286
  call void @llvm.lifetime.end.p0(i64 4, ptr %7) #14, !dbg !4286
  call void @llvm.lifetime.end.p0(i64 4, ptr %6) #14, !dbg !4286
  %195 = load i32, ptr %3, align 4, !dbg !4286
  ret i32 %195, !dbg !4286
}

; Function Attrs: nounwind
define internal ptr @update_flow(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !4287 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %5, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %5, metadata !4291, metadata !DIExpression()), !dbg !4295
  store ptr %1, ptr %6, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %6, metadata !4292, metadata !DIExpression()), !dbg !4296
  store ptr %2, ptr %7, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %7, metadata !4293, metadata !DIExpression()), !dbg !4297
  call void @llvm.lifetime.start.p0(i64 8, ptr %8) #14, !dbg !4298
  call void @llvm.dbg.declare(metadata ptr %8, metadata !4294, metadata !DIExpression()), !dbg !4299
  %10 = load ptr, ptr %7, align 8, !dbg !4300, !tbaa !943
  store i8 0, ptr %10, align 1, !dbg !4301, !tbaa !963
  %11 = load ptr, ptr @bpf_map_lookup_elem.2, align 8, !dbg !4302, !tbaa !943
  %12 = load ptr, ptr %6, align 8, !dbg !4303, !tbaa !943
  %13 = getelementptr inbounds %struct.packet_info, ptr %12, i32 0, i32 4, !dbg !4304
  %14 = getelementptr inbounds %struct.packet_id, ptr %13, i32 0, i32 0, !dbg !4305
  %15 = call ptr %11(ptr noundef @flow_state, ptr noundef %14), !dbg !4302
  store ptr %15, ptr %8, align 8, !dbg !4306, !tbaa !943
  %16 = load ptr, ptr %8, align 8, !dbg !4307, !tbaa !943
  %17 = icmp ne ptr %16, null, !dbg !4307
  br i1 %17, label %40, label %18, !dbg !4309

18:                                               ; preds = %3
  %19 = load ptr, ptr %6, align 8, !dbg !4310, !tbaa !943
  %20 = getelementptr inbounds %struct.packet_info, ptr %19, i32 0, i32 6, !dbg !4311
  %21 = load i8, ptr %20, align 4, !dbg !4311, !tbaa !4312, !range !961, !noundef !962
  %22 = trunc i8 %21 to i1, !dbg !4311
  br i1 %22, label %23, label %40, !dbg !4313

23:                                               ; preds = %18
  %24 = load ptr, ptr %6, align 8, !dbg !4314, !tbaa !943
  %25 = getelementptr inbounds %struct.packet_info, ptr %24, i32 0, i32 8, !dbg !4315
  %26 = load i8, ptr %25, align 2, !dbg !4315, !tbaa !4316
  %27 = zext i8 %26 to i32, !dbg !4314
  %28 = icmp eq i32 %27, 2, !dbg !4317
  br i1 %28, label %40, label %29, !dbg !4318

29:                                               ; preds = %23
  %30 = load ptr, ptr %6, align 8, !dbg !4319, !tbaa !943
  %31 = getelementptr inbounds %struct.packet_info, ptr %30, i32 0, i32 8, !dbg !4320
  %32 = load i8, ptr %31, align 2, !dbg !4320, !tbaa !4316
  %33 = zext i8 %32 to i32, !dbg !4319
  %34 = icmp eq i32 %33, 3, !dbg !4321
  br i1 %34, label %40, label %35, !dbg !4322

35:                                               ; preds = %29
  %36 = load ptr, ptr %7, align 8, !dbg !4323, !tbaa !943
  store i8 1, ptr %36, align 1, !dbg !4325, !tbaa !963
  %37 = load ptr, ptr %5, align 8, !dbg !4326, !tbaa !943
  %38 = load ptr, ptr %6, align 8, !dbg !4327, !tbaa !943
  %39 = call ptr @create_flow(ptr noundef %37, ptr noundef %38), !dbg !4328
  store ptr %39, ptr %8, align 8, !dbg !4329, !tbaa !943
  br label %40, !dbg !4330

40:                                               ; preds = %35, %29, %23, %18, %3
  %41 = load ptr, ptr %8, align 8, !dbg !4331, !tbaa !943
  %42 = icmp ne ptr %41, null, !dbg !4331
  br i1 %42, label %44, label %43, !dbg !4333

43:                                               ; preds = %40
  store ptr null, ptr %4, align 8, !dbg !4334
  store i32 1, ptr %9, align 4
  br label %58, !dbg !4334

44:                                               ; preds = %40
  %45 = load ptr, ptr %8, align 8, !dbg !4335, !tbaa !943
  %46 = getelementptr inbounds %struct.flow_state, ptr %45, i32 0, i32 3, !dbg !4336
  %47 = load i64, ptr %46, align 8, !dbg !4337, !tbaa !4338
  %48 = add i64 %47, 1, !dbg !4337
  store i64 %48, ptr %46, align 8, !dbg !4337, !tbaa !4338
  %49 = load ptr, ptr %6, align 8, !dbg !4339, !tbaa !943
  %50 = getelementptr inbounds %struct.packet_info, ptr %49, i32 0, i32 3, !dbg !4340
  %51 = load i32, ptr %50, align 8, !dbg !4340, !tbaa !4284
  %52 = zext i32 %51 to i64, !dbg !4339
  %53 = load ptr, ptr %8, align 8, !dbg !4341, !tbaa !943
  %54 = getelementptr inbounds %struct.flow_state, ptr %53, i32 0, i32 4, !dbg !4342
  %55 = load i64, ptr %54, align 8, !dbg !4343, !tbaa !4344
  %56 = add i64 %55, %52, !dbg !4343
  store i64 %56, ptr %54, align 8, !dbg !4343, !tbaa !4344
  %57 = load ptr, ptr %8, align 8, !dbg !4345, !tbaa !943
  store ptr %57, ptr %4, align 8, !dbg !4346
  store i32 1, ptr %9, align 4
  br label %58, !dbg !4346

58:                                               ; preds = %44, %43
  call void @llvm.lifetime.end.p0(i64 8, ptr %8) #14, !dbg !4347
  %59 = load ptr, ptr %4, align 8, !dbg !4347
  ret ptr %59, !dbg !4347
}

; Function Attrs: nounwind
define internal void @pping_timestamp_packet(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3, i1 noundef zeroext %4) #0 !dbg !4348 {
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca ptr, align 8
  %10 = alloca i8, align 1
  store ptr %0, ptr %6, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %6, metadata !4352, metadata !DIExpression()), !dbg !4357
  store ptr %1, ptr %7, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %7, metadata !4353, metadata !DIExpression()), !dbg !4358
  store ptr %2, ptr %8, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %8, metadata !4354, metadata !DIExpression()), !dbg !4359
  store ptr %3, ptr %9, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %9, metadata !4355, metadata !DIExpression()), !dbg !4360
  %11 = zext i1 %4 to i8
  store i8 %11, ptr %10, align 1, !tbaa !963
  call void @llvm.dbg.declare(metadata ptr %10, metadata !4356, metadata !DIExpression()), !dbg !4361
  %12 = load ptr, ptr %6, align 8, !dbg !4362, !tbaa !943
  %13 = icmp ne ptr %12, null, !dbg !4362
  br i1 %13, label %14, label %19, !dbg !4364

14:                                               ; preds = %5
  %15 = load ptr, ptr %9, align 8, !dbg !4365, !tbaa !943
  %16 = getelementptr inbounds %struct.packet_info, ptr %15, i32 0, i32 6, !dbg !4366
  %17 = load i8, ptr %16, align 4, !dbg !4366, !tbaa !4312, !range !961, !noundef !962
  %18 = trunc i8 %17 to i1, !dbg !4366
  br i1 %18, label %20, label %19, !dbg !4367

19:                                               ; preds = %14, %5
  br label %93, !dbg !4368

20:                                               ; preds = %14
  %21 = load volatile i8, ptr getelementptr inbounds (%struct.bpf_config, ptr @config, i32 0, i32 5), align 1, !dbg !4369, !tbaa !1044, !range !961, !noundef !962
  %22 = trunc i8 %21 to i1, !dbg !4369
  br i1 %22, label %23, label %34, !dbg !4371

23:                                               ; preds = %20
  %24 = load ptr, ptr %8, align 8, !dbg !4372, !tbaa !943
  %25 = getelementptr inbounds %struct.parsing_context, ptr %24, i32 0, i32 5, !dbg !4373
  %26 = load i8, ptr %25, align 8, !dbg !4373, !tbaa !3806, !range !961, !noundef !962
  %27 = trunc i8 %26 to i1, !dbg !4373
  br i1 %27, label %34, label %28, !dbg !4374

28:                                               ; preds = %23
  %29 = load ptr, ptr %9, align 8, !dbg !4375, !tbaa !943
  %30 = load ptr, ptr %7, align 8, !dbg !4376, !tbaa !943
  %31 = load ptr, ptr %8, align 8, !dbg !4377, !tbaa !943
  %32 = call i1 @is_local_address(ptr noundef %29, ptr noundef %30, ptr noundef %31), !dbg !4378
  br i1 %32, label %33, label %34, !dbg !4379

33:                                               ; preds = %28
  br label %93, !dbg !4380

34:                                               ; preds = %28, %23, %20
  %35 = load i8, ptr %10, align 1, !dbg !4381, !tbaa !963, !range !961, !noundef !962
  %36 = trunc i8 %35 to i1, !dbg !4381
  br i1 %36, label %47, label %37, !dbg !4383

37:                                               ; preds = %34
  %38 = load ptr, ptr %6, align 8, !dbg !4384, !tbaa !943
  %39 = getelementptr inbounds %struct.flow_state, ptr %38, i32 0, i32 7, !dbg !4385
  %40 = load i32, ptr %39, align 8, !dbg !4385, !tbaa !4386
  %41 = load ptr, ptr %9, align 8, !dbg !4387, !tbaa !943
  %42 = getelementptr inbounds %struct.packet_info, ptr %41, i32 0, i32 4, !dbg !4388
  %43 = getelementptr inbounds %struct.packet_id, ptr %42, i32 0, i32 1, !dbg !4389
  %44 = load i32, ptr %43, align 4, !dbg !4389, !tbaa !4390
  %45 = icmp eq i32 %40, %44, !dbg !4391
  br i1 %45, label %46, label %47, !dbg !4392

46:                                               ; preds = %37
  br label %93, !dbg !4393

47:                                               ; preds = %37, %34
  %48 = load ptr, ptr %9, align 8, !dbg !4394, !tbaa !943
  %49 = getelementptr inbounds %struct.packet_info, ptr %48, i32 0, i32 4, !dbg !4395
  %50 = getelementptr inbounds %struct.packet_id, ptr %49, i32 0, i32 1, !dbg !4396
  %51 = load i32, ptr %50, align 4, !dbg !4396, !tbaa !4390
  %52 = load ptr, ptr %6, align 8, !dbg !4397, !tbaa !943
  %53 = getelementptr inbounds %struct.flow_state, ptr %52, i32 0, i32 7, !dbg !4398
  store i32 %51, ptr %53, align 8, !dbg !4399, !tbaa !4386
  %54 = load i8, ptr %10, align 1, !dbg !4400, !tbaa !963, !range !961, !noundef !962
  %55 = trunc i8 %54 to i1, !dbg !4400
  br i1 %55, label %77, label %56, !dbg !4402

56:                                               ; preds = %47
  %57 = load ptr, ptr %9, align 8, !dbg !4403, !tbaa !943
  %58 = getelementptr inbounds %struct.packet_info, ptr %57, i32 0, i32 2, !dbg !4404
  %59 = load i64, ptr %58, align 8, !dbg !4404, !tbaa !4109
  %60 = load ptr, ptr %6, align 8, !dbg !4405, !tbaa !943
  %61 = getelementptr inbounds %struct.flow_state, ptr %60, i32 0, i32 2, !dbg !4406
  %62 = load i64, ptr %61, align 8, !dbg !4406, !tbaa !2889
  %63 = load volatile i8, ptr getelementptr inbounds (%struct.bpf_config, ptr @config, i32 0, i32 2), align 8, !dbg !4407, !tbaa !1041, !range !961, !noundef !962
  %64 = trunc i8 %63 to i1, !dbg !4407
  br i1 %64, label %65, label %69, !dbg !4408

65:                                               ; preds = %56
  %66 = load ptr, ptr %6, align 8, !dbg !4409, !tbaa !943
  %67 = getelementptr inbounds %struct.flow_state, ptr %66, i32 0, i32 1, !dbg !4410
  %68 = load i64, ptr %67, align 8, !dbg !4410, !tbaa !4411
  br label %73, !dbg !4408

69:                                               ; preds = %56
  %70 = load ptr, ptr %6, align 8, !dbg !4412, !tbaa !943
  %71 = getelementptr inbounds %struct.flow_state, ptr %70, i32 0, i32 0, !dbg !4413
  %72 = load i64, ptr %71, align 8, !dbg !4413, !tbaa !4414
  br label %73, !dbg !4408

73:                                               ; preds = %69, %65
  %74 = phi i64 [ %68, %65 ], [ %72, %69 ], !dbg !4408
  %75 = call i1 @is_rate_limited(i64 noundef %59, i64 noundef %62, i64 noundef %74), !dbg !4415
  br i1 %75, label %76, label %77, !dbg !4416

76:                                               ; preds = %73
  br label %93, !dbg !4417

77:                                               ; preds = %73, %47
  %78 = load ptr, ptr %9, align 8, !dbg !4418, !tbaa !943
  %79 = getelementptr inbounds %struct.packet_info, ptr %78, i32 0, i32 2, !dbg !4419
  %80 = load i64, ptr %79, align 8, !dbg !4419, !tbaa !4109
  %81 = load ptr, ptr %6, align 8, !dbg !4420, !tbaa !943
  %82 = getelementptr inbounds %struct.flow_state, ptr %81, i32 0, i32 2, !dbg !4421
  store i64 %80, ptr %82, align 8, !dbg !4422, !tbaa !2889
  %83 = load ptr, ptr @bpf_map_update_elem, align 8, !dbg !4423, !tbaa !943
  %84 = load ptr, ptr %9, align 8, !dbg !4425, !tbaa !943
  %85 = getelementptr inbounds %struct.packet_info, ptr %84, i32 0, i32 4, !dbg !4426
  %86 = load ptr, ptr %9, align 8, !dbg !4427, !tbaa !943
  %87 = getelementptr inbounds %struct.packet_info, ptr %86, i32 0, i32 2, !dbg !4428
  %88 = call i64 %83(ptr noundef @packet_ts, ptr noundef %85, ptr noundef %87, i64 noundef 1), !dbg !4423
  %89 = icmp ne i64 %88, 0, !dbg !4429
  br i1 %89, label %90, label %93, !dbg !4430

90:                                               ; preds = %77
  %91 = load ptr, ptr %7, align 8, !dbg !4431, !tbaa !943
  %92 = load ptr, ptr %9, align 8, !dbg !4432, !tbaa !943
  call void @send_map_full_event(ptr noundef %91, ptr noundef %92, i8 noundef zeroext 1), !dbg !4433
  br label %93, !dbg !4433

93:                                               ; preds = %90, %77, %76, %46, %33, %19
  ret void, !dbg !4434
}

; Function Attrs: nounwind
define internal ptr @update_rev_flow(ptr noundef %0, ptr noundef %1) #0 !dbg !4435 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %4, metadata !4439, metadata !DIExpression()), !dbg !4442
  store ptr %1, ptr %5, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %5, metadata !4440, metadata !DIExpression()), !dbg !4443
  call void @llvm.lifetime.start.p0(i64 8, ptr %6) #14, !dbg !4444
  call void @llvm.dbg.declare(metadata ptr %6, metadata !4441, metadata !DIExpression()), !dbg !4445
  %8 = load ptr, ptr @bpf_map_lookup_elem.2, align 8, !dbg !4446, !tbaa !943
  %9 = load ptr, ptr %5, align 8, !dbg !4447, !tbaa !943
  %10 = getelementptr inbounds %struct.packet_info, ptr %9, i32 0, i32 5, !dbg !4448
  %11 = getelementptr inbounds %struct.packet_id, ptr %10, i32 0, i32 0, !dbg !4449
  %12 = call ptr %8(ptr noundef @flow_state, ptr noundef %11), !dbg !4446
  store ptr %12, ptr %6, align 8, !dbg !4450, !tbaa !943
  %13 = load ptr, ptr %6, align 8, !dbg !4451, !tbaa !943
  %14 = icmp ne ptr %13, null, !dbg !4451
  br i1 %14, label %16, label %15, !dbg !4453

15:                                               ; preds = %2
  store ptr null, ptr %3, align 8, !dbg !4454
  store i32 1, ptr %7, align 4
  br label %47, !dbg !4454

16:                                               ; preds = %2
  %17 = load ptr, ptr %6, align 8, !dbg !4455, !tbaa !943
  %18 = getelementptr inbounds %struct.flow_state, ptr %17, i32 0, i32 8, !dbg !4457
  %19 = load i8, ptr %18, align 4, !dbg !4457, !tbaa !2905, !range !961, !noundef !962
  %20 = trunc i8 %19 to i1, !dbg !4457
  br i1 %20, label %33, label %21, !dbg !4458

21:                                               ; preds = %16
  %22 = load ptr, ptr %5, align 8, !dbg !4459, !tbaa !943
  %23 = getelementptr inbounds %struct.packet_info, ptr %22, i32 0, i32 8, !dbg !4460
  %24 = load i8, ptr %23, align 2, !dbg !4460, !tbaa !4316
  %25 = zext i8 %24 to i32, !dbg !4459
  %26 = icmp ne i32 %25, 3, !dbg !4461
  br i1 %26, label %27, label %33, !dbg !4462

27:                                               ; preds = %21
  %28 = load ptr, ptr %6, align 8, !dbg !4463, !tbaa !943
  %29 = getelementptr inbounds %struct.flow_state, ptr %28, i32 0, i32 8, !dbg !4465
  store i8 1, ptr %29, align 4, !dbg !4466, !tbaa !2905
  %30 = load ptr, ptr %4, align 8, !dbg !4467, !tbaa !943
  %31 = load ptr, ptr %5, align 8, !dbg !4468, !tbaa !943
  %32 = load ptr, ptr %6, align 8, !dbg !4469, !tbaa !943
  call void @send_flow_open_event(ptr noundef %30, ptr noundef %31, ptr noundef %32), !dbg !4470
  br label %33, !dbg !4471

33:                                               ; preds = %27, %21, %16
  %34 = load ptr, ptr %6, align 8, !dbg !4472, !tbaa !943
  %35 = getelementptr inbounds %struct.flow_state, ptr %34, i32 0, i32 5, !dbg !4473
  %36 = load i64, ptr %35, align 8, !dbg !4474, !tbaa !4475
  %37 = add i64 %36, 1, !dbg !4474
  store i64 %37, ptr %35, align 8, !dbg !4474, !tbaa !4475
  %38 = load ptr, ptr %5, align 8, !dbg !4476, !tbaa !943
  %39 = getelementptr inbounds %struct.packet_info, ptr %38, i32 0, i32 3, !dbg !4477
  %40 = load i32, ptr %39, align 8, !dbg !4477, !tbaa !4284
  %41 = zext i32 %40 to i64, !dbg !4476
  %42 = load ptr, ptr %6, align 8, !dbg !4478, !tbaa !943
  %43 = getelementptr inbounds %struct.flow_state, ptr %42, i32 0, i32 6, !dbg !4479
  %44 = load i64, ptr %43, align 8, !dbg !4480, !tbaa !4481
  %45 = add i64 %44, %41, !dbg !4480
  store i64 %45, ptr %43, align 8, !dbg !4480, !tbaa !4481
  %46 = load ptr, ptr %6, align 8, !dbg !4482, !tbaa !943
  store ptr %46, ptr %3, align 8, !dbg !4483
  store i32 1, ptr %7, align 4
  br label %47, !dbg !4483

47:                                               ; preds = %33, %15
  call void @llvm.lifetime.end.p0(i64 8, ptr %6) #14, !dbg !4484
  %48 = load ptr, ptr %3, align 8, !dbg !4484
  ret ptr %48, !dbg !4484
}

; Function Attrs: nounwind
define internal void @pping_match_packet(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 !dbg !4485 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca %struct.rtt_event, align 8
  %10 = alloca ptr, align 8
  %11 = alloca i32, align 4
  store ptr %0, ptr %5, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %5, metadata !4489, metadata !DIExpression()), !dbg !4509
  store ptr %1, ptr %6, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %6, metadata !4490, metadata !DIExpression()), !dbg !4510
  store ptr %2, ptr %7, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %7, metadata !4491, metadata !DIExpression()), !dbg !4511
  store ptr %3, ptr %8, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %8, metadata !4492, metadata !DIExpression()), !dbg !4512
  call void @llvm.lifetime.start.p0(i64 120, ptr %9) #14, !dbg !4513
  call void @llvm.dbg.declare(metadata ptr %9, metadata !4493, metadata !DIExpression()), !dbg !4514
  call void @llvm.memset.p0.i64(ptr align 8 %9, i8 0, i64 120, i1 false), !dbg !4514
  call void @llvm.lifetime.start.p0(i64 8, ptr %10) #14, !dbg !4515
  call void @llvm.dbg.declare(metadata ptr %10, metadata !4508, metadata !DIExpression()), !dbg !4516
  %12 = load ptr, ptr %5, align 8, !dbg !4517, !tbaa !943
  %13 = icmp ne ptr %12, null, !dbg !4517
  br i1 %13, label %14, label %19, !dbg !4519

14:                                               ; preds = %4
  %15 = load ptr, ptr %8, align 8, !dbg !4520, !tbaa !943
  %16 = getelementptr inbounds %struct.packet_info, ptr %15, i32 0, i32 7, !dbg !4521
  %17 = load i8, ptr %16, align 1, !dbg !4521, !tbaa !4522, !range !961, !noundef !962
  %18 = trunc i8 %17 to i1, !dbg !4521
  br i1 %18, label %20, label %19, !dbg !4523

19:                                               ; preds = %14, %4
  store i32 1, ptr %11, align 4
  br label %110, !dbg !4524

20:                                               ; preds = %14
  %21 = load ptr, ptr @bpf_map_lookup_elem.2, align 8, !dbg !4525, !tbaa !943
  %22 = load ptr, ptr %8, align 8, !dbg !4526, !tbaa !943
  %23 = getelementptr inbounds %struct.packet_info, ptr %22, i32 0, i32 5, !dbg !4527
  %24 = call ptr %21(ptr noundef @packet_ts, ptr noundef %23), !dbg !4525
  store ptr %24, ptr %10, align 8, !dbg !4528, !tbaa !943
  %25 = load ptr, ptr %10, align 8, !dbg !4529, !tbaa !943
  %26 = icmp ne ptr %25, null, !dbg !4529
  br i1 %26, label %27, label %34, !dbg !4531

27:                                               ; preds = %20
  %28 = load ptr, ptr %8, align 8, !dbg !4532, !tbaa !943
  %29 = getelementptr inbounds %struct.packet_info, ptr %28, i32 0, i32 2, !dbg !4533
  %30 = load i64, ptr %29, align 8, !dbg !4533, !tbaa !4109
  %31 = load ptr, ptr %10, align 8, !dbg !4534, !tbaa !943
  %32 = load i64, ptr %31, align 8, !dbg !4535, !tbaa !1764
  %33 = icmp ult i64 %30, %32, !dbg !4536
  br i1 %33, label %34, label %35, !dbg !4537

34:                                               ; preds = %27, %20
  store i32 1, ptr %11, align 4
  br label %110, !dbg !4538

35:                                               ; preds = %27
  %36 = load ptr, ptr %8, align 8, !dbg !4539, !tbaa !943
  %37 = getelementptr inbounds %struct.packet_info, ptr %36, i32 0, i32 2, !dbg !4540
  %38 = load i64, ptr %37, align 8, !dbg !4540, !tbaa !4109
  %39 = load ptr, ptr %10, align 8, !dbg !4541, !tbaa !943
  %40 = load i64, ptr %39, align 8, !dbg !4542, !tbaa !1764
  %41 = sub i64 %38, %40, !dbg !4543
  %42 = getelementptr inbounds %struct.rtt_event, ptr %9, i32 0, i32 4, !dbg !4544
  store i64 %41, ptr %42, align 8, !dbg !4545, !tbaa !1771
  %43 = load ptr, ptr @bpf_map_delete_elem.1, align 8, !dbg !4546, !tbaa !943
  %44 = load ptr, ptr %8, align 8, !dbg !4547, !tbaa !943
  %45 = getelementptr inbounds %struct.packet_info, ptr %44, i32 0, i32 5, !dbg !4548
  %46 = call i64 %43(ptr noundef @packet_ts, ptr noundef %45), !dbg !4546
  %47 = load ptr, ptr %5, align 8, !dbg !4549, !tbaa !943
  %48 = getelementptr inbounds %struct.flow_state, ptr %47, i32 0, i32 0, !dbg !4551
  %49 = load i64, ptr %48, align 8, !dbg !4551, !tbaa !4414
  %50 = icmp eq i64 %49, 0, !dbg !4552
  br i1 %50, label %58, label %51, !dbg !4553

51:                                               ; preds = %35
  %52 = getelementptr inbounds %struct.rtt_event, ptr %9, i32 0, i32 4, !dbg !4554
  %53 = load i64, ptr %52, align 8, !dbg !4554, !tbaa !1771
  %54 = load ptr, ptr %5, align 8, !dbg !4555, !tbaa !943
  %55 = getelementptr inbounds %struct.flow_state, ptr %54, i32 0, i32 0, !dbg !4556
  %56 = load i64, ptr %55, align 8, !dbg !4556, !tbaa !4414
  %57 = icmp ult i64 %53, %56, !dbg !4557
  br i1 %57, label %58, label %63, !dbg !4558

58:                                               ; preds = %51, %35
  %59 = getelementptr inbounds %struct.rtt_event, ptr %9, i32 0, i32 4, !dbg !4559
  %60 = load i64, ptr %59, align 8, !dbg !4559, !tbaa !1771
  %61 = load ptr, ptr %5, align 8, !dbg !4560, !tbaa !943
  %62 = getelementptr inbounds %struct.flow_state, ptr %61, i32 0, i32 0, !dbg !4561
  store i64 %60, ptr %62, align 8, !dbg !4562, !tbaa !4414
  br label %63, !dbg !4560

63:                                               ; preds = %58, %51
  %64 = load ptr, ptr %5, align 8, !dbg !4563, !tbaa !943
  %65 = getelementptr inbounds %struct.flow_state, ptr %64, i32 0, i32 1, !dbg !4564
  %66 = load i64, ptr %65, align 8, !dbg !4564, !tbaa !4411
  %67 = getelementptr inbounds %struct.rtt_event, ptr %9, i32 0, i32 4, !dbg !4565
  %68 = load i64, ptr %67, align 8, !dbg !4565, !tbaa !1771
  %69 = call i64 @calculate_srtt(i64 noundef %66, i64 noundef %68), !dbg !4566
  %70 = load ptr, ptr %5, align 8, !dbg !4567, !tbaa !943
  %71 = getelementptr inbounds %struct.flow_state, ptr %70, i32 0, i32 1, !dbg !4568
  store i64 %69, ptr %71, align 8, !dbg !4569, !tbaa !4411
  %72 = getelementptr inbounds %struct.rtt_event, ptr %9, i32 0, i32 0, !dbg !4570
  store i64 2, ptr %72, align 8, !dbg !4571, !tbaa !4572
  %73 = load ptr, ptr %8, align 8, !dbg !4573, !tbaa !943
  %74 = getelementptr inbounds %struct.packet_info, ptr %73, i32 0, i32 2, !dbg !4574
  %75 = load i64, ptr %74, align 8, !dbg !4574, !tbaa !4109
  %76 = getelementptr inbounds %struct.rtt_event, ptr %9, i32 0, i32 1, !dbg !4575
  store i64 %75, ptr %76, align 8, !dbg !4576, !tbaa !1757
  %77 = load ptr, ptr %5, align 8, !dbg !4577, !tbaa !943
  %78 = getelementptr inbounds %struct.flow_state, ptr %77, i32 0, i32 0, !dbg !4578
  %79 = load i64, ptr %78, align 8, !dbg !4578, !tbaa !4414
  %80 = getelementptr inbounds %struct.rtt_event, ptr %9, i32 0, i32 5, !dbg !4579
  store i64 %79, ptr %80, align 8, !dbg !4580, !tbaa !1778
  %81 = load ptr, ptr %5, align 8, !dbg !4581, !tbaa !943
  %82 = getelementptr inbounds %struct.flow_state, ptr %81, i32 0, i32 3, !dbg !4582
  %83 = load i64, ptr %82, align 8, !dbg !4582, !tbaa !4338
  %84 = getelementptr inbounds %struct.rtt_event, ptr %9, i32 0, i32 6, !dbg !4583
  store i64 %83, ptr %84, align 8, !dbg !4584, !tbaa !3416
  %85 = load ptr, ptr %5, align 8, !dbg !4585, !tbaa !943
  %86 = getelementptr inbounds %struct.flow_state, ptr %85, i32 0, i32 4, !dbg !4586
  %87 = load i64, ptr %86, align 8, !dbg !4586, !tbaa !4344
  %88 = getelementptr inbounds %struct.rtt_event, ptr %9, i32 0, i32 7, !dbg !4587
  store i64 %87, ptr %88, align 8, !dbg !4588, !tbaa !3421
  %89 = load ptr, ptr %5, align 8, !dbg !4589, !tbaa !943
  %90 = getelementptr inbounds %struct.flow_state, ptr %89, i32 0, i32 5, !dbg !4590
  %91 = load i64, ptr %90, align 8, !dbg !4590, !tbaa !4475
  %92 = getelementptr inbounds %struct.rtt_event, ptr %9, i32 0, i32 8, !dbg !4591
  store i64 %91, ptr %92, align 8, !dbg !4592, !tbaa !3426
  %93 = load ptr, ptr %5, align 8, !dbg !4593, !tbaa !943
  %94 = getelementptr inbounds %struct.flow_state, ptr %93, i32 0, i32 6, !dbg !4594
  %95 = load i64, ptr %94, align 8, !dbg !4594, !tbaa !4481
  %96 = getelementptr inbounds %struct.rtt_event, ptr %9, i32 0, i32 9, !dbg !4595
  store i64 %95, ptr %96, align 8, !dbg !4596, !tbaa !3431
  %97 = getelementptr inbounds %struct.rtt_event, ptr %9, i32 0, i32 2, !dbg !4597
  %98 = load ptr, ptr %8, align 8, !dbg !4598, !tbaa !943
  %99 = getelementptr inbounds %struct.packet_info, ptr %98, i32 0, i32 4, !dbg !4599
  %100 = getelementptr inbounds %struct.packet_id, ptr %99, i32 0, i32 0, !dbg !4600
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %97, ptr align 4 %100, i64 44, i1 false), !dbg !4600, !tbaa.struct !4601
  %101 = load ptr, ptr %7, align 8, !dbg !4602, !tbaa !943
  %102 = getelementptr inbounds %struct.parsing_context, ptr %101, i32 0, i32 5, !dbg !4603
  %103 = load i8, ptr %102, align 8, !dbg !4603, !tbaa !3806, !range !961, !noundef !962
  %104 = trunc i8 %103 to i1, !dbg !4603
  %105 = getelementptr inbounds %struct.rtt_event, ptr %9, i32 0, i32 10, !dbg !4604
  %106 = zext i1 %104 to i8, !dbg !4605
  store i8 %106, ptr %105, align 8, !dbg !4605, !tbaa !3436
  %107 = load ptr, ptr @bpf_perf_event_output, align 8, !dbg !4606, !tbaa !943
  %108 = load ptr, ptr %6, align 8, !dbg !4607, !tbaa !943
  %109 = call i64 %107(ptr noundef %108, ptr noundef @events, i64 noundef 4294967295, ptr noundef %9, i64 noundef 120), !dbg !4606
  store i32 0, ptr %11, align 4, !dbg !4608
  br label %110, !dbg !4608

110:                                              ; preds = %63, %34, %19
  call void @llvm.lifetime.end.p0(i64 8, ptr %10) #14, !dbg !4608
  call void @llvm.lifetime.end.p0(i64 120, ptr %9) #14, !dbg !4608
  %111 = load i32, ptr %11, align 4
  switch i32 %111, label %113 [
    i32 0, label %112
    i32 1, label %112
  ]

112:                                              ; preds = %110, %110
  ret void, !dbg !4608

113:                                              ; preds = %110
  unreachable
}

; Function Attrs: nounwind
define internal void @delete_closed_flows(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 !dbg !4609 {
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i8, align 1
  store ptr %0, ptr %5, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %5, metadata !4613, metadata !DIExpression()), !dbg !4618
  store ptr %1, ptr %6, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %6, metadata !4614, metadata !DIExpression()), !dbg !4619
  store ptr %2, ptr %7, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %7, metadata !4615, metadata !DIExpression()), !dbg !4620
  store ptr %3, ptr %8, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %8, metadata !4616, metadata !DIExpression()), !dbg !4621
  call void @llvm.lifetime.start.p0(i64 1, ptr %9) #14, !dbg !4622
  call void @llvm.dbg.declare(metadata ptr %9, metadata !4617, metadata !DIExpression()), !dbg !4623
  %10 = load ptr, ptr %7, align 8, !dbg !4624, !tbaa !943
  %11 = icmp ne ptr %10, null, !dbg !4624
  br i1 %11, label %12, label %43, !dbg !4626

12:                                               ; preds = %4
  %13 = load ptr, ptr %6, align 8, !dbg !4627, !tbaa !943
  %14 = getelementptr inbounds %struct.packet_info, ptr %13, i32 0, i32 8, !dbg !4628
  %15 = load i8, ptr %14, align 2, !dbg !4628, !tbaa !4316
  %16 = zext i8 %15 to i32, !dbg !4627
  %17 = icmp eq i32 %16, 2, !dbg !4629
  br i1 %17, label %24, label %18, !dbg !4630

18:                                               ; preds = %12
  %19 = load ptr, ptr %6, align 8, !dbg !4631, !tbaa !943
  %20 = getelementptr inbounds %struct.packet_info, ptr %19, i32 0, i32 8, !dbg !4632
  %21 = load i8, ptr %20, align 2, !dbg !4632, !tbaa !4316
  %22 = zext i8 %21 to i32, !dbg !4631
  %23 = icmp eq i32 %22, 3, !dbg !4633
  br i1 %23, label %24, label %43, !dbg !4634

24:                                               ; preds = %18, %12
  %25 = load ptr, ptr %7, align 8, !dbg !4635, !tbaa !943
  %26 = getelementptr inbounds %struct.flow_state, ptr %25, i32 0, i32 8, !dbg !4637
  %27 = load i8, ptr %26, align 4, !dbg !4637, !tbaa !2905, !range !961, !noundef !962
  %28 = trunc i8 %27 to i1, !dbg !4637
  %29 = zext i1 %28 to i8, !dbg !4638
  store i8 %29, ptr %9, align 1, !dbg !4638, !tbaa !963
  %30 = load ptr, ptr @bpf_map_delete_elem.1, align 8, !dbg !4639, !tbaa !943
  %31 = load ptr, ptr %6, align 8, !dbg !4641, !tbaa !943
  %32 = getelementptr inbounds %struct.packet_info, ptr %31, i32 0, i32 4, !dbg !4642
  %33 = getelementptr inbounds %struct.packet_id, ptr %32, i32 0, i32 0, !dbg !4643
  %34 = call i64 %30(ptr noundef @flow_state, ptr noundef %33), !dbg !4639
  %35 = icmp ne i64 %34, 0, !dbg !4639
  br i1 %35, label %42, label %36, !dbg !4644

36:                                               ; preds = %24
  %37 = load i8, ptr %9, align 1, !dbg !4645, !tbaa !963, !range !961, !noundef !962
  %38 = trunc i8 %37 to i1, !dbg !4645
  br i1 %38, label %39, label %42, !dbg !4646

39:                                               ; preds = %36
  %40 = load ptr, ptr %5, align 8, !dbg !4647, !tbaa !943
  %41 = load ptr, ptr %6, align 8, !dbg !4648, !tbaa !943
  call void @send_flow_event(ptr noundef %40, ptr noundef %41, i1 noundef zeroext false), !dbg !4649
  br label %42, !dbg !4649

42:                                               ; preds = %39, %36, %24
  br label %43, !dbg !4650

43:                                               ; preds = %42, %18, %4
  %44 = load ptr, ptr %8, align 8, !dbg !4651, !tbaa !943
  %45 = icmp ne ptr %44, null, !dbg !4651
  br i1 %45, label %46, label %71, !dbg !4653

46:                                               ; preds = %43
  %47 = load ptr, ptr %6, align 8, !dbg !4654, !tbaa !943
  %48 = getelementptr inbounds %struct.packet_info, ptr %47, i32 0, i32 8, !dbg !4655
  %49 = load i8, ptr %48, align 2, !dbg !4655, !tbaa !4316
  %50 = zext i8 %49 to i32, !dbg !4654
  %51 = icmp eq i32 %50, 3, !dbg !4656
  br i1 %51, label %52, label %71, !dbg !4657

52:                                               ; preds = %46
  %53 = load ptr, ptr %8, align 8, !dbg !4658, !tbaa !943
  %54 = getelementptr inbounds %struct.flow_state, ptr %53, i32 0, i32 8, !dbg !4660
  %55 = load i8, ptr %54, align 4, !dbg !4660, !tbaa !2905, !range !961, !noundef !962
  %56 = trunc i8 %55 to i1, !dbg !4660
  %57 = zext i1 %56 to i8, !dbg !4661
  store i8 %57, ptr %9, align 1, !dbg !4661, !tbaa !963
  %58 = load ptr, ptr @bpf_map_delete_elem.1, align 8, !dbg !4662, !tbaa !943
  %59 = load ptr, ptr %6, align 8, !dbg !4664, !tbaa !943
  %60 = getelementptr inbounds %struct.packet_info, ptr %59, i32 0, i32 5, !dbg !4665
  %61 = getelementptr inbounds %struct.packet_id, ptr %60, i32 0, i32 0, !dbg !4666
  %62 = call i64 %58(ptr noundef @flow_state, ptr noundef %61), !dbg !4662
  %63 = icmp ne i64 %62, 0, !dbg !4662
  br i1 %63, label %70, label %64, !dbg !4667

64:                                               ; preds = %52
  %65 = load i8, ptr %9, align 1, !dbg !4668, !tbaa !963, !range !961, !noundef !962
  %66 = trunc i8 %65 to i1, !dbg !4668
  br i1 %66, label %67, label %70, !dbg !4669

67:                                               ; preds = %64
  %68 = load ptr, ptr %5, align 8, !dbg !4670, !tbaa !943
  %69 = load ptr, ptr %6, align 8, !dbg !4671, !tbaa !943
  call void @send_flow_event(ptr noundef %68, ptr noundef %69, i1 noundef zeroext true), !dbg !4672
  br label %70, !dbg !4672

70:                                               ; preds = %67, %64, %52
  br label %71, !dbg !4673

71:                                               ; preds = %70, %46, %43
  call void @llvm.lifetime.end.p0(i64 1, ptr %9) #14, !dbg !4674
  ret void, !dbg !4674
}

; Function Attrs: nounwind
define internal void @send_flow_event(ptr noundef %0, ptr noundef %1, i1 noundef zeroext %2) #0 !dbg !4675 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i8, align 1
  %7 = alloca %struct.flow_event, align 8
  store ptr %0, ptr %4, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %4, metadata !4679, metadata !DIExpression()), !dbg !4692
  store ptr %1, ptr %5, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %5, metadata !4680, metadata !DIExpression()), !dbg !4693
  %8 = zext i1 %2 to i8
  store i8 %8, ptr %6, align 1, !tbaa !963
  call void @llvm.dbg.declare(metadata ptr %6, metadata !4681, metadata !DIExpression()), !dbg !4694
  call void @llvm.lifetime.start.p0(i64 64, ptr %7) #14, !dbg !4695
  call void @llvm.dbg.declare(metadata ptr %7, metadata !4682, metadata !DIExpression()), !dbg !4696
  %9 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 0, !dbg !4697
  store i64 1, ptr %9, align 8, !dbg !4697, !tbaa !2910
  %10 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 1, !dbg !4697
  %11 = load ptr, ptr %5, align 8, !dbg !4698, !tbaa !943
  %12 = getelementptr inbounds %struct.packet_info, ptr %11, i32 0, i32 2, !dbg !4699
  %13 = load i64, ptr %12, align 8, !dbg !4699, !tbaa !4109
  store i64 %13, ptr %10, align 8, !dbg !4697, !tbaa !2915
  %14 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 2, !dbg !4697
  call void @llvm.memset.p0.i64(ptr align 8 %14, i8 0, i64 44, i1 false), !dbg !4697
  %15 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 3, !dbg !4697
  %16 = load ptr, ptr %5, align 8, !dbg !4700, !tbaa !943
  %17 = getelementptr inbounds %struct.packet_info, ptr %16, i32 0, i32 8, !dbg !4701
  %18 = load i8, ptr %17, align 2, !dbg !4701, !tbaa !4316
  store i8 %18, ptr %15, align 4, !dbg !4697, !tbaa !2921
  %19 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 4, !dbg !4697
  %20 = load ptr, ptr %5, align 8, !dbg !4702, !tbaa !943
  %21 = getelementptr inbounds %struct.packet_info, ptr %20, i32 0, i32 9, !dbg !4703
  %22 = load i8, ptr %21, align 1, !dbg !4703, !tbaa !4704
  store i8 %22, ptr %19, align 1, !dbg !4697, !tbaa !2924
  %23 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 5, !dbg !4697
  store i8 0, ptr %23, align 2, !dbg !4697, !tbaa !2927
  %24 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 6, !dbg !4697
  store i8 0, ptr %24, align 1, !dbg !4697, !tbaa !4705
  %25 = load i8, ptr %6, align 1, !dbg !4706, !tbaa !963, !range !961, !noundef !962
  %26 = trunc i8 %25 to i1, !dbg !4706
  br i1 %26, label %27, label %33, !dbg !4708

27:                                               ; preds = %3
  %28 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 2, !dbg !4709
  %29 = load ptr, ptr %5, align 8, !dbg !4711, !tbaa !943
  %30 = getelementptr inbounds %struct.packet_info, ptr %29, i32 0, i32 4, !dbg !4712
  %31 = getelementptr inbounds %struct.packet_id, ptr %30, i32 0, i32 0, !dbg !4713
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %28, ptr align 4 %31, i64 44, i1 false), !dbg !4713, !tbaa.struct !4601
  %32 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 5, !dbg !4714
  store i8 0, ptr %32, align 2, !dbg !4715, !tbaa !2927
  br label %39, !dbg !4716

33:                                               ; preds = %3
  %34 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 2, !dbg !4717
  %35 = load ptr, ptr %5, align 8, !dbg !4719, !tbaa !943
  %36 = getelementptr inbounds %struct.packet_info, ptr %35, i32 0, i32 5, !dbg !4720
  %37 = getelementptr inbounds %struct.packet_id, ptr %36, i32 0, i32 0, !dbg !4721
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %34, ptr align 4 %37, i64 44, i1 false), !dbg !4721, !tbaa.struct !4601
  %38 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 5, !dbg !4722
  store i8 1, ptr %38, align 2, !dbg !4723, !tbaa !2927
  br label %39

39:                                               ; preds = %33, %27
  %40 = load ptr, ptr @bpf_perf_event_output, align 8, !dbg !4724, !tbaa !943
  %41 = load ptr, ptr %4, align 8, !dbg !4725, !tbaa !943
  %42 = call i64 %40(ptr noundef %41, ptr noundef @events, i64 noundef 4294967295, ptr noundef %7, i64 noundef 64), !dbg !4724
  call void @llvm.lifetime.end.p0(i64 64, ptr %7) #14, !dbg !4726
  ret void, !dbg !4726
}

; Function Attrs: nounwind
define internal i64 @calculate_srtt(i64 noundef %0, i64 noundef %1) #0 !dbg !4727 {
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  store i64 %0, ptr %4, align 8, !tbaa !1764
  call void @llvm.dbg.declare(metadata ptr %4, metadata !4731, metadata !DIExpression()), !dbg !4733
  store i64 %1, ptr %5, align 8, !tbaa !1764
  call void @llvm.dbg.declare(metadata ptr %5, metadata !4732, metadata !DIExpression()), !dbg !4734
  %6 = load i64, ptr %4, align 8, !dbg !4735, !tbaa !1764
  %7 = icmp ne i64 %6, 0, !dbg !4735
  br i1 %7, label %10, label %8, !dbg !4737

8:                                                ; preds = %2
  %9 = load i64, ptr %5, align 8, !dbg !4738, !tbaa !1764
  store i64 %9, ptr %3, align 8, !dbg !4739
  br label %18, !dbg !4739

10:                                               ; preds = %2
  %11 = load i64, ptr %4, align 8, !dbg !4740, !tbaa !1764
  %12 = load i64, ptr %4, align 8, !dbg !4741, !tbaa !1764
  %13 = lshr i64 %12, 3, !dbg !4742
  %14 = sub i64 %11, %13, !dbg !4743
  %15 = load i64, ptr %5, align 8, !dbg !4744, !tbaa !1764
  %16 = lshr i64 %15, 3, !dbg !4745
  %17 = add i64 %14, %16, !dbg !4746
  store i64 %17, ptr %3, align 8, !dbg !4747
  br label %18, !dbg !4747

18:                                               ; preds = %10, %8
  %19 = load i64, ptr %3, align 8, !dbg !4748
  ret i64 %19, !dbg !4748
}

; Function Attrs: nounwind
define internal void @send_flow_open_event(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !4749 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca %struct.flow_event, align 8
  store ptr %0, ptr %4, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %4, metadata !4753, metadata !DIExpression()), !dbg !4757
  store ptr %1, ptr %5, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %5, metadata !4754, metadata !DIExpression()), !dbg !4758
  store ptr %2, ptr %6, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %6, metadata !4755, metadata !DIExpression()), !dbg !4759
  call void @llvm.lifetime.start.p0(i64 64, ptr %7) #14, !dbg !4760
  call void @llvm.dbg.declare(metadata ptr %7, metadata !4756, metadata !DIExpression()), !dbg !4761
  %8 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 0, !dbg !4762
  store i64 1, ptr %8, align 8, !dbg !4762, !tbaa !2910
  %9 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 1, !dbg !4762
  %10 = load ptr, ptr %6, align 8, !dbg !4763, !tbaa !943
  %11 = getelementptr inbounds %struct.flow_state, ptr %10, i32 0, i32 2, !dbg !4764
  %12 = load i64, ptr %11, align 8, !dbg !4764, !tbaa !2889
  store i64 %12, ptr %9, align 8, !dbg !4762, !tbaa !2915
  %13 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 2, !dbg !4762
  %14 = load ptr, ptr %5, align 8, !dbg !4765, !tbaa !943
  %15 = getelementptr inbounds %struct.packet_info, ptr %14, i32 0, i32 4, !dbg !4766
  %16 = getelementptr inbounds %struct.packet_id, ptr %15, i32 0, i32 0, !dbg !4767
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %13, ptr align 4 %16, i64 44, i1 false), !dbg !4767, !tbaa.struct !4601
  %17 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 3, !dbg !4762
  store i8 1, ptr %17, align 4, !dbg !4762, !tbaa !2921
  %18 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 4, !dbg !4762
  %19 = load ptr, ptr %6, align 8, !dbg !4768, !tbaa !943
  %20 = getelementptr inbounds %struct.flow_state, ptr %19, i32 0, i32 9, !dbg !4769
  %21 = load i8, ptr %20, align 1, !dbg !4769, !tbaa !4770
  store i8 %21, ptr %18, align 1, !dbg !4762, !tbaa !2924
  %22 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 5, !dbg !4762
  store i8 1, ptr %22, align 2, !dbg !4762, !tbaa !2927
  %23 = getelementptr inbounds %struct.flow_event, ptr %7, i32 0, i32 6, !dbg !4762
  store i8 0, ptr %23, align 1, !dbg !4762, !tbaa !4705
  %24 = load ptr, ptr @bpf_perf_event_output, align 8, !dbg !4771, !tbaa !943
  %25 = load ptr, ptr %4, align 8, !dbg !4772, !tbaa !943
  %26 = call i64 %24(ptr noundef %25, ptr noundef @events, i64 noundef 4294967295, ptr noundef %7, i64 noundef 64), !dbg !4771
  call void @llvm.lifetime.end.p0(i64 64, ptr %7) #14, !dbg !4773
  ret void, !dbg !4773
}

; Function Attrs: nounwind
define internal i1 @is_local_address(ptr noundef %0, ptr noundef %1, ptr noundef %2) #0 !dbg !4774 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i32, align 4
  %8 = alloca %struct.bpf_fib_lookup, align 4
  %9 = alloca ptr, align 8
  %10 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %4, metadata !4778, metadata !DIExpression()), !dbg !4788
  store ptr %1, ptr %5, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %5, metadata !4779, metadata !DIExpression()), !dbg !4789
  store ptr %2, ptr %6, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %6, metadata !4780, metadata !DIExpression()), !dbg !4790
  call void @llvm.lifetime.start.p0(i64 4, ptr %7) #14, !dbg !4791
  call void @llvm.dbg.declare(metadata ptr %7, metadata !4781, metadata !DIExpression()), !dbg !4792
  call void @llvm.lifetime.start.p0(i64 64, ptr %8) #14, !dbg !4793
  call void @llvm.dbg.declare(metadata ptr %8, metadata !4782, metadata !DIExpression()), !dbg !4794
  call void @llvm.memset.p0.i64(ptr align 4 %8, i8 0, i64 64, i1 false), !dbg !4795
  %11 = load ptr, ptr %6, align 8, !dbg !4796, !tbaa !943
  %12 = getelementptr inbounds %struct.parsing_context, ptr %11, i32 0, i32 4, !dbg !4797
  %13 = load i32, ptr %12, align 4, !dbg !4797, !tbaa !3805
  %14 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %8, i32 0, i32 5, !dbg !4798
  store i32 %13, ptr %14, align 4, !dbg !4799, !tbaa !4800
  %15 = load ptr, ptr %4, align 8, !dbg !4802, !tbaa !943
  %16 = getelementptr inbounds %struct.packet_info, ptr %15, i32 0, i32 4, !dbg !4803
  %17 = getelementptr inbounds %struct.packet_id, ptr %16, i32 0, i32 0, !dbg !4804
  %18 = getelementptr inbounds %struct.network_tuple, ptr %17, i32 0, i32 3, !dbg !4805
  %19 = load i8, ptr %18, align 2, !dbg !4805, !tbaa !4128
  %20 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %8, i32 0, i32 0, !dbg !4806
  store i8 %19, ptr %20, align 4, !dbg !4807, !tbaa !4808
  %21 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %8, i32 0, i32 0, !dbg !4809
  %22 = load i8, ptr %21, align 4, !dbg !4809, !tbaa !4808
  %23 = zext i8 %22 to i32, !dbg !4810
  %24 = icmp eq i32 %23, 2, !dbg !4811
  br i1 %24, label %25, label %86, !dbg !4812

25:                                               ; preds = %3
  %26 = load ptr, ptr %4, align 8, !dbg !4813, !tbaa !943
  %27 = getelementptr inbounds %struct.packet_info, ptr %26, i32 0, i32 0, !dbg !4815
  %28 = load ptr, ptr %27, align 8, !dbg !4815, !tbaa !981
  %29 = getelementptr inbounds %struct.iphdr, ptr %28, i32 0, i32 1, !dbg !4816
  %30 = load i8, ptr %29, align 1, !dbg !4816, !tbaa !4817
  %31 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %8, i32 0, i32 6, !dbg !4819
  store i8 %30, ptr %31, align 4, !dbg !4820, !tbaa !981
  %32 = load ptr, ptr %4, align 8, !dbg !4821, !tbaa !943
  %33 = getelementptr inbounds %struct.packet_info, ptr %32, i32 0, i32 0, !dbg !4821
  %34 = load ptr, ptr %33, align 8, !dbg !4821, !tbaa !981
  %35 = getelementptr inbounds %struct.iphdr, ptr %34, i32 0, i32 2, !dbg !4821
  %36 = load i16, ptr %35, align 2, !dbg !4821, !tbaa !4822
  %37 = call i1 @llvm.is.constant.i16(i16 %36), !dbg !4821
  br i1 %37, label %38, label %60, !dbg !4821

38:                                               ; preds = %25
  %39 = load ptr, ptr %4, align 8, !dbg !4821, !tbaa !943
  %40 = getelementptr inbounds %struct.packet_info, ptr %39, i32 0, i32 0, !dbg !4821
  %41 = load ptr, ptr %40, align 8, !dbg !4821, !tbaa !981
  %42 = getelementptr inbounds %struct.iphdr, ptr %41, i32 0, i32 2, !dbg !4821
  %43 = load i16, ptr %42, align 2, !dbg !4821, !tbaa !4822
  %44 = zext i16 %43 to i32, !dbg !4821
  %45 = shl i32 %44, 8, !dbg !4821
  %46 = ashr i32 %45, 8, !dbg !4821
  %47 = shl i32 %46, 8, !dbg !4821
  %48 = load ptr, ptr %4, align 8, !dbg !4821, !tbaa !943
  %49 = getelementptr inbounds %struct.packet_info, ptr %48, i32 0, i32 0, !dbg !4821
  %50 = load ptr, ptr %49, align 8, !dbg !4821, !tbaa !981
  %51 = getelementptr inbounds %struct.iphdr, ptr %50, i32 0, i32 2, !dbg !4821
  %52 = load i16, ptr %51, align 2, !dbg !4821, !tbaa !4822
  %53 = zext i16 %52 to i32, !dbg !4821
  %54 = shl i32 %53, 0, !dbg !4821
  %55 = ashr i32 %54, 8, !dbg !4821
  %56 = shl i32 %55, 0, !dbg !4821
  %57 = or i32 %47, %56, !dbg !4821
  %58 = trunc i32 %57 to i16, !dbg !4821
  %59 = zext i16 %58 to i32, !dbg !4821
  br label %68, !dbg !4821

60:                                               ; preds = %25
  %61 = load ptr, ptr %4, align 8, !dbg !4821, !tbaa !943
  %62 = getelementptr inbounds %struct.packet_info, ptr %61, i32 0, i32 0, !dbg !4821
  %63 = load ptr, ptr %62, align 8, !dbg !4821, !tbaa !981
  %64 = getelementptr inbounds %struct.iphdr, ptr %63, i32 0, i32 2, !dbg !4821
  %65 = load i16, ptr %64, align 2, !dbg !4821, !tbaa !4822
  %66 = call i16 @llvm.bswap.i16(i16 %65), !dbg !4821
  %67 = zext i16 %66 to i32, !dbg !4821
  br label %68, !dbg !4821

68:                                               ; preds = %60, %38
  %69 = phi i32 [ %59, %38 ], [ %67, %60 ], !dbg !4821
  %70 = trunc i32 %69 to i16, !dbg !4821
  %71 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %8, i32 0, i32 4, !dbg !4823
  store i16 %70, ptr %71, align 2, !dbg !4824, !tbaa !4825
  %72 = load ptr, ptr %4, align 8, !dbg !4826, !tbaa !943
  %73 = getelementptr inbounds %struct.packet_info, ptr %72, i32 0, i32 0, !dbg !4827
  %74 = load ptr, ptr %73, align 8, !dbg !4827, !tbaa !981
  %75 = getelementptr inbounds %struct.iphdr, ptr %74, i32 0, i32 8, !dbg !4828
  %76 = getelementptr inbounds %struct.anon.9, ptr %75, i32 0, i32 0, !dbg !4828
  %77 = load i32, ptr %76, align 4, !dbg !4828, !tbaa !981
  %78 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %8, i32 0, i32 7, !dbg !4829
  store i32 %77, ptr %78, align 4, !dbg !4830, !tbaa !981
  %79 = load ptr, ptr %4, align 8, !dbg !4831, !tbaa !943
  %80 = getelementptr inbounds %struct.packet_info, ptr %79, i32 0, i32 0, !dbg !4832
  %81 = load ptr, ptr %80, align 8, !dbg !4832, !tbaa !981
  %82 = getelementptr inbounds %struct.iphdr, ptr %81, i32 0, i32 8, !dbg !4833
  %83 = getelementptr inbounds %struct.anon.9, ptr %82, i32 0, i32 1, !dbg !4833
  %84 = load i32, ptr %83, align 4, !dbg !4833, !tbaa !981
  %85 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %8, i32 0, i32 8, !dbg !4834
  store i32 %84, ptr %85, align 4, !dbg !4835, !tbaa !981
  br label %155, !dbg !4836

86:                                               ; preds = %3
  %87 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %8, i32 0, i32 0, !dbg !4837
  %88 = load i8, ptr %87, align 4, !dbg !4837, !tbaa !4808
  %89 = zext i8 %88 to i32, !dbg !4838
  %90 = icmp eq i32 %89, 10, !dbg !4839
  br i1 %90, label %91, label %154, !dbg !4840

91:                                               ; preds = %86
  call void @llvm.lifetime.start.p0(i64 8, ptr %9) #14, !dbg !4841
  call void @llvm.dbg.declare(metadata ptr %9, metadata !4783, metadata !DIExpression()), !dbg !4842
  %92 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %8, i32 0, i32 7, !dbg !4843
  %93 = getelementptr inbounds [4 x i32], ptr %92, i64 0, i64 0, !dbg !4844
  store ptr %93, ptr %9, align 8, !dbg !4842, !tbaa !943
  call void @llvm.lifetime.start.p0(i64 8, ptr %10) #14, !dbg !4845
  call void @llvm.dbg.declare(metadata ptr %10, metadata !4787, metadata !DIExpression()), !dbg !4846
  %94 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %8, i32 0, i32 8, !dbg !4847
  %95 = getelementptr inbounds [4 x i32], ptr %94, i64 0, i64 0, !dbg !4848
  store ptr %95, ptr %10, align 8, !dbg !4846, !tbaa !943
  %96 = load ptr, ptr %4, align 8, !dbg !4849, !tbaa !943
  %97 = getelementptr inbounds %struct.packet_info, ptr %96, i32 0, i32 0, !dbg !4850
  %98 = load ptr, ptr %97, align 8, !dbg !4850, !tbaa !981
  %99 = load i32, ptr %98, align 4, !dbg !4851, !tbaa !996
  %100 = and i32 %99, -241, !dbg !4852
  %101 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %8, i32 0, i32 6, !dbg !4853
  store i32 %100, ptr %101, align 4, !dbg !4854, !tbaa !981
  %102 = load ptr, ptr %4, align 8, !dbg !4855, !tbaa !943
  %103 = getelementptr inbounds %struct.packet_info, ptr %102, i32 0, i32 0, !dbg !4855
  %104 = load ptr, ptr %103, align 8, !dbg !4855, !tbaa !981
  %105 = getelementptr inbounds %struct.ipv6hdr, ptr %104, i32 0, i32 2, !dbg !4855
  %106 = load i16, ptr %105, align 4, !dbg !4855, !tbaa !4856
  %107 = call i1 @llvm.is.constant.i16(i16 %106), !dbg !4855
  br i1 %107, label %108, label %130, !dbg !4855

108:                                              ; preds = %91
  %109 = load ptr, ptr %4, align 8, !dbg !4855, !tbaa !943
  %110 = getelementptr inbounds %struct.packet_info, ptr %109, i32 0, i32 0, !dbg !4855
  %111 = load ptr, ptr %110, align 8, !dbg !4855, !tbaa !981
  %112 = getelementptr inbounds %struct.ipv6hdr, ptr %111, i32 0, i32 2, !dbg !4855
  %113 = load i16, ptr %112, align 4, !dbg !4855, !tbaa !4856
  %114 = zext i16 %113 to i32, !dbg !4855
  %115 = shl i32 %114, 8, !dbg !4855
  %116 = ashr i32 %115, 8, !dbg !4855
  %117 = shl i32 %116, 8, !dbg !4855
  %118 = load ptr, ptr %4, align 8, !dbg !4855, !tbaa !943
  %119 = getelementptr inbounds %struct.packet_info, ptr %118, i32 0, i32 0, !dbg !4855
  %120 = load ptr, ptr %119, align 8, !dbg !4855, !tbaa !981
  %121 = getelementptr inbounds %struct.ipv6hdr, ptr %120, i32 0, i32 2, !dbg !4855
  %122 = load i16, ptr %121, align 4, !dbg !4855, !tbaa !4856
  %123 = zext i16 %122 to i32, !dbg !4855
  %124 = shl i32 %123, 0, !dbg !4855
  %125 = ashr i32 %124, 8, !dbg !4855
  %126 = shl i32 %125, 0, !dbg !4855
  %127 = or i32 %117, %126, !dbg !4855
  %128 = trunc i32 %127 to i16, !dbg !4855
  %129 = zext i16 %128 to i32, !dbg !4855
  br label %138, !dbg !4855

130:                                              ; preds = %91
  %131 = load ptr, ptr %4, align 8, !dbg !4855, !tbaa !943
  %132 = getelementptr inbounds %struct.packet_info, ptr %131, i32 0, i32 0, !dbg !4855
  %133 = load ptr, ptr %132, align 8, !dbg !4855, !tbaa !981
  %134 = getelementptr inbounds %struct.ipv6hdr, ptr %133, i32 0, i32 2, !dbg !4855
  %135 = load i16, ptr %134, align 4, !dbg !4855, !tbaa !4856
  %136 = call i16 @llvm.bswap.i16(i16 %135), !dbg !4855
  %137 = zext i16 %136 to i32, !dbg !4855
  br label %138, !dbg !4855

138:                                              ; preds = %130, %108
  %139 = phi i32 [ %129, %108 ], [ %137, %130 ], !dbg !4855
  %140 = trunc i32 %139 to i16, !dbg !4855
  %141 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %8, i32 0, i32 4, !dbg !4858
  store i16 %140, ptr %141, align 2, !dbg !4859, !tbaa !4825
  %142 = load ptr, ptr %9, align 8, !dbg !4860, !tbaa !943
  %143 = load ptr, ptr %4, align 8, !dbg !4861, !tbaa !943
  %144 = getelementptr inbounds %struct.packet_info, ptr %143, i32 0, i32 4, !dbg !4862
  %145 = getelementptr inbounds %struct.packet_id, ptr %144, i32 0, i32 0, !dbg !4863
  %146 = getelementptr inbounds %struct.network_tuple, ptr %145, i32 0, i32 0, !dbg !4864
  %147 = getelementptr inbounds %struct.flow_address, ptr %146, i32 0, i32 0, !dbg !4865
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %142, ptr align 4 %147, i64 16, i1 false), !dbg !4865, !tbaa.struct !4263
  %148 = load ptr, ptr %10, align 8, !dbg !4866, !tbaa !943
  %149 = load ptr, ptr %4, align 8, !dbg !4867, !tbaa !943
  %150 = getelementptr inbounds %struct.packet_info, ptr %149, i32 0, i32 4, !dbg !4868
  %151 = getelementptr inbounds %struct.packet_id, ptr %150, i32 0, i32 0, !dbg !4869
  %152 = getelementptr inbounds %struct.network_tuple, ptr %151, i32 0, i32 1, !dbg !4870
  %153 = getelementptr inbounds %struct.flow_address, ptr %152, i32 0, i32 0, !dbg !4871
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %148, ptr align 4 %153, i64 16, i1 false), !dbg !4871, !tbaa.struct !4263
  call void @llvm.lifetime.end.p0(i64 8, ptr %10) #14, !dbg !4872
  call void @llvm.lifetime.end.p0(i64 8, ptr %9) #14, !dbg !4872
  br label %154, !dbg !4873

154:                                              ; preds = %138, %86
  br label %155

155:                                              ; preds = %154, %68
  %156 = load ptr, ptr %4, align 8, !dbg !4874, !tbaa !943
  %157 = getelementptr inbounds %struct.packet_info, ptr %156, i32 0, i32 4, !dbg !4875
  %158 = getelementptr inbounds %struct.packet_id, ptr %157, i32 0, i32 0, !dbg !4876
  %159 = getelementptr inbounds %struct.network_tuple, ptr %158, i32 0, i32 2, !dbg !4877
  %160 = load i16, ptr %159, align 4, !dbg !4877, !tbaa !4141
  %161 = trunc i16 %160 to i8, !dbg !4874
  %162 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %8, i32 0, i32 1, !dbg !4878
  store i8 %161, ptr %162, align 1, !dbg !4879, !tbaa !4880
  %163 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %8, i32 0, i32 2, !dbg !4881
  store i16 0, ptr %163, align 2, !dbg !4882, !tbaa !4883
  %164 = getelementptr inbounds %struct.bpf_fib_lookup, ptr %8, i32 0, i32 3, !dbg !4884
  store i16 0, ptr %164, align 4, !dbg !4885, !tbaa !4886
  %165 = load ptr, ptr @bpf_fib_lookup, align 8, !dbg !4887, !tbaa !943
  %166 = load ptr, ptr %5, align 8, !dbg !4888, !tbaa !943
  %167 = call i64 %165(ptr noundef %166, ptr noundef %8, i32 noundef 64, i32 noundef 0), !dbg !4887
  %168 = trunc i64 %167 to i32, !dbg !4887
  store i32 %168, ptr %7, align 4, !dbg !4889, !tbaa !996
  %169 = load i32, ptr %7, align 4, !dbg !4890, !tbaa !996
  %170 = icmp eq i32 %169, 4, !dbg !4891
  br i1 %170, label %174, label %171, !dbg !4892

171:                                              ; preds = %155
  %172 = load i32, ptr %7, align 4, !dbg !4893, !tbaa !996
  %173 = icmp eq i32 %172, 5, !dbg !4894
  br label %174, !dbg !4892

174:                                              ; preds = %171, %155
  %175 = phi i1 [ true, %155 ], [ %173, %171 ]
  call void @llvm.lifetime.end.p0(i64 64, ptr %8) #14, !dbg !4895
  call void @llvm.lifetime.end.p0(i64 4, ptr %7) #14, !dbg !4895
  ret i1 %175, !dbg !4896
}

; Function Attrs: nounwind
define internal i1 @is_rate_limited(i64 noundef %0, i64 noundef %1, i64 noundef %2) #0 !dbg !4897 {
  %4 = alloca i1, align 1
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i64, align 8
  store i64 %0, ptr %5, align 8, !tbaa !1764
  call void @llvm.dbg.declare(metadata ptr %5, metadata !4901, metadata !DIExpression()), !dbg !4904
  store i64 %1, ptr %6, align 8, !tbaa !1764
  call void @llvm.dbg.declare(metadata ptr %6, metadata !4902, metadata !DIExpression()), !dbg !4905
  store i64 %2, ptr %7, align 8, !tbaa !1764
  call void @llvm.dbg.declare(metadata ptr %7, metadata !4903, metadata !DIExpression()), !dbg !4906
  %8 = load i64, ptr %5, align 8, !dbg !4907, !tbaa !1764
  %9 = load i64, ptr %6, align 8, !dbg !4909, !tbaa !1764
  %10 = icmp ult i64 %8, %9, !dbg !4910
  br i1 %10, label %11, label %12, !dbg !4911

11:                                               ; preds = %3
  store i1 true, ptr %4, align 1, !dbg !4912
  br label %33, !dbg !4912

12:                                               ; preds = %3
  %13 = load volatile i64, ptr getelementptr inbounds (%struct.bpf_config, ptr @config, i32 0, i32 1), align 8, !dbg !4913, !tbaa !1040
  %14 = icmp ne i64 %13, 0, !dbg !4915
  br i1 %14, label %15, label %27, !dbg !4916

15:                                               ; preds = %12
  %16 = load i64, ptr %7, align 8, !dbg !4917, !tbaa !1764
  %17 = icmp ne i64 %16, 0, !dbg !4917
  br i1 %17, label %18, label %27, !dbg !4918

18:                                               ; preds = %15
  %19 = load i64, ptr %5, align 8, !dbg !4919, !tbaa !1764
  %20 = load i64, ptr %6, align 8, !dbg !4920, !tbaa !1764
  %21 = sub i64 %19, %20, !dbg !4921
  %22 = load volatile i64, ptr getelementptr inbounds (%struct.bpf_config, ptr @config, i32 0, i32 1), align 8, !dbg !4922, !tbaa !1040
  %23 = load i64, ptr %7, align 8, !dbg !4922, !tbaa !1764
  %24 = mul i64 %22, %23, !dbg !4922
  %25 = lshr i64 %24, 16, !dbg !4922
  %26 = icmp ult i64 %21, %25, !dbg !4923
  store i1 %26, ptr %4, align 1, !dbg !4924
  br label %33, !dbg !4924

27:                                               ; preds = %15, %12
  %28 = load i64, ptr %5, align 8, !dbg !4925, !tbaa !1764
  %29 = load i64, ptr %6, align 8, !dbg !4926, !tbaa !1764
  %30 = sub i64 %28, %29, !dbg !4927
  %31 = load volatile i64, ptr @config, align 8, !dbg !4928, !tbaa !1039
  %32 = icmp ult i64 %30, %31, !dbg !4929
  store i1 %32, ptr %4, align 1, !dbg !4930
  br label %33, !dbg !4930

33:                                               ; preds = %27, %18, %11
  %34 = load i1, ptr %4, align 1, !dbg !4931
  ret i1 %34, !dbg !4931
}

; Function Attrs: nounwind
define internal void @send_map_full_event(ptr noundef %0, ptr noundef %1, i8 noundef zeroext %2) #0 !dbg !4932 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca i8, align 1
  %7 = alloca %struct.map_full_event, align 8
  %8 = alloca i32, align 4
  store ptr %0, ptr %4, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %4, metadata !4936, metadata !DIExpression()), !dbg !4947
  store ptr %1, ptr %5, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %5, metadata !4937, metadata !DIExpression()), !dbg !4948
  store i8 %2, ptr %6, align 1, !tbaa !981
  call void @llvm.dbg.declare(metadata ptr %6, metadata !4938, metadata !DIExpression()), !dbg !4949
  call void @llvm.lifetime.start.p0(i64 64, ptr %7) #14, !dbg !4950
  call void @llvm.dbg.declare(metadata ptr %7, metadata !4939, metadata !DIExpression()), !dbg !4951
  %9 = load ptr, ptr %5, align 8, !dbg !4952, !tbaa !943
  %10 = getelementptr inbounds %struct.packet_info, ptr %9, i32 0, i32 2, !dbg !4954
  %11 = load i64, ptr %10, align 8, !dbg !4954, !tbaa !4109
  %12 = load i8, ptr %6, align 1, !dbg !4955, !tbaa !981
  %13 = zext i8 %12 to i64, !dbg !4956
  %14 = getelementptr inbounds [2 x i64], ptr @last_warn_time, i64 0, i64 %13, !dbg !4956
  %15 = load volatile i64, ptr %14, align 8, !dbg !4956, !tbaa !1764
  %16 = icmp ult i64 %11, %15, !dbg !4957
  br i1 %16, label %27, label %17, !dbg !4958

17:                                               ; preds = %3
  %18 = load ptr, ptr %5, align 8, !dbg !4959, !tbaa !943
  %19 = getelementptr inbounds %struct.packet_info, ptr %18, i32 0, i32 2, !dbg !4960
  %20 = load i64, ptr %19, align 8, !dbg !4960, !tbaa !4109
  %21 = load i8, ptr %6, align 1, !dbg !4961, !tbaa !981
  %22 = zext i8 %21 to i64, !dbg !4962
  %23 = getelementptr inbounds [2 x i64], ptr @last_warn_time, i64 0, i64 %22, !dbg !4962
  %24 = load volatile i64, ptr %23, align 8, !dbg !4962, !tbaa !1764
  %25 = sub i64 %20, %24, !dbg !4963
  %26 = icmp ult i64 %25, 1000000000, !dbg !4964
  br i1 %26, label %27, label %28, !dbg !4965

27:                                               ; preds = %17, %3
  store i32 1, ptr %8, align 4
  br label %49, !dbg !4966

28:                                               ; preds = %17
  %29 = load ptr, ptr %5, align 8, !dbg !4967, !tbaa !943
  %30 = getelementptr inbounds %struct.packet_info, ptr %29, i32 0, i32 2, !dbg !4968
  %31 = load i64, ptr %30, align 8, !dbg !4968, !tbaa !4109
  %32 = load i8, ptr %6, align 1, !dbg !4969, !tbaa !981
  %33 = zext i8 %32 to i64, !dbg !4970
  %34 = getelementptr inbounds [2 x i64], ptr @last_warn_time, i64 0, i64 %33, !dbg !4970
  store volatile i64 %31, ptr %34, align 8, !dbg !4971, !tbaa !1764
  call void @llvm.memset.p0.i64(ptr align 8 %7, i8 0, i64 64, i1 false), !dbg !4972
  %35 = getelementptr inbounds %struct.map_full_event, ptr %7, i32 0, i32 0, !dbg !4973
  store i64 3, ptr %35, align 8, !dbg !4974, !tbaa !4975
  %36 = load ptr, ptr %5, align 8, !dbg !4976, !tbaa !943
  %37 = getelementptr inbounds %struct.packet_info, ptr %36, i32 0, i32 2, !dbg !4977
  %38 = load i64, ptr %37, align 8, !dbg !4977, !tbaa !4109
  %39 = getelementptr inbounds %struct.map_full_event, ptr %7, i32 0, i32 1, !dbg !4978
  store i64 %38, ptr %39, align 8, !dbg !4979, !tbaa !2363
  %40 = getelementptr inbounds %struct.map_full_event, ptr %7, i32 0, i32 2, !dbg !4980
  %41 = load ptr, ptr %5, align 8, !dbg !4981, !tbaa !943
  %42 = getelementptr inbounds %struct.packet_info, ptr %41, i32 0, i32 4, !dbg !4982
  %43 = getelementptr inbounds %struct.packet_id, ptr %42, i32 0, i32 0, !dbg !4983
  call void @llvm.memcpy.p0.p0.i64(ptr align 8 %40, ptr align 4 %43, i64 44, i1 false), !dbg !4983, !tbaa.struct !4601
  %44 = load i8, ptr %6, align 1, !dbg !4984, !tbaa !981
  %45 = getelementptr inbounds %struct.map_full_event, ptr %7, i32 0, i32 3, !dbg !4985
  store i8 %44, ptr %45, align 4, !dbg !4986, !tbaa !2369
  %46 = load ptr, ptr @bpf_perf_event_output, align 8, !dbg !4987, !tbaa !943
  %47 = load ptr, ptr %4, align 8, !dbg !4988, !tbaa !943
  %48 = call i64 %46(ptr noundef %47, ptr noundef @events, i64 noundef 4294967295, ptr noundef %7, i64 noundef 64), !dbg !4987
  store i32 0, ptr %8, align 4, !dbg !4989
  br label %49, !dbg !4989

49:                                               ; preds = %28, %27
  call void @llvm.lifetime.end.p0(i64 64, ptr %7) #14, !dbg !4989
  %50 = load i32, ptr %8, align 4
  switch i32 %50, label %52 [
    i32 0, label %51
    i32 1, label %51
  ]

51:                                               ; preds = %49, %49
  ret void, !dbg !4989

52:                                               ; preds = %49
  unreachable
}

; Function Attrs: convergent nocallback nofree nosync nounwind willreturn memory(none)
declare i1 @llvm.is.constant.i16(i16) #12

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare i16 @llvm.bswap.i16(i16) #1

; Function Attrs: nounwind
define internal ptr @create_flow(ptr noundef %0, ptr noundef %1) #0 !dbg !4990 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca %struct.flow_state, align 8
  %7 = alloca i32, align 4
  store ptr %0, ptr %4, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %4, metadata !4992, metadata !DIExpression()), !dbg !4995
  store ptr %1, ptr %5, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %5, metadata !4993, metadata !DIExpression()), !dbg !4996
  call void @llvm.lifetime.start.p0(i64 64, ptr %6) #14, !dbg !4997
  call void @llvm.dbg.declare(metadata ptr %6, metadata !4994, metadata !DIExpression()), !dbg !4998
  call void @llvm.memset.p0.i64(ptr align 8 %6, i8 0, i64 64, i1 false), !dbg !4998
  %8 = load ptr, ptr %5, align 8, !dbg !4999, !tbaa !943
  %9 = getelementptr inbounds %struct.packet_info, ptr %8, i32 0, i32 2, !dbg !5000
  %10 = load i64, ptr %9, align 8, !dbg !5000, !tbaa !4109
  %11 = getelementptr inbounds %struct.flow_state, ptr %6, i32 0, i32 2, !dbg !5001
  store i64 %10, ptr %11, align 8, !dbg !5002, !tbaa !2889
  %12 = load ptr, ptr %5, align 8, !dbg !5003, !tbaa !943
  %13 = getelementptr inbounds %struct.packet_info, ptr %12, i32 0, i32 8, !dbg !5004
  %14 = load i8, ptr %13, align 2, !dbg !5004, !tbaa !4316
  %15 = zext i8 %14 to i32, !dbg !5003
  %16 = icmp eq i32 %15, 1, !dbg !5005
  br i1 %16, label %17, label %22, !dbg !5003

17:                                               ; preds = %2
  %18 = load ptr, ptr %5, align 8, !dbg !5006, !tbaa !943
  %19 = getelementptr inbounds %struct.packet_info, ptr %18, i32 0, i32 9, !dbg !5007
  %20 = load i8, ptr %19, align 1, !dbg !5007, !tbaa !4704
  %21 = zext i8 %20 to i32, !dbg !5006
  br label %23, !dbg !5003

22:                                               ; preds = %2
  br label %23, !dbg !5003

23:                                               ; preds = %22, %17
  %24 = phi i32 [ %21, %17 ], [ 2, %22 ], !dbg !5003
  %25 = trunc i32 %24 to i8, !dbg !5003
  %26 = getelementptr inbounds %struct.flow_state, ptr %6, i32 0, i32 9, !dbg !5008
  store i8 %25, ptr %26, align 1, !dbg !5009, !tbaa !4770
  %27 = load ptr, ptr @bpf_map_update_elem, align 8, !dbg !5010, !tbaa !943
  %28 = load ptr, ptr %5, align 8, !dbg !5012, !tbaa !943
  %29 = getelementptr inbounds %struct.packet_info, ptr %28, i32 0, i32 4, !dbg !5013
  %30 = getelementptr inbounds %struct.packet_id, ptr %29, i32 0, i32 0, !dbg !5014
  %31 = call i64 %27(ptr noundef @flow_state, ptr noundef %30, ptr noundef %6, i64 noundef 1), !dbg !5010
  %32 = icmp ne i64 %31, 0, !dbg !5015
  br i1 %32, label %33, label %36, !dbg !5016

33:                                               ; preds = %23
  %34 = load ptr, ptr %4, align 8, !dbg !5017, !tbaa !943
  %35 = load ptr, ptr %5, align 8, !dbg !5019, !tbaa !943
  call void @send_map_full_event(ptr noundef %34, ptr noundef %35, i8 noundef zeroext 0), !dbg !5020
  store ptr null, ptr %3, align 8, !dbg !5021
  store i32 1, ptr %7, align 4
  br label %42, !dbg !5021

36:                                               ; preds = %23
  %37 = load ptr, ptr @bpf_map_lookup_elem.2, align 8, !dbg !5022, !tbaa !943
  %38 = load ptr, ptr %5, align 8, !dbg !5023, !tbaa !943
  %39 = getelementptr inbounds %struct.packet_info, ptr %38, i32 0, i32 4, !dbg !5024
  %40 = getelementptr inbounds %struct.packet_id, ptr %39, i32 0, i32 0, !dbg !5025
  %41 = call ptr %37(ptr noundef @flow_state, ptr noundef %40), !dbg !5022
  store ptr %41, ptr %3, align 8, !dbg !5026
  store i32 1, ptr %7, align 4
  br label %42, !dbg !5026

42:                                               ; preds = %36, %33
  call void @llvm.lifetime.end.p0(i64 64, ptr %6) #14, !dbg !5027
  %43 = load ptr, ptr %3, align 8, !dbg !5027
  ret ptr %43, !dbg !5027
}

; Function Attrs: alwaysinline nounwind
define internal i32 @parse_ethhdr(ptr noundef %0, ptr noundef %1, ptr noundef %2) #13 !dbg !5028 {
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %4, metadata !5034, metadata !DIExpression()), !dbg !5037
  store ptr %1, ptr %5, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %5, metadata !5035, metadata !DIExpression()), !dbg !5038
  store ptr %2, ptr %6, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %6, metadata !5036, metadata !DIExpression()), !dbg !5039
  %7 = load ptr, ptr %4, align 8, !dbg !5040, !tbaa !943
  %8 = load ptr, ptr %5, align 8, !dbg !5041, !tbaa !943
  %9 = load ptr, ptr %6, align 8, !dbg !5042, !tbaa !943
  %10 = call i32 @parse_ethhdr_vlan(ptr noundef %7, ptr noundef %8, ptr noundef %9, ptr noundef null), !dbg !5043
  ret i32 %10, !dbg !5044
}

; Function Attrs: alwaysinline nounwind
define internal i32 @parse_iphdr(ptr noundef %0, ptr noundef %1, ptr noundef %2) #13 !dbg !5045 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %5, metadata !5050, metadata !DIExpression()), !dbg !5055
  store ptr %1, ptr %6, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %6, metadata !5051, metadata !DIExpression()), !dbg !5056
  store ptr %2, ptr %7, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %7, metadata !5052, metadata !DIExpression()), !dbg !5057
  call void @llvm.lifetime.start.p0(i64 8, ptr %8) #14, !dbg !5058
  call void @llvm.dbg.declare(metadata ptr %8, metadata !5053, metadata !DIExpression()), !dbg !5059
  %11 = load ptr, ptr %5, align 8, !dbg !5060, !tbaa !943
  %12 = getelementptr inbounds %struct.hdr_cursor, ptr %11, i32 0, i32 0, !dbg !5061
  %13 = load ptr, ptr %12, align 8, !dbg !5061, !tbaa !3800
  store ptr %13, ptr %8, align 8, !dbg !5059, !tbaa !943
  call void @llvm.lifetime.start.p0(i64 4, ptr %9) #14, !dbg !5062
  call void @llvm.dbg.declare(metadata ptr %9, metadata !5054, metadata !DIExpression()), !dbg !5063
  %14 = load ptr, ptr %8, align 8, !dbg !5064, !tbaa !943
  %15 = getelementptr inbounds %struct.iphdr, ptr %14, i64 1, !dbg !5066
  %16 = load ptr, ptr %6, align 8, !dbg !5067, !tbaa !943
  %17 = icmp ugt ptr %15, %16, !dbg !5068
  br i1 %17, label %18, label %19, !dbg !5069

18:                                               ; preds = %3
  store i32 -1, ptr %4, align 4, !dbg !5070
  store i32 1, ptr %10, align 4
  br label %59, !dbg !5070

19:                                               ; preds = %3
  %20 = load ptr, ptr %8, align 8, !dbg !5071, !tbaa !943
  %21 = load i8, ptr %20, align 4, !dbg !5073
  %22 = lshr i8 %21, 4, !dbg !5073
  %23 = zext i8 %22 to i32, !dbg !5071
  %24 = icmp ne i32 %23, 4, !dbg !5074
  br i1 %24, label %25, label %26, !dbg !5075

25:                                               ; preds = %19
  store i32 -1, ptr %4, align 4, !dbg !5076
  store i32 1, ptr %10, align 4
  br label %59, !dbg !5076

26:                                               ; preds = %19
  %27 = load ptr, ptr %8, align 8, !dbg !5077, !tbaa !943
  %28 = load i8, ptr %27, align 4, !dbg !5078
  %29 = and i8 %28, 15, !dbg !5078
  %30 = zext i8 %29 to i32, !dbg !5077
  %31 = mul nsw i32 %30, 4, !dbg !5079
  store i32 %31, ptr %9, align 4, !dbg !5080, !tbaa !996
  %32 = load i32, ptr %9, align 4, !dbg !5081, !tbaa !996
  %33 = sext i32 %32 to i64, !dbg !5081
  %34 = icmp ult i64 %33, 20, !dbg !5083
  br i1 %34, label %35, label %36, !dbg !5084

35:                                               ; preds = %26
  store i32 -1, ptr %4, align 4, !dbg !5085
  store i32 1, ptr %10, align 4
  br label %59, !dbg !5085

36:                                               ; preds = %26
  %37 = load ptr, ptr %5, align 8, !dbg !5086, !tbaa !943
  %38 = getelementptr inbounds %struct.hdr_cursor, ptr %37, i32 0, i32 0, !dbg !5088
  %39 = load ptr, ptr %38, align 8, !dbg !5088, !tbaa !3800
  %40 = load i32, ptr %9, align 4, !dbg !5089, !tbaa !996
  %41 = sext i32 %40 to i64, !dbg !5090
  %42 = getelementptr i8, ptr %39, i64 %41, !dbg !5090
  %43 = load ptr, ptr %6, align 8, !dbg !5091, !tbaa !943
  %44 = icmp ugt ptr %42, %43, !dbg !5092
  br i1 %44, label %45, label %46, !dbg !5093

45:                                               ; preds = %36
  store i32 -1, ptr %4, align 4, !dbg !5094
  store i32 1, ptr %10, align 4
  br label %59, !dbg !5094

46:                                               ; preds = %36
  %47 = load i32, ptr %9, align 4, !dbg !5095, !tbaa !996
  %48 = load ptr, ptr %5, align 8, !dbg !5096, !tbaa !943
  %49 = getelementptr inbounds %struct.hdr_cursor, ptr %48, i32 0, i32 0, !dbg !5097
  %50 = load ptr, ptr %49, align 8, !dbg !5098, !tbaa !3800
  %51 = sext i32 %47 to i64, !dbg !5098
  %52 = getelementptr i8, ptr %50, i64 %51, !dbg !5098
  store ptr %52, ptr %49, align 8, !dbg !5098, !tbaa !3800
  %53 = load ptr, ptr %8, align 8, !dbg !5099, !tbaa !943
  %54 = load ptr, ptr %7, align 8, !dbg !5100, !tbaa !943
  store ptr %53, ptr %54, align 8, !dbg !5101, !tbaa !943
  %55 = load ptr, ptr %8, align 8, !dbg !5102, !tbaa !943
  %56 = getelementptr inbounds %struct.iphdr, ptr %55, i32 0, i32 6, !dbg !5103
  %57 = load i8, ptr %56, align 1, !dbg !5103, !tbaa !5104
  %58 = zext i8 %57 to i32, !dbg !5102
  store i32 %58, ptr %4, align 4, !dbg !5105
  store i32 1, ptr %10, align 4
  br label %59, !dbg !5105

59:                                               ; preds = %46, %45, %35, %25, %18
  call void @llvm.lifetime.end.p0(i64 4, ptr %9) #14, !dbg !5106
  call void @llvm.lifetime.end.p0(i64 8, ptr %8) #14, !dbg !5106
  %60 = load i32, ptr %4, align 4, !dbg !5106
  ret i32 %60, !dbg !5106
}

; Function Attrs: alwaysinline nounwind
define internal i32 @parse_ip6hdr(ptr noundef %0, ptr noundef %1, ptr noundef %2) #13 !dbg !5107 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %5, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %5, metadata !5112, metadata !DIExpression()), !dbg !5116
  store ptr %1, ptr %6, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %6, metadata !5113, metadata !DIExpression()), !dbg !5117
  store ptr %2, ptr %7, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %7, metadata !5114, metadata !DIExpression()), !dbg !5118
  call void @llvm.lifetime.start.p0(i64 8, ptr %8) #14, !dbg !5119
  call void @llvm.dbg.declare(metadata ptr %8, metadata !5115, metadata !DIExpression()), !dbg !5120
  %10 = load ptr, ptr %5, align 8, !dbg !5121, !tbaa !943
  %11 = getelementptr inbounds %struct.hdr_cursor, ptr %10, i32 0, i32 0, !dbg !5122
  %12 = load ptr, ptr %11, align 8, !dbg !5122, !tbaa !3800
  store ptr %12, ptr %8, align 8, !dbg !5120, !tbaa !943
  %13 = load ptr, ptr %8, align 8, !dbg !5123, !tbaa !943
  %14 = getelementptr inbounds %struct.ipv6hdr, ptr %13, i64 1, !dbg !5125
  %15 = load ptr, ptr %6, align 8, !dbg !5126, !tbaa !943
  %16 = icmp ugt ptr %14, %15, !dbg !5127
  br i1 %16, label %17, label %18, !dbg !5128

17:                                               ; preds = %3
  store i32 -1, ptr %4, align 4, !dbg !5129
  store i32 1, ptr %9, align 4
  br label %38, !dbg !5129

18:                                               ; preds = %3
  %19 = load ptr, ptr %8, align 8, !dbg !5130, !tbaa !943
  %20 = load i8, ptr %19, align 4, !dbg !5132
  %21 = lshr i8 %20, 4, !dbg !5132
  %22 = zext i8 %21 to i32, !dbg !5130
  %23 = icmp ne i32 %22, 6, !dbg !5133
  br i1 %23, label %24, label %25, !dbg !5134

24:                                               ; preds = %18
  store i32 -1, ptr %4, align 4, !dbg !5135
  store i32 1, ptr %9, align 4
  br label %38, !dbg !5135

25:                                               ; preds = %18
  %26 = load ptr, ptr %8, align 8, !dbg !5136, !tbaa !943
  %27 = getelementptr inbounds %struct.ipv6hdr, ptr %26, i64 1, !dbg !5137
  %28 = load ptr, ptr %5, align 8, !dbg !5138, !tbaa !943
  %29 = getelementptr inbounds %struct.hdr_cursor, ptr %28, i32 0, i32 0, !dbg !5139
  store ptr %27, ptr %29, align 8, !dbg !5140, !tbaa !3800
  %30 = load ptr, ptr %8, align 8, !dbg !5141, !tbaa !943
  %31 = load ptr, ptr %7, align 8, !dbg !5142, !tbaa !943
  store ptr %30, ptr %31, align 8, !dbg !5143, !tbaa !943
  %32 = load ptr, ptr %5, align 8, !dbg !5144, !tbaa !943
  %33 = load ptr, ptr %6, align 8, !dbg !5145, !tbaa !943
  %34 = load ptr, ptr %8, align 8, !dbg !5146, !tbaa !943
  %35 = getelementptr inbounds %struct.ipv6hdr, ptr %34, i32 0, i32 3, !dbg !5147
  %36 = load i8, ptr %35, align 2, !dbg !5147, !tbaa !5148
  %37 = call i32 @skip_ip6hdrext(ptr noundef %32, ptr noundef %33, i8 noundef zeroext %36), !dbg !5149
  store i32 %37, ptr %4, align 4, !dbg !5150
  store i32 1, ptr %9, align 4
  br label %38, !dbg !5150

38:                                               ; preds = %25, %24, %17
  call void @llvm.lifetime.end.p0(i64 8, ptr %8) #14, !dbg !5151
  %39 = load i32, ptr %4, align 4, !dbg !5151
  ret i32 %39, !dbg !5151
}

; Function Attrs: nounwind
define internal i32 @parse_tcp_identifier(ptr noundef %0, ptr noundef %1) #0 !dbg !5152 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %4, metadata !5154, metadata !DIExpression()), !dbg !5156
  store ptr %1, ptr %5, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %5, metadata !5155, metadata !DIExpression()), !dbg !5157
  %6 = load ptr, ptr %4, align 8, !dbg !5158, !tbaa !943
  %7 = getelementptr inbounds %struct.parsing_context, ptr %6, i32 0, i32 2, !dbg !5160
  %8 = load ptr, ptr %4, align 8, !dbg !5161, !tbaa !943
  %9 = getelementptr inbounds %struct.parsing_context, ptr %8, i32 0, i32 1, !dbg !5162
  %10 = load ptr, ptr %9, align 8, !dbg !5162, !tbaa !3797
  %11 = load ptr, ptr %5, align 8, !dbg !5163, !tbaa !943
  %12 = getelementptr inbounds %struct.packet_info, ptr %11, i32 0, i32 1, !dbg !5164
  %13 = call i32 @parse_tcphdr(ptr noundef %7, ptr noundef %10, ptr noundef %12), !dbg !5165
  %14 = icmp slt i32 %13, 0, !dbg !5166
  br i1 %14, label %15, label %16, !dbg !5167

15:                                               ; preds = %2
  store i32 -1, ptr %3, align 4, !dbg !5168
  br label %153, !dbg !5168

16:                                               ; preds = %2
  %17 = load ptr, ptr %5, align 8, !dbg !5169, !tbaa !943
  %18 = getelementptr inbounds %struct.packet_info, ptr %17, i32 0, i32 1, !dbg !5171
  %19 = load ptr, ptr %18, align 8, !dbg !5171, !tbaa !981
  %20 = load ptr, ptr %4, align 8, !dbg !5172, !tbaa !943
  %21 = getelementptr inbounds %struct.parsing_context, ptr %20, i32 0, i32 1, !dbg !5173
  %22 = load ptr, ptr %21, align 8, !dbg !5173, !tbaa !3797
  %23 = load ptr, ptr %5, align 8, !dbg !5174, !tbaa !943
  %24 = getelementptr inbounds %struct.packet_info, ptr %23, i32 0, i32 4, !dbg !5175
  %25 = getelementptr inbounds %struct.packet_id, ptr %24, i32 0, i32 1, !dbg !5176
  %26 = load ptr, ptr %5, align 8, !dbg !5177, !tbaa !943
  %27 = getelementptr inbounds %struct.packet_info, ptr %26, i32 0, i32 5, !dbg !5178
  %28 = getelementptr inbounds %struct.packet_id, ptr %27, i32 0, i32 1, !dbg !5179
  %29 = call i32 @parse_tcp_ts(ptr noundef %19, ptr noundef %22, ptr noundef %25, ptr noundef %28), !dbg !5180
  %30 = icmp slt i32 %29, 0, !dbg !5181
  br i1 %30, label %31, label %32, !dbg !5182

31:                                               ; preds = %16
  store i32 -1, ptr %3, align 4, !dbg !5183
  br label %153, !dbg !5183

32:                                               ; preds = %16
  %33 = load ptr, ptr %5, align 8, !dbg !5184, !tbaa !943
  %34 = getelementptr inbounds %struct.packet_info, ptr %33, i32 0, i32 1, !dbg !5185
  %35 = load ptr, ptr %34, align 8, !dbg !5185, !tbaa !981
  %36 = getelementptr inbounds %struct.tcphdr, ptr %35, i32 0, i32 0, !dbg !5186
  %37 = load i16, ptr %36, align 4, !dbg !5186, !tbaa !5187
  %38 = load ptr, ptr %5, align 8, !dbg !5189, !tbaa !943
  %39 = getelementptr inbounds %struct.packet_info, ptr %38, i32 0, i32 4, !dbg !5190
  %40 = getelementptr inbounds %struct.packet_id, ptr %39, i32 0, i32 0, !dbg !5191
  %41 = getelementptr inbounds %struct.network_tuple, ptr %40, i32 0, i32 0, !dbg !5192
  %42 = getelementptr inbounds %struct.flow_address, ptr %41, i32 0, i32 1, !dbg !5193
  store i16 %37, ptr %42, align 4, !dbg !5194, !tbaa !5195
  %43 = load ptr, ptr %5, align 8, !dbg !5196, !tbaa !943
  %44 = getelementptr inbounds %struct.packet_info, ptr %43, i32 0, i32 1, !dbg !5197
  %45 = load ptr, ptr %44, align 8, !dbg !5197, !tbaa !981
  %46 = getelementptr inbounds %struct.tcphdr, ptr %45, i32 0, i32 1, !dbg !5198
  %47 = load i16, ptr %46, align 2, !dbg !5198, !tbaa !5199
  %48 = load ptr, ptr %5, align 8, !dbg !5200, !tbaa !943
  %49 = getelementptr inbounds %struct.packet_info, ptr %48, i32 0, i32 4, !dbg !5201
  %50 = getelementptr inbounds %struct.packet_id, ptr %49, i32 0, i32 0, !dbg !5202
  %51 = getelementptr inbounds %struct.network_tuple, ptr %50, i32 0, i32 1, !dbg !5203
  %52 = getelementptr inbounds %struct.flow_address, ptr %51, i32 0, i32 1, !dbg !5204
  store i16 %47, ptr %52, align 4, !dbg !5205, !tbaa !5206
  %53 = load ptr, ptr %4, align 8, !dbg !5207, !tbaa !943
  %54 = getelementptr inbounds %struct.parsing_context, ptr %53, i32 0, i32 2, !dbg !5208
  %55 = getelementptr inbounds %struct.hdr_cursor, ptr %54, i32 0, i32 0, !dbg !5209
  %56 = load ptr, ptr %55, align 8, !dbg !5209, !tbaa !5210
  %57 = load ptr, ptr %4, align 8, !dbg !5211, !tbaa !943
  %58 = getelementptr inbounds %struct.parsing_context, ptr %57, i32 0, i32 0, !dbg !5212
  %59 = load ptr, ptr %58, align 8, !dbg !5212, !tbaa !3789
  %60 = ptrtoint ptr %56 to i64, !dbg !5213
  %61 = ptrtoint ptr %59 to i64, !dbg !5213
  %62 = sub i64 %60, %61, !dbg !5213
  %63 = load ptr, ptr %4, align 8, !dbg !5214, !tbaa !943
  %64 = getelementptr inbounds %struct.parsing_context, ptr %63, i32 0, i32 3, !dbg !5215
  %65 = load i32, ptr %64, align 8, !dbg !5215, !tbaa !3804
  %66 = zext i32 %65 to i64, !dbg !5214
  %67 = icmp slt i64 %62, %66, !dbg !5216
  br i1 %67, label %78, label %68, !dbg !5217

68:                                               ; preds = %32
  %69 = load ptr, ptr %5, align 8, !dbg !5218, !tbaa !943
  %70 = getelementptr inbounds %struct.packet_info, ptr %69, i32 0, i32 1, !dbg !5219
  %71 = load ptr, ptr %70, align 8, !dbg !5219, !tbaa !981
  %72 = getelementptr inbounds %struct.tcphdr, ptr %71, i32 0, i32 4, !dbg !5220
  %73 = load i16, ptr %72, align 4, !dbg !5220
  %74 = lshr i16 %73, 9, !dbg !5220
  %75 = and i16 %74, 1, !dbg !5220
  %76 = zext i16 %75 to i32, !dbg !5218
  %77 = icmp ne i32 %76, 0, !dbg !5217
  br label %78, !dbg !5217

78:                                               ; preds = %68, %32
  %79 = phi i1 [ true, %32 ], [ %77, %68 ]
  %80 = load ptr, ptr %5, align 8, !dbg !5221, !tbaa !943
  %81 = getelementptr inbounds %struct.packet_info, ptr %80, i32 0, i32 6, !dbg !5222
  %82 = zext i1 %79 to i8, !dbg !5223
  store i8 %82, ptr %81, align 4, !dbg !5223, !tbaa !4312
  %83 = load ptr, ptr %5, align 8, !dbg !5224, !tbaa !943
  %84 = getelementptr inbounds %struct.packet_info, ptr %83, i32 0, i32 1, !dbg !5225
  %85 = load ptr, ptr %84, align 8, !dbg !5225, !tbaa !981
  %86 = getelementptr inbounds %struct.tcphdr, ptr %85, i32 0, i32 4, !dbg !5226
  %87 = load i16, ptr %86, align 4, !dbg !5226
  %88 = lshr i16 %87, 12, !dbg !5226
  %89 = and i16 %88, 1, !dbg !5226
  %90 = icmp ne i16 %89, 0, !dbg !5224
  %91 = load ptr, ptr %5, align 8, !dbg !5227, !tbaa !943
  %92 = getelementptr inbounds %struct.packet_info, ptr %91, i32 0, i32 7, !dbg !5228
  %93 = zext i1 %90 to i8, !dbg !5229
  store i8 %93, ptr %92, align 1, !dbg !5229, !tbaa !4522
  %94 = load ptr, ptr %5, align 8, !dbg !5230, !tbaa !943
  %95 = getelementptr inbounds %struct.packet_info, ptr %94, i32 0, i32 1, !dbg !5232
  %96 = load ptr, ptr %95, align 8, !dbg !5232, !tbaa !981
  %97 = getelementptr inbounds %struct.tcphdr, ptr %96, i32 0, i32 4, !dbg !5233
  %98 = load i16, ptr %97, align 4, !dbg !5233
  %99 = lshr i16 %98, 10, !dbg !5233
  %100 = and i16 %99, 1, !dbg !5233
  %101 = icmp ne i16 %100, 0, !dbg !5230
  br i1 %101, label %102, label %107, !dbg !5234

102:                                              ; preds = %78
  %103 = load ptr, ptr %5, align 8, !dbg !5235, !tbaa !943
  %104 = getelementptr inbounds %struct.packet_info, ptr %103, i32 0, i32 8, !dbg !5237
  store i8 3, ptr %104, align 2, !dbg !5238, !tbaa !4316
  %105 = load ptr, ptr %5, align 8, !dbg !5239, !tbaa !943
  %106 = getelementptr inbounds %struct.packet_info, ptr %105, i32 0, i32 9, !dbg !5240
  store i8 4, ptr %106, align 1, !dbg !5241, !tbaa !4704
  br label %152, !dbg !5242

107:                                              ; preds = %78
  %108 = load ptr, ptr %5, align 8, !dbg !5243, !tbaa !943
  %109 = getelementptr inbounds %struct.packet_info, ptr %108, i32 0, i32 1, !dbg !5245
  %110 = load ptr, ptr %109, align 8, !dbg !5245, !tbaa !981
  %111 = getelementptr inbounds %struct.tcphdr, ptr %110, i32 0, i32 4, !dbg !5246
  %112 = load i16, ptr %111, align 4, !dbg !5246
  %113 = lshr i16 %112, 8, !dbg !5246
  %114 = and i16 %113, 1, !dbg !5246
  %115 = icmp ne i16 %114, 0, !dbg !5243
  br i1 %115, label %116, label %121, !dbg !5247

116:                                              ; preds = %107
  %117 = load ptr, ptr %5, align 8, !dbg !5248, !tbaa !943
  %118 = getelementptr inbounds %struct.packet_info, ptr %117, i32 0, i32 8, !dbg !5250
  store i8 2, ptr %118, align 2, !dbg !5251, !tbaa !4316
  %119 = load ptr, ptr %5, align 8, !dbg !5252, !tbaa !943
  %120 = getelementptr inbounds %struct.packet_info, ptr %119, i32 0, i32 9, !dbg !5253
  store i8 3, ptr %120, align 1, !dbg !5254, !tbaa !4704
  br label %151, !dbg !5255

121:                                              ; preds = %107
  %122 = load ptr, ptr %5, align 8, !dbg !5256, !tbaa !943
  %123 = getelementptr inbounds %struct.packet_info, ptr %122, i32 0, i32 1, !dbg !5258
  %124 = load ptr, ptr %123, align 8, !dbg !5258, !tbaa !981
  %125 = getelementptr inbounds %struct.tcphdr, ptr %124, i32 0, i32 4, !dbg !5259
  %126 = load i16, ptr %125, align 4, !dbg !5259
  %127 = lshr i16 %126, 9, !dbg !5259
  %128 = and i16 %127, 1, !dbg !5259
  %129 = icmp ne i16 %128, 0, !dbg !5256
  br i1 %129, label %130, label %147, !dbg !5260

130:                                              ; preds = %121
  %131 = load ptr, ptr %5, align 8, !dbg !5261, !tbaa !943
  %132 = getelementptr inbounds %struct.packet_info, ptr %131, i32 0, i32 8, !dbg !5263
  store i8 1, ptr %132, align 2, !dbg !5264, !tbaa !4316
  %133 = load ptr, ptr %5, align 8, !dbg !5265, !tbaa !943
  %134 = getelementptr inbounds %struct.packet_info, ptr %133, i32 0, i32 1, !dbg !5266
  %135 = load ptr, ptr %134, align 8, !dbg !5266, !tbaa !981
  %136 = getelementptr inbounds %struct.tcphdr, ptr %135, i32 0, i32 4, !dbg !5267
  %137 = load i16, ptr %136, align 4, !dbg !5267
  %138 = lshr i16 %137, 12, !dbg !5267
  %139 = and i16 %138, 1, !dbg !5267
  %140 = zext i16 %139 to i32, !dbg !5265
  %141 = icmp ne i32 %140, 0, !dbg !5265
  %142 = zext i1 %141 to i64, !dbg !5265
  %143 = select i1 %141, i32 1, i32 0, !dbg !5265
  %144 = trunc i32 %143 to i8, !dbg !5265
  %145 = load ptr, ptr %5, align 8, !dbg !5268, !tbaa !943
  %146 = getelementptr inbounds %struct.packet_info, ptr %145, i32 0, i32 9, !dbg !5269
  store i8 %144, ptr %146, align 1, !dbg !5270, !tbaa !4704
  br label %150, !dbg !5271

147:                                              ; preds = %121
  %148 = load ptr, ptr %5, align 8, !dbg !5272, !tbaa !943
  %149 = getelementptr inbounds %struct.packet_info, ptr %148, i32 0, i32 8, !dbg !5274
  store i8 0, ptr %149, align 2, !dbg !5275, !tbaa !4316
  br label %150

150:                                              ; preds = %147, %130
  br label %151

151:                                              ; preds = %150, %116
  br label %152

152:                                              ; preds = %151, %102
  store i32 0, ptr %3, align 4, !dbg !5276
  br label %153, !dbg !5276

153:                                              ; preds = %152, %31, %15
  %154 = load i32, ptr %3, align 4, !dbg !5277
  ret i32 %154, !dbg !5277
}

; Function Attrs: nounwind
define internal i32 @parse_icmp6_identifier(ptr noundef %0, ptr noundef %1) #0 !dbg !5278 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %4, metadata !5280, metadata !DIExpression()), !dbg !5282
  store ptr %1, ptr %5, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %5, metadata !5281, metadata !DIExpression()), !dbg !5283
  %6 = load ptr, ptr %4, align 8, !dbg !5284, !tbaa !943
  %7 = getelementptr inbounds %struct.parsing_context, ptr %6, i32 0, i32 2, !dbg !5286
  %8 = load ptr, ptr %4, align 8, !dbg !5287, !tbaa !943
  %9 = getelementptr inbounds %struct.parsing_context, ptr %8, i32 0, i32 1, !dbg !5288
  %10 = load ptr, ptr %9, align 8, !dbg !5288, !tbaa !3797
  %11 = load ptr, ptr %5, align 8, !dbg !5289, !tbaa !943
  %12 = getelementptr inbounds %struct.packet_info, ptr %11, i32 0, i32 1, !dbg !5290
  %13 = call i32 @parse_icmp6hdr(ptr noundef %7, ptr noundef %10, ptr noundef %12), !dbg !5291
  %14 = icmp slt i32 %13, 0, !dbg !5292
  br i1 %14, label %15, label %16, !dbg !5293

15:                                               ; preds = %2
  store i32 -1, ptr %3, align 4, !dbg !5294
  br label %98, !dbg !5294

16:                                               ; preds = %2
  %17 = load ptr, ptr %5, align 8, !dbg !5295, !tbaa !943
  %18 = getelementptr inbounds %struct.packet_info, ptr %17, i32 0, i32 1, !dbg !5297
  %19 = load ptr, ptr %18, align 8, !dbg !5297, !tbaa !981
  %20 = getelementptr inbounds %struct.icmp6hdr, ptr %19, i32 0, i32 1, !dbg !5298
  %21 = load i8, ptr %20, align 1, !dbg !5298, !tbaa !5299
  %22 = zext i8 %21 to i32, !dbg !5295
  %23 = icmp ne i32 %22, 0, !dbg !5301
  br i1 %23, label %24, label %25, !dbg !5302

24:                                               ; preds = %16
  store i32 -1, ptr %3, align 4, !dbg !5303
  br label %98, !dbg !5303

25:                                               ; preds = %16
  %26 = load ptr, ptr %5, align 8, !dbg !5304, !tbaa !943
  %27 = getelementptr inbounds %struct.packet_info, ptr %26, i32 0, i32 1, !dbg !5306
  %28 = load ptr, ptr %27, align 8, !dbg !5306, !tbaa !981
  %29 = getelementptr inbounds %struct.icmp6hdr, ptr %28, i32 0, i32 0, !dbg !5307
  %30 = load i8, ptr %29, align 4, !dbg !5307, !tbaa !5308
  %31 = zext i8 %30 to i32, !dbg !5304
  %32 = icmp eq i32 %31, 128, !dbg !5309
  br i1 %32, label %33, label %48, !dbg !5310

33:                                               ; preds = %25
  %34 = load ptr, ptr %5, align 8, !dbg !5311, !tbaa !943
  %35 = getelementptr inbounds %struct.packet_info, ptr %34, i32 0, i32 1, !dbg !5313
  %36 = load ptr, ptr %35, align 8, !dbg !5313, !tbaa !981
  %37 = getelementptr inbounds %struct.icmp6hdr, ptr %36, i32 0, i32 3, !dbg !5314
  %38 = getelementptr inbounds %struct.anon.16, ptr %37, i32 0, i32 1, !dbg !5314
  %39 = load i16, ptr %38, align 2, !dbg !5314, !tbaa !981
  %40 = zext i16 %39 to i32, !dbg !5311
  %41 = load ptr, ptr %5, align 8, !dbg !5315, !tbaa !943
  %42 = getelementptr inbounds %struct.packet_info, ptr %41, i32 0, i32 4, !dbg !5316
  %43 = getelementptr inbounds %struct.packet_id, ptr %42, i32 0, i32 1, !dbg !5317
  store i32 %40, ptr %43, align 4, !dbg !5318, !tbaa !4390
  %44 = load ptr, ptr %5, align 8, !dbg !5319, !tbaa !943
  %45 = getelementptr inbounds %struct.packet_info, ptr %44, i32 0, i32 6, !dbg !5320
  store i8 1, ptr %45, align 4, !dbg !5321, !tbaa !4312
  %46 = load ptr, ptr %5, align 8, !dbg !5322, !tbaa !943
  %47 = getelementptr inbounds %struct.packet_info, ptr %46, i32 0, i32 7, !dbg !5323
  store i8 0, ptr %47, align 1, !dbg !5324, !tbaa !4522
  br label %73, !dbg !5325

48:                                               ; preds = %25
  %49 = load ptr, ptr %5, align 8, !dbg !5326, !tbaa !943
  %50 = getelementptr inbounds %struct.packet_info, ptr %49, i32 0, i32 1, !dbg !5328
  %51 = load ptr, ptr %50, align 8, !dbg !5328, !tbaa !981
  %52 = getelementptr inbounds %struct.icmp6hdr, ptr %51, i32 0, i32 0, !dbg !5329
  %53 = load i8, ptr %52, align 4, !dbg !5329, !tbaa !5308
  %54 = zext i8 %53 to i32, !dbg !5326
  %55 = icmp eq i32 %54, 129, !dbg !5330
  br i1 %55, label %56, label %71, !dbg !5331

56:                                               ; preds = %48
  %57 = load ptr, ptr %5, align 8, !dbg !5332, !tbaa !943
  %58 = getelementptr inbounds %struct.packet_info, ptr %57, i32 0, i32 1, !dbg !5334
  %59 = load ptr, ptr %58, align 8, !dbg !5334, !tbaa !981
  %60 = getelementptr inbounds %struct.icmp6hdr, ptr %59, i32 0, i32 3, !dbg !5335
  %61 = getelementptr inbounds %struct.anon.16, ptr %60, i32 0, i32 1, !dbg !5335
  %62 = load i16, ptr %61, align 2, !dbg !5335, !tbaa !981
  %63 = zext i16 %62 to i32, !dbg !5332
  %64 = load ptr, ptr %5, align 8, !dbg !5336, !tbaa !943
  %65 = getelementptr inbounds %struct.packet_info, ptr %64, i32 0, i32 5, !dbg !5337
  %66 = getelementptr inbounds %struct.packet_id, ptr %65, i32 0, i32 1, !dbg !5338
  store i32 %63, ptr %66, align 4, !dbg !5339, !tbaa !5340
  %67 = load ptr, ptr %5, align 8, !dbg !5341, !tbaa !943
  %68 = getelementptr inbounds %struct.packet_info, ptr %67, i32 0, i32 7, !dbg !5342
  store i8 1, ptr %68, align 1, !dbg !5343, !tbaa !4522
  %69 = load ptr, ptr %5, align 8, !dbg !5344, !tbaa !943
  %70 = getelementptr inbounds %struct.packet_info, ptr %69, i32 0, i32 6, !dbg !5345
  store i8 0, ptr %70, align 4, !dbg !5346, !tbaa !4312
  br label %72, !dbg !5347

71:                                               ; preds = %48
  store i32 -1, ptr %3, align 4, !dbg !5348
  br label %98, !dbg !5348

72:                                               ; preds = %56
  br label %73

73:                                               ; preds = %72, %33
  %74 = load ptr, ptr %5, align 8, !dbg !5350, !tbaa !943
  %75 = getelementptr inbounds %struct.packet_info, ptr %74, i32 0, i32 8, !dbg !5351
  store i8 0, ptr %75, align 2, !dbg !5352, !tbaa !4316
  %76 = load ptr, ptr %5, align 8, !dbg !5353, !tbaa !943
  %77 = getelementptr inbounds %struct.packet_info, ptr %76, i32 0, i32 1, !dbg !5354
  %78 = load ptr, ptr %77, align 8, !dbg !5354, !tbaa !981
  %79 = getelementptr inbounds %struct.icmp6hdr, ptr %78, i32 0, i32 3, !dbg !5355
  %80 = getelementptr inbounds %struct.anon.16, ptr %79, i32 0, i32 0, !dbg !5355
  %81 = load i16, ptr %80, align 4, !dbg !5355, !tbaa !981
  %82 = load ptr, ptr %5, align 8, !dbg !5356, !tbaa !943
  %83 = getelementptr inbounds %struct.packet_info, ptr %82, i32 0, i32 4, !dbg !5357
  %84 = getelementptr inbounds %struct.packet_id, ptr %83, i32 0, i32 0, !dbg !5358
  %85 = getelementptr inbounds %struct.network_tuple, ptr %84, i32 0, i32 0, !dbg !5359
  %86 = getelementptr inbounds %struct.flow_address, ptr %85, i32 0, i32 1, !dbg !5360
  store i16 %81, ptr %86, align 4, !dbg !5361, !tbaa !5195
  %87 = load ptr, ptr %5, align 8, !dbg !5362, !tbaa !943
  %88 = getelementptr inbounds %struct.packet_info, ptr %87, i32 0, i32 4, !dbg !5363
  %89 = getelementptr inbounds %struct.packet_id, ptr %88, i32 0, i32 0, !dbg !5364
  %90 = getelementptr inbounds %struct.network_tuple, ptr %89, i32 0, i32 0, !dbg !5365
  %91 = getelementptr inbounds %struct.flow_address, ptr %90, i32 0, i32 1, !dbg !5366
  %92 = load i16, ptr %91, align 4, !dbg !5366, !tbaa !5195
  %93 = load ptr, ptr %5, align 8, !dbg !5367, !tbaa !943
  %94 = getelementptr inbounds %struct.packet_info, ptr %93, i32 0, i32 4, !dbg !5368
  %95 = getelementptr inbounds %struct.packet_id, ptr %94, i32 0, i32 0, !dbg !5369
  %96 = getelementptr inbounds %struct.network_tuple, ptr %95, i32 0, i32 1, !dbg !5370
  %97 = getelementptr inbounds %struct.flow_address, ptr %96, i32 0, i32 1, !dbg !5371
  store i16 %92, ptr %97, align 4, !dbg !5372, !tbaa !5206
  store i32 0, ptr %3, align 4, !dbg !5373
  br label %98, !dbg !5373

98:                                               ; preds = %73, %71, %24, %15
  %99 = load i32, ptr %3, align 4, !dbg !5374
  ret i32 %99, !dbg !5374
}

; Function Attrs: nounwind
define internal i32 @parse_icmp_identifier(ptr noundef %0, ptr noundef %1) #0 !dbg !5375 {
  %3 = alloca i32, align 4
  %4 = alloca ptr, align 8
  %5 = alloca ptr, align 8
  store ptr %0, ptr %4, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %4, metadata !5377, metadata !DIExpression()), !dbg !5379
  store ptr %1, ptr %5, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %5, metadata !5378, metadata !DIExpression()), !dbg !5380
  %6 = load ptr, ptr %4, align 8, !dbg !5381, !tbaa !943
  %7 = getelementptr inbounds %struct.parsing_context, ptr %6, i32 0, i32 2, !dbg !5383
  %8 = load ptr, ptr %4, align 8, !dbg !5384, !tbaa !943
  %9 = getelementptr inbounds %struct.parsing_context, ptr %8, i32 0, i32 1, !dbg !5385
  %10 = load ptr, ptr %9, align 8, !dbg !5385, !tbaa !3797
  %11 = load ptr, ptr %5, align 8, !dbg !5386, !tbaa !943
  %12 = getelementptr inbounds %struct.packet_info, ptr %11, i32 0, i32 1, !dbg !5387
  %13 = call i32 @parse_icmphdr(ptr noundef %7, ptr noundef %10, ptr noundef %12), !dbg !5388
  %14 = icmp slt i32 %13, 0, !dbg !5389
  br i1 %14, label %15, label %16, !dbg !5390

15:                                               ; preds = %2
  store i32 -1, ptr %3, align 4, !dbg !5391
  br label %98, !dbg !5391

16:                                               ; preds = %2
  %17 = load ptr, ptr %5, align 8, !dbg !5392, !tbaa !943
  %18 = getelementptr inbounds %struct.packet_info, ptr %17, i32 0, i32 1, !dbg !5394
  %19 = load ptr, ptr %18, align 8, !dbg !5394, !tbaa !981
  %20 = getelementptr inbounds %struct.icmphdr, ptr %19, i32 0, i32 1, !dbg !5395
  %21 = load i8, ptr %20, align 1, !dbg !5395, !tbaa !5396
  %22 = zext i8 %21 to i32, !dbg !5392
  %23 = icmp ne i32 %22, 0, !dbg !5398
  br i1 %23, label %24, label %25, !dbg !5399

24:                                               ; preds = %16
  store i32 -1, ptr %3, align 4, !dbg !5400
  br label %98, !dbg !5400

25:                                               ; preds = %16
  %26 = load ptr, ptr %5, align 8, !dbg !5401, !tbaa !943
  %27 = getelementptr inbounds %struct.packet_info, ptr %26, i32 0, i32 1, !dbg !5403
  %28 = load ptr, ptr %27, align 8, !dbg !5403, !tbaa !981
  %29 = getelementptr inbounds %struct.icmphdr, ptr %28, i32 0, i32 0, !dbg !5404
  %30 = load i8, ptr %29, align 4, !dbg !5404, !tbaa !5405
  %31 = zext i8 %30 to i32, !dbg !5401
  %32 = icmp eq i32 %31, 8, !dbg !5406
  br i1 %32, label %33, label %48, !dbg !5407

33:                                               ; preds = %25
  %34 = load ptr, ptr %5, align 8, !dbg !5408, !tbaa !943
  %35 = getelementptr inbounds %struct.packet_info, ptr %34, i32 0, i32 1, !dbg !5410
  %36 = load ptr, ptr %35, align 8, !dbg !5410, !tbaa !981
  %37 = getelementptr inbounds %struct.icmphdr, ptr %36, i32 0, i32 3, !dbg !5411
  %38 = getelementptr inbounds %struct.anon.16, ptr %37, i32 0, i32 1, !dbg !5412
  %39 = load i16, ptr %38, align 2, !dbg !5412, !tbaa !981
  %40 = zext i16 %39 to i32, !dbg !5408
  %41 = load ptr, ptr %5, align 8, !dbg !5413, !tbaa !943
  %42 = getelementptr inbounds %struct.packet_info, ptr %41, i32 0, i32 4, !dbg !5414
  %43 = getelementptr inbounds %struct.packet_id, ptr %42, i32 0, i32 1, !dbg !5415
  store i32 %40, ptr %43, align 4, !dbg !5416, !tbaa !4390
  %44 = load ptr, ptr %5, align 8, !dbg !5417, !tbaa !943
  %45 = getelementptr inbounds %struct.packet_info, ptr %44, i32 0, i32 6, !dbg !5418
  store i8 1, ptr %45, align 4, !dbg !5419, !tbaa !4312
  %46 = load ptr, ptr %5, align 8, !dbg !5420, !tbaa !943
  %47 = getelementptr inbounds %struct.packet_info, ptr %46, i32 0, i32 7, !dbg !5421
  store i8 0, ptr %47, align 1, !dbg !5422, !tbaa !4522
  br label %73, !dbg !5423

48:                                               ; preds = %25
  %49 = load ptr, ptr %5, align 8, !dbg !5424, !tbaa !943
  %50 = getelementptr inbounds %struct.packet_info, ptr %49, i32 0, i32 1, !dbg !5426
  %51 = load ptr, ptr %50, align 8, !dbg !5426, !tbaa !981
  %52 = getelementptr inbounds %struct.icmphdr, ptr %51, i32 0, i32 0, !dbg !5427
  %53 = load i8, ptr %52, align 4, !dbg !5427, !tbaa !5405
  %54 = zext i8 %53 to i32, !dbg !5424
  %55 = icmp eq i32 %54, 0, !dbg !5428
  br i1 %55, label %56, label %71, !dbg !5429

56:                                               ; preds = %48
  %57 = load ptr, ptr %5, align 8, !dbg !5430, !tbaa !943
  %58 = getelementptr inbounds %struct.packet_info, ptr %57, i32 0, i32 1, !dbg !5432
  %59 = load ptr, ptr %58, align 8, !dbg !5432, !tbaa !981
  %60 = getelementptr inbounds %struct.icmphdr, ptr %59, i32 0, i32 3, !dbg !5433
  %61 = getelementptr inbounds %struct.anon.16, ptr %60, i32 0, i32 1, !dbg !5434
  %62 = load i16, ptr %61, align 2, !dbg !5434, !tbaa !981
  %63 = zext i16 %62 to i32, !dbg !5430
  %64 = load ptr, ptr %5, align 8, !dbg !5435, !tbaa !943
  %65 = getelementptr inbounds %struct.packet_info, ptr %64, i32 0, i32 5, !dbg !5436
  %66 = getelementptr inbounds %struct.packet_id, ptr %65, i32 0, i32 1, !dbg !5437
  store i32 %63, ptr %66, align 4, !dbg !5438, !tbaa !5340
  %67 = load ptr, ptr %5, align 8, !dbg !5439, !tbaa !943
  %68 = getelementptr inbounds %struct.packet_info, ptr %67, i32 0, i32 7, !dbg !5440
  store i8 1, ptr %68, align 1, !dbg !5441, !tbaa !4522
  %69 = load ptr, ptr %5, align 8, !dbg !5442, !tbaa !943
  %70 = getelementptr inbounds %struct.packet_info, ptr %69, i32 0, i32 6, !dbg !5443
  store i8 0, ptr %70, align 4, !dbg !5444, !tbaa !4312
  br label %72, !dbg !5445

71:                                               ; preds = %48
  store i32 -1, ptr %3, align 4, !dbg !5446
  br label %98, !dbg !5446

72:                                               ; preds = %56
  br label %73

73:                                               ; preds = %72, %33
  %74 = load ptr, ptr %5, align 8, !dbg !5448, !tbaa !943
  %75 = getelementptr inbounds %struct.packet_info, ptr %74, i32 0, i32 8, !dbg !5449
  store i8 0, ptr %75, align 2, !dbg !5450, !tbaa !4316
  %76 = load ptr, ptr %5, align 8, !dbg !5451, !tbaa !943
  %77 = getelementptr inbounds %struct.packet_info, ptr %76, i32 0, i32 1, !dbg !5452
  %78 = load ptr, ptr %77, align 8, !dbg !5452, !tbaa !981
  %79 = getelementptr inbounds %struct.icmphdr, ptr %78, i32 0, i32 3, !dbg !5453
  %80 = getelementptr inbounds %struct.anon.16, ptr %79, i32 0, i32 0, !dbg !5454
  %81 = load i16, ptr %80, align 4, !dbg !5454, !tbaa !981
  %82 = load ptr, ptr %5, align 8, !dbg !5455, !tbaa !943
  %83 = getelementptr inbounds %struct.packet_info, ptr %82, i32 0, i32 4, !dbg !5456
  %84 = getelementptr inbounds %struct.packet_id, ptr %83, i32 0, i32 0, !dbg !5457
  %85 = getelementptr inbounds %struct.network_tuple, ptr %84, i32 0, i32 0, !dbg !5458
  %86 = getelementptr inbounds %struct.flow_address, ptr %85, i32 0, i32 1, !dbg !5459
  store i16 %81, ptr %86, align 4, !dbg !5460, !tbaa !5195
  %87 = load ptr, ptr %5, align 8, !dbg !5461, !tbaa !943
  %88 = getelementptr inbounds %struct.packet_info, ptr %87, i32 0, i32 4, !dbg !5462
  %89 = getelementptr inbounds %struct.packet_id, ptr %88, i32 0, i32 0, !dbg !5463
  %90 = getelementptr inbounds %struct.network_tuple, ptr %89, i32 0, i32 0, !dbg !5464
  %91 = getelementptr inbounds %struct.flow_address, ptr %90, i32 0, i32 1, !dbg !5465
  %92 = load i16, ptr %91, align 4, !dbg !5465, !tbaa !5195
  %93 = load ptr, ptr %5, align 8, !dbg !5466, !tbaa !943
  %94 = getelementptr inbounds %struct.packet_info, ptr %93, i32 0, i32 4, !dbg !5467
  %95 = getelementptr inbounds %struct.packet_id, ptr %94, i32 0, i32 0, !dbg !5468
  %96 = getelementptr inbounds %struct.network_tuple, ptr %95, i32 0, i32 1, !dbg !5469
  %97 = getelementptr inbounds %struct.flow_address, ptr %96, i32 0, i32 1, !dbg !5470
  store i16 %92, ptr %97, align 4, !dbg !5471, !tbaa !5206
  store i32 0, ptr %3, align 4, !dbg !5472
  br label %98, !dbg !5472

98:                                               ; preds = %73, %71, %24, %15
  %99 = load i32, ptr %3, align 4, !dbg !5473
  ret i32 %99, !dbg !5473
}

; Function Attrs: nounwind
define internal void @map_ipv4_to_ipv6(ptr noundef %0, i32 noundef %1) #0 !dbg !5474 {
  %3 = alloca ptr, align 8
  %4 = alloca i32, align 4
  store ptr %0, ptr %3, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %3, metadata !5478, metadata !DIExpression()), !dbg !5480
  store i32 %1, ptr %4, align 4, !tbaa !996
  call void @llvm.dbg.declare(metadata ptr %4, metadata !5479, metadata !DIExpression()), !dbg !5481
  %5 = load ptr, ptr %3, align 8, !dbg !5482, !tbaa !943
  %6 = getelementptr inbounds %struct.in6_addr, ptr %5, i32 0, i32 0, !dbg !5483
  %7 = getelementptr inbounds [16 x i8], ptr %6, i64 0, i64 0, !dbg !5482
  call void @llvm.memset.p0.i64(ptr align 4 %7, i8 0, i64 10, i1 false), !dbg !5484
  %8 = load ptr, ptr %3, align 8, !dbg !5485, !tbaa !943
  %9 = getelementptr inbounds %struct.in6_addr, ptr %8, i32 0, i32 0, !dbg !5486
  %10 = getelementptr inbounds [16 x i8], ptr %9, i64 0, i64 10, !dbg !5485
  call void @llvm.memset.p0.i64(ptr align 2 %10, i8 -1, i64 2, i1 false), !dbg !5487
  %11 = load i32, ptr %4, align 4, !dbg !5488, !tbaa !996
  %12 = load ptr, ptr %3, align 8, !dbg !5489, !tbaa !943
  %13 = getelementptr inbounds %struct.in6_addr, ptr %12, i32 0, i32 0, !dbg !5490
  %14 = getelementptr inbounds [4 x i32], ptr %13, i64 0, i64 3, !dbg !5489
  store i32 %11, ptr %14, align 4, !dbg !5491, !tbaa !981
  ret void, !dbg !5492
}

; Function Attrs: nounwind
define internal void @reverse_flow.3(ptr noundef %0, ptr noundef %1) #0 !dbg !5493 {
  %3 = alloca ptr, align 8
  %4 = alloca ptr, align 8
  store ptr %0, ptr %3, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %3, metadata !5497, metadata !DIExpression()), !dbg !5499
  store ptr %1, ptr %4, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %4, metadata !5498, metadata !DIExpression()), !dbg !5500
  %5 = load ptr, ptr %4, align 8, !dbg !5501, !tbaa !943
  %6 = getelementptr inbounds %struct.network_tuple, ptr %5, i32 0, i32 3, !dbg !5502
  %7 = load i8, ptr %6, align 2, !dbg !5502, !tbaa !2431
  %8 = load ptr, ptr %3, align 8, !dbg !5503, !tbaa !943
  %9 = getelementptr inbounds %struct.network_tuple, ptr %8, i32 0, i32 3, !dbg !5504
  store i8 %7, ptr %9, align 2, !dbg !5505, !tbaa !2431
  %10 = load ptr, ptr %4, align 8, !dbg !5506, !tbaa !943
  %11 = getelementptr inbounds %struct.network_tuple, ptr %10, i32 0, i32 2, !dbg !5507
  %12 = load i16, ptr %11, align 4, !dbg !5507, !tbaa !2962
  %13 = load ptr, ptr %3, align 8, !dbg !5508, !tbaa !943
  %14 = getelementptr inbounds %struct.network_tuple, ptr %13, i32 0, i32 2, !dbg !5509
  store i16 %12, ptr %14, align 4, !dbg !5510, !tbaa !2962
  %15 = load ptr, ptr %3, align 8, !dbg !5511, !tbaa !943
  %16 = getelementptr inbounds %struct.network_tuple, ptr %15, i32 0, i32 0, !dbg !5512
  %17 = load ptr, ptr %4, align 8, !dbg !5513, !tbaa !943
  %18 = getelementptr inbounds %struct.network_tuple, ptr %17, i32 0, i32 1, !dbg !5514
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %16, ptr align 4 %18, i64 20, i1 false), !dbg !5514, !tbaa.struct !2970
  %19 = load ptr, ptr %3, align 8, !dbg !5515, !tbaa !943
  %20 = getelementptr inbounds %struct.network_tuple, ptr %19, i32 0, i32 1, !dbg !5516
  %21 = load ptr, ptr %4, align 8, !dbg !5517, !tbaa !943
  %22 = getelementptr inbounds %struct.network_tuple, ptr %21, i32 0, i32 0, !dbg !5518
  call void @llvm.memcpy.p0.p0.i64(ptr align 4 %20, ptr align 4 %22, i64 20, i1 false), !dbg !5518, !tbaa.struct !2970
  %23 = load ptr, ptr %3, align 8, !dbg !5519, !tbaa !943
  %24 = getelementptr inbounds %struct.network_tuple, ptr %23, i32 0, i32 4, !dbg !5520
  store i8 0, ptr %24, align 1, !dbg !5521, !tbaa !2978
  ret void, !dbg !5522
}

; Function Attrs: nounwind
define internal i32 @remaining_pkt_payload(ptr noundef %0) #0 !dbg !5523 {
  %2 = alloca ptr, align 8
  %3 = alloca i32, align 4
  store ptr %0, ptr %2, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %2, metadata !5527, metadata !DIExpression()), !dbg !5529
  call void @llvm.lifetime.start.p0(i64 4, ptr %3) #14, !dbg !5530
  call void @llvm.dbg.declare(metadata ptr %3, metadata !5528, metadata !DIExpression()), !dbg !5531
  %4 = load ptr, ptr %2, align 8, !dbg !5532, !tbaa !943
  %5 = getelementptr inbounds %struct.parsing_context, ptr %4, i32 0, i32 2, !dbg !5533
  %6 = getelementptr inbounds %struct.hdr_cursor, ptr %5, i32 0, i32 0, !dbg !5534
  %7 = load ptr, ptr %6, align 8, !dbg !5534, !tbaa !5210
  %8 = load ptr, ptr %2, align 8, !dbg !5535, !tbaa !943
  %9 = getelementptr inbounds %struct.parsing_context, ptr %8, i32 0, i32 0, !dbg !5536
  %10 = load ptr, ptr %9, align 8, !dbg !5536, !tbaa !3789
  %11 = ptrtoint ptr %7 to i64, !dbg !5537
  %12 = ptrtoint ptr %10 to i64, !dbg !5537
  %13 = sub i64 %11, %12, !dbg !5537
  %14 = trunc i64 %13 to i32, !dbg !5532
  store i32 %14, ptr %3, align 4, !dbg !5531, !tbaa !996
  %15 = load i32, ptr %3, align 4, !dbg !5538, !tbaa !996
  %16 = load ptr, ptr %2, align 8, !dbg !5539, !tbaa !943
  %17 = getelementptr inbounds %struct.parsing_context, ptr %16, i32 0, i32 3, !dbg !5540
  %18 = load i32, ptr %17, align 8, !dbg !5540, !tbaa !3804
  %19 = icmp ult i32 %15, %18, !dbg !5541
  br i1 %19, label %20, label %26, !dbg !5538

20:                                               ; preds = %1
  %21 = load ptr, ptr %2, align 8, !dbg !5542, !tbaa !943
  %22 = getelementptr inbounds %struct.parsing_context, ptr %21, i32 0, i32 3, !dbg !5543
  %23 = load i32, ptr %22, align 8, !dbg !5543, !tbaa !3804
  %24 = load i32, ptr %3, align 4, !dbg !5544, !tbaa !996
  %25 = sub i32 %23, %24, !dbg !5545
  br label %27, !dbg !5538

26:                                               ; preds = %1
  br label %27, !dbg !5538

27:                                               ; preds = %26, %20
  %28 = phi i32 [ %25, %20 ], [ 0, %26 ], !dbg !5538
  call void @llvm.lifetime.end.p0(i64 4, ptr %3) #14, !dbg !5546
  ret i32 %28, !dbg !5547
}

; Function Attrs: alwaysinline nounwind
define internal i32 @parse_icmphdr(ptr noundef %0, ptr noundef %1, ptr noundef %2) #13 !dbg !5548 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %5, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %5, metadata !5553, metadata !DIExpression()), !dbg !5557
  store ptr %1, ptr %6, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %6, metadata !5554, metadata !DIExpression()), !dbg !5558
  store ptr %2, ptr %7, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %7, metadata !5555, metadata !DIExpression()), !dbg !5559
  call void @llvm.lifetime.start.p0(i64 8, ptr %8) #14, !dbg !5560
  call void @llvm.dbg.declare(metadata ptr %8, metadata !5556, metadata !DIExpression()), !dbg !5561
  %10 = load ptr, ptr %5, align 8, !dbg !5562, !tbaa !943
  %11 = getelementptr inbounds %struct.hdr_cursor, ptr %10, i32 0, i32 0, !dbg !5563
  %12 = load ptr, ptr %11, align 8, !dbg !5563, !tbaa !3800
  store ptr %12, ptr %8, align 8, !dbg !5561, !tbaa !943
  %13 = load ptr, ptr %8, align 8, !dbg !5564, !tbaa !943
  %14 = getelementptr inbounds %struct.icmphdr, ptr %13, i64 1, !dbg !5566
  %15 = load ptr, ptr %6, align 8, !dbg !5567, !tbaa !943
  %16 = icmp ugt ptr %14, %15, !dbg !5568
  br i1 %16, label %17, label %18, !dbg !5569

17:                                               ; preds = %3
  store i32 -1, ptr %4, align 4, !dbg !5570
  store i32 1, ptr %9, align 4
  br label %29, !dbg !5570

18:                                               ; preds = %3
  %19 = load ptr, ptr %8, align 8, !dbg !5571, !tbaa !943
  %20 = getelementptr inbounds %struct.icmphdr, ptr %19, i64 1, !dbg !5572
  %21 = load ptr, ptr %5, align 8, !dbg !5573, !tbaa !943
  %22 = getelementptr inbounds %struct.hdr_cursor, ptr %21, i32 0, i32 0, !dbg !5574
  store ptr %20, ptr %22, align 8, !dbg !5575, !tbaa !3800
  %23 = load ptr, ptr %8, align 8, !dbg !5576, !tbaa !943
  %24 = load ptr, ptr %7, align 8, !dbg !5577, !tbaa !943
  store ptr %23, ptr %24, align 8, !dbg !5578, !tbaa !943
  %25 = load ptr, ptr %8, align 8, !dbg !5579, !tbaa !943
  %26 = getelementptr inbounds %struct.icmphdr, ptr %25, i32 0, i32 0, !dbg !5580
  %27 = load i8, ptr %26, align 4, !dbg !5580, !tbaa !5405
  %28 = zext i8 %27 to i32, !dbg !5579
  store i32 %28, ptr %4, align 4, !dbg !5581
  store i32 1, ptr %9, align 4
  br label %29, !dbg !5581

29:                                               ; preds = %18, %17
  call void @llvm.lifetime.end.p0(i64 8, ptr %8) #14, !dbg !5582
  %30 = load i32, ptr %4, align 4, !dbg !5582
  ret i32 %30, !dbg !5582
}

; Function Attrs: alwaysinline nounwind
define internal i32 @parse_icmp6hdr(ptr noundef %0, ptr noundef %1, ptr noundef %2) #13 !dbg !5583 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca ptr, align 8
  %9 = alloca i32, align 4
  store ptr %0, ptr %5, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %5, metadata !5588, metadata !DIExpression()), !dbg !5592
  store ptr %1, ptr %6, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %6, metadata !5589, metadata !DIExpression()), !dbg !5593
  store ptr %2, ptr %7, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %7, metadata !5590, metadata !DIExpression()), !dbg !5594
  call void @llvm.lifetime.start.p0(i64 8, ptr %8) #14, !dbg !5595
  call void @llvm.dbg.declare(metadata ptr %8, metadata !5591, metadata !DIExpression()), !dbg !5596
  %10 = load ptr, ptr %5, align 8, !dbg !5597, !tbaa !943
  %11 = getelementptr inbounds %struct.hdr_cursor, ptr %10, i32 0, i32 0, !dbg !5598
  %12 = load ptr, ptr %11, align 8, !dbg !5598, !tbaa !3800
  store ptr %12, ptr %8, align 8, !dbg !5596, !tbaa !943
  %13 = load ptr, ptr %8, align 8, !dbg !5599, !tbaa !943
  %14 = getelementptr inbounds %struct.icmp6hdr, ptr %13, i64 1, !dbg !5601
  %15 = load ptr, ptr %6, align 8, !dbg !5602, !tbaa !943
  %16 = icmp ugt ptr %14, %15, !dbg !5603
  br i1 %16, label %17, label %18, !dbg !5604

17:                                               ; preds = %3
  store i32 -1, ptr %4, align 4, !dbg !5605
  store i32 1, ptr %9, align 4
  br label %29, !dbg !5605

18:                                               ; preds = %3
  %19 = load ptr, ptr %8, align 8, !dbg !5606, !tbaa !943
  %20 = getelementptr inbounds %struct.icmp6hdr, ptr %19, i64 1, !dbg !5607
  %21 = load ptr, ptr %5, align 8, !dbg !5608, !tbaa !943
  %22 = getelementptr inbounds %struct.hdr_cursor, ptr %21, i32 0, i32 0, !dbg !5609
  store ptr %20, ptr %22, align 8, !dbg !5610, !tbaa !3800
  %23 = load ptr, ptr %8, align 8, !dbg !5611, !tbaa !943
  %24 = load ptr, ptr %7, align 8, !dbg !5612, !tbaa !943
  store ptr %23, ptr %24, align 8, !dbg !5613, !tbaa !943
  %25 = load ptr, ptr %8, align 8, !dbg !5614, !tbaa !943
  %26 = getelementptr inbounds %struct.icmp6hdr, ptr %25, i32 0, i32 0, !dbg !5615
  %27 = load i8, ptr %26, align 4, !dbg !5615, !tbaa !5308
  %28 = zext i8 %27 to i32, !dbg !5614
  store i32 %28, ptr %4, align 4, !dbg !5616
  store i32 1, ptr %9, align 4
  br label %29, !dbg !5616

29:                                               ; preds = %18, %17
  call void @llvm.lifetime.end.p0(i64 8, ptr %8) #14, !dbg !5617
  %30 = load i32, ptr %4, align 4, !dbg !5617
  ret i32 %30, !dbg !5617
}

; Function Attrs: alwaysinline nounwind
define internal i32 @parse_tcphdr(ptr noundef %0, ptr noundef %1, ptr noundef %2) #13 !dbg !5618 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca ptr, align 8
  %8 = alloca i32, align 4
  %9 = alloca ptr, align 8
  %10 = alloca i32, align 4
  store ptr %0, ptr %5, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %5, metadata !5623, metadata !DIExpression()), !dbg !5628
  store ptr %1, ptr %6, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %6, metadata !5624, metadata !DIExpression()), !dbg !5629
  store ptr %2, ptr %7, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %7, metadata !5625, metadata !DIExpression()), !dbg !5630
  call void @llvm.lifetime.start.p0(i64 4, ptr %8) #14, !dbg !5631
  call void @llvm.dbg.declare(metadata ptr %8, metadata !5626, metadata !DIExpression()), !dbg !5632
  call void @llvm.lifetime.start.p0(i64 8, ptr %9) #14, !dbg !5633
  call void @llvm.dbg.declare(metadata ptr %9, metadata !5627, metadata !DIExpression()), !dbg !5634
  %11 = load ptr, ptr %5, align 8, !dbg !5635, !tbaa !943
  %12 = getelementptr inbounds %struct.hdr_cursor, ptr %11, i32 0, i32 0, !dbg !5636
  %13 = load ptr, ptr %12, align 8, !dbg !5636, !tbaa !3800
  store ptr %13, ptr %9, align 8, !dbg !5634, !tbaa !943
  %14 = load ptr, ptr %9, align 8, !dbg !5637, !tbaa !943
  %15 = getelementptr inbounds %struct.tcphdr, ptr %14, i64 1, !dbg !5639
  %16 = load ptr, ptr %6, align 8, !dbg !5640, !tbaa !943
  %17 = icmp ugt ptr %15, %16, !dbg !5641
  br i1 %17, label %18, label %19, !dbg !5642

18:                                               ; preds = %3
  store i32 -1, ptr %4, align 4, !dbg !5643
  store i32 1, ptr %10, align 4
  br label %51, !dbg !5643

19:                                               ; preds = %3
  %20 = load ptr, ptr %9, align 8, !dbg !5644, !tbaa !943
  %21 = getelementptr inbounds %struct.tcphdr, ptr %20, i32 0, i32 4, !dbg !5645
  %22 = load i16, ptr %21, align 4, !dbg !5645
  %23 = lshr i16 %22, 4, !dbg !5645
  %24 = and i16 %23, 15, !dbg !5645
  %25 = zext i16 %24 to i32, !dbg !5644
  %26 = mul nsw i32 %25, 4, !dbg !5646
  store i32 %26, ptr %8, align 4, !dbg !5647, !tbaa !996
  %27 = load i32, ptr %8, align 4, !dbg !5648, !tbaa !996
  %28 = sext i32 %27 to i64, !dbg !5648
  %29 = icmp ult i64 %28, 20, !dbg !5650
  br i1 %29, label %30, label %31, !dbg !5651

30:                                               ; preds = %19
  store i32 -1, ptr %4, align 4, !dbg !5652
  store i32 1, ptr %10, align 4
  br label %51, !dbg !5652

31:                                               ; preds = %19
  %32 = load ptr, ptr %5, align 8, !dbg !5653, !tbaa !943
  %33 = getelementptr inbounds %struct.hdr_cursor, ptr %32, i32 0, i32 0, !dbg !5655
  %34 = load ptr, ptr %33, align 8, !dbg !5655, !tbaa !3800
  %35 = load i32, ptr %8, align 4, !dbg !5656, !tbaa !996
  %36 = sext i32 %35 to i64, !dbg !5657
  %37 = getelementptr i8, ptr %34, i64 %36, !dbg !5657
  %38 = load ptr, ptr %6, align 8, !dbg !5658, !tbaa !943
  %39 = icmp ugt ptr %37, %38, !dbg !5659
  br i1 %39, label %40, label %41, !dbg !5660

40:                                               ; preds = %31
  store i32 -1, ptr %4, align 4, !dbg !5661
  store i32 1, ptr %10, align 4
  br label %51, !dbg !5661

41:                                               ; preds = %31
  %42 = load i32, ptr %8, align 4, !dbg !5662, !tbaa !996
  %43 = load ptr, ptr %5, align 8, !dbg !5663, !tbaa !943
  %44 = getelementptr inbounds %struct.hdr_cursor, ptr %43, i32 0, i32 0, !dbg !5664
  %45 = load ptr, ptr %44, align 8, !dbg !5665, !tbaa !3800
  %46 = sext i32 %42 to i64, !dbg !5665
  %47 = getelementptr i8, ptr %45, i64 %46, !dbg !5665
  store ptr %47, ptr %44, align 8, !dbg !5665, !tbaa !3800
  %48 = load ptr, ptr %9, align 8, !dbg !5666, !tbaa !943
  %49 = load ptr, ptr %7, align 8, !dbg !5667, !tbaa !943
  store ptr %48, ptr %49, align 8, !dbg !5668, !tbaa !943
  %50 = load i32, ptr %8, align 4, !dbg !5669, !tbaa !996
  store i32 %50, ptr %4, align 4, !dbg !5670
  store i32 1, ptr %10, align 4
  br label %51, !dbg !5670

51:                                               ; preds = %41, %40, %30, %18
  call void @llvm.lifetime.end.p0(i64 8, ptr %9) #14, !dbg !5671
  call void @llvm.lifetime.end.p0(i64 4, ptr %8) #14, !dbg !5671
  %52 = load i32, ptr %4, align 4, !dbg !5671
  ret i32 %52, !dbg !5671
}

; Function Attrs: nounwind
define internal i32 @parse_tcp_ts(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #0 !dbg !5672 {
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
  store ptr %0, ptr %6, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %6, metadata !5676, metadata !DIExpression()), !dbg !5687
  store ptr %1, ptr %7, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %7, metadata !5677, metadata !DIExpression()), !dbg !5688
  store ptr %2, ptr %8, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %8, metadata !5678, metadata !DIExpression()), !dbg !5689
  store ptr %3, ptr %9, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %9, metadata !5679, metadata !DIExpression()), !dbg !5690
  call void @llvm.lifetime.start.p0(i64 4, ptr %10) #14, !dbg !5691
  call void @llvm.dbg.declare(metadata ptr %10, metadata !5680, metadata !DIExpression()), !dbg !5692
  %17 = load ptr, ptr %6, align 8, !dbg !5693, !tbaa !943
  %18 = getelementptr inbounds %struct.tcphdr, ptr %17, i32 0, i32 4, !dbg !5694
  %19 = load i16, ptr %18, align 4, !dbg !5694
  %20 = lshr i16 %19, 4, !dbg !5694
  %21 = and i16 %20, 15, !dbg !5694
  %22 = zext i16 %21 to i32, !dbg !5693
  %23 = shl i32 %22, 2, !dbg !5695
  store i32 %23, ptr %10, align 4, !dbg !5692, !tbaa !996
  call void @llvm.lifetime.start.p0(i64 8, ptr %11) #14, !dbg !5696
  call void @llvm.dbg.declare(metadata ptr %11, metadata !5681, metadata !DIExpression()), !dbg !5697
  %24 = load ptr, ptr %6, align 8, !dbg !5698, !tbaa !943
  %25 = load i32, ptr %10, align 4, !dbg !5699, !tbaa !996
  %26 = sext i32 %25 to i64, !dbg !5700
  %27 = getelementptr i8, ptr %24, i64 %26, !dbg !5700
  store ptr %27, ptr %11, align 8, !dbg !5697, !tbaa !943
  call void @llvm.lifetime.start.p0(i64 8, ptr %12) #14, !dbg !5701
  call void @llvm.dbg.declare(metadata ptr %12, metadata !5682, metadata !DIExpression()), !dbg !5702
  %28 = load ptr, ptr %6, align 8, !dbg !5703, !tbaa !943
  %29 = getelementptr inbounds %struct.tcphdr, ptr %28, i64 1, !dbg !5704
  store ptr %29, ptr %12, align 8, !dbg !5702, !tbaa !943
  call void @llvm.lifetime.start.p0(i64 1, ptr %13) #14, !dbg !5705
  call void @llvm.dbg.declare(metadata ptr %13, metadata !5683, metadata !DIExpression()), !dbg !5706
  call void @llvm.lifetime.start.p0(i64 1, ptr %14) #14, !dbg !5705
  call void @llvm.dbg.declare(metadata ptr %14, metadata !5684, metadata !DIExpression()), !dbg !5707
  call void @llvm.lifetime.start.p0(i64 1, ptr %15) #14, !dbg !5708
  call void @llvm.dbg.declare(metadata ptr %15, metadata !5685, metadata !DIExpression()), !dbg !5709
  %30 = load ptr, ptr %6, align 8, !dbg !5710, !tbaa !943
  %31 = getelementptr inbounds %struct.tcphdr, ptr %30, i64 1, !dbg !5712
  %32 = load ptr, ptr %7, align 8, !dbg !5713, !tbaa !943
  %33 = icmp ugt ptr %31, %32, !dbg !5714
  br i1 %33, label %38, label %34, !dbg !5715

34:                                               ; preds = %4
  %35 = load i32, ptr %10, align 4, !dbg !5716, !tbaa !996
  %36 = sext i32 %35 to i64, !dbg !5716
  %37 = icmp ule i64 %36, 20, !dbg !5717
  br i1 %37, label %38, label %39, !dbg !5718

38:                                               ; preds = %34, %4
  store i32 -1, ptr %5, align 4, !dbg !5719
  store i32 1, ptr %16, align 4
  br label %126, !dbg !5719

39:                                               ; preds = %34
  store i8 0, ptr %13, align 1, !dbg !5720, !tbaa !981
  br label %40, !dbg !5722

40:                                               ; preds = %122, %39
  %41 = load i8, ptr %13, align 1, !dbg !5723, !tbaa !981
  %42 = zext i8 %41 to i32, !dbg !5723
  %43 = icmp slt i32 %42, 10, !dbg !5725
  br i1 %43, label %44, label %125, !dbg !5726

44:                                               ; preds = %40
  %45 = load ptr, ptr %12, align 8, !dbg !5727, !tbaa !943
  %46 = getelementptr inbounds i8, ptr %45, i64 1, !dbg !5730
  %47 = load ptr, ptr %11, align 8, !dbg !5731, !tbaa !943
  %48 = icmp ugt ptr %46, %47, !dbg !5732
  br i1 %48, label %54, label %49, !dbg !5733

49:                                               ; preds = %44
  %50 = load ptr, ptr %12, align 8, !dbg !5734, !tbaa !943
  %51 = getelementptr inbounds i8, ptr %50, i64 1, !dbg !5735
  %52 = load ptr, ptr %7, align 8, !dbg !5736, !tbaa !943
  %53 = icmp ugt ptr %51, %52, !dbg !5737
  br i1 %53, label %54, label %55, !dbg !5738

54:                                               ; preds = %49, %44
  store i32 -1, ptr %5, align 4, !dbg !5739
  store i32 1, ptr %16, align 4
  br label %126, !dbg !5739

55:                                               ; preds = %49
  %56 = load ptr, ptr %12, align 8, !dbg !5740, !tbaa !943
  %57 = load i8, ptr %56, align 1, !dbg !5741, !tbaa !981
  store i8 %57, ptr %14, align 1, !dbg !5742, !tbaa !981
  %58 = load i8, ptr %14, align 1, !dbg !5743, !tbaa !981
  %59 = zext i8 %58 to i32, !dbg !5743
  %60 = icmp eq i32 %59, 0, !dbg !5745
  br i1 %60, label %61, label %62, !dbg !5746

61:                                               ; preds = %55
  store i32 -1, ptr %5, align 4, !dbg !5747
  store i32 1, ptr %16, align 4
  br label %126, !dbg !5747

62:                                               ; preds = %55
  %63 = load i8, ptr %14, align 1, !dbg !5748, !tbaa !981
  %64 = zext i8 %63 to i32, !dbg !5748
  %65 = icmp eq i32 %64, 1, !dbg !5750
  br i1 %65, label %66, label %69, !dbg !5751

66:                                               ; preds = %62
  %67 = load ptr, ptr %12, align 8, !dbg !5752, !tbaa !943
  %68 = getelementptr inbounds i8, ptr %67, i32 1, !dbg !5752
  store ptr %68, ptr %12, align 8, !dbg !5752, !tbaa !943
  br label %122, !dbg !5754

69:                                               ; preds = %62
  %70 = load ptr, ptr %12, align 8, !dbg !5755, !tbaa !943
  %71 = getelementptr inbounds i8, ptr %70, i64 2, !dbg !5757
  %72 = load ptr, ptr %11, align 8, !dbg !5758, !tbaa !943
  %73 = icmp ugt ptr %71, %72, !dbg !5759
  br i1 %73, label %79, label %74, !dbg !5760

74:                                               ; preds = %69
  %75 = load ptr, ptr %12, align 8, !dbg !5761, !tbaa !943
  %76 = getelementptr inbounds i8, ptr %75, i64 2, !dbg !5762
  %77 = load ptr, ptr %7, align 8, !dbg !5763, !tbaa !943
  %78 = icmp ugt ptr %76, %77, !dbg !5764
  br i1 %78, label %79, label %80, !dbg !5765

79:                                               ; preds = %74, %69
  store i32 -1, ptr %5, align 4, !dbg !5766
  store i32 1, ptr %16, align 4
  br label %126, !dbg !5766

80:                                               ; preds = %74
  %81 = load ptr, ptr %12, align 8, !dbg !5767, !tbaa !943
  %82 = getelementptr inbounds i8, ptr %81, i64 1, !dbg !5768
  %83 = load i8, ptr %82, align 1, !dbg !5769, !tbaa !981
  store volatile i8 %83, ptr %15, align 1, !dbg !5770, !tbaa !981
  %84 = load volatile i8, ptr %15, align 1, !dbg !5771, !tbaa !981
  %85 = zext i8 %84 to i32, !dbg !5771
  %86 = icmp slt i32 %85, 2, !dbg !5773
  br i1 %86, label %87, label %88, !dbg !5774

87:                                               ; preds = %80
  store i32 -1, ptr %5, align 4, !dbg !5775
  store i32 1, ptr %16, align 4
  br label %126, !dbg !5775

88:                                               ; preds = %80
  %89 = load i8, ptr %14, align 1, !dbg !5776, !tbaa !981
  %90 = zext i8 %89 to i32, !dbg !5776
  %91 = icmp eq i32 %90, 8, !dbg !5778
  br i1 %91, label %92, label %116, !dbg !5779

92:                                               ; preds = %88
  %93 = load volatile i8, ptr %15, align 1, !dbg !5780, !tbaa !981
  %94 = zext i8 %93 to i32, !dbg !5780
  %95 = icmp eq i32 %94, 10, !dbg !5781
  br i1 %95, label %96, label %116, !dbg !5782

96:                                               ; preds = %92
  %97 = load ptr, ptr %12, align 8, !dbg !5783, !tbaa !943
  %98 = getelementptr inbounds i8, ptr %97, i64 10, !dbg !5786
  %99 = load ptr, ptr %11, align 8, !dbg !5787, !tbaa !943
  %100 = icmp ugt ptr %98, %99, !dbg !5788
  br i1 %100, label %106, label %101, !dbg !5789

101:                                              ; preds = %96
  %102 = load ptr, ptr %12, align 8, !dbg !5790, !tbaa !943
  %103 = getelementptr inbounds i8, ptr %102, i64 10, !dbg !5791
  %104 = load ptr, ptr %7, align 8, !dbg !5792, !tbaa !943
  %105 = icmp ugt ptr %103, %104, !dbg !5793
  br i1 %105, label %106, label %107, !dbg !5794

106:                                              ; preds = %101, %96
  store i32 -1, ptr %5, align 4, !dbg !5795
  store i32 1, ptr %16, align 4
  br label %126, !dbg !5795

107:                                              ; preds = %101
  %108 = load ptr, ptr %12, align 8, !dbg !5796, !tbaa !943
  %109 = getelementptr inbounds i8, ptr %108, i64 2, !dbg !5797
  %110 = load i32, ptr %109, align 4, !dbg !5798, !tbaa !996
  %111 = load ptr, ptr %8, align 8, !dbg !5799, !tbaa !943
  store i32 %110, ptr %111, align 4, !dbg !5800, !tbaa !996
  %112 = load ptr, ptr %12, align 8, !dbg !5801, !tbaa !943
  %113 = getelementptr inbounds i8, ptr %112, i64 6, !dbg !5802
  %114 = load i32, ptr %113, align 4, !dbg !5803, !tbaa !996
  %115 = load ptr, ptr %9, align 8, !dbg !5804, !tbaa !943
  store i32 %114, ptr %115, align 4, !dbg !5805, !tbaa !996
  store i32 0, ptr %5, align 4, !dbg !5806
  store i32 1, ptr %16, align 4
  br label %126, !dbg !5806

116:                                              ; preds = %92, %88
  %117 = load volatile i8, ptr %15, align 1, !dbg !5807, !tbaa !981
  %118 = zext i8 %117 to i32, !dbg !5807
  %119 = load ptr, ptr %12, align 8, !dbg !5808, !tbaa !943
  %120 = sext i32 %118 to i64, !dbg !5808
  %121 = getelementptr inbounds i8, ptr %119, i64 %120, !dbg !5808
  store ptr %121, ptr %12, align 8, !dbg !5808, !tbaa !943
  br label %122, !dbg !5809

122:                                              ; preds = %116, %66
  %123 = load i8, ptr %13, align 1, !dbg !5810, !tbaa !981
  %124 = add i8 %123, 1, !dbg !5810
  store i8 %124, ptr %13, align 1, !dbg !5810, !tbaa !981
  br label %40, !dbg !5811, !llvm.loop !5812

125:                                              ; preds = %40
  store i32 -1, ptr %5, align 4, !dbg !5815
  store i32 1, ptr %16, align 4
  br label %126, !dbg !5815

126:                                              ; preds = %125, %107, %106, %87, %79, %61, %54, %38
  call void @llvm.lifetime.end.p0(i64 1, ptr %15) #14, !dbg !5816
  call void @llvm.lifetime.end.p0(i64 1, ptr %14) #14, !dbg !5816
  call void @llvm.lifetime.end.p0(i64 1, ptr %13) #14, !dbg !5816
  call void @llvm.lifetime.end.p0(i64 8, ptr %12) #14, !dbg !5816
  call void @llvm.lifetime.end.p0(i64 8, ptr %11) #14, !dbg !5816
  call void @llvm.lifetime.end.p0(i64 4, ptr %10) #14, !dbg !5816
  %127 = load i32, ptr %5, align 4, !dbg !5816
  ret i32 %127, !dbg !5816
}

; Function Attrs: alwaysinline nounwind
define internal i32 @skip_ip6hdrext(ptr noundef %0, ptr noundef %1, i8 noundef zeroext %2) #13 !dbg !5817 {
  %4 = alloca i32, align 4
  %5 = alloca ptr, align 8
  %6 = alloca ptr, align 8
  %7 = alloca i8, align 1
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca ptr, align 8
  store ptr %0, ptr %5, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %5, metadata !5821, metadata !DIExpression()), !dbg !5834
  store ptr %1, ptr %6, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %6, metadata !5822, metadata !DIExpression()), !dbg !5835
  store i8 %2, ptr %7, align 1, !tbaa !981
  call void @llvm.dbg.declare(metadata ptr %7, metadata !5823, metadata !DIExpression()), !dbg !5836
  call void @llvm.lifetime.start.p0(i64 4, ptr %8) #14, !dbg !5837
  call void @llvm.dbg.declare(metadata ptr %8, metadata !5824, metadata !DIExpression()), !dbg !5838
  store i32 0, ptr %8, align 4, !dbg !5838, !tbaa !996
  br label %11, !dbg !5837

11:                                               ; preds = %72, %3
  %12 = load i32, ptr %8, align 4, !dbg !5839, !tbaa !996
  %13 = icmp slt i32 %12, 3, !dbg !5840
  br i1 %13, label %15, label %14, !dbg !5841

14:                                               ; preds = %11
  store i32 2, ptr %9, align 4
  br label %75, !dbg !5841

15:                                               ; preds = %11
  call void @llvm.lifetime.start.p0(i64 8, ptr %10) #14, !dbg !5842
  call void @llvm.dbg.declare(metadata ptr %10, metadata !5826, metadata !DIExpression()), !dbg !5843
  %16 = load ptr, ptr %5, align 8, !dbg !5844, !tbaa !943
  %17 = getelementptr inbounds %struct.hdr_cursor, ptr %16, i32 0, i32 0, !dbg !5845
  %18 = load ptr, ptr %17, align 8, !dbg !5845, !tbaa !3800
  store ptr %18, ptr %10, align 8, !dbg !5843, !tbaa !943
  %19 = load ptr, ptr %10, align 8, !dbg !5846, !tbaa !943
  %20 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %19, i64 1, !dbg !5848
  %21 = load ptr, ptr %6, align 8, !dbg !5849, !tbaa !943
  %22 = icmp ugt ptr %20, %21, !dbg !5850
  br i1 %22, label %23, label %24, !dbg !5851

23:                                               ; preds = %15
  store i32 -1, ptr %4, align 4, !dbg !5852
  store i32 1, ptr %9, align 4
  br label %69, !dbg !5852

24:                                               ; preds = %15
  %25 = load i8, ptr %7, align 1, !dbg !5853, !tbaa !981
  %26 = zext i8 %25 to i32, !dbg !5853
  switch i32 %26, label %65 [
    i32 0, label %27
    i32 60, label %27
    i32 43, label %27
    i32 135, label %27
    i32 51, label %42
    i32 44, label %57
  ], !dbg !5854

27:                                               ; preds = %24, %24, %24, %24
  %28 = load ptr, ptr %10, align 8, !dbg !5855, !tbaa !943
  %29 = load ptr, ptr %10, align 8, !dbg !5857, !tbaa !943
  %30 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %29, i32 0, i32 1, !dbg !5858
  %31 = load i8, ptr %30, align 1, !dbg !5858, !tbaa !5859
  %32 = zext i8 %31 to i32, !dbg !5857
  %33 = add nsw i32 %32, 1, !dbg !5861
  %34 = mul nsw i32 %33, 8, !dbg !5862
  %35 = sext i32 %34 to i64, !dbg !5863
  %36 = getelementptr inbounds i8, ptr %28, i64 %35, !dbg !5863
  %37 = load ptr, ptr %5, align 8, !dbg !5864, !tbaa !943
  %38 = getelementptr inbounds %struct.hdr_cursor, ptr %37, i32 0, i32 0, !dbg !5865
  store ptr %36, ptr %38, align 8, !dbg !5866, !tbaa !3800
  %39 = load ptr, ptr %10, align 8, !dbg !5867, !tbaa !943
  %40 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %39, i32 0, i32 0, !dbg !5868
  %41 = load i8, ptr %40, align 1, !dbg !5868, !tbaa !5869
  store i8 %41, ptr %7, align 1, !dbg !5870, !tbaa !981
  br label %68, !dbg !5871

42:                                               ; preds = %24
  %43 = load ptr, ptr %10, align 8, !dbg !5872, !tbaa !943
  %44 = load ptr, ptr %10, align 8, !dbg !5873, !tbaa !943
  %45 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %44, i32 0, i32 1, !dbg !5874
  %46 = load i8, ptr %45, align 1, !dbg !5874, !tbaa !5859
  %47 = zext i8 %46 to i32, !dbg !5873
  %48 = add nsw i32 %47, 2, !dbg !5875
  %49 = mul nsw i32 %48, 4, !dbg !5876
  %50 = sext i32 %49 to i64, !dbg !5877
  %51 = getelementptr inbounds i8, ptr %43, i64 %50, !dbg !5877
  %52 = load ptr, ptr %5, align 8, !dbg !5878, !tbaa !943
  %53 = getelementptr inbounds %struct.hdr_cursor, ptr %52, i32 0, i32 0, !dbg !5879
  store ptr %51, ptr %53, align 8, !dbg !5880, !tbaa !3800
  %54 = load ptr, ptr %10, align 8, !dbg !5881, !tbaa !943
  %55 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %54, i32 0, i32 0, !dbg !5882
  %56 = load i8, ptr %55, align 1, !dbg !5882, !tbaa !5869
  store i8 %56, ptr %7, align 1, !dbg !5883, !tbaa !981
  br label %68, !dbg !5884

57:                                               ; preds = %24
  %58 = load ptr, ptr %10, align 8, !dbg !5885, !tbaa !943
  %59 = getelementptr inbounds i8, ptr %58, i64 8, !dbg !5886
  %60 = load ptr, ptr %5, align 8, !dbg !5887, !tbaa !943
  %61 = getelementptr inbounds %struct.hdr_cursor, ptr %60, i32 0, i32 0, !dbg !5888
  store ptr %59, ptr %61, align 8, !dbg !5889, !tbaa !3800
  %62 = load ptr, ptr %10, align 8, !dbg !5890, !tbaa !943
  %63 = getelementptr inbounds %struct.ipv6_opt_hdr, ptr %62, i32 0, i32 0, !dbg !5891
  %64 = load i8, ptr %63, align 1, !dbg !5891, !tbaa !5869
  store i8 %64, ptr %7, align 1, !dbg !5892, !tbaa !981
  br label %68, !dbg !5893

65:                                               ; preds = %24
  %66 = load i8, ptr %7, align 1, !dbg !5894, !tbaa !981
  %67 = zext i8 %66 to i32, !dbg !5894
  store i32 %67, ptr %4, align 4, !dbg !5895
  store i32 1, ptr %9, align 4
  br label %69, !dbg !5895

68:                                               ; preds = %57, %42, %27
  store i32 0, ptr %9, align 4, !dbg !5896
  br label %69, !dbg !5896

69:                                               ; preds = %68, %65, %23
  call void @llvm.lifetime.end.p0(i64 8, ptr %10) #14, !dbg !5896
  %70 = load i32, ptr %9, align 4
  switch i32 %70, label %75 [
    i32 0, label %71
  ]

71:                                               ; preds = %69
  br label %72, !dbg !5897

72:                                               ; preds = %71
  %73 = load i32, ptr %8, align 4, !dbg !5898, !tbaa !996
  %74 = add nsw i32 %73, 1, !dbg !5898
  store i32 %74, ptr %8, align 4, !dbg !5898, !tbaa !996
  br label %11, !dbg !5899, !llvm.loop !5900

75:                                               ; preds = %69, %14
  call void @llvm.lifetime.end.p0(i64 4, ptr %8) #14, !dbg !5899
  %76 = load i32, ptr %9, align 4
  switch i32 %76, label %80 [
    i32 2, label %77
    i32 1, label %78
  ]

77:                                               ; preds = %75
  store i32 -1, ptr %4, align 4, !dbg !5902
  br label %78, !dbg !5902

78:                                               ; preds = %77, %75
  %79 = load i32, ptr %4, align 4, !dbg !5903
  ret i32 %79, !dbg !5903

80:                                               ; preds = %75
  unreachable
}

; Function Attrs: alwaysinline nounwind
define internal i32 @parse_ethhdr_vlan(ptr noundef %0, ptr noundef %1, ptr noundef %2, ptr noundef %3) #13 !dbg !5904 {
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
  store ptr %0, ptr %6, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %6, metadata !5913, metadata !DIExpression()), !dbg !5927
  store ptr %1, ptr %7, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %7, metadata !5914, metadata !DIExpression()), !dbg !5928
  store ptr %2, ptr %8, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %8, metadata !5915, metadata !DIExpression()), !dbg !5929
  store ptr %3, ptr %9, align 8, !tbaa !943
  call void @llvm.dbg.declare(metadata ptr %9, metadata !5916, metadata !DIExpression()), !dbg !5930
  call void @llvm.lifetime.start.p0(i64 8, ptr %10) #14, !dbg !5931
  call void @llvm.dbg.declare(metadata ptr %10, metadata !5917, metadata !DIExpression()), !dbg !5932
  %16 = load ptr, ptr %6, align 8, !dbg !5933, !tbaa !943
  %17 = getelementptr inbounds %struct.hdr_cursor, ptr %16, i32 0, i32 0, !dbg !5934
  %18 = load ptr, ptr %17, align 8, !dbg !5934, !tbaa !3800
  store ptr %18, ptr %10, align 8, !dbg !5932, !tbaa !943
  call void @llvm.lifetime.start.p0(i64 4, ptr %11) #14, !dbg !5935
  call void @llvm.dbg.declare(metadata ptr %11, metadata !5918, metadata !DIExpression()), !dbg !5936
  store i32 14, ptr %11, align 4, !dbg !5936, !tbaa !996
  call void @llvm.lifetime.start.p0(i64 8, ptr %12) #14, !dbg !5937
  call void @llvm.dbg.declare(metadata ptr %12, metadata !5919, metadata !DIExpression()), !dbg !5938
  call void @llvm.lifetime.start.p0(i64 2, ptr %13) #14, !dbg !5939
  call void @llvm.dbg.declare(metadata ptr %13, metadata !5925, metadata !DIExpression()), !dbg !5940
  call void @llvm.lifetime.start.p0(i64 4, ptr %14) #14, !dbg !5941
  call void @llvm.dbg.declare(metadata ptr %14, metadata !5926, metadata !DIExpression()), !dbg !5942
  %19 = load ptr, ptr %6, align 8, !dbg !5943, !tbaa !943
  %20 = getelementptr inbounds %struct.hdr_cursor, ptr %19, i32 0, i32 0, !dbg !5945
  %21 = load ptr, ptr %20, align 8, !dbg !5945, !tbaa !3800
  %22 = load i32, ptr %11, align 4, !dbg !5946, !tbaa !996
  %23 = sext i32 %22 to i64, !dbg !5947
  %24 = getelementptr i8, ptr %21, i64 %23, !dbg !5947
  %25 = load ptr, ptr %7, align 8, !dbg !5948, !tbaa !943
  %26 = icmp ugt ptr %24, %25, !dbg !5949
  br i1 %26, label %27, label %28, !dbg !5950

27:                                               ; preds = %4
  store i32 -1, ptr %5, align 4, !dbg !5951
  store i32 1, ptr %15, align 4
  br label %113, !dbg !5951

28:                                               ; preds = %4
  %29 = load i32, ptr %11, align 4, !dbg !5952, !tbaa !996
  %30 = load ptr, ptr %6, align 8, !dbg !5953, !tbaa !943
  %31 = getelementptr inbounds %struct.hdr_cursor, ptr %30, i32 0, i32 0, !dbg !5954
  %32 = load ptr, ptr %31, align 8, !dbg !5955, !tbaa !3800
  %33 = sext i32 %29 to i64, !dbg !5955
  %34 = getelementptr i8, ptr %32, i64 %33, !dbg !5955
  store ptr %34, ptr %31, align 8, !dbg !5955, !tbaa !3800
  %35 = load ptr, ptr %10, align 8, !dbg !5956, !tbaa !943
  %36 = load ptr, ptr %8, align 8, !dbg !5957, !tbaa !943
  store ptr %35, ptr %36, align 8, !dbg !5958, !tbaa !943
  %37 = load ptr, ptr %6, align 8, !dbg !5959, !tbaa !943
  %38 = getelementptr inbounds %struct.hdr_cursor, ptr %37, i32 0, i32 0, !dbg !5960
  %39 = load ptr, ptr %38, align 8, !dbg !5960, !tbaa !3800
  store ptr %39, ptr %12, align 8, !dbg !5961, !tbaa !943
  %40 = load ptr, ptr %10, align 8, !dbg !5962, !tbaa !943
  %41 = getelementptr inbounds %struct.ethhdr, ptr %40, i32 0, i32 2, !dbg !5963
  %42 = load i16, ptr %41, align 1, !dbg !5963, !tbaa !5964
  store i16 %42, ptr %13, align 2, !dbg !5966, !tbaa !2499
  store i32 0, ptr %14, align 4, !dbg !5967, !tbaa !996
  br label %43, !dbg !5969

43:                                               ; preds = %104, %28
  %44 = load i32, ptr %14, align 4, !dbg !5970, !tbaa !996
  %45 = icmp slt i32 %44, 2, !dbg !5972
  br i1 %45, label %46, label %107, !dbg !5973

46:                                               ; preds = %43
  %47 = load i16, ptr %13, align 2, !dbg !5974, !tbaa !2499
  %48 = call i32 @proto_is_vlan(i16 noundef zeroext %47), !dbg !5977
  %49 = icmp ne i32 %48, 0, !dbg !5977
  br i1 %49, label %51, label %50, !dbg !5978

50:                                               ; preds = %46
  br label %107, !dbg !5979

51:                                               ; preds = %46
  %52 = load ptr, ptr %12, align 8, !dbg !5980, !tbaa !943
  %53 = getelementptr inbounds %struct.anon.16, ptr %52, i64 1, !dbg !5982
  %54 = load ptr, ptr %7, align 8, !dbg !5983, !tbaa !943
  %55 = icmp ugt ptr %53, %54, !dbg !5984
  br i1 %55, label %56, label %57, !dbg !5985

56:                                               ; preds = %51
  br label %107, !dbg !5986

57:                                               ; preds = %51
  %58 = load ptr, ptr %12, align 8, !dbg !5987, !tbaa !943
  %59 = getelementptr inbounds %struct.anon.16, ptr %58, i32 0, i32 1, !dbg !5988
  %60 = load i16, ptr %59, align 2, !dbg !5988, !tbaa !5989
  store i16 %60, ptr %13, align 2, !dbg !5991, !tbaa !2499
  %61 = load ptr, ptr %9, align 8, !dbg !5992, !tbaa !943
  %62 = icmp ne ptr %61, null, !dbg !5992
  br i1 %62, label %63, label %101, !dbg !5994

63:                                               ; preds = %57
  %64 = load ptr, ptr %12, align 8, !dbg !5995, !tbaa !943
  %65 = getelementptr inbounds %struct.anon.16, ptr %64, i32 0, i32 0, !dbg !5995
  %66 = load i16, ptr %65, align 2, !dbg !5995, !tbaa !5996
  %67 = call i1 @llvm.is.constant.i16(i16 %66), !dbg !5995
  br i1 %67, label %68, label %86, !dbg !5995

68:                                               ; preds = %63
  %69 = load ptr, ptr %12, align 8, !dbg !5995, !tbaa !943
  %70 = getelementptr inbounds %struct.anon.16, ptr %69, i32 0, i32 0, !dbg !5995
  %71 = load i16, ptr %70, align 2, !dbg !5995, !tbaa !5996
  %72 = zext i16 %71 to i32, !dbg !5995
  %73 = shl i32 %72, 8, !dbg !5995
  %74 = ashr i32 %73, 8, !dbg !5995
  %75 = shl i32 %74, 8, !dbg !5995
  %76 = load ptr, ptr %12, align 8, !dbg !5995, !tbaa !943
  %77 = getelementptr inbounds %struct.anon.16, ptr %76, i32 0, i32 0, !dbg !5995
  %78 = load i16, ptr %77, align 2, !dbg !5995, !tbaa !5996
  %79 = zext i16 %78 to i32, !dbg !5995
  %80 = shl i32 %79, 0, !dbg !5995
  %81 = ashr i32 %80, 8, !dbg !5995
  %82 = shl i32 %81, 0, !dbg !5995
  %83 = or i32 %75, %82, !dbg !5995
  %84 = trunc i32 %83 to i16, !dbg !5995
  %85 = zext i16 %84 to i32, !dbg !5995
  br label %92, !dbg !5995

86:                                               ; preds = %63
  %87 = load ptr, ptr %12, align 8, !dbg !5995, !tbaa !943
  %88 = getelementptr inbounds %struct.anon.16, ptr %87, i32 0, i32 0, !dbg !5995
  %89 = load i16, ptr %88, align 2, !dbg !5995, !tbaa !5996
  %90 = call i16 @llvm.bswap.i16(i16 %89), !dbg !5995
  %91 = zext i16 %90 to i32, !dbg !5995
  br label %92, !dbg !5995

92:                                               ; preds = %86, %68
  %93 = phi i32 [ %85, %68 ], [ %91, %86 ], !dbg !5995
  %94 = and i32 %93, 4095, !dbg !5997
  %95 = trunc i32 %94 to i16, !dbg !5998
  %96 = load ptr, ptr %9, align 8, !dbg !5999, !tbaa !943
  %97 = getelementptr inbounds %struct.collect_vlans, ptr %96, i32 0, i32 0, !dbg !6000
  %98 = load i32, ptr %14, align 4, !dbg !6001, !tbaa !996
  %99 = sext i32 %98 to i64, !dbg !5999
  %100 = getelementptr inbounds [2 x i16], ptr %97, i64 0, i64 %99, !dbg !5999
  store i16 %95, ptr %100, align 2, !dbg !6002, !tbaa !2499
  br label %101, !dbg !5999

101:                                              ; preds = %92, %57
  %102 = load ptr, ptr %12, align 8, !dbg !6003, !tbaa !943
  %103 = getelementptr inbounds %struct.anon.16, ptr %102, i32 1, !dbg !6003
  store ptr %103, ptr %12, align 8, !dbg !6003, !tbaa !943
  br label %104, !dbg !6004

104:                                              ; preds = %101
  %105 = load i32, ptr %14, align 4, !dbg !6005, !tbaa !996
  %106 = add nsw i32 %105, 1, !dbg !6005
  store i32 %106, ptr %14, align 4, !dbg !6005, !tbaa !996
  br label %43, !dbg !6006, !llvm.loop !6007

107:                                              ; preds = %56, %50, %43
  %108 = load ptr, ptr %12, align 8, !dbg !6009, !tbaa !943
  %109 = load ptr, ptr %6, align 8, !dbg !6010, !tbaa !943
  %110 = getelementptr inbounds %struct.hdr_cursor, ptr %109, i32 0, i32 0, !dbg !6011
  store ptr %108, ptr %110, align 8, !dbg !6012, !tbaa !3800
  %111 = load i16, ptr %13, align 2, !dbg !6013, !tbaa !2499
  %112 = zext i16 %111 to i32, !dbg !6013
  store i32 %112, ptr %5, align 4, !dbg !6014
  store i32 1, ptr %15, align 4
  br label %113, !dbg !6014

113:                                              ; preds = %107, %27
  call void @llvm.lifetime.end.p0(i64 4, ptr %14) #14, !dbg !6015
  call void @llvm.lifetime.end.p0(i64 2, ptr %13) #14, !dbg !6015
  call void @llvm.lifetime.end.p0(i64 8, ptr %12) #14, !dbg !6015
  call void @llvm.lifetime.end.p0(i64 4, ptr %11) #14, !dbg !6015
  call void @llvm.lifetime.end.p0(i64 8, ptr %10) #14, !dbg !6015
  %114 = load i32, ptr %5, align 4, !dbg !6015
  ret i32 %114, !dbg !6015
}

; Function Attrs: alwaysinline nounwind
define internal i32 @proto_is_vlan(i16 noundef zeroext %0) #13 !dbg !6016 {
  %2 = alloca i16, align 2
  store i16 %0, ptr %2, align 2, !tbaa !2499
  call void @llvm.dbg.declare(metadata ptr %2, metadata !6020, metadata !DIExpression()), !dbg !6021
  %3 = load i16, ptr %2, align 2, !dbg !6022, !tbaa !2499
  %4 = zext i16 %3 to i32, !dbg !6022
  %5 = icmp eq i32 %4, 129, !dbg !6023
  br i1 %5, label %10, label %6, !dbg !6024

6:                                                ; preds = %1
  %7 = load i16, ptr %2, align 2, !dbg !6025, !tbaa !2499
  %8 = zext i16 %7 to i32, !dbg !6025
  %9 = icmp eq i32 %8, 43144, !dbg !6026
  br label %10, !dbg !6024

10:                                               ; preds = %6, %1
  %11 = phi i1 [ true, %1 ], [ %9, %6 ]
  %12 = xor i1 %11, true, !dbg !6027
  %13 = xor i1 %12, true, !dbg !6028
  %14 = zext i1 %13 to i32, !dbg !6028
  ret i32 %14, !dbg !6029
}

attributes #0 = { nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { nocallback nofree nosync nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nocallback nofree nounwind willreturn memory(argmem: write) }
attributes #4 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #5 = { "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #6 = { nounwind willreturn memory(read) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #7 = { inlinehint nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #8 = { nounwind willreturn memory(none) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #9 = { noreturn "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #10 = { nounwind allocsize(0) "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #11 = { noreturn nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #12 = { convergent nocallback nofree nosync nounwind willreturn memory(none) }
attributes #13 = { alwaysinline nounwind "frame-pointer"="all" "no-trapping-math"="true" "stack-protector-buffer-size"="8" }
attributes #14 = { nounwind }
attributes #15 = { nounwind willreturn memory(read) }
attributes #16 = { nounwind willreturn memory(none) }
attributes #17 = { noreturn nounwind }
attributes #18 = { noreturn }
attributes #19 = { nounwind allocsize(0) }

!llvm.dbg.cu = !{!36, !693}
!llvm.ident = !{!893, !893}
!llvm.module.flags = !{!894, !895, !896, !897}

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
!691 = !DIGlobalVariableExpression(var: !692, expr: !DIExpression())
!692 = distinct !DIGlobalVariable(name: "_license", scope: !693, file: !694, line: 82, type: !9, isLocal: false, isDefinition: true)
!693 = distinct !DICompileUnit(language: DW_LANG_C11, file: !694, producer: "clang version 16.0.0", isOptimized: true, runtimeVersion: 0, emissionKind: FullDebug, enums: !695, retainedTypes: !728, globals: !748, splitDebugInlining: false, nameTableKind: None)
!694 = !DIFile(filename: "pping_kern.c", directory: "/home/demo/bpf-examples/pping", checksumkind: CSK_MD5, checksum: "ba8946e8e057f67fd5341ac949fe30c6")
!695 = !{!696, !52, !44, !704, !706, !65, !712, !717, !60}
!696 = !DICompositeType(tag: DW_TAG_enumeration_type, name: "xdp_action", file: !697, line: 4363, baseType: !39, size: 32, elements: !698)
!697 = !DIFile(filename: "../lib/../headers/linux/bpf.h", directory: "/home/demo/bpf-examples/pping", checksumkind: CSK_MD5, checksum: "686704d11802f5f210143bc29244c61a")
!698 = !{!699, !700, !701, !702, !703}
!699 = !DIEnumerator(name: "XDP_ABORTED", value: 0)
!700 = !DIEnumerator(name: "XDP_DROP", value: 1)
!701 = !DIEnumerator(name: "XDP_PASS", value: 2)
!702 = !DIEnumerator(name: "XDP_TX", value: 3)
!703 = !DIEnumerator(name: "XDP_REDIRECT", value: 4)
!704 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !705, line: 28, baseType: !39, size: 32, elements: !99)
!705 = !DIFile(filename: "/usr/include/linux/in.h", directory: "", checksumkind: CSK_MD5, checksum: "078a32220dc819f6a7e2ea3cecc4e133")
!706 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !697, line: 397, baseType: !39, size: 32, elements: !707)
!707 = !{!708, !709, !710, !711}
!708 = !DIEnumerator(name: "BPF_ANY", value: 0)
!709 = !DIEnumerator(name: "BPF_NOEXIST", value: 1)
!710 = !DIEnumerator(name: "BPF_EXIST", value: 2)
!711 = !DIEnumerator(name: "BPF_F_LOCK", value: 4)
!712 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !697, line: 4063, baseType: !140, size: 64, elements: !713)
!713 = !{!714, !715, !716}
!714 = !DIEnumerator(name: "BPF_F_INDEX_MASK", value: 4294967295, isUnsigned: true)
!715 = !DIEnumerator(name: "BPF_F_CURRENT_CPU", value: 4294967295, isUnsigned: true)
!716 = !DIEnumerator(name: "BPF_F_CTXLEN_MASK", value: 4503595332403200, isUnsigned: true)
!717 = !DICompositeType(tag: DW_TAG_enumeration_type, file: !697, line: 4955, baseType: !39, size: 32, elements: !718)
!718 = !{!719, !720, !721, !722, !723, !724, !725, !726, !727}
!719 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_SUCCESS", value: 0)
!720 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_BLACKHOLE", value: 1)
!721 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_UNREACHABLE", value: 2)
!722 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_PROHIBIT", value: 3)
!723 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_NOT_FWDED", value: 4)
!724 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_FWD_DISABLED", value: 5)
!725 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_UNSUPP_LWT", value: 6)
!726 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_NO_NEIGH", value: 7)
!727 = !DIEnumerator(name: "BPF_FIB_LKUP_RET_FRAG_NEEDED", value: 8)
!728 = !{!141, !334, !187, !314, !729, !730, !731, !747, !746, !195}
!729 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !192, size: 64)
!730 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !195, size: 64)
!731 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !732, size: 64)
!732 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "in6_addr", file: !733, line: 33, size: 128, elements: !734)
!733 = !DIFile(filename: "/usr/include/linux/in6.h", directory: "", checksumkind: CSK_MD5, checksum: "fca1889f0274df066e49cf4d8db8011e")
!734 = !{!735}
!735 = !DIDerivedType(tag: DW_TAG_member, name: "in6_u", scope: !732, file: !733, line: 40, baseType: !736, size: 128)
!736 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !732, file: !733, line: 34, size: 128, elements: !737)
!737 = !{!738, !740, !744}
!738 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr8", scope: !736, file: !733, line: 35, baseType: !739, size: 128)
!739 = !DICompositeType(tag: DW_TAG_array_type, baseType: !192, size: 128, elements: !175)
!740 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr16", scope: !736, file: !733, line: 37, baseType: !741, size: 128)
!741 = !DICompositeType(tag: DW_TAG_array_type, baseType: !742, size: 128, elements: !180)
!742 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be16", file: !743, line: 25, baseType: !187)
!743 = !DIFile(filename: "/usr/include/linux/types.h", directory: "", checksumkind: CSK_MD5, checksum: "710687c858b58f42afb1bfdfe3f8dee9")
!744 = !DIDerivedType(tag: DW_TAG_member, name: "u6_addr32", scope: !736, file: !733, line: 38, baseType: !745, size: 128)
!745 = !DICompositeType(tag: DW_TAG_array_type, baseType: !746, size: 128, elements: !10)
!746 = !DIDerivedType(tag: DW_TAG_typedef, name: "__be32", file: !743, line: 27, baseType: !195)
!747 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !746, size: 64)
!748 = !{!691, !749, !780, !803, !812, !818, !831, !838, !843, !847, !852, !888}
!749 = !DIGlobalVariableExpression(var: !750, expr: !DIExpression())
!750 = distinct !DIGlobalVariable(name: "packet_ts", scope: !693, file: !694, line: 94, type: !751, isLocal: false, isDefinition: true)
!751 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !694, line: 89, size: 256, elements: !752)
!752 = !{!753, !756, !774, !775}
!753 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !751, file: !694, line: 90, baseType: !754, size: 64)
!754 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !755, size: 64)
!755 = !DICompositeType(tag: DW_TAG_array_type, baseType: !312, size: 32, elements: !340)
!756 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !751, file: !694, line: 91, baseType: !757, size: 64, offset: 64)
!757 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !758, size: 64)
!758 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "packet_id", file: !45, line: 96, size: 384, elements: !759)
!759 = !{!760, !773}
!760 = !DIDerivedType(tag: DW_TAG_member, name: "flow", scope: !758, file: !45, line: 97, baseType: !761, size: 352)
!761 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "network_tuple", file: !45, line: 74, size: 352, elements: !762)
!762 = !{!763, !769, !770, !771, !772}
!763 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !761, file: !45, line: 75, baseType: !764, size: 160)
!764 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "flow_address", file: !45, line: 61, size: 160, elements: !765)
!765 = !{!766, !767, !768}
!766 = !DIDerivedType(tag: DW_TAG_member, name: "ip", scope: !764, file: !45, line: 62, baseType: !732, size: 128)
!767 = !DIDerivedType(tag: DW_TAG_member, name: "port", scope: !764, file: !45, line: 63, baseType: !187, size: 16, offset: 128)
!768 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !764, file: !45, line: 64, baseType: !187, size: 16, offset: 144)
!769 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !761, file: !45, line: 76, baseType: !764, size: 160, offset: 160)
!770 = !DIDerivedType(tag: DW_TAG_member, name: "proto", scope: !761, file: !45, line: 77, baseType: !187, size: 16, offset: 320)
!771 = !DIDerivedType(tag: DW_TAG_member, name: "ipv", scope: !761, file: !45, line: 78, baseType: !192, size: 8, offset: 336)
!772 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !761, file: !45, line: 79, baseType: !192, size: 8, offset: 344)
!773 = !DIDerivedType(tag: DW_TAG_member, name: "identifier", scope: !758, file: !45, line: 98, baseType: !195, size: 32, offset: 352)
!774 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !751, file: !694, line: 92, baseType: !148, size: 64, offset: 128)
!775 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !751, file: !694, line: 93, baseType: !776, size: 64, offset: 192)
!776 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !777, size: 64)
!777 = !DICompositeType(tag: DW_TAG_array_type, baseType: !312, size: 524288, elements: !778)
!778 = !{!779}
!779 = !DISubrange(count: 16384)
!780 = !DIGlobalVariableExpression(var: !781, expr: !DIExpression())
!781 = distinct !DIGlobalVariable(name: "flow_state", scope: !693, file: !694, line: 101, type: !782, isLocal: false, isDefinition: true)
!782 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !694, line: 96, size: 256, elements: !783)
!783 = !{!784, !785, !787, !802}
!784 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !782, file: !694, line: 97, baseType: !754, size: 64)
!785 = !DIDerivedType(tag: DW_TAG_member, name: "key", scope: !782, file: !694, line: 98, baseType: !786, size: 64, offset: 64)
!786 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !761, size: 64)
!787 = !DIDerivedType(tag: DW_TAG_member, name: "value", scope: !782, file: !694, line: 99, baseType: !788, size: 64, offset: 128)
!788 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !789, size: 64)
!789 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "flow_state", file: !45, line: 82, size: 512, elements: !790)
!790 = !{!791, !792, !793, !794, !795, !796, !797, !798, !799, !800, !801}
!791 = !DIDerivedType(tag: DW_TAG_member, name: "min_rtt", scope: !789, file: !45, line: 83, baseType: !143, size: 64)
!792 = !DIDerivedType(tag: DW_TAG_member, name: "srtt", scope: !789, file: !45, line: 84, baseType: !143, size: 64, offset: 64)
!793 = !DIDerivedType(tag: DW_TAG_member, name: "last_timestamp", scope: !789, file: !45, line: 85, baseType: !143, size: 64, offset: 128)
!794 = !DIDerivedType(tag: DW_TAG_member, name: "sent_pkts", scope: !789, file: !45, line: 86, baseType: !143, size: 64, offset: 192)
!795 = !DIDerivedType(tag: DW_TAG_member, name: "sent_bytes", scope: !789, file: !45, line: 87, baseType: !143, size: 64, offset: 256)
!796 = !DIDerivedType(tag: DW_TAG_member, name: "rec_pkts", scope: !789, file: !45, line: 88, baseType: !143, size: 64, offset: 320)
!797 = !DIDerivedType(tag: DW_TAG_member, name: "rec_bytes", scope: !789, file: !45, line: 89, baseType: !143, size: 64, offset: 384)
!798 = !DIDerivedType(tag: DW_TAG_member, name: "last_id", scope: !789, file: !45, line: 90, baseType: !195, size: 32, offset: 448)
!799 = !DIDerivedType(tag: DW_TAG_member, name: "has_opened", scope: !789, file: !45, line: 91, baseType: !203, size: 8, offset: 480)
!800 = !DIDerivedType(tag: DW_TAG_member, name: "opening_reason", scope: !789, file: !45, line: 92, baseType: !52, size: 8, offset: 488)
!801 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !789, file: !45, line: 93, baseType: !187, size: 16, offset: 496)
!802 = !DIDerivedType(tag: DW_TAG_member, name: "max_entries", scope: !782, file: !694, line: 100, baseType: !776, size: 64, offset: 192)
!803 = !DIGlobalVariableExpression(var: !804, expr: !DIExpression())
!804 = distinct !DIGlobalVariable(name: "events", scope: !693, file: !694, line: 107, type: !805, isLocal: false, isDefinition: true)
!805 = distinct !DICompositeType(tag: DW_TAG_structure_type, file: !694, line: 103, size: 192, elements: !806)
!806 = !{!807, !810, !811}
!807 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !805, file: !694, line: 104, baseType: !808, size: 64)
!808 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !809, size: 64)
!809 = !DICompositeType(tag: DW_TAG_array_type, baseType: !312, size: 128, elements: !10)
!810 = !DIDerivedType(tag: DW_TAG_member, name: "key_size", scope: !805, file: !694, line: 105, baseType: !808, size: 64, offset: 64)
!811 = !DIDerivedType(tag: DW_TAG_member, name: "value_size", scope: !805, file: !694, line: 106, baseType: !808, size: 64, offset: 128)
!812 = !DIGlobalVariableExpression(var: !813, expr: !DIExpression())
!813 = distinct !DIGlobalVariable(name: "bpf_ktime_get_ns", scope: !693, file: !814, line: 109, type: !815, isLocal: true, isDefinition: true)
!814 = !DIFile(filename: "../lib/libbpf-install/usr/include/bpf/bpf_helper_defs.h", directory: "/home/demo/bpf-examples/pping", checksumkind: CSK_MD5, checksum: "52f02fca464a4053efa2721be82f1a3e")
!815 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !816, size: 64)
!816 = !DISubroutineType(types: !817)
!817 = !{!143}
!818 = !DIGlobalVariableExpression(var: !819, expr: !DIExpression())
!819 = distinct !DIGlobalVariable(name: "config", scope: !693, file: !694, line: 84, type: !820, isLocal: true, isDefinition: true)
!820 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !821)
!821 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !822)
!822 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_config", file: !45, line: 46, size: 192, elements: !823)
!823 = !{!824, !825, !826, !827, !828, !829, !830}
!824 = !DIDerivedType(tag: DW_TAG_member, name: "rate_limit", scope: !822, file: !45, line: 47, baseType: !143, size: 64)
!825 = !DIDerivedType(tag: DW_TAG_member, name: "rtt_rate", scope: !822, file: !45, line: 48, baseType: !142, size: 64, offset: 64)
!826 = !DIDerivedType(tag: DW_TAG_member, name: "use_srtt", scope: !822, file: !45, line: 49, baseType: !203, size: 8, offset: 128)
!827 = !DIDerivedType(tag: DW_TAG_member, name: "track_tcp", scope: !822, file: !45, line: 50, baseType: !203, size: 8, offset: 136)
!828 = !DIDerivedType(tag: DW_TAG_member, name: "track_icmp", scope: !822, file: !45, line: 51, baseType: !203, size: 8, offset: 144)
!829 = !DIDerivedType(tag: DW_TAG_member, name: "localfilt", scope: !822, file: !45, line: 52, baseType: !203, size: 8, offset: 152)
!830 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !822, file: !45, line: 53, baseType: !195, size: 32, offset: 160)
!831 = !DIGlobalVariableExpression(var: !832, expr: !DIExpression())
!832 = distinct !DIGlobalVariable(name: "bpf_map_lookup_elem", scope: !693, file: !814, line: 51, type: !833, isLocal: true, isDefinition: true)
!833 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !834, size: 64)
!834 = !DISubroutineType(types: !835)
!835 = !{!141, !141, !836}
!836 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !837, size: 64)
!837 = !DIDerivedType(tag: DW_TAG_const_type, baseType: null)
!838 = !DIGlobalVariableExpression(var: !839, expr: !DIExpression())
!839 = distinct !DIGlobalVariable(name: "bpf_map_update_elem", scope: !693, file: !814, line: 73, type: !840, isLocal: true, isDefinition: true)
!840 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !841, size: 64)
!841 = !DISubroutineType(types: !842)
!842 = !{!334, !141, !836, !836, !143}
!843 = !DIGlobalVariableExpression(var: !844, expr: !DIExpression())
!844 = distinct !DIGlobalVariable(name: "last_warn_time", scope: !693, file: !694, line: 85, type: !845, isLocal: true, isDefinition: true)
!845 = !DICompositeType(tag: DW_TAG_array_type, baseType: !846, size: 128, elements: !481)
!846 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !143)
!847 = !DIGlobalVariableExpression(var: !848, expr: !DIExpression())
!848 = distinct !DIGlobalVariable(name: "bpf_perf_event_output", scope: !693, file: !814, line: 686, type: !849, isLocal: true, isDefinition: true)
!849 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !850, size: 64)
!850 = !DISubroutineType(types: !851)
!851 = !{!334, !141, !141, !143, !141, !143}
!852 = !DIGlobalVariableExpression(var: !853, expr: !DIExpression())
!853 = distinct !DIGlobalVariable(name: "bpf_fib_lookup", scope: !693, file: !814, line: 1816, type: !854, isLocal: true, isDefinition: true)
!854 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !855, size: 64)
!855 = !DISubroutineType(types: !856)
!856 = !{!334, !141, !857, !312, !195}
!857 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !858, size: 64)
!858 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_fib_lookup", file: !697, line: 4967, size: 512, elements: !859)
!859 = !{!860, !861, !862, !863, !864, !865, !866, !872, !878, !883, !884, !885, !887}
!860 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !858, file: !697, line: 4971, baseType: !192, size: 8)
!861 = !DIDerivedType(tag: DW_TAG_member, name: "l4_protocol", scope: !858, file: !697, line: 4974, baseType: !192, size: 8, offset: 8)
!862 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !858, file: !697, line: 4975, baseType: !742, size: 16, offset: 16)
!863 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !858, file: !697, line: 4976, baseType: !742, size: 16, offset: 32)
!864 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !858, file: !697, line: 4979, baseType: !187, size: 16, offset: 48)
!865 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !858, file: !697, line: 4984, baseType: !195, size: 32, offset: 64)
!866 = !DIDerivedType(tag: DW_TAG_member, scope: !858, file: !697, line: 4986, baseType: !867, size: 32, offset: 96)
!867 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !858, file: !697, line: 4986, size: 32, elements: !868)
!868 = !{!869, !870, !871}
!869 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !867, file: !697, line: 4988, baseType: !192, size: 8)
!870 = !DIDerivedType(tag: DW_TAG_member, name: "flowinfo", scope: !867, file: !697, line: 4989, baseType: !746, size: 32)
!871 = !DIDerivedType(tag: DW_TAG_member, name: "rt_metric", scope: !867, file: !697, line: 4992, baseType: !195, size: 32)
!872 = !DIDerivedType(tag: DW_TAG_member, scope: !858, file: !697, line: 4995, baseType: !873, size: 128, offset: 128)
!873 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !858, file: !697, line: 4995, size: 128, elements: !874)
!874 = !{!875, !876}
!875 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !873, file: !697, line: 4996, baseType: !746, size: 32)
!876 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !873, file: !697, line: 4997, baseType: !877, size: 128)
!877 = !DICompositeType(tag: DW_TAG_array_type, baseType: !195, size: 128, elements: !10)
!878 = !DIDerivedType(tag: DW_TAG_member, scope: !858, file: !697, line: 5004, baseType: !879, size: 128, offset: 256)
!879 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !858, file: !697, line: 5004, size: 128, elements: !880)
!880 = !{!881, !882}
!881 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !879, file: !697, line: 5005, baseType: !746, size: 32)
!882 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !879, file: !697, line: 5006, baseType: !877, size: 128)
!883 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_proto", scope: !858, file: !697, line: 5010, baseType: !742, size: 16, offset: 384)
!884 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !858, file: !697, line: 5011, baseType: !742, size: 16, offset: 400)
!885 = !DIDerivedType(tag: DW_TAG_member, name: "smac", scope: !858, file: !697, line: 5012, baseType: !886, size: 48, offset: 416)
!886 = !DICompositeType(tag: DW_TAG_array_type, baseType: !192, size: 48, elements: !27)
!887 = !DIDerivedType(tag: DW_TAG_member, name: "dmac", scope: !858, file: !697, line: 5013, baseType: !886, size: 48, offset: 464)
!888 = !DIGlobalVariableExpression(var: !889, expr: !DIExpression())
!889 = distinct !DIGlobalVariable(name: "bpf_map_delete_elem", scope: !693, file: !814, line: 83, type: !890, isLocal: true, isDefinition: true)
!890 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !891, size: 64)
!891 = !DISubroutineType(types: !892)
!892 = !{!334, !141, !836}
!893 = !{!"clang version 16.0.0"}
!894 = !{i32 7, !"Dwarf Version", i32 5}
!895 = !{i32 2, !"Debug Info Version", i32 3}
!896 = !{i32 1, !"wchar_size", i32 4}
!897 = !{i32 7, !"frame-pointer", i32 2}
!898 = distinct !DISubprogram(name: "tracked_protocols_to_str", scope: !2, file: !2, line: 291, type: !899, scopeLine: 292, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !939)
!899 = !DISubroutineType(types: !900)
!900 = !{!379, !901}
!901 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !902, size: 64)
!902 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "pping_config", file: !2, line: 71, size: 1472, elements: !903)
!903 = !{!904, !914, !923, !924, !925, !926, !927, !928, !929, !930, !931, !932, !933, !934, !935, !936, !937, !938}
!904 = !DIDerivedType(tag: DW_TAG_member, name: "bpf_config", scope: !902, file: !2, line: 72, baseType: !905, size: 192)
!905 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_config", file: !45, line: 46, size: 192, elements: !906)
!906 = !{!907, !908, !909, !910, !911, !912, !913}
!907 = !DIDerivedType(tag: DW_TAG_member, name: "rate_limit", scope: !905, file: !45, line: 47, baseType: !143, size: 64)
!908 = !DIDerivedType(tag: DW_TAG_member, name: "rtt_rate", scope: !905, file: !45, line: 48, baseType: !142, size: 64, offset: 64)
!909 = !DIDerivedType(tag: DW_TAG_member, name: "use_srtt", scope: !905, file: !45, line: 49, baseType: !203, size: 8, offset: 128)
!910 = !DIDerivedType(tag: DW_TAG_member, name: "track_tcp", scope: !905, file: !45, line: 50, baseType: !203, size: 8, offset: 136)
!911 = !DIDerivedType(tag: DW_TAG_member, name: "track_icmp", scope: !905, file: !45, line: 51, baseType: !203, size: 8, offset: 144)
!912 = !DIDerivedType(tag: DW_TAG_member, name: "localfilt", scope: !905, file: !45, line: 52, baseType: !203, size: 8, offset: 152)
!913 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !905, file: !45, line: 53, baseType: !195, size: 32, offset: 160)
!914 = !DIDerivedType(tag: DW_TAG_member, name: "tc_ingress_opts", scope: !902, file: !2, line: 73, baseType: !915, size: 256, offset: 192)
!915 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_tc_opts", file: !70, line: 866, size: 256, elements: !916)
!916 = !{!917, !918, !919, !920, !921, !922}
!917 = !DIDerivedType(tag: DW_TAG_member, name: "sz", scope: !915, file: !70, line: 867, baseType: !358, size: 64)
!918 = !DIDerivedType(tag: DW_TAG_member, name: "prog_fd", scope: !915, file: !70, line: 868, baseType: !312, size: 32, offset: 64)
!919 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !915, file: !70, line: 869, baseType: !195, size: 32, offset: 96)
!920 = !DIDerivedType(tag: DW_TAG_member, name: "prog_id", scope: !915, file: !70, line: 870, baseType: !195, size: 32, offset: 128)
!921 = !DIDerivedType(tag: DW_TAG_member, name: "handle", scope: !915, file: !70, line: 871, baseType: !195, size: 32, offset: 160)
!922 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !915, file: !70, line: 872, baseType: !195, size: 32, offset: 192)
!923 = !DIDerivedType(tag: DW_TAG_member, name: "tc_egress_opts", scope: !902, file: !2, line: 74, baseType: !915, size: 256, offset: 448)
!924 = !DIDerivedType(tag: DW_TAG_member, name: "cleanup_interval", scope: !902, file: !2, line: 75, baseType: !143, size: 64, offset: 704)
!925 = !DIDerivedType(tag: DW_TAG_member, name: "object_path", scope: !902, file: !2, line: 76, baseType: !314, size: 64, offset: 768)
!926 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_prog", scope: !902, file: !2, line: 77, baseType: !314, size: 64, offset: 832)
!927 = !DIDerivedType(tag: DW_TAG_member, name: "egress_prog", scope: !902, file: !2, line: 78, baseType: !314, size: 64, offset: 896)
!928 = !DIDerivedType(tag: DW_TAG_member, name: "packet_map", scope: !902, file: !2, line: 79, baseType: !314, size: 64, offset: 960)
!929 = !DIDerivedType(tag: DW_TAG_member, name: "flow_map", scope: !902, file: !2, line: 80, baseType: !314, size: 64, offset: 1024)
!930 = !DIDerivedType(tag: DW_TAG_member, name: "event_map", scope: !902, file: !2, line: 81, baseType: !314, size: 64, offset: 1088)
!931 = !DIDerivedType(tag: DW_TAG_member, name: "xdp_flags", scope: !902, file: !2, line: 82, baseType: !312, size: 32, offset: 1152)
!932 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !902, file: !2, line: 83, baseType: !312, size: 32, offset: 1184)
!933 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_prog_id", scope: !902, file: !2, line: 84, baseType: !312, size: 32, offset: 1216)
!934 = !DIDerivedType(tag: DW_TAG_member, name: "egress_prog_id", scope: !902, file: !2, line: 85, baseType: !312, size: 32, offset: 1248)
!935 = !DIDerivedType(tag: DW_TAG_member, name: "ifname", scope: !902, file: !2, line: 86, baseType: !242, size: 128, offset: 1280)
!936 = !DIDerivedType(tag: DW_TAG_member, name: "output_format", scope: !902, file: !2, line: 87, baseType: !38, size: 32, offset: 1408)
!937 = !DIDerivedType(tag: DW_TAG_member, name: "force", scope: !902, file: !2, line: 88, baseType: !203, size: 8, offset: 1440)
!938 = !DIDerivedType(tag: DW_TAG_member, name: "created_tc_hook", scope: !902, file: !2, line: 89, baseType: !203, size: 8, offset: 1448)
!939 = !{!940, !941, !942}
!940 = !DILocalVariable(name: "config", arg: 1, scope: !898, file: !2, line: 291, type: !901)
!941 = !DILocalVariable(name: "tcp", scope: !898, file: !2, line: 293, type: !203)
!942 = !DILocalVariable(name: "icmp", scope: !898, file: !2, line: 294, type: !203)
!943 = !{!944, !944, i64 0}
!944 = !{!"any pointer", !945, i64 0}
!945 = !{!"omnipotent char", !946, i64 0}
!946 = !{!"Simple C/C++ TBAA"}
!947 = !DILocation(line: 291, column: 59, scope: !898)
!948 = !DILocation(line: 293, column: 2, scope: !898)
!949 = !DILocation(line: 293, column: 7, scope: !898)
!950 = !DILocation(line: 293, column: 13, scope: !898)
!951 = !DILocation(line: 293, column: 21, scope: !898)
!952 = !DILocation(line: 293, column: 32, scope: !898)
!953 = !{!954, !957, i64 17}
!954 = !{!"pping_config", !955, i64 0, !959, i64 24, !959, i64 56, !956, i64 88, !944, i64 96, !944, i64 104, !944, i64 112, !944, i64 120, !944, i64 128, !944, i64 136, !958, i64 144, !958, i64 148, !958, i64 152, !958, i64 156, !945, i64 160, !945, i64 176, !957, i64 180, !957, i64 181}
!955 = !{!"bpf_config", !956, i64 0, !956, i64 8, !957, i64 16, !957, i64 17, !957, i64 18, !957, i64 19, !958, i64 20}
!956 = !{!"long long", !945, i64 0}
!957 = !{!"_Bool", !945, i64 0}
!958 = !{!"int", !945, i64 0}
!959 = !{!"bpf_tc_opts", !960, i64 0, !958, i64 8, !958, i64 12, !958, i64 16, !958, i64 20, !958, i64 24}
!960 = !{!"long", !945, i64 0}
!961 = !{i8 0, i8 2}
!962 = !{}
!963 = !{!957, !957, i64 0}
!964 = !DILocation(line: 294, column: 2, scope: !898)
!965 = !DILocation(line: 294, column: 7, scope: !898)
!966 = !DILocation(line: 294, column: 14, scope: !898)
!967 = !DILocation(line: 294, column: 22, scope: !898)
!968 = !DILocation(line: 294, column: 33, scope: !898)
!969 = !{!954, !957, i64 18}
!970 = !DILocation(line: 295, column: 9, scope: !898)
!971 = !DILocation(line: 295, column: 13, scope: !898)
!972 = !DILocation(line: 295, column: 16, scope: !898)
!973 = !DILocation(line: 295, column: 37, scope: !898)
!974 = !DILocation(line: 296, column: 1, scope: !898)
!975 = !DILocation(line: 295, column: 2, scope: !898)
!976 = distinct !DISubprogram(name: "output_format_to_str", scope: !2, file: !2, line: 298, type: !977, scopeLine: 299, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !979)
!977 = !DISubroutineType(types: !978)
!978 = !{!379, !38}
!979 = !{!980}
!980 = !DILocalVariable(name: "format", arg: 1, scope: !976, file: !2, line: 298, type: !38)
!981 = !{!945, !945, i64 0}
!982 = !DILocation(line: 298, column: 59, scope: !976)
!983 = !DILocation(line: 300, column: 10, scope: !976)
!984 = !DILocation(line: 300, column: 2, scope: !976)
!985 = !DILocation(line: 301, column: 30, scope: !986)
!986 = distinct !DILexicalBlock(scope: !976, file: !2, line: 300, column: 18)
!987 = !DILocation(line: 302, column: 26, scope: !986)
!988 = !DILocation(line: 303, column: 27, scope: !986)
!989 = !DILocation(line: 304, column: 11, scope: !986)
!990 = !DILocation(line: 306, column: 1, scope: !976)
!991 = distinct !DISubprogram(name: "abort_program", scope: !2, file: !2, line: 308, type: !992, scopeLine: 309, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !994)
!992 = !DISubroutineType(types: !993)
!993 = !{null, !312}
!994 = !{!995}
!995 = !DILocalVariable(name: "sig", arg: 1, scope: !991, file: !2, line: 308, type: !312)
!996 = !{!958, !958, i64 0}
!997 = !DILocation(line: 308, column: 24, scope: !991)
!998 = !DILocation(line: 310, column: 15, scope: !991)
!999 = !DILocation(line: 311, column: 1, scope: !991)
!1000 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 1019, type: !1001, scopeLine: 1020, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !1004)
!1001 = !DISubroutineType(types: !1002)
!1002 = !{!312, !312, !1003}
!1003 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !314, size: 64)
!1004 = !{!1005, !1006, !1007, !1008, !1009, !1012, !1015, !1016, !1017, !1018}
!1005 = !DILocalVariable(name: "argc", arg: 1, scope: !1000, file: !2, line: 1019, type: !312)
!1006 = !DILocalVariable(name: "argv", arg: 2, scope: !1000, file: !2, line: 1019, type: !1003)
!1007 = !DILocalVariable(name: "err", scope: !1000, file: !2, line: 1021, type: !312)
!1008 = !DILocalVariable(name: "detach_err", scope: !1000, file: !2, line: 1021, type: !312)
!1009 = !DILocalVariable(name: "obj", scope: !1000, file: !2, line: 1022, type: !1010)
!1010 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1011, size: 64)
!1011 = !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_object", file: !70, line: 66, flags: DIFlagFwdDecl)
!1012 = !DILocalVariable(name: "pb", scope: !1000, file: !2, line: 1023, type: !1013)
!1013 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1014, size: 64)
!1014 = !DICompositeType(tag: DW_TAG_structure_type, name: "perf_buffer", file: !70, line: 908, flags: DIFlagFwdDecl)
!1015 = !DILocalVariable(name: "tc_ingress_opts", scope: !1000, file: !2, line: 1025, type: !915)
!1016 = !DILocalVariable(name: "tc_egress_opts", scope: !1000, file: !2, line: 1026, type: !915)
!1017 = !DILocalVariable(name: "config", scope: !1000, file: !2, line: 1028, type: !902)
!1018 = !DILabel(scope: !1000, name: "cleanup_attached_progs", file: !2, line: 1141)
!1019 = !DILocation(line: 1019, column: 14, scope: !1000)
!1020 = !DILocation(line: 1019, column: 26, scope: !1000)
!1021 = !DILocation(line: 1021, column: 2, scope: !1000)
!1022 = !DILocation(line: 1021, column: 6, scope: !1000)
!1023 = !DILocation(line: 1021, column: 15, scope: !1000)
!1024 = !DILocation(line: 1022, column: 2, scope: !1000)
!1025 = !DILocation(line: 1022, column: 21, scope: !1000)
!1026 = !DILocation(line: 1023, column: 2, scope: !1000)
!1027 = !DILocation(line: 1023, column: 22, scope: !1000)
!1028 = !DILocation(line: 1025, column: 2, scope: !1000)
!1029 = !DILocation(line: 1025, column: 2, scope: !1030)
!1030 = distinct !DILexicalBlock(scope: !1000, file: !2, line: 1025, column: 2)
!1031 = !{!959, !960, i64 0}
!1032 = !DILocation(line: 1026, column: 2, scope: !1000)
!1033 = !DILocation(line: 1026, column: 2, scope: !1034)
!1034 = distinct !DILexicalBlock(scope: !1000, file: !2, line: 1026, column: 2)
!1035 = !DILocation(line: 1028, column: 2, scope: !1000)
!1036 = !DILocation(line: 1028, column: 22, scope: !1000)
!1037 = !DILocation(line: 1028, column: 31, scope: !1000)
!1038 = !DILocation(line: 1029, column: 17, scope: !1000)
!1039 = !{!955, !956, i64 0}
!1040 = !{!955, !956, i64 8}
!1041 = !{!955, !957, i64 16}
!1042 = !{!955, !957, i64 17}
!1043 = !{!955, !957, i64 18}
!1044 = !{!955, !957, i64 19}
!1045 = !{!955, !958, i64 20}
!1046 = !DILocation(line: 1040, column: 22, scope: !1000)
!1047 = !{i64 0, i64 8, !1048, i64 8, i64 4, !996, i64 12, i64 4, !996, i64 16, i64 4, !996, i64 20, i64 4, !996, i64 24, i64 4, !996}
!1048 = !{!960, !960, i64 0}
!1049 = !DILocation(line: 1041, column: 21, scope: !1000)
!1050 = !{!954, !956, i64 88}
!1051 = !{!954, !944, i64 96}
!1052 = !{!954, !944, i64 104}
!1053 = !{!954, !944, i64 112}
!1054 = !{!954, !944, i64 120}
!1055 = !{!954, !944, i64 128}
!1056 = !{!954, !944, i64 136}
!1057 = !{!954, !958, i64 144}
!1058 = !{!954, !958, i64 148}
!1059 = !{!954, !958, i64 152}
!1060 = !{!954, !958, i64 156}
!1061 = !{!954, !945, i64 176}
!1062 = !{!954, !957, i64 180}
!1063 = !{!954, !957, i64 181}
!1064 = !DILocation(line: 1046, column: 6, scope: !1065)
!1065 = distinct !DILexicalBlock(scope: !1000, file: !2, line: 1046, column: 6)
!1066 = !DILocation(line: 1046, column: 16, scope: !1065)
!1067 = !DILocation(line: 1046, column: 6, scope: !1000)
!1068 = !DILocation(line: 1047, column: 3, scope: !1069)
!1069 = distinct !DILexicalBlock(scope: !1065, file: !2, line: 1046, column: 22)
!1070 = !DILocation(line: 1048, column: 3, scope: !1069)
!1071 = !DILocation(line: 1052, column: 8, scope: !1000)
!1072 = !DILocation(line: 1052, column: 6, scope: !1000)
!1073 = !DILocation(line: 1053, column: 6, scope: !1074)
!1074 = distinct !DILexicalBlock(scope: !1000, file: !2, line: 1053, column: 6)
!1075 = !DILocation(line: 1053, column: 6, scope: !1000)
!1076 = !DILocation(line: 1054, column: 11, scope: !1077)
!1077 = distinct !DILexicalBlock(scope: !1074, file: !2, line: 1053, column: 11)
!1078 = !DILocation(line: 1055, column: 24, scope: !1077)
!1079 = !DILocation(line: 1055, column: 4, scope: !1077)
!1080 = !DILocation(line: 1054, column: 3, scope: !1077)
!1081 = !DILocation(line: 1056, column: 3, scope: !1077)
!1082 = !DILocation(line: 1059, column: 24, scope: !1000)
!1083 = !DILocation(line: 1059, column: 30, scope: !1000)
!1084 = !DILocation(line: 1059, column: 8, scope: !1000)
!1085 = !DILocation(line: 1059, column: 6, scope: !1000)
!1086 = !DILocation(line: 1060, column: 6, scope: !1087)
!1087 = distinct !DILexicalBlock(scope: !1000, file: !2, line: 1060, column: 6)
!1088 = !DILocation(line: 1060, column: 6, scope: !1000)
!1089 = !DILocation(line: 1061, column: 11, scope: !1090)
!1090 = distinct !DILexicalBlock(scope: !1087, file: !2, line: 1060, column: 11)
!1091 = !DILocation(line: 1062, column: 24, scope: !1090)
!1092 = !DILocation(line: 1062, column: 4, scope: !1090)
!1093 = !DILocation(line: 1061, column: 3, scope: !1090)
!1094 = !DILocation(line: 1063, column: 15, scope: !1090)
!1095 = !DILocation(line: 1063, column: 3, scope: !1090)
!1096 = !DILocation(line: 1064, column: 3, scope: !1090)
!1097 = !DILocation(line: 1067, column: 14, scope: !1098)
!1098 = distinct !DILexicalBlock(scope: !1000, file: !2, line: 1067, column: 6)
!1099 = !DILocation(line: 1067, column: 25, scope: !1098)
!1100 = !DILocation(line: 1067, column: 35, scope: !1098)
!1101 = !DILocation(line: 1067, column: 46, scope: !1098)
!1102 = !DILocation(line: 1067, column: 57, scope: !1098)
!1103 = !DILocation(line: 1067, column: 6, scope: !1000)
!1104 = !DILocation(line: 1068, column: 10, scope: !1098)
!1105 = !DILocation(line: 1068, column: 21, scope: !1098)
!1106 = !DILocation(line: 1068, column: 31, scope: !1098)
!1107 = !DILocation(line: 1068, column: 3, scope: !1098)
!1108 = !DILocation(line: 1070, column: 13, scope: !1109)
!1109 = distinct !DILexicalBlock(scope: !1000, file: !2, line: 1070, column: 6)
!1110 = !DILocation(line: 1070, column: 24, scope: !1109)
!1111 = !DILocation(line: 1070, column: 35, scope: !1109)
!1112 = !DILocation(line: 1071, column: 13, scope: !1109)
!1113 = !DILocation(line: 1071, column: 27, scope: !1109)
!1114 = !DILocation(line: 1070, column: 6, scope: !1000)
!1115 = !DILocation(line: 1072, column: 11, scope: !1109)
!1116 = !DILocation(line: 1072, column: 3, scope: !1109)
!1117 = !DILocation(line: 1075, column: 17, scope: !1000)
!1118 = !DILocation(line: 1075, column: 2, scope: !1000)
!1119 = !DILocation(line: 1077, column: 20, scope: !1120)
!1120 = distinct !DILexicalBlock(scope: !1000, file: !2, line: 1075, column: 32)
!1121 = !DILocation(line: 1078, column: 3, scope: !1120)
!1122 = !DILocation(line: 1080, column: 20, scope: !1120)
!1123 = !DILocation(line: 1081, column: 3, scope: !1120)
!1124 = !DILocation(line: 1083, column: 20, scope: !1120)
!1125 = !DILocation(line: 1084, column: 3, scope: !1120)
!1126 = !DILocation(line: 1087, column: 10, scope: !1000)
!1127 = !DILocation(line: 1088, column: 31, scope: !1000)
!1128 = !DILocation(line: 1088, column: 3, scope: !1000)
!1129 = !DILocation(line: 1089, column: 3, scope: !1000)
!1130 = !DILocation(line: 1089, column: 45, scope: !1000)
!1131 = !DILocation(line: 1089, column: 38, scope: !1000)
!1132 = !DILocation(line: 1087, column: 2, scope: !1000)
!1133 = !DILocation(line: 1091, column: 8, scope: !1000)
!1134 = !DILocation(line: 1091, column: 6, scope: !1000)
!1135 = !DILocation(line: 1092, column: 6, scope: !1136)
!1136 = distinct !DILexicalBlock(scope: !1000, file: !2, line: 1092, column: 6)
!1137 = !DILocation(line: 1092, column: 6, scope: !1000)
!1138 = !DILocation(line: 1093, column: 11, scope: !1139)
!1139 = distinct !DILexicalBlock(scope: !1136, file: !2, line: 1092, column: 11)
!1140 = !DILocation(line: 1095, column: 11, scope: !1139)
!1141 = !DILocation(line: 1093, column: 3, scope: !1139)
!1142 = !DILocation(line: 1096, column: 3, scope: !1139)
!1143 = !DILocation(line: 1099, column: 38, scope: !1000)
!1144 = !DILocation(line: 1099, column: 8, scope: !1000)
!1145 = !DILocation(line: 1099, column: 6, scope: !1000)
!1146 = !DILocation(line: 1100, column: 6, scope: !1147)
!1147 = distinct !DILexicalBlock(scope: !1000, file: !2, line: 1100, column: 6)
!1148 = !DILocation(line: 1100, column: 6, scope: !1000)
!1149 = !DILocation(line: 1101, column: 11, scope: !1150)
!1150 = distinct !DILexicalBlock(scope: !1147, file: !2, line: 1100, column: 11)
!1151 = !DILocation(line: 1102, column: 24, scope: !1150)
!1152 = !DILocation(line: 1102, column: 4, scope: !1150)
!1153 = !DILocation(line: 1101, column: 3, scope: !1150)
!1154 = !DILocation(line: 1103, column: 3, scope: !1150)
!1155 = !DILocation(line: 1107, column: 7, scope: !1000)
!1156 = !DILocation(line: 1107, column: 5, scope: !1000)
!1157 = !DILocation(line: 1111, column: 25, scope: !1000)
!1158 = !DILocation(line: 1111, column: 8, scope: !1000)
!1159 = !DILocation(line: 1111, column: 6, scope: !1000)
!1160 = !DILocation(line: 1112, column: 6, scope: !1161)
!1161 = distinct !DILexicalBlock(scope: !1000, file: !2, line: 1112, column: 6)
!1162 = !DILocation(line: 1112, column: 6, scope: !1000)
!1163 = !DILocation(line: 1113, column: 11, scope: !1164)
!1164 = distinct !DILexicalBlock(scope: !1161, file: !2, line: 1112, column: 11)
!1165 = !DILocation(line: 1114, column: 11, scope: !1164)
!1166 = !DILocation(line: 1114, column: 42, scope: !1164)
!1167 = !DILocation(line: 1114, column: 22, scope: !1164)
!1168 = !DILocation(line: 1113, column: 3, scope: !1164)
!1169 = !DILocation(line: 1115, column: 3, scope: !1164)
!1170 = !DILocation(line: 1119, column: 2, scope: !1000)
!1171 = !DILocation(line: 1120, column: 2, scope: !1000)
!1172 = !DILocation(line: 1123, column: 2, scope: !1000)
!1173 = !DILocation(line: 1123, column: 9, scope: !1000)
!1174 = !DILocation(line: 1124, column: 32, scope: !1175)
!1175 = distinct !DILexicalBlock(scope: !1176, file: !2, line: 1124, column: 7)
!1176 = distinct !DILexicalBlock(scope: !1000, file: !2, line: 1123, column: 23)
!1177 = !DILocation(line: 1124, column: 14, scope: !1175)
!1178 = !DILocation(line: 1124, column: 12, scope: !1175)
!1179 = !DILocation(line: 1124, column: 59, scope: !1175)
!1180 = !DILocation(line: 1124, column: 7, scope: !1176)
!1181 = !DILocation(line: 1125, column: 8, scope: !1182)
!1182 = distinct !DILexicalBlock(scope: !1183, file: !2, line: 1125, column: 8)
!1183 = distinct !DILexicalBlock(scope: !1175, file: !2, line: 1124, column: 64)
!1184 = !DILocation(line: 1125, column: 8, scope: !1183)
!1185 = !DILocation(line: 1126, column: 13, scope: !1182)
!1186 = !DILocation(line: 1128, column: 27, scope: !1182)
!1187 = !DILocation(line: 1128, column: 26, scope: !1182)
!1188 = !DILocation(line: 1128, column: 6, scope: !1182)
!1189 = !DILocation(line: 1126, column: 5, scope: !1182)
!1190 = !DILocation(line: 1129, column: 4, scope: !1183)
!1191 = distinct !{!1191, !1172, !1192, !1193}
!1192 = !DILocation(line: 1131, column: 2, scope: !1000)
!1193 = !{!"llvm.loop.mustprogress"}
!1194 = !DILocation(line: 1134, column: 13, scope: !1195)
!1195 = distinct !DILexicalBlock(scope: !1000, file: !2, line: 1134, column: 6)
!1196 = !DILocation(line: 1134, column: 27, scope: !1195)
!1197 = !DILocation(line: 1134, column: 48, scope: !1195)
!1198 = !DILocation(line: 1134, column: 51, scope: !1195)
!1199 = !DILocation(line: 1134, column: 6, scope: !1000)
!1200 = !DILocation(line: 1135, column: 19, scope: !1201)
!1201 = distinct !DILexicalBlock(scope: !1195, file: !2, line: 1134, column: 61)
!1202 = !DILocation(line: 1135, column: 3, scope: !1201)
!1203 = !DILocation(line: 1136, column: 3, scope: !1201)
!1204 = !DILocation(line: 1137, column: 2, scope: !1201)
!1205 = !DILocation(line: 1139, column: 20, scope: !1000)
!1206 = !DILocation(line: 1139, column: 2, scope: !1000)
!1207 = !DILocation(line: 1141, column: 1, scope: !1000)
!1208 = !DILocation(line: 1142, column: 20, scope: !1209)
!1209 = distinct !DILexicalBlock(scope: !1000, file: !2, line: 1142, column: 6)
!1210 = !DILocation(line: 1142, column: 6, scope: !1209)
!1211 = !DILocation(line: 1142, column: 55, scope: !1209)
!1212 = !DILocation(line: 1142, column: 6, scope: !1000)
!1213 = !DILocation(line: 1143, column: 34, scope: !1209)
!1214 = !DILocation(line: 1143, column: 50, scope: !1209)
!1215 = !DILocation(line: 1144, column: 13, scope: !1209)
!1216 = !DILocation(line: 1143, column: 16, scope: !1209)
!1217 = !DILocation(line: 1143, column: 14, scope: !1209)
!1218 = !DILocation(line: 1143, column: 3, scope: !1209)
!1219 = !DILocation(line: 1146, column: 33, scope: !1209)
!1220 = !DILocation(line: 1147, column: 20, scope: !1209)
!1221 = !DILocation(line: 1146, column: 16, scope: !1209)
!1222 = !DILocation(line: 1146, column: 14, scope: !1209)
!1223 = !DILocation(line: 1148, column: 6, scope: !1224)
!1224 = distinct !DILexicalBlock(scope: !1000, file: !2, line: 1148, column: 6)
!1225 = !DILocation(line: 1148, column: 6, scope: !1000)
!1226 = !DILocation(line: 1149, column: 11, scope: !1224)
!1227 = !DILocation(line: 1151, column: 11, scope: !1224)
!1228 = !DILocation(line: 1151, column: 4, scope: !1224)
!1229 = !DILocation(line: 1151, column: 39, scope: !1224)
!1230 = !DILocation(line: 1151, column: 19, scope: !1224)
!1231 = !DILocation(line: 1149, column: 3, scope: !1224)
!1232 = !DILocation(line: 1154, column: 20, scope: !1000)
!1233 = !DILocation(line: 1154, column: 52, scope: !1000)
!1234 = !DILocation(line: 1155, column: 13, scope: !1000)
!1235 = !DILocation(line: 1155, column: 19, scope: !1000)
!1236 = !DILocation(line: 1155, column: 29, scope: !1000)
!1237 = !DILocation(line: 0, scope: !1000)
!1238 = !DILocation(line: 1154, column: 3, scope: !1000)
!1239 = !DILocation(line: 1153, column: 13, scope: !1000)
!1240 = !DILocation(line: 1156, column: 6, scope: !1241)
!1241 = distinct !DILexicalBlock(scope: !1000, file: !2, line: 1156, column: 6)
!1242 = !DILocation(line: 1156, column: 6, scope: !1000)
!1243 = !DILocation(line: 1157, column: 11, scope: !1241)
!1244 = !DILocation(line: 1159, column: 11, scope: !1241)
!1245 = !DILocation(line: 1159, column: 4, scope: !1241)
!1246 = !DILocation(line: 1159, column: 39, scope: !1241)
!1247 = !DILocation(line: 1159, column: 19, scope: !1241)
!1248 = !DILocation(line: 1157, column: 3, scope: !1241)
!1249 = !DILocation(line: 1161, column: 10, scope: !1000)
!1250 = !DILocation(line: 1161, column: 14, scope: !1000)
!1251 = !DILocation(line: 1161, column: 19, scope: !1000)
!1252 = !DILocation(line: 1161, column: 22, scope: !1000)
!1253 = !DILocation(line: 1161, column: 36, scope: !1000)
!1254 = !DILocation(line: 1161, column: 39, scope: !1000)
!1255 = !DILocation(line: 1161, column: 50, scope: !1000)
!1256 = !DILocation(line: 1161, column: 2, scope: !1000)
!1257 = !DILocation(line: 1162, column: 1, scope: !1000)
!1258 = !DISubprogram(name: "geteuid", scope: !1259, file: !1259, line: 700, type: !1260, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !962)
!1259 = !DIFile(filename: "/usr/include/unistd.h", directory: "", checksumkind: CSK_MD5, checksum: "ed37c2e6f30ba31a8b41e4d70547c39c")
!1260 = !DISubroutineType(types: !1261)
!1261 = !{!1262}
!1262 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uid_t", file: !139, line: 146, baseType: !39)
!1263 = !DISubprogram(name: "printf", scope: !304, file: !304, line: 356, type: !1264, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !1266)
!1264 = !DISubroutineType(types: !1265)
!1265 = !{!312, !379, null}
!1266 = !{!1267}
!1267 = !DILocalVariable(name: "__format", arg: 1, scope: !1263, file: !304, line: 356, type: !379)
!1268 = distinct !DISubprogram(name: "set_rlimit", scope: !2, file: !2, line: 313, type: !1269, scopeLine: 314, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !1271)
!1269 = !DISubroutineType(types: !1270)
!1270 = !{!312, !334}
!1271 = !{!1272, !1273}
!1272 = !DILocalVariable(name: "lim", arg: 1, scope: !1268, file: !2, line: 313, type: !334)
!1273 = !DILocalVariable(name: "rlim", scope: !1268, file: !2, line: 315, type: !1274)
!1274 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rlimit", file: !76, line: 139, size: 128, elements: !1275)
!1275 = !{!1276, !1278}
!1276 = !DIDerivedType(tag: DW_TAG_member, name: "rlim_cur", scope: !1274, file: !76, line: 142, baseType: !1277, size: 64)
!1277 = !DIDerivedType(tag: DW_TAG_typedef, name: "rlim_t", file: !76, line: 131, baseType: !138)
!1278 = !DIDerivedType(tag: DW_TAG_member, name: "rlim_max", scope: !1274, file: !76, line: 144, baseType: !1277, size: 64, offset: 64)
!1279 = !DILocation(line: 313, column: 32, scope: !1268)
!1280 = !DILocation(line: 315, column: 2, scope: !1268)
!1281 = !DILocation(line: 315, column: 16, scope: !1268)
!1282 = !DILocation(line: 315, column: 23, scope: !1268)
!1283 = !DILocation(line: 316, column: 15, scope: !1268)
!1284 = !{!1285, !960, i64 0}
!1285 = !{!"rlimit", !960, i64 0, !960, i64 8}
!1286 = !DILocation(line: 317, column: 15, scope: !1268)
!1287 = !{!1285, !960, i64 8}
!1288 = !DILocation(line: 320, column: 10, scope: !1268)
!1289 = !DILocation(line: 320, column: 9, scope: !1268)
!1290 = !DILocation(line: 320, column: 50, scope: !1268)
!1291 = !DILocation(line: 320, column: 49, scope: !1268)
!1292 = !DILocation(line: 321, column: 1, scope: !1268)
!1293 = !DILocation(line: 320, column: 2, scope: !1268)
!1294 = !DILocation(line: 143, column: 44, scope: !376)
!1295 = !DILocation(line: 146, column: 18, scope: !376)
!1296 = !DILocation(line: 146, column: 2, scope: !376)
!1297 = !DILocation(line: 147, column: 2, scope: !376)
!1298 = !DISubprogram(name: "fprintf", scope: !304, file: !304, line: 350, type: !1299, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !1301)
!1299 = !DISubroutineType(types: !1300)
!1300 = !{!312, !305, !379, null}
!1301 = !{!1302, !1303}
!1302 = !DILocalVariable(name: "__stream", arg: 1, scope: !1298, file: !304, line: 350, type: !305)
!1303 = !DILocalVariable(name: "__format", arg: 2, scope: !1298, file: !304, line: 350, type: !379)
!1304 = distinct !DISubprogram(name: "parse_arguments", scope: !2, file: !2, line: 167, type: !1305, scopeLine: 168, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !1307)
!1305 = !DISubroutineType(types: !1306)
!1306 = !{!312, !312, !1003, !901}
!1307 = !{!1308, !1309, !1310, !1311, !1312, !1313, !1315, !1316}
!1308 = !DILocalVariable(name: "argc", arg: 1, scope: !1304, file: !2, line: 167, type: !312)
!1309 = !DILocalVariable(name: "argv", arg: 2, scope: !1304, file: !2, line: 167, type: !1003)
!1310 = !DILocalVariable(name: "config", arg: 3, scope: !1304, file: !2, line: 167, type: !901)
!1311 = !DILocalVariable(name: "err", scope: !1304, file: !2, line: 169, type: !312)
!1312 = !DILocalVariable(name: "opt", scope: !1304, file: !2, line: 169, type: !312)
!1313 = !DILocalVariable(name: "rate_limit_ms", scope: !1304, file: !2, line: 170, type: !1314)
!1314 = !DIBasicType(name: "double", size: 64, encoding: DW_ATE_float)
!1315 = !DILocalVariable(name: "cleanup_interval_s", scope: !1304, file: !2, line: 170, type: !1314)
!1316 = !DILocalVariable(name: "rtt_rate", scope: !1304, file: !2, line: 170, type: !1314)
!1317 = !DILocation(line: 167, column: 32, scope: !1304)
!1318 = !DILocation(line: 167, column: 44, scope: !1304)
!1319 = !DILocation(line: 167, column: 73, scope: !1304)
!1320 = !DILocation(line: 169, column: 2, scope: !1304)
!1321 = !DILocation(line: 169, column: 6, scope: !1304)
!1322 = !DILocation(line: 169, column: 11, scope: !1304)
!1323 = !DILocation(line: 170, column: 2, scope: !1304)
!1324 = !DILocation(line: 170, column: 9, scope: !1304)
!1325 = !DILocation(line: 170, column: 24, scope: !1304)
!1326 = !DILocation(line: 170, column: 44, scope: !1304)
!1327 = !DILocation(line: 172, column: 2, scope: !1304)
!1328 = !DILocation(line: 172, column: 10, scope: !1304)
!1329 = !DILocation(line: 172, column: 18, scope: !1304)
!1330 = !DILocation(line: 173, column: 2, scope: !1304)
!1331 = !DILocation(line: 173, column: 10, scope: !1304)
!1332 = !DILocation(line: 173, column: 21, scope: !1304)
!1333 = !DILocation(line: 173, column: 31, scope: !1304)
!1334 = !{!954, !957, i64 19}
!1335 = !DILocation(line: 174, column: 2, scope: !1304)
!1336 = !DILocation(line: 174, column: 10, scope: !1304)
!1337 = !DILocation(line: 174, column: 16, scope: !1304)
!1338 = !DILocation(line: 175, column: 2, scope: !1304)
!1339 = !DILocation(line: 175, column: 10, scope: !1304)
!1340 = !DILocation(line: 175, column: 21, scope: !1304)
!1341 = !DILocation(line: 175, column: 31, scope: !1304)
!1342 = !DILocation(line: 176, column: 2, scope: !1304)
!1343 = !DILocation(line: 176, column: 10, scope: !1304)
!1344 = !DILocation(line: 176, column: 21, scope: !1304)
!1345 = !DILocation(line: 176, column: 32, scope: !1304)
!1346 = !DILocation(line: 178, column: 2, scope: !1304)
!1347 = !DILocation(line: 178, column: 28, scope: !1304)
!1348 = !DILocation(line: 178, column: 34, scope: !1304)
!1349 = !DILocation(line: 178, column: 16, scope: !1304)
!1350 = !DILocation(line: 178, column: 14, scope: !1304)
!1351 = !DILocation(line: 179, column: 14, scope: !1304)
!1352 = !DILocation(line: 180, column: 11, scope: !1353)
!1353 = distinct !DILexicalBlock(scope: !1304, file: !2, line: 179, column: 21)
!1354 = !DILocation(line: 180, column: 3, scope: !1353)
!1355 = !DILocation(line: 182, column: 15, scope: !1356)
!1356 = distinct !DILexicalBlock(scope: !1357, file: !2, line: 182, column: 8)
!1357 = distinct !DILexicalBlock(scope: !1353, file: !2, line: 180, column: 16)
!1358 = !DILocation(line: 182, column: 8, scope: !1356)
!1359 = !DILocation(line: 182, column: 23, scope: !1356)
!1360 = !DILocation(line: 182, column: 8, scope: !1357)
!1361 = !DILocation(line: 183, column: 13, scope: !1362)
!1362 = distinct !DILexicalBlock(scope: !1356, file: !2, line: 182, column: 38)
!1363 = !DILocation(line: 183, column: 5, scope: !1362)
!1364 = !DILocation(line: 184, column: 5, scope: !1362)
!1365 = !DILocation(line: 186, column: 12, scope: !1357)
!1366 = !DILocation(line: 186, column: 20, scope: !1357)
!1367 = !DILocation(line: 186, column: 28, scope: !1357)
!1368 = !DILocation(line: 186, column: 4, scope: !1357)
!1369 = !DILocation(line: 188, column: 37, scope: !1357)
!1370 = !DILocation(line: 188, column: 45, scope: !1357)
!1371 = !DILocation(line: 188, column: 22, scope: !1357)
!1372 = !DILocation(line: 188, column: 4, scope: !1357)
!1373 = !DILocation(line: 188, column: 12, scope: !1357)
!1374 = !DILocation(line: 188, column: 20, scope: !1357)
!1375 = !DILocation(line: 189, column: 8, scope: !1376)
!1376 = distinct !DILexicalBlock(scope: !1357, file: !2, line: 189, column: 8)
!1377 = !DILocation(line: 189, column: 16, scope: !1376)
!1378 = !DILocation(line: 189, column: 24, scope: !1376)
!1379 = !DILocation(line: 189, column: 8, scope: !1357)
!1380 = !DILocation(line: 190, column: 12, scope: !1381)
!1381 = distinct !DILexicalBlock(scope: !1376, file: !2, line: 189, column: 30)
!1382 = !DILocation(line: 190, column: 11, scope: !1381)
!1383 = !DILocation(line: 190, column: 9, scope: !1381)
!1384 = !DILocation(line: 191, column: 13, scope: !1381)
!1385 = !DILocation(line: 193, column: 6, scope: !1381)
!1386 = !DILocation(line: 193, column: 14, scope: !1381)
!1387 = !DILocation(line: 193, column: 42, scope: !1381)
!1388 = !DILocation(line: 193, column: 22, scope: !1381)
!1389 = !DILocation(line: 191, column: 5, scope: !1381)
!1390 = !DILocation(line: 194, column: 12, scope: !1381)
!1391 = !DILocation(line: 194, column: 5, scope: !1381)
!1392 = !DILocation(line: 196, column: 4, scope: !1357)
!1393 = !DILocation(line: 198, column: 47, scope: !1357)
!1394 = !DILocation(line: 198, column: 10, scope: !1357)
!1395 = !DILocation(line: 198, column: 8, scope: !1357)
!1396 = !DILocation(line: 201, column: 8, scope: !1397)
!1397 = distinct !DILexicalBlock(scope: !1357, file: !2, line: 201, column: 8)
!1398 = !DILocation(line: 201, column: 8, scope: !1357)
!1399 = !DILocation(line: 202, column: 5, scope: !1397)
!1400 = !DILocation(line: 205, column: 5, scope: !1357)
!1401 = !{!1402, !1402, i64 0}
!1402 = !{!"double", !945, i64 0}
!1403 = !DILocation(line: 205, column: 19, scope: !1357)
!1404 = !DILocation(line: 204, column: 4, scope: !1357)
!1405 = !DILocation(line: 204, column: 12, scope: !1357)
!1406 = !DILocation(line: 204, column: 23, scope: !1357)
!1407 = !DILocation(line: 204, column: 34, scope: !1357)
!1408 = !{!954, !956, i64 0}
!1409 = !DILocation(line: 206, column: 4, scope: !1357)
!1410 = !DILocation(line: 208, column: 42, scope: !1357)
!1411 = !DILocation(line: 208, column: 10, scope: !1357)
!1412 = !DILocation(line: 208, column: 8, scope: !1357)
!1413 = !DILocation(line: 210, column: 8, scope: !1414)
!1414 = distinct !DILexicalBlock(scope: !1357, file: !2, line: 210, column: 8)
!1415 = !DILocation(line: 210, column: 8, scope: !1357)
!1416 = !DILocation(line: 211, column: 5, scope: !1414)
!1417 = !DILocation(line: 213, column: 5, scope: !1357)
!1418 = !DILocation(line: 212, column: 4, scope: !1357)
!1419 = !DILocation(line: 212, column: 12, scope: !1357)
!1420 = !DILocation(line: 212, column: 23, scope: !1357)
!1421 = !DILocation(line: 212, column: 32, scope: !1357)
!1422 = !{!954, !956, i64 8}
!1423 = !DILocation(line: 214, column: 4, scope: !1357)
!1424 = !DILocation(line: 216, column: 15, scope: !1425)
!1425 = distinct !DILexicalBlock(scope: !1357, file: !2, line: 216, column: 8)
!1426 = !DILocation(line: 216, column: 8, scope: !1425)
!1427 = !DILocation(line: 216, column: 30, scope: !1425)
!1428 = !DILocation(line: 216, column: 8, scope: !1357)
!1429 = !DILocation(line: 217, column: 5, scope: !1430)
!1430 = distinct !DILexicalBlock(scope: !1425, file: !2, line: 216, column: 36)
!1431 = !DILocation(line: 217, column: 13, scope: !1430)
!1432 = !DILocation(line: 217, column: 24, scope: !1430)
!1433 = !DILocation(line: 217, column: 33, scope: !1430)
!1434 = !{!954, !957, i64 16}
!1435 = !DILocation(line: 218, column: 4, scope: !1430)
!1436 = !DILocation(line: 219, column: 20, scope: !1437)
!1437 = distinct !DILexicalBlock(scope: !1425, file: !2, line: 219, column: 13)
!1438 = !DILocation(line: 219, column: 13, scope: !1437)
!1439 = !DILocation(line: 219, column: 40, scope: !1437)
!1440 = !DILocation(line: 219, column: 13, scope: !1425)
!1441 = !DILocation(line: 220, column: 5, scope: !1442)
!1442 = distinct !DILexicalBlock(scope: !1437, file: !2, line: 219, column: 46)
!1443 = !DILocation(line: 220, column: 13, scope: !1442)
!1444 = !DILocation(line: 220, column: 24, scope: !1442)
!1445 = !DILocation(line: 220, column: 33, scope: !1442)
!1446 = !DILocation(line: 221, column: 4, scope: !1442)
!1447 = !DILocation(line: 222, column: 13, scope: !1448)
!1448 = distinct !DILexicalBlock(scope: !1437, file: !2, line: 221, column: 11)
!1449 = !DILocation(line: 222, column: 5, scope: !1448)
!1450 = !DILocation(line: 224, column: 5, scope: !1448)
!1451 = !DILocation(line: 226, column: 4, scope: !1357)
!1452 = !DILocation(line: 228, column: 52, scope: !1357)
!1453 = !DILocation(line: 228, column: 10, scope: !1357)
!1454 = !DILocation(line: 228, column: 8, scope: !1357)
!1455 = !DILocation(line: 231, column: 8, scope: !1456)
!1456 = distinct !DILexicalBlock(scope: !1357, file: !2, line: 231, column: 8)
!1457 = !DILocation(line: 231, column: 8, scope: !1357)
!1458 = !DILocation(line: 232, column: 5, scope: !1456)
!1459 = !DILocation(line: 235, column: 5, scope: !1357)
!1460 = !DILocation(line: 235, column: 24, scope: !1357)
!1461 = !DILocation(line: 234, column: 4, scope: !1357)
!1462 = !DILocation(line: 234, column: 12, scope: !1357)
!1463 = !DILocation(line: 234, column: 29, scope: !1357)
!1464 = !DILocation(line: 236, column: 4, scope: !1357)
!1465 = !DILocation(line: 238, column: 15, scope: !1466)
!1466 = distinct !DILexicalBlock(scope: !1357, file: !2, line: 238, column: 8)
!1467 = !DILocation(line: 238, column: 8, scope: !1466)
!1468 = !DILocation(line: 238, column: 35, scope: !1466)
!1469 = !DILocation(line: 238, column: 8, scope: !1357)
!1470 = !DILocation(line: 239, column: 5, scope: !1471)
!1471 = distinct !DILexicalBlock(scope: !1466, file: !2, line: 238, column: 41)
!1472 = !DILocation(line: 239, column: 13, scope: !1471)
!1473 = !DILocation(line: 239, column: 27, scope: !1471)
!1474 = !DILocation(line: 240, column: 4, scope: !1471)
!1475 = !DILocation(line: 240, column: 22, scope: !1476)
!1476 = distinct !DILexicalBlock(scope: !1466, file: !2, line: 240, column: 15)
!1477 = !DILocation(line: 240, column: 15, scope: !1476)
!1478 = !DILocation(line: 240, column: 38, scope: !1476)
!1479 = !DILocation(line: 240, column: 15, scope: !1466)
!1480 = !DILocation(line: 241, column: 5, scope: !1481)
!1481 = distinct !DILexicalBlock(scope: !1476, file: !2, line: 240, column: 44)
!1482 = !DILocation(line: 241, column: 13, scope: !1481)
!1483 = !DILocation(line: 241, column: 27, scope: !1481)
!1484 = !DILocation(line: 242, column: 4, scope: !1481)
!1485 = !DILocation(line: 242, column: 22, scope: !1486)
!1486 = distinct !DILexicalBlock(scope: !1476, file: !2, line: 242, column: 15)
!1487 = !DILocation(line: 242, column: 15, scope: !1486)
!1488 = !DILocation(line: 242, column: 39, scope: !1486)
!1489 = !DILocation(line: 242, column: 15, scope: !1476)
!1490 = !DILocation(line: 243, column: 5, scope: !1491)
!1491 = distinct !DILexicalBlock(scope: !1486, file: !2, line: 242, column: 45)
!1492 = !DILocation(line: 243, column: 13, scope: !1491)
!1493 = !DILocation(line: 243, column: 27, scope: !1491)
!1494 = !DILocation(line: 244, column: 4, scope: !1491)
!1495 = !DILocation(line: 245, column: 13, scope: !1496)
!1496 = distinct !DILexicalBlock(scope: !1486, file: !2, line: 244, column: 11)
!1497 = !DILocation(line: 245, column: 5, scope: !1496)
!1498 = !DILocation(line: 246, column: 5, scope: !1496)
!1499 = !DILocation(line: 248, column: 4, scope: !1357)
!1500 = !DILocation(line: 250, column: 15, scope: !1501)
!1501 = distinct !DILexicalBlock(scope: !1357, file: !2, line: 250, column: 8)
!1502 = !DILocation(line: 250, column: 8, scope: !1501)
!1503 = !DILocation(line: 250, column: 30, scope: !1501)
!1504 = !DILocation(line: 250, column: 8, scope: !1357)
!1505 = !DILocation(line: 251, column: 5, scope: !1506)
!1506 = distinct !DILexicalBlock(scope: !1501, file: !2, line: 250, column: 36)
!1507 = !DILocation(line: 251, column: 13, scope: !1506)
!1508 = !DILocation(line: 251, column: 26, scope: !1506)
!1509 = !DILocation(line: 252, column: 4, scope: !1506)
!1510 = !DILocation(line: 252, column: 22, scope: !1511)
!1511 = distinct !DILexicalBlock(scope: !1501, file: !2, line: 252, column: 15)
!1512 = !DILocation(line: 252, column: 15, scope: !1511)
!1513 = !DILocation(line: 252, column: 36, scope: !1511)
!1514 = !DILocation(line: 252, column: 15, scope: !1501)
!1515 = !DILocation(line: 253, column: 5, scope: !1516)
!1516 = distinct !DILexicalBlock(scope: !1511, file: !2, line: 252, column: 42)
!1517 = !DILocation(line: 253, column: 13, scope: !1516)
!1518 = !DILocation(line: 253, column: 26, scope: !1516)
!1519 = !DILocation(line: 254, column: 4, scope: !1516)
!1520 = !DILocation(line: 255, column: 13, scope: !1521)
!1521 = distinct !DILexicalBlock(scope: !1511, file: !2, line: 254, column: 11)
!1522 = !DILocation(line: 255, column: 5, scope: !1521)
!1523 = !DILocation(line: 256, column: 5, scope: !1521)
!1524 = !DILocation(line: 258, column: 4, scope: !1357)
!1525 = !DILocation(line: 260, column: 4, scope: !1357)
!1526 = !DILocation(line: 260, column: 12, scope: !1357)
!1527 = !DILocation(line: 260, column: 23, scope: !1357)
!1528 = !DILocation(line: 260, column: 33, scope: !1357)
!1529 = !DILocation(line: 261, column: 4, scope: !1357)
!1530 = !DILocation(line: 263, column: 4, scope: !1357)
!1531 = !DILocation(line: 263, column: 12, scope: !1357)
!1532 = !DILocation(line: 263, column: 18, scope: !1357)
!1533 = !DILocation(line: 264, column: 4, scope: !1357)
!1534 = !DILocation(line: 264, column: 12, scope: !1357)
!1535 = !DILocation(line: 264, column: 22, scope: !1357)
!1536 = !DILocation(line: 265, column: 4, scope: !1357)
!1537 = !DILocation(line: 267, column: 4, scope: !1357)
!1538 = !DILocation(line: 267, column: 12, scope: !1357)
!1539 = !DILocation(line: 267, column: 23, scope: !1357)
!1540 = !DILocation(line: 267, column: 33, scope: !1357)
!1541 = !DILocation(line: 268, column: 4, scope: !1357)
!1542 = !DILocation(line: 270, column: 4, scope: !1357)
!1543 = !DILocation(line: 270, column: 12, scope: !1357)
!1544 = !DILocation(line: 270, column: 23, scope: !1357)
!1545 = !DILocation(line: 270, column: 34, scope: !1357)
!1546 = !DILocation(line: 271, column: 4, scope: !1357)
!1547 = !DILocation(line: 273, column: 4, scope: !1357)
!1548 = !DILocation(line: 274, column: 16, scope: !1357)
!1549 = !DILocation(line: 274, column: 4, scope: !1357)
!1550 = !DILocation(line: 275, column: 4, scope: !1357)
!1551 = !DILocation(line: 277, column: 12, scope: !1357)
!1552 = !DILocation(line: 277, column: 43, scope: !1357)
!1553 = !DILocation(line: 277, column: 48, scope: !1357)
!1554 = !DILocation(line: 277, column: 4, scope: !1357)
!1555 = !DILocation(line: 278, column: 4, scope: !1357)
!1556 = distinct !{!1556, !1346, !1557, !1193}
!1557 = !DILocation(line: 280, column: 2, scope: !1304)
!1558 = !DILocation(line: 282, column: 6, scope: !1559)
!1559 = distinct !DILexicalBlock(scope: !1304, file: !2, line: 282, column: 6)
!1560 = !DILocation(line: 282, column: 14, scope: !1559)
!1561 = !DILocation(line: 282, column: 22, scope: !1559)
!1562 = !DILocation(line: 282, column: 6, scope: !1304)
!1563 = !DILocation(line: 283, column: 11, scope: !1564)
!1564 = distinct !DILexicalBlock(scope: !1559, file: !2, line: 282, column: 28)
!1565 = !DILocation(line: 283, column: 3, scope: !1564)
!1566 = !DILocation(line: 285, column: 3, scope: !1564)
!1567 = !DILocation(line: 288, column: 2, scope: !1304)
!1568 = !DILocation(line: 289, column: 1, scope: !1304)
!1569 = distinct !DISubprogram(name: "print_usage", scope: !2, file: !2, line: 115, type: !1570, scopeLine: 116, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !1572)
!1570 = !DISubroutineType(types: !1571)
!1571 = !{null, !1003}
!1572 = !{!1573, !1574}
!1573 = !DILocalVariable(name: "argv", arg: 1, scope: !1569, file: !2, line: 115, type: !1003)
!1574 = !DILocalVariable(name: "i", scope: !1569, file: !2, line: 117, type: !312)
!1575 = !DILocation(line: 115, column: 31, scope: !1569)
!1576 = !DILocation(line: 117, column: 2, scope: !1569)
!1577 = !DILocation(line: 117, column: 6, scope: !1569)
!1578 = !DILocation(line: 119, column: 35, scope: !1569)
!1579 = !DILocation(line: 119, column: 2, scope: !1569)
!1580 = !DILocation(line: 120, column: 2, scope: !1569)
!1581 = !DILocation(line: 121, column: 45, scope: !1569)
!1582 = !DILocation(line: 121, column: 2, scope: !1569)
!1583 = !DILocation(line: 122, column: 2, scope: !1569)
!1584 = !DILocation(line: 123, column: 9, scope: !1585)
!1585 = distinct !DILexicalBlock(scope: !1569, file: !2, line: 123, column: 2)
!1586 = !DILocation(line: 123, column: 7, scope: !1585)
!1587 = !DILocation(line: 123, column: 27, scope: !1588)
!1588 = distinct !DILexicalBlock(scope: !1585, file: !2, line: 123, column: 2)
!1589 = !DILocation(line: 123, column: 14, scope: !1588)
!1590 = !DILocation(line: 123, column: 30, scope: !1588)
!1591 = !{!1592, !944, i64 0}
!1592 = !{!"option", !944, i64 0, !958, i64 8, !944, i64 16, !958, i64 24}
!1593 = !DILocation(line: 123, column: 35, scope: !1588)
!1594 = !DILocation(line: 123, column: 2, scope: !1585)
!1595 = !DILocation(line: 124, column: 35, scope: !1596)
!1596 = distinct !DILexicalBlock(scope: !1588, file: !2, line: 123, column: 46)
!1597 = !DILocation(line: 124, column: 22, scope: !1596)
!1598 = !DILocation(line: 124, column: 38, scope: !1596)
!1599 = !DILocation(line: 124, column: 3, scope: !1596)
!1600 = !DILocation(line: 125, column: 20, scope: !1601)
!1601 = distinct !DILexicalBlock(scope: !1596, file: !2, line: 125, column: 7)
!1602 = !DILocation(line: 125, column: 7, scope: !1601)
!1603 = !DILocation(line: 125, column: 23, scope: !1601)
!1604 = !{!1592, !944, i64 16}
!1605 = !DILocation(line: 125, column: 28, scope: !1601)
!1606 = !DILocation(line: 125, column: 7, scope: !1596)
!1607 = !DILocation(line: 127, column: 25, scope: !1601)
!1608 = !DILocation(line: 127, column: 12, scope: !1601)
!1609 = !DILocation(line: 127, column: 28, scope: !1601)
!1610 = !DILocation(line: 127, column: 11, scope: !1601)
!1611 = !DILocation(line: 126, column: 4, scope: !1601)
!1612 = !DILocation(line: 129, column: 46, scope: !1601)
!1613 = !DILocation(line: 129, column: 33, scope: !1601)
!1614 = !DILocation(line: 129, column: 49, scope: !1601)
!1615 = !{!1592, !958, i64 24}
!1616 = !DILocation(line: 129, column: 4, scope: !1601)
!1617 = !DILocation(line: 130, column: 3, scope: !1596)
!1618 = !DILocation(line: 131, column: 2, scope: !1596)
!1619 = !DILocation(line: 123, column: 42, scope: !1588)
!1620 = !DILocation(line: 123, column: 2, scope: !1588)
!1621 = distinct !{!1621, !1594, !1622, !1193}
!1622 = !DILocation(line: 131, column: 2, scope: !1585)
!1623 = !DILocation(line: 132, column: 2, scope: !1569)
!1624 = !DILocation(line: 133, column: 1, scope: !1569)
!1625 = distinct !DISubprogram(name: "print_event_standard", scope: !2, file: !2, line: 725, type: !579, scopeLine: 726, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !1626)
!1626 = !{!1627}
!1627 = !DILocalVariable(name: "e", arg: 1, scope: !1625, file: !2, line: 725, type: !581)
!1628 = !DILocation(line: 725, column: 59, scope: !1625)
!1629 = !DILocation(line: 727, column: 6, scope: !1630)
!1630 = distinct !DILexicalBlock(scope: !1625, file: !2, line: 727, column: 6)
!1631 = !DILocation(line: 727, column: 9, scope: !1630)
!1632 = !DILocation(line: 727, column: 20, scope: !1630)
!1633 = !DILocation(line: 727, column: 6, scope: !1625)
!1634 = !DILocation(line: 728, column: 21, scope: !1635)
!1635 = distinct !DILexicalBlock(scope: !1630, file: !2, line: 727, column: 39)
!1636 = !DILocation(line: 728, column: 29, scope: !1635)
!1637 = !DILocation(line: 728, column: 42, scope: !1635)
!1638 = !DILocation(line: 728, column: 3, scope: !1635)
!1639 = !DILocation(line: 730, column: 10, scope: !1635)
!1640 = !DILocation(line: 730, column: 23, scope: !1635)
!1641 = !DILocation(line: 730, column: 27, scope: !1635)
!1642 = !DILocation(line: 731, column: 10, scope: !1635)
!1643 = !DILocation(line: 731, column: 23, scope: !1635)
!1644 = !DILocation(line: 731, column: 27, scope: !1635)
!1645 = !DILocation(line: 732, column: 10, scope: !1635)
!1646 = !DILocation(line: 732, column: 23, scope: !1635)
!1647 = !DILocation(line: 732, column: 31, scope: !1635)
!1648 = !DILocation(line: 733, column: 10, scope: !1635)
!1649 = !DILocation(line: 733, column: 23, scope: !1635)
!1650 = !DILocation(line: 733, column: 31, scope: !1635)
!1651 = !DILocation(line: 734, column: 23, scope: !1635)
!1652 = !DILocation(line: 734, column: 36, scope: !1635)
!1653 = !DILocation(line: 734, column: 41, scope: !1635)
!1654 = !DILocation(line: 734, column: 10, scope: !1635)
!1655 = !DILocation(line: 729, column: 3, scope: !1635)
!1656 = !DILocation(line: 735, column: 26, scope: !1635)
!1657 = !DILocation(line: 735, column: 35, scope: !1635)
!1658 = !DILocation(line: 735, column: 48, scope: !1635)
!1659 = !DILocation(line: 735, column: 3, scope: !1635)
!1660 = !DILocation(line: 736, column: 3, scope: !1635)
!1661 = !DILocation(line: 737, column: 2, scope: !1635)
!1662 = !DILocation(line: 737, column: 13, scope: !1663)
!1663 = distinct !DILexicalBlock(scope: !1630, file: !2, line: 737, column: 13)
!1664 = !DILocation(line: 737, column: 16, scope: !1663)
!1665 = !DILocation(line: 737, column: 27, scope: !1663)
!1666 = !DILocation(line: 737, column: 13, scope: !1630)
!1667 = !DILocation(line: 738, column: 21, scope: !1668)
!1668 = distinct !DILexicalBlock(scope: !1663, file: !2, line: 737, column: 47)
!1669 = !DILocation(line: 738, column: 29, scope: !1668)
!1670 = !DILocation(line: 738, column: 43, scope: !1668)
!1671 = !DILocation(line: 738, column: 3, scope: !1668)
!1672 = !DILocation(line: 739, column: 31, scope: !1668)
!1673 = !DILocation(line: 739, column: 44, scope: !1668)
!1674 = !DILocation(line: 739, column: 49, scope: !1668)
!1675 = !DILocation(line: 739, column: 18, scope: !1668)
!1676 = !DILocation(line: 739, column: 3, scope: !1668)
!1677 = !DILocation(line: 740, column: 26, scope: !1668)
!1678 = !DILocation(line: 740, column: 35, scope: !1668)
!1679 = !DILocation(line: 740, column: 49, scope: !1668)
!1680 = !DILocation(line: 740, column: 3, scope: !1668)
!1681 = !DILocation(line: 742, column: 27, scope: !1668)
!1682 = !DILocation(line: 742, column: 41, scope: !1668)
!1683 = !DILocation(line: 742, column: 10, scope: !1668)
!1684 = !DILocation(line: 743, column: 29, scope: !1668)
!1685 = !DILocation(line: 743, column: 43, scope: !1668)
!1686 = !DILocation(line: 743, column: 10, scope: !1668)
!1687 = !DILocation(line: 744, column: 29, scope: !1668)
!1688 = !DILocation(line: 744, column: 43, scope: !1668)
!1689 = !DILocation(line: 744, column: 10, scope: !1668)
!1690 = !DILocation(line: 741, column: 3, scope: !1668)
!1691 = !DILocation(line: 745, column: 2, scope: !1668)
!1692 = !DILocation(line: 746, column: 1, scope: !1625)
!1693 = distinct !DISubprogram(name: "print_event_json", scope: !2, file: !2, line: 805, type: !579, scopeLine: 806, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !1694)
!1694 = !{!1695}
!1695 = !DILocalVariable(name: "e", arg: 1, scope: !1693, file: !2, line: 805, type: !581)
!1696 = !DILocation(line: 805, column: 55, scope: !1693)
!1697 = !DILocation(line: 807, column: 6, scope: !1698)
!1698 = distinct !DILexicalBlock(scope: !1693, file: !2, line: 807, column: 6)
!1699 = !DILocation(line: 807, column: 9, scope: !1698)
!1700 = !DILocation(line: 807, column: 20, scope: !1698)
!1701 = !DILocation(line: 807, column: 38, scope: !1698)
!1702 = !DILocation(line: 807, column: 41, scope: !1698)
!1703 = !DILocation(line: 807, column: 44, scope: !1698)
!1704 = !DILocation(line: 807, column: 55, scope: !1698)
!1705 = !DILocation(line: 807, column: 6, scope: !1693)
!1706 = !DILocation(line: 808, column: 3, scope: !1698)
!1707 = !DILocation(line: 810, column: 7, scope: !1708)
!1708 = distinct !DILexicalBlock(scope: !1693, file: !2, line: 810, column: 6)
!1709 = !DILocation(line: 810, column: 6, scope: !1693)
!1710 = !DILocation(line: 811, column: 24, scope: !1711)
!1711 = distinct !DILexicalBlock(scope: !1708, file: !2, line: 810, column: 17)
!1712 = !DILocation(line: 811, column: 14, scope: !1711)
!1713 = !DILocation(line: 811, column: 12, scope: !1711)
!1714 = !DILocation(line: 812, column: 21, scope: !1711)
!1715 = !DILocation(line: 812, column: 3, scope: !1711)
!1716 = !DILocation(line: 813, column: 2, scope: !1711)
!1717 = !DILocation(line: 815, column: 21, scope: !1693)
!1718 = !DILocation(line: 815, column: 2, scope: !1693)
!1719 = !DILocation(line: 816, column: 27, scope: !1693)
!1720 = !DILocation(line: 816, column: 37, scope: !1693)
!1721 = !DILocation(line: 816, column: 2, scope: !1693)
!1722 = !DILocation(line: 817, column: 6, scope: !1723)
!1723 = distinct !DILexicalBlock(scope: !1693, file: !2, line: 817, column: 6)
!1724 = !DILocation(line: 817, column: 9, scope: !1723)
!1725 = !DILocation(line: 817, column: 20, scope: !1723)
!1726 = !DILocation(line: 817, column: 6, scope: !1693)
!1727 = !DILocation(line: 818, column: 30, scope: !1723)
!1728 = !DILocation(line: 818, column: 41, scope: !1723)
!1729 = !DILocation(line: 818, column: 3, scope: !1723)
!1730 = !DILocation(line: 820, column: 31, scope: !1723)
!1731 = !DILocation(line: 820, column: 42, scope: !1723)
!1732 = !DILocation(line: 820, column: 3, scope: !1723)
!1733 = !DILocation(line: 821, column: 19, scope: !1693)
!1734 = !DILocation(line: 821, column: 2, scope: !1693)
!1735 = !DILocation(line: 822, column: 1, scope: !1693)
!1736 = distinct !DISubprogram(name: "print_event_ppviz", scope: !2, file: !2, line: 748, type: !579, scopeLine: 749, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !1737)
!1737 = !{!1738, !1739, !1742}
!1738 = !DILocalVariable(name: "e", arg: 1, scope: !1736, file: !2, line: 748, type: !581)
!1739 = !DILocalVariable(name: "re", scope: !1736, file: !2, line: 754, type: !1740)
!1740 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1741, size: 64)
!1741 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !154)
!1742 = !DILocalVariable(name: "time", scope: !1736, file: !2, line: 755, type: !143)
!1743 = !DILocation(line: 748, column: 56, scope: !1736)
!1744 = !DILocation(line: 751, column: 6, scope: !1745)
!1745 = distinct !DILexicalBlock(scope: !1736, file: !2, line: 751, column: 6)
!1746 = !DILocation(line: 751, column: 9, scope: !1745)
!1747 = !DILocation(line: 751, column: 20, scope: !1745)
!1748 = !DILocation(line: 751, column: 6, scope: !1736)
!1749 = !DILocation(line: 752, column: 3, scope: !1745)
!1750 = !DILocation(line: 754, column: 2, scope: !1736)
!1751 = !DILocation(line: 754, column: 26, scope: !1736)
!1752 = !DILocation(line: 754, column: 32, scope: !1736)
!1753 = !DILocation(line: 755, column: 2, scope: !1736)
!1754 = !DILocation(line: 755, column: 8, scope: !1736)
!1755 = !DILocation(line: 755, column: 45, scope: !1736)
!1756 = !DILocation(line: 755, column: 49, scope: !1736)
!1757 = !{!1758, !956, i64 8}
!1758 = !{!"rtt_event", !956, i64 0, !956, i64 8, !1759, i64 16, !958, i64 60, !956, i64 64, !956, i64 72, !956, i64 80, !956, i64 88, !956, i64 96, !956, i64 104, !957, i64 112, !945, i64 113}
!1759 = !{!"network_tuple", !1760, i64 0, !1760, i64 20, !1762, i64 40, !945, i64 42, !945, i64 43}
!1760 = !{!"flow_address", !1761, i64 0, !1762, i64 16, !1762, i64 18}
!1761 = !{!"in6_addr", !945, i64 0}
!1762 = !{!"short", !945, i64 0}
!1763 = !DILocation(line: 755, column: 15, scope: !1736)
!1764 = !{!956, !956, i64 0}
!1765 = !DILocation(line: 757, column: 49, scope: !1736)
!1766 = !DILocation(line: 757, column: 54, scope: !1736)
!1767 = !DILocation(line: 758, column: 9, scope: !1736)
!1768 = !DILocation(line: 758, column: 14, scope: !1736)
!1769 = !DILocation(line: 758, column: 31, scope: !1736)
!1770 = !DILocation(line: 758, column: 35, scope: !1736)
!1771 = !{!1758, !956, i64 64}
!1772 = !DILocation(line: 758, column: 39, scope: !1736)
!1773 = !DILocation(line: 759, column: 9, scope: !1736)
!1774 = !DILocation(line: 759, column: 13, scope: !1736)
!1775 = !DILocation(line: 759, column: 17, scope: !1736)
!1776 = !DILocation(line: 759, column: 34, scope: !1736)
!1777 = !DILocation(line: 759, column: 38, scope: !1736)
!1778 = !{!1758, !956, i64 72}
!1779 = !DILocation(line: 759, column: 46, scope: !1736)
!1780 = !DILocation(line: 759, column: 63, scope: !1736)
!1781 = !DILocation(line: 759, column: 67, scope: !1736)
!1782 = !DILocation(line: 757, column: 2, scope: !1736)
!1783 = !DILocation(line: 760, column: 25, scope: !1736)
!1784 = !DILocation(line: 760, column: 34, scope: !1736)
!1785 = !DILocation(line: 760, column: 38, scope: !1736)
!1786 = !DILocation(line: 760, column: 2, scope: !1736)
!1787 = !DILocation(line: 761, column: 2, scope: !1736)
!1788 = !DILocation(line: 762, column: 1, scope: !1736)
!1789 = distinct !DISubprogram(name: "load_attach_bpfprogs", scope: !2, file: !2, line: 901, type: !1790, scopeLine: 903, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !1793)
!1790 = !DISubroutineType(types: !1791)
!1791 = !{!312, !1792, !901}
!1792 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1010, size: 64)
!1793 = !{!1794, !1795, !1796, !1797, !1798}
!1794 = !DILocalVariable(name: "obj", arg: 1, scope: !1789, file: !2, line: 901, type: !1792)
!1795 = !DILocalVariable(name: "config", arg: 2, scope: !1789, file: !2, line: 902, type: !901)
!1796 = !DILocalVariable(name: "err", scope: !1789, file: !2, line: 904, type: !312)
!1797 = !DILocalVariable(name: "detach_err", scope: !1789, file: !2, line: 904, type: !312)
!1798 = !DILabel(scope: !1789, name: "ingress_err", file: !2, line: 966)
!1799 = !DILocation(line: 901, column: 53, scope: !1789)
!1800 = !DILocation(line: 902, column: 26, scope: !1789)
!1801 = !DILocation(line: 904, column: 2, scope: !1789)
!1802 = !DILocation(line: 904, column: 6, scope: !1789)
!1803 = !DILocation(line: 904, column: 11, scope: !1789)
!1804 = !DILocation(line: 907, column: 26, scope: !1789)
!1805 = !DILocation(line: 907, column: 34, scope: !1789)
!1806 = !DILocation(line: 907, column: 9, scope: !1789)
!1807 = !DILocation(line: 907, column: 3, scope: !1789)
!1808 = !DILocation(line: 907, column: 7, scope: !1789)
!1809 = !DILocation(line: 908, column: 26, scope: !1789)
!1810 = !DILocation(line: 908, column: 25, scope: !1789)
!1811 = !DILocation(line: 908, column: 8, scope: !1789)
!1812 = !DILocation(line: 908, column: 6, scope: !1789)
!1813 = !DILocation(line: 909, column: 6, scope: !1814)
!1814 = distinct !DILexicalBlock(scope: !1789, file: !2, line: 909, column: 6)
!1815 = !DILocation(line: 909, column: 6, scope: !1789)
!1816 = !DILocation(line: 910, column: 11, scope: !1817)
!1817 = distinct !DILexicalBlock(scope: !1814, file: !2, line: 909, column: 11)
!1818 = !DILocation(line: 911, column: 4, scope: !1817)
!1819 = !DILocation(line: 911, column: 12, scope: !1817)
!1820 = !DILocation(line: 911, column: 45, scope: !1817)
!1821 = !DILocation(line: 911, column: 25, scope: !1817)
!1822 = !DILocation(line: 910, column: 3, scope: !1817)
!1823 = !DILocation(line: 912, column: 10, scope: !1817)
!1824 = !DILocation(line: 912, column: 3, scope: !1817)
!1825 = !DILocation(line: 915, column: 21, scope: !1789)
!1826 = !DILocation(line: 915, column: 20, scope: !1789)
!1827 = !DILocation(line: 915, column: 27, scope: !1789)
!1828 = !DILocation(line: 915, column: 35, scope: !1789)
!1829 = !DILocation(line: 915, column: 8, scope: !1789)
!1830 = !DILocation(line: 915, column: 6, scope: !1789)
!1831 = !DILocation(line: 917, column: 6, scope: !1832)
!1832 = distinct !DILexicalBlock(scope: !1789, file: !2, line: 917, column: 6)
!1833 = !DILocation(line: 917, column: 6, scope: !1789)
!1834 = !DILocation(line: 918, column: 11, scope: !1835)
!1835 = distinct !DILexicalBlock(scope: !1832, file: !2, line: 917, column: 11)
!1836 = !DILocation(line: 919, column: 4, scope: !1835)
!1837 = !DILocation(line: 919, column: 12, scope: !1835)
!1838 = !DILocation(line: 919, column: 45, scope: !1835)
!1839 = !DILocation(line: 919, column: 25, scope: !1835)
!1840 = !DILocation(line: 918, column: 3, scope: !1835)
!1841 = !DILocation(line: 920, column: 10, scope: !1835)
!1842 = !DILocation(line: 920, column: 3, scope: !1835)
!1843 = !DILocation(line: 923, column: 24, scope: !1789)
!1844 = !DILocation(line: 923, column: 23, scope: !1789)
!1845 = !DILocation(line: 923, column: 29, scope: !1789)
!1846 = !DILocation(line: 923, column: 2, scope: !1789)
!1847 = !DILocation(line: 924, column: 26, scope: !1789)
!1848 = !DILocation(line: 924, column: 25, scope: !1789)
!1849 = !DILocation(line: 924, column: 8, scope: !1789)
!1850 = !DILocation(line: 924, column: 6, scope: !1789)
!1851 = !DILocation(line: 925, column: 6, scope: !1852)
!1852 = distinct !DILexicalBlock(scope: !1789, file: !2, line: 925, column: 6)
!1853 = !DILocation(line: 925, column: 6, scope: !1789)
!1854 = !DILocation(line: 926, column: 11, scope: !1855)
!1855 = distinct !DILexicalBlock(scope: !1852, file: !2, line: 925, column: 11)
!1856 = !DILocation(line: 927, column: 4, scope: !1855)
!1857 = !DILocation(line: 927, column: 12, scope: !1855)
!1858 = !DILocation(line: 927, column: 45, scope: !1855)
!1859 = !DILocation(line: 927, column: 25, scope: !1855)
!1860 = !DILocation(line: 926, column: 3, scope: !1855)
!1861 = !DILocation(line: 928, column: 10, scope: !1855)
!1862 = !DILocation(line: 928, column: 3, scope: !1855)
!1863 = !DILocation(line: 933, column: 14, scope: !1789)
!1864 = !DILocation(line: 933, column: 13, scope: !1789)
!1865 = !DILocation(line: 933, column: 19, scope: !1789)
!1866 = !DILocation(line: 933, column: 27, scope: !1789)
!1867 = !DILocation(line: 934, column: 6, scope: !1789)
!1868 = !DILocation(line: 934, column: 14, scope: !1789)
!1869 = !DILocation(line: 934, column: 28, scope: !1789)
!1870 = !DILocation(line: 934, column: 36, scope: !1789)
!1871 = !DILocation(line: 935, column: 7, scope: !1789)
!1872 = !DILocation(line: 935, column: 15, scope: !1789)
!1873 = !DILocation(line: 933, column: 3, scope: !1789)
!1874 = !DILocation(line: 932, column: 2, scope: !1789)
!1875 = !DILocation(line: 932, column: 10, scope: !1789)
!1876 = !DILocation(line: 932, column: 25, scope: !1789)
!1877 = !DILocation(line: 936, column: 6, scope: !1878)
!1878 = distinct !DILexicalBlock(scope: !1789, file: !2, line: 936, column: 6)
!1879 = !DILocation(line: 936, column: 14, scope: !1878)
!1880 = !DILocation(line: 936, column: 29, scope: !1878)
!1881 = !DILocation(line: 936, column: 6, scope: !1789)
!1882 = !DILocation(line: 937, column: 11, scope: !1883)
!1883 = distinct !DILexicalBlock(scope: !1878, file: !2, line: 936, column: 34)
!1884 = !DILocation(line: 939, column: 4, scope: !1883)
!1885 = !DILocation(line: 939, column: 12, scope: !1883)
!1886 = !DILocation(line: 940, column: 24, scope: !1883)
!1887 = !DILocation(line: 940, column: 32, scope: !1883)
!1888 = !DILocation(line: 940, column: 4, scope: !1883)
!1889 = !DILocation(line: 937, column: 3, scope: !1883)
!1890 = !DILocation(line: 941, column: 10, scope: !1883)
!1891 = !DILocation(line: 941, column: 18, scope: !1883)
!1892 = !DILocation(line: 941, column: 3, scope: !1883)
!1893 = !DILocation(line: 945, column: 13, scope: !1894)
!1894 = distinct !DILexicalBlock(scope: !1789, file: !2, line: 945, column: 6)
!1895 = !DILocation(line: 945, column: 21, scope: !1894)
!1896 = !DILocation(line: 945, column: 6, scope: !1894)
!1897 = !DILocation(line: 945, column: 56, scope: !1894)
!1898 = !DILocation(line: 945, column: 6, scope: !1789)
!1899 = !DILocation(line: 947, column: 16, scope: !1894)
!1900 = !DILocation(line: 947, column: 15, scope: !1894)
!1901 = !DILocation(line: 947, column: 21, scope: !1894)
!1902 = !DILocation(line: 947, column: 29, scope: !1894)
!1903 = !DILocation(line: 947, column: 43, scope: !1894)
!1904 = !DILocation(line: 947, column: 51, scope: !1894)
!1905 = !DILocation(line: 948, column: 8, scope: !1894)
!1906 = !DILocation(line: 948, column: 16, scope: !1894)
!1907 = !DILocation(line: 947, column: 4, scope: !1894)
!1908 = !DILocation(line: 946, column: 3, scope: !1894)
!1909 = !DILocation(line: 946, column: 11, scope: !1894)
!1910 = !DILocation(line: 946, column: 27, scope: !1894)
!1911 = !DILocation(line: 951, column: 15, scope: !1894)
!1912 = !DILocation(line: 951, column: 14, scope: !1894)
!1913 = !DILocation(line: 951, column: 20, scope: !1894)
!1914 = !DILocation(line: 951, column: 28, scope: !1894)
!1915 = !DILocation(line: 952, column: 7, scope: !1894)
!1916 = !DILocation(line: 952, column: 15, scope: !1894)
!1917 = !DILocation(line: 953, column: 8, scope: !1894)
!1918 = !DILocation(line: 953, column: 16, scope: !1894)
!1919 = !DILocation(line: 951, column: 4, scope: !1894)
!1920 = !DILocation(line: 950, column: 3, scope: !1894)
!1921 = !DILocation(line: 950, column: 11, scope: !1894)
!1922 = !DILocation(line: 950, column: 27, scope: !1894)
!1923 = !DILocation(line: 954, column: 6, scope: !1924)
!1924 = distinct !DILexicalBlock(scope: !1789, file: !2, line: 954, column: 6)
!1925 = !DILocation(line: 954, column: 14, scope: !1924)
!1926 = !DILocation(line: 954, column: 30, scope: !1924)
!1927 = !DILocation(line: 954, column: 6, scope: !1789)
!1928 = !DILocation(line: 955, column: 11, scope: !1929)
!1929 = distinct !DILexicalBlock(scope: !1924, file: !2, line: 954, column: 35)
!1930 = !DILocation(line: 957, column: 4, scope: !1929)
!1931 = !DILocation(line: 957, column: 12, scope: !1929)
!1932 = !DILocation(line: 957, column: 40, scope: !1929)
!1933 = !DILocation(line: 957, column: 20, scope: !1929)
!1934 = !DILocation(line: 955, column: 3, scope: !1929)
!1935 = !DILocation(line: 958, column: 9, scope: !1929)
!1936 = !DILocation(line: 958, column: 17, scope: !1929)
!1937 = !DILocation(line: 958, column: 7, scope: !1929)
!1938 = !DILocation(line: 959, column: 14, scope: !1939)
!1939 = distinct !DILexicalBlock(scope: !1929, file: !2, line: 959, column: 7)
!1940 = !DILocation(line: 959, column: 22, scope: !1939)
!1941 = !DILocation(line: 959, column: 7, scope: !1939)
!1942 = !DILocation(line: 959, column: 57, scope: !1939)
!1943 = !DILocation(line: 959, column: 7, scope: !1929)
!1944 = !DILocation(line: 960, column: 26, scope: !1939)
!1945 = !DILocation(line: 960, column: 34, scope: !1939)
!1946 = !DILocation(line: 960, column: 4, scope: !1939)
!1947 = !DILocation(line: 961, column: 3, scope: !1929)
!1948 = !DILocation(line: 964, column: 2, scope: !1789)
!1949 = !DILocation(line: 966, column: 1, scope: !1789)
!1950 = !DILocation(line: 968, column: 13, scope: !1789)
!1951 = !DILocation(line: 968, column: 21, scope: !1789)
!1952 = !DILocation(line: 969, column: 7, scope: !1789)
!1953 = !DILocation(line: 969, column: 15, scope: !1789)
!1954 = !DILocation(line: 969, column: 31, scope: !1789)
!1955 = !DILocation(line: 969, column: 39, scope: !1789)
!1956 = !DILocation(line: 968, column: 3, scope: !1789)
!1957 = !DILocation(line: 967, column: 13, scope: !1789)
!1958 = !DILocation(line: 970, column: 6, scope: !1959)
!1959 = distinct !DILexicalBlock(scope: !1789, file: !2, line: 970, column: 6)
!1960 = !DILocation(line: 970, column: 6, scope: !1789)
!1961 = !DILocation(line: 971, column: 11, scope: !1959)
!1962 = !DILocation(line: 972, column: 4, scope: !1959)
!1963 = !DILocation(line: 972, column: 12, scope: !1959)
!1964 = !DILocation(line: 972, column: 40, scope: !1959)
!1965 = !DILocation(line: 972, column: 20, scope: !1959)
!1966 = !DILocation(line: 971, column: 3, scope: !1959)
!1967 = !DILocation(line: 973, column: 9, scope: !1789)
!1968 = !DILocation(line: 973, column: 2, scope: !1789)
!1969 = !DILocation(line: 974, column: 1, scope: !1789)
!1970 = distinct !DISubprogram(name: "setup_periodical_map_cleaning", scope: !2, file: !2, line: 976, type: !1971, scopeLine: 978, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !1973)
!1971 = !DISubroutineType(types: !1972)
!1972 = !{!312, !1010, !901}
!1973 = !{!1974, !1975, !1976, !1979, !1985}
!1974 = !DILocalVariable(name: "obj", arg: 1, scope: !1970, file: !2, line: 976, type: !1010)
!1975 = !DILocalVariable(name: "config", arg: 2, scope: !1970, file: !2, line: 977, type: !901)
!1976 = !DILocalVariable(name: "tid", scope: !1970, file: !2, line: 979, type: !1977)
!1977 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_t", file: !1978, line: 27, baseType: !140)
!1978 = !DIFile(filename: "/usr/include/bits/pthreadtypes.h", directory: "", checksumkind: CSK_MD5, checksum: "735e3bf264ff9d8f5d95898b1692fbdb")
!1979 = !DILocalVariable(name: "clean_args", scope: !1970, file: !2, line: 980, type: !1980)
!1980 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "map_cleanup_args", file: !2, line: 64, size: 128, elements: !1981)
!1981 = !{!1982, !1983, !1984}
!1982 = !DIDerivedType(tag: DW_TAG_member, name: "cleanup_interval", scope: !1980, file: !2, line: 65, baseType: !143, size: 64)
!1983 = !DIDerivedType(tag: DW_TAG_member, name: "packet_map_fd", scope: !1980, file: !2, line: 66, baseType: !312, size: 32, offset: 64)
!1984 = !DIDerivedType(tag: DW_TAG_member, name: "flow_map_fd", scope: !1980, file: !2, line: 67, baseType: !312, size: 32, offset: 96)
!1985 = !DILocalVariable(name: "err", scope: !1970, file: !2, line: 983, type: !312)
!1986 = !DILocation(line: 976, column: 61, scope: !1970)
!1987 = !DILocation(line: 977, column: 28, scope: !1970)
!1988 = !DILocation(line: 979, column: 2, scope: !1970)
!1989 = !DILocation(line: 979, column: 12, scope: !1970)
!1990 = !DILocation(line: 980, column: 2, scope: !1970)
!1991 = !DILocation(line: 980, column: 26, scope: !1970)
!1992 = !DILocation(line: 980, column: 39, scope: !1970)
!1993 = !DILocation(line: 981, column: 23, scope: !1970)
!1994 = !DILocation(line: 981, column: 31, scope: !1970)
!1995 = !{!1996, !956, i64 0}
!1996 = !{!"map_cleanup_args", !956, i64 0, !958, i64 8, !958, i64 12}
!1997 = !{!1996, !958, i64 8}
!1998 = !{!1996, !958, i64 12}
!1999 = !DILocation(line: 983, column: 2, scope: !1970)
!2000 = !DILocation(line: 983, column: 6, scope: !1970)
!2001 = !DILocation(line: 985, column: 18, scope: !2002)
!2002 = distinct !DILexicalBlock(scope: !1970, file: !2, line: 985, column: 6)
!2003 = !DILocation(line: 985, column: 7, scope: !2002)
!2004 = !DILocation(line: 985, column: 6, scope: !1970)
!2005 = !DILocation(line: 986, column: 11, scope: !2006)
!2006 = distinct !DILexicalBlock(scope: !2002, file: !2, line: 985, column: 36)
!2007 = !DILocation(line: 986, column: 3, scope: !2006)
!2008 = !DILocation(line: 987, column: 3, scope: !2006)
!2009 = !DILocation(line: 991, column: 35, scope: !1970)
!2010 = !DILocation(line: 991, column: 40, scope: !1970)
!2011 = !DILocation(line: 991, column: 48, scope: !1970)
!2012 = !DILocation(line: 991, column: 3, scope: !1970)
!2013 = !DILocation(line: 990, column: 13, scope: !1970)
!2014 = !DILocation(line: 990, column: 27, scope: !1970)
!2015 = !DILocation(line: 992, column: 17, scope: !2016)
!2016 = distinct !DILexicalBlock(scope: !1970, file: !2, line: 992, column: 6)
!2017 = !DILocation(line: 992, column: 31, scope: !2016)
!2018 = !DILocation(line: 992, column: 6, scope: !1970)
!2019 = !DILocation(line: 993, column: 11, scope: !2020)
!2020 = distinct !DILexicalBlock(scope: !2016, file: !2, line: 992, column: 36)
!2021 = !DILocation(line: 994, column: 4, scope: !2020)
!2022 = !DILocation(line: 994, column: 12, scope: !2020)
!2023 = !DILocation(line: 995, column: 35, scope: !2020)
!2024 = !DILocation(line: 995, column: 4, scope: !2020)
!2025 = !DILocation(line: 993, column: 3, scope: !2020)
!2026 = !DILocation(line: 996, column: 21, scope: !2020)
!2027 = !DILocation(line: 996, column: 3, scope: !2020)
!2028 = !DILocation(line: 1000, column: 35, scope: !1970)
!2029 = !DILocation(line: 1000, column: 40, scope: !1970)
!2030 = !DILocation(line: 1000, column: 48, scope: !1970)
!2031 = !DILocation(line: 1000, column: 3, scope: !1970)
!2032 = !DILocation(line: 999, column: 13, scope: !1970)
!2033 = !DILocation(line: 999, column: 25, scope: !1970)
!2034 = !DILocation(line: 1001, column: 17, scope: !2035)
!2035 = distinct !DILexicalBlock(scope: !1970, file: !2, line: 1001, column: 6)
!2036 = !DILocation(line: 1001, column: 29, scope: !2035)
!2037 = !DILocation(line: 1001, column: 6, scope: !1970)
!2038 = !DILocation(line: 1002, column: 11, scope: !2039)
!2039 = distinct !DILexicalBlock(scope: !2035, file: !2, line: 1001, column: 34)
!2040 = !DILocation(line: 1003, column: 4, scope: !2039)
!2041 = !DILocation(line: 1003, column: 12, scope: !2039)
!2042 = !DILocation(line: 1004, column: 35, scope: !2039)
!2043 = !DILocation(line: 1004, column: 4, scope: !2039)
!2044 = !DILocation(line: 1002, column: 3, scope: !2039)
!2045 = !DILocation(line: 1005, column: 21, scope: !2039)
!2046 = !DILocation(line: 1005, column: 3, scope: !2039)
!2047 = !DILocation(line: 1008, column: 8, scope: !1970)
!2048 = !DILocation(line: 1008, column: 6, scope: !1970)
!2049 = !DILocation(line: 1009, column: 6, scope: !2050)
!2050 = distinct !DILexicalBlock(scope: !1970, file: !2, line: 1009, column: 6)
!2051 = !DILocation(line: 1009, column: 6, scope: !1970)
!2052 = !DILocation(line: 1010, column: 11, scope: !2053)
!2053 = distinct !DILexicalBlock(scope: !2050, file: !2, line: 1009, column: 11)
!2054 = !DILocation(line: 1012, column: 24, scope: !2053)
!2055 = !DILocation(line: 1012, column: 4, scope: !2053)
!2056 = !DILocation(line: 1010, column: 3, scope: !2053)
!2057 = !DILocation(line: 1013, column: 10, scope: !2053)
!2058 = !DILocation(line: 1013, column: 3, scope: !2053)
!2059 = !DILocation(line: 1016, column: 2, scope: !1970)
!2060 = !DILocation(line: 1017, column: 1, scope: !1970)
!2061 = !DISubprogram(name: "bpf_object__find_map_fd_by_name", scope: !70, file: !70, line: 674, type: !2062, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2066)
!2062 = !DISubroutineType(types: !2063)
!2063 = !{!312, !2064, !379}
!2064 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2065, size: 64)
!2065 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1011)
!2066 = !{!2067, !2068}
!2067 = !DILocalVariable(name: "obj", arg: 1, scope: !2061, file: !70, line: 674, type: !2064)
!2068 = !DILocalVariable(name: "name", arg: 2, scope: !2061, file: !70, line: 674, type: !379)
!2069 = distinct !DISubprogram(name: "handle_event", scope: !2, file: !2, line: 833, type: !2070, scopeLine: 834, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2072)
!2070 = !DISubroutineType(types: !2071)
!2071 = !{null, !141, !312, !141, !195}
!2072 = !{!2073, !2074, !2075, !2076, !2077}
!2073 = !DILocalVariable(name: "ctx", arg: 1, scope: !2069, file: !2, line: 833, type: !141)
!2074 = !DILocalVariable(name: "cpu", arg: 2, scope: !2069, file: !2, line: 833, type: !312)
!2075 = !DILocalVariable(name: "data", arg: 3, scope: !2069, file: !2, line: 833, type: !141)
!2076 = !DILocalVariable(name: "data_size", arg: 4, scope: !2069, file: !2, line: 833, type: !195)
!2077 = !DILocalVariable(name: "e", scope: !2069, file: !2, line: 835, type: !581)
!2078 = !DILocation(line: 833, column: 32, scope: !2069)
!2079 = !DILocation(line: 833, column: 41, scope: !2069)
!2080 = !DILocation(line: 833, column: 52, scope: !2069)
!2081 = !DILocation(line: 833, column: 64, scope: !2069)
!2082 = !DILocation(line: 835, column: 2, scope: !2069)
!2083 = !DILocation(line: 835, column: 27, scope: !2069)
!2084 = !DILocation(line: 835, column: 31, scope: !2069)
!2085 = !DILocation(line: 837, column: 6, scope: !2086)
!2086 = distinct !DILexicalBlock(scope: !2069, file: !2, line: 837, column: 6)
!2087 = !DILocation(line: 837, column: 16, scope: !2086)
!2088 = !DILocation(line: 837, column: 6, scope: !2069)
!2089 = !DILocation(line: 838, column: 3, scope: !2086)
!2090 = !DILocation(line: 840, column: 10, scope: !2069)
!2091 = !DILocation(line: 840, column: 13, scope: !2069)
!2092 = !DILocation(line: 840, column: 2, scope: !2069)
!2093 = !DILocation(line: 842, column: 18, scope: !2094)
!2094 = distinct !DILexicalBlock(scope: !2069, file: !2, line: 840, column: 25)
!2095 = !DILocation(line: 842, column: 3, scope: !2094)
!2096 = !DILocation(line: 843, column: 3, scope: !2094)
!2097 = !DILocation(line: 846, column: 3, scope: !2094)
!2098 = !DILocation(line: 846, column: 20, scope: !2094)
!2099 = !DILocation(line: 847, column: 3, scope: !2094)
!2100 = !DILocation(line: 849, column: 11, scope: !2094)
!2101 = !DILocation(line: 850, column: 4, scope: !2094)
!2102 = !DILocation(line: 850, column: 7, scope: !2094)
!2103 = !DILocation(line: 849, column: 3, scope: !2094)
!2104 = !DILocation(line: 851, column: 2, scope: !2094)
!2105 = !DILocation(line: 852, column: 1, scope: !2069)
!2106 = distinct !DISubprogram(name: "handle_missed_events", scope: !2, file: !2, line: 854, type: !2107, scopeLine: 855, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2109)
!2107 = !DISubroutineType(types: !2108)
!2108 = !{null, !141, !312, !143}
!2109 = !{!2110, !2111, !2112}
!2110 = !DILocalVariable(name: "ctx", arg: 1, scope: !2106, file: !2, line: 854, type: !141)
!2111 = !DILocalVariable(name: "cpu", arg: 2, scope: !2106, file: !2, line: 854, type: !312)
!2112 = !DILocalVariable(name: "lost_cnt", arg: 3, scope: !2106, file: !2, line: 854, type: !143)
!2113 = !DILocation(line: 854, column: 40, scope: !2106)
!2114 = !DILocation(line: 854, column: 49, scope: !2106)
!2115 = !DILocation(line: 854, column: 60, scope: !2106)
!2116 = !DILocation(line: 856, column: 10, scope: !2106)
!2117 = !DILocation(line: 856, column: 50, scope: !2106)
!2118 = !DILocation(line: 856, column: 60, scope: !2106)
!2119 = !DILocation(line: 856, column: 2, scope: !2106)
!2120 = !DILocation(line: 857, column: 1, scope: !2106)
!2121 = !DISubprogram(name: "perf_buffer__new", scope: !70, file: !70, line: 943, type: !2122, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2142)
!2122 = !DISubroutineType(types: !2123)
!2123 = !{!1013, !312, !358, !2124, !2126, !141, !2128}
!2124 = !DIDerivedType(tag: DW_TAG_typedef, name: "perf_buffer_sample_fn", file: !70, line: 910, baseType: !2125)
!2125 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2070, size: 64)
!2126 = !DIDerivedType(tag: DW_TAG_typedef, name: "perf_buffer_lost_fn", file: !70, line: 912, baseType: !2127)
!2127 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2107, size: 64)
!2128 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2129, size: 64)
!2129 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2130)
!2130 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "perf_buffer_opts", file: !70, line: 915, size: 192, elements: !2131)
!2131 = !{!2132}
!2132 = !DIDerivedType(tag: DW_TAG_member, scope: !2130, file: !70, line: 916, baseType: !2133, size: 192)
!2133 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !2130, file: !70, line: 916, size: 192, elements: !2134)
!2134 = !{!2135, !2136}
!2135 = !DIDerivedType(tag: DW_TAG_member, name: "sz", scope: !2133, file: !70, line: 917, baseType: !358, size: 64)
!2136 = !DIDerivedType(tag: DW_TAG_member, scope: !2133, file: !70, line: 918, baseType: !2137, size: 192)
!2137 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !2133, file: !70, line: 918, size: 192, elements: !2138)
!2138 = !{!2139, !2140, !2141}
!2139 = !DIDerivedType(tag: DW_TAG_member, name: "sample_cb", scope: !2137, file: !70, line: 920, baseType: !2124, size: 64)
!2140 = !DIDerivedType(tag: DW_TAG_member, name: "lost_cb", scope: !2137, file: !70, line: 922, baseType: !2126, size: 64, offset: 64)
!2141 = !DIDerivedType(tag: DW_TAG_member, name: "ctx", scope: !2137, file: !70, line: 924, baseType: !141, size: 64, offset: 128)
!2142 = !{!2143, !2144, !2145, !2146, !2147, !2148}
!2143 = !DILocalVariable(name: "map_fd", arg: 1, scope: !2121, file: !70, line: 943, type: !312)
!2144 = !DILocalVariable(name: "page_cnt", arg: 2, scope: !2121, file: !70, line: 943, type: !358)
!2145 = !DILocalVariable(name: "sample_cb", arg: 3, scope: !2121, file: !70, line: 943, type: !2124)
!2146 = !DILocalVariable(name: "lost_cb", arg: 4, scope: !2121, file: !70, line: 943, type: !2126)
!2147 = !DILocalVariable(name: "ctx", arg: 5, scope: !2121, file: !70, line: 943, type: !141)
!2148 = !DILocalVariable(name: "opts", arg: 6, scope: !2121, file: !70, line: 943, type: !2128)
!2149 = !DISubprogram(name: "libbpf_get_error", scope: !70, file: !70, line: 802, type: !2150, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2152)
!2150 = !DISubroutineType(types: !2151)
!2151 = !{!334, !836}
!2152 = !{!2153}
!2153 = !DILocalVariable(name: "ptr", arg: 1, scope: !2149, file: !70, line: 802, type: !836)
!2154 = !DISubprogram(name: "signal", scope: !2155, file: !2155, line: 88, type: !2156, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2160)
!2155 = !DIFile(filename: "/usr/include/signal.h", directory: "", checksumkind: CSK_MD5, checksum: "331e107bf774bb600ec675d0db0b92ce")
!2156 = !DISubroutineType(types: !2157)
!2157 = !{!2158, !312, !2158}
!2158 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sighandler_t", file: !2155, line: 72, baseType: !2159)
!2159 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !992, size: 64)
!2160 = !{!2161, !2162}
!2161 = !DILocalVariable(name: "__sig", arg: 1, scope: !2154, file: !2155, line: 88, type: !312)
!2162 = !DILocalVariable(name: "__handler", arg: 2, scope: !2154, file: !2155, line: 88, type: !2158)
!2163 = !DISubprogram(name: "perf_buffer__poll", scope: !70, file: !70, line: 1023, type: !2164, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2166)
!2164 = !DISubroutineType(types: !2165)
!2165 = !{!312, !1013, !312}
!2166 = !{!2167, !2168}
!2167 = !DILocalVariable(name: "pb", arg: 1, scope: !2163, file: !70, line: 1023, type: !1013)
!2168 = !DILocalVariable(name: "timeout_ms", arg: 2, scope: !2163, file: !70, line: 1023, type: !312)
!2169 = !DISubprogram(name: "jsonw_end_array", scope: !688, file: !688, line: 74, type: !2170, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2172)
!2170 = !DISubroutineType(types: !2171)
!2171 = !{null, !686}
!2172 = !{!2173}
!2173 = !DILocalVariable(name: "self", arg: 1, scope: !2169, file: !688, line: 74, type: !686)
!2174 = !DISubprogram(name: "jsonw_destroy", scope: !688, file: !688, line: 26, type: !2175, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2178)
!2175 = !DISubroutineType(types: !2176)
!2176 = !{null, !2177}
!2177 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !686, size: 64)
!2178 = !{!2179}
!2179 = !DILocalVariable(name: "self_p", arg: 1, scope: !2174, file: !688, line: 26, type: !2177)
!2180 = !DISubprogram(name: "perf_buffer__free", scope: !70, file: !70, line: 1021, type: !2181, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2183)
!2181 = !DISubroutineType(types: !2182)
!2182 = !{null, !1013}
!2183 = !{!2184}
!2184 = !DILocalVariable(name: "pb", arg: 1, scope: !2180, file: !70, line: 1021, type: !1013)
!2185 = !DISubprogram(name: "strcmp", scope: !2186, file: !2186, line: 156, type: !2187, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2189)
!2186 = !DIFile(filename: "/usr/include/string.h", directory: "", checksumkind: CSK_MD5, checksum: "f443da8025a0b7c1498fb6c554ec788d")
!2187 = !DISubroutineType(types: !2188)
!2188 = !{!312, !379, !379}
!2189 = !{!2190, !2191}
!2190 = !DILocalVariable(name: "__s1", arg: 1, scope: !2185, file: !2186, line: 156, type: !379)
!2191 = !DILocalVariable(name: "__s2", arg: 2, scope: !2185, file: !2186, line: 156, type: !379)
!2192 = distinct !DISubprogram(name: "xdp_detach", scope: !2, file: !2, line: 369, type: !2193, scopeLine: 370, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2195)
!2193 = !DISubroutineType(types: !2194)
!2194 = !{!312, !312, !195, !195}
!2195 = !{!2196, !2197, !2198, !2199, !2200}
!2196 = !DILocalVariable(name: "ifindex", arg: 1, scope: !2192, file: !2, line: 369, type: !312)
!2197 = !DILocalVariable(name: "xdp_flags", arg: 2, scope: !2192, file: !2, line: 369, type: !195)
!2198 = !DILocalVariable(name: "expected_prog_id", arg: 3, scope: !2192, file: !2, line: 369, type: !195)
!2199 = !DILocalVariable(name: "curr_prog_id", scope: !2192, file: !2, line: 371, type: !195)
!2200 = !DILocalVariable(name: "err", scope: !2192, file: !2, line: 372, type: !312)
!2201 = !DILocation(line: 369, column: 27, scope: !2192)
!2202 = !DILocation(line: 369, column: 42, scope: !2192)
!2203 = !DILocation(line: 369, column: 59, scope: !2192)
!2204 = !DILocation(line: 371, column: 2, scope: !2192)
!2205 = !DILocation(line: 371, column: 8, scope: !2192)
!2206 = !DILocation(line: 372, column: 2, scope: !2192)
!2207 = !DILocation(line: 372, column: 6, scope: !2192)
!2208 = !DILocation(line: 374, column: 28, scope: !2192)
!2209 = !DILocation(line: 374, column: 52, scope: !2192)
!2210 = !DILocation(line: 374, column: 8, scope: !2192)
!2211 = !DILocation(line: 374, column: 6, scope: !2192)
!2212 = !DILocation(line: 375, column: 6, scope: !2213)
!2213 = distinct !DILexicalBlock(scope: !2192, file: !2, line: 375, column: 6)
!2214 = !DILocation(line: 375, column: 6, scope: !2192)
!2215 = !DILocation(line: 376, column: 10, scope: !2213)
!2216 = !DILocation(line: 376, column: 3, scope: !2213)
!2217 = !DILocation(line: 378, column: 7, scope: !2218)
!2218 = distinct !DILexicalBlock(scope: !2192, file: !2, line: 378, column: 6)
!2219 = !DILocation(line: 378, column: 6, scope: !2192)
!2220 = !DILocation(line: 379, column: 3, scope: !2221)
!2221 = distinct !DILexicalBlock(scope: !2218, file: !2, line: 378, column: 21)
!2222 = !DILocation(line: 382, column: 6, scope: !2223)
!2223 = distinct !DILexicalBlock(scope: !2192, file: !2, line: 382, column: 6)
!2224 = !DILocation(line: 382, column: 23, scope: !2223)
!2225 = !DILocation(line: 382, column: 26, scope: !2223)
!2226 = !DILocation(line: 382, column: 42, scope: !2223)
!2227 = !DILocation(line: 382, column: 39, scope: !2223)
!2228 = !DILocation(line: 382, column: 6, scope: !2192)
!2229 = !DILocation(line: 383, column: 3, scope: !2223)
!2230 = !DILocation(line: 385, column: 29, scope: !2192)
!2231 = !DILocation(line: 385, column: 42, scope: !2192)
!2232 = !DILocation(line: 385, column: 9, scope: !2192)
!2233 = !DILocation(line: 385, column: 2, scope: !2192)
!2234 = !DILocation(line: 386, column: 1, scope: !2192)
!2235 = distinct !DISubprogram(name: "tc_detach", scope: !2, file: !2, line: 442, type: !2236, scopeLine: 444, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2240)
!2236 = !DISubroutineType(types: !2237)
!2237 = !{!312, !312, !69, !2238, !203}
!2238 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2239, size: 64)
!2239 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !915)
!2240 = !{!2241, !2242, !2243, !2244, !2245, !2246, !2247, !2254}
!2241 = !DILocalVariable(name: "ifindex", arg: 1, scope: !2235, file: !2, line: 442, type: !312)
!2242 = !DILocalVariable(name: "attach_point", arg: 2, scope: !2235, file: !2, line: 442, type: !69)
!2243 = !DILocalVariable(name: "opts", arg: 3, scope: !2235, file: !2, line: 443, type: !2238)
!2244 = !DILocalVariable(name: "destroy_hook", arg: 4, scope: !2235, file: !2, line: 443, type: !203)
!2245 = !DILocalVariable(name: "err", scope: !2235, file: !2, line: 445, type: !312)
!2246 = !DILocalVariable(name: "hook_err", scope: !2235, file: !2, line: 446, type: !312)
!2247 = !DILocalVariable(name: "hook", scope: !2235, file: !2, line: 447, type: !2248)
!2248 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_tc_hook", file: !70, line: 857, size: 192, elements: !2249)
!2249 = !{!2250, !2251, !2252, !2253}
!2250 = !DIDerivedType(tag: DW_TAG_member, name: "sz", scope: !2248, file: !70, line: 858, baseType: !358, size: 64)
!2251 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !2248, file: !70, line: 859, baseType: !312, size: 32, offset: 64)
!2252 = !DIDerivedType(tag: DW_TAG_member, name: "attach_point", scope: !2248, file: !70, line: 860, baseType: !69, size: 32, offset: 96)
!2253 = !DIDerivedType(tag: DW_TAG_member, name: "parent", scope: !2248, file: !70, line: 861, baseType: !195, size: 32, offset: 128)
!2254 = !DILocalVariable(name: "opts_info", scope: !2235, file: !2, line: 449, type: !915)
!2255 = !DILocation(line: 442, column: 26, scope: !2235)
!2256 = !DILocation(line: 442, column: 60, scope: !2235)
!2257 = !DILocation(line: 443, column: 34, scope: !2235)
!2258 = !DILocation(line: 443, column: 45, scope: !2235)
!2259 = !DILocation(line: 445, column: 2, scope: !2235)
!2260 = !DILocation(line: 445, column: 6, scope: !2235)
!2261 = !DILocation(line: 446, column: 2, scope: !2235)
!2262 = !DILocation(line: 446, column: 6, scope: !2235)
!2263 = !DILocation(line: 447, column: 2, scope: !2235)
!2264 = !DILocation(line: 447, column: 2, scope: !2265)
!2265 = distinct !DILexicalBlock(scope: !2235, file: !2, line: 447, column: 2)
!2266 = !{!2267, !960, i64 0}
!2267 = !{!"bpf_tc_hook", !960, i64 0, !958, i64 8, !945, i64 12, !958, i64 16}
!2268 = !{!2267, !958, i64 8}
!2269 = !{!2267, !945, i64 12}
!2270 = !{!2267, !958, i64 16}
!2271 = !DILocation(line: 449, column: 2, scope: !2235)
!2272 = !DILocation(line: 449, column: 2, scope: !2273)
!2273 = distinct !DILexicalBlock(scope: !2235, file: !2, line: 449, column: 2)
!2274 = !{!959, !958, i64 8}
!2275 = !{!959, !958, i64 12}
!2276 = !{!959, !958, i64 16}
!2277 = !{!959, !958, i64 20}
!2278 = !{!959, !958, i64 24}
!2279 = !DILocation(line: 453, column: 8, scope: !2235)
!2280 = !DILocation(line: 453, column: 6, scope: !2235)
!2281 = !DILocation(line: 454, column: 6, scope: !2282)
!2282 = distinct !DILexicalBlock(scope: !2235, file: !2, line: 454, column: 6)
!2283 = !DILocation(line: 454, column: 6, scope: !2235)
!2284 = !DILocation(line: 455, column: 10, scope: !2282)
!2285 = !DILocation(line: 455, column: 3, scope: !2282)
!2286 = !DILocation(line: 456, column: 6, scope: !2287)
!2287 = distinct !DILexicalBlock(scope: !2235, file: !2, line: 456, column: 6)
!2288 = !DILocation(line: 456, column: 12, scope: !2287)
!2289 = !DILocation(line: 456, column: 33, scope: !2287)
!2290 = !DILocation(line: 456, column: 20, scope: !2287)
!2291 = !DILocation(line: 456, column: 6, scope: !2235)
!2292 = !DILocation(line: 457, column: 3, scope: !2287)
!2293 = !DILocation(line: 460, column: 12, scope: !2235)
!2294 = !DILocation(line: 460, column: 20, scope: !2235)
!2295 = !DILocation(line: 461, column: 12, scope: !2235)
!2296 = !DILocation(line: 461, column: 20, scope: !2235)
!2297 = !DILocation(line: 462, column: 12, scope: !2235)
!2298 = !DILocation(line: 462, column: 18, scope: !2235)
!2299 = !DILocation(line: 463, column: 8, scope: !2235)
!2300 = !DILocation(line: 463, column: 6, scope: !2235)
!2301 = !DILocation(line: 470, column: 6, scope: !2302)
!2302 = distinct !DILexicalBlock(scope: !2235, file: !2, line: 470, column: 6)
!2303 = !DILocation(line: 470, column: 6, scope: !2235)
!2304 = !DILocation(line: 471, column: 8, scope: !2305)
!2305 = distinct !DILexicalBlock(scope: !2302, file: !2, line: 470, column: 20)
!2306 = !DILocation(line: 471, column: 21, scope: !2305)
!2307 = !DILocation(line: 472, column: 14, scope: !2305)
!2308 = !DILocation(line: 472, column: 12, scope: !2305)
!2309 = !DILocation(line: 473, column: 2, scope: !2305)
!2310 = !DILocation(line: 475, column: 8, scope: !2235)
!2311 = !DILocation(line: 475, column: 23, scope: !2235)
!2312 = !DILocation(line: 475, column: 34, scope: !2235)
!2313 = !DILocation(line: 475, column: 6, scope: !2235)
!2314 = !DILocation(line: 476, column: 9, scope: !2235)
!2315 = !DILocation(line: 476, column: 2, scope: !2235)
!2316 = !DILocation(line: 477, column: 1, scope: !2235)
!2317 = !DISubprogram(name: "bpf_tc_query", scope: !70, file: !70, line: 883, type: !2318, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2323)
!2318 = !DISubroutineType(types: !2319)
!2319 = !{!312, !2320, !2322}
!2320 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2321, size: 64)
!2321 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2248)
!2322 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !915, size: 64)
!2323 = !{!2324, !2325}
!2324 = !DILocalVariable(name: "hook", arg: 1, scope: !2317, file: !70, line: 883, type: !2320)
!2325 = !DILocalVariable(name: "opts", arg: 2, scope: !2317, file: !70, line: 883, type: !2322)
!2326 = !DISubprogram(name: "bpf_tc_detach", scope: !70, file: !70, line: 881, type: !2327, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2329)
!2327 = !DISubroutineType(types: !2328)
!2328 = !{!312, !2320, !2238}
!2329 = !{!2330, !2331}
!2330 = !DILocalVariable(name: "hook", arg: 1, scope: !2326, file: !70, line: 881, type: !2320)
!2331 = !DILocalVariable(name: "opts", arg: 2, scope: !2326, file: !70, line: 881, type: !2238)
!2332 = !DISubprogram(name: "bpf_tc_hook_destroy", scope: !70, file: !70, line: 878, type: !2333, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2336)
!2333 = !DISubroutineType(types: !2334)
!2334 = !{!312, !2335}
!2335 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2248, size: 64)
!2336 = !{!2337}
!2337 = !DILocalVariable(name: "hook", arg: 1, scope: !2332, file: !70, line: 878, type: !2335)
!2338 = !DISubprogram(name: "bpf_get_link_xdp_id", scope: !70, file: !70, line: 839, type: !2339, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2341)
!2339 = !DISubroutineType(types: !2340)
!2340 = !{!312, !312, !730, !195}
!2341 = !{!2342, !2343, !2344}
!2342 = !DILocalVariable(name: "ifindex", arg: 1, scope: !2338, file: !70, line: 839, type: !312)
!2343 = !DILocalVariable(name: "prog_id", arg: 2, scope: !2338, file: !70, line: 839, type: !730)
!2344 = !DILocalVariable(name: "flags", arg: 3, scope: !2338, file: !70, line: 839, type: !195)
!2345 = !DISubprogram(name: "bpf_set_link_xdp_fd", scope: !70, file: !70, line: 836, type: !2346, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2348)
!2346 = !DISubroutineType(types: !2347)
!2347 = !{!312, !312, !312, !195}
!2348 = !{!2349, !2350, !2351}
!2349 = !DILocalVariable(name: "ifindex", arg: 1, scope: !2345, file: !70, line: 836, type: !312)
!2350 = !DILocalVariable(name: "fd", arg: 2, scope: !2345, file: !70, line: 836, type: !312)
!2351 = !DILocalVariable(name: "flags", arg: 3, scope: !2345, file: !70, line: 836, type: !195)
!2352 = distinct !DISubprogram(name: "warn_map_full", scope: !2, file: !2, line: 824, type: !2353, scopeLine: 825, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2357)
!2353 = !DISubroutineType(types: !2354)
!2354 = !{null, !2355}
!2355 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2356, size: 64)
!2356 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !219)
!2357 = !{!2358}
!2358 = !DILocalVariable(name: "e", arg: 1, scope: !2352, file: !2, line: 824, type: !2355)
!2359 = !DILocation(line: 824, column: 56, scope: !2352)
!2360 = !DILocation(line: 826, column: 20, scope: !2352)
!2361 = !DILocation(line: 826, column: 28, scope: !2352)
!2362 = !DILocation(line: 826, column: 31, scope: !2352)
!2363 = !{!2364, !956, i64 8}
!2364 = !{!"map_full_event", !956, i64 0, !956, i64 8, !1759, i64 16, !945, i64 60, !945, i64 61}
!2365 = !DILocation(line: 826, column: 2, scope: !2352)
!2366 = !DILocation(line: 827, column: 10, scope: !2352)
!2367 = !DILocation(line: 828, column: 3, scope: !2352)
!2368 = !DILocation(line: 828, column: 6, scope: !2352)
!2369 = !{!2364, !945, i64 60}
!2370 = !DILocation(line: 828, column: 10, scope: !2352)
!2371 = !DILocation(line: 827, column: 2, scope: !2352)
!2372 = !DILocation(line: 829, column: 25, scope: !2352)
!2373 = !DILocation(line: 829, column: 34, scope: !2352)
!2374 = !DILocation(line: 829, column: 37, scope: !2352)
!2375 = !DILocation(line: 829, column: 2, scope: !2352)
!2376 = !DILocation(line: 830, column: 10, scope: !2352)
!2377 = !DILocation(line: 830, column: 2, scope: !2352)
!2378 = !DILocation(line: 831, column: 1, scope: !2352)
!2379 = distinct !DISubprogram(name: "print_ns_datetime", scope: !2, file: !2, line: 715, type: !2380, scopeLine: 716, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2382)
!2380 = !DISubroutineType(types: !2381)
!2381 = !{null, !305, !143}
!2382 = !{!2383, !2384, !2385, !2386, !2387}
!2383 = !DILocalVariable(name: "stream", arg: 1, scope: !2379, file: !2, line: 715, type: !305)
!2384 = !DILocalVariable(name: "monotonic_ns", arg: 2, scope: !2379, file: !2, line: 715, type: !143)
!2385 = !DILocalVariable(name: "timestr", scope: !2379, file: !2, line: 717, type: !19)
!2386 = !DILocalVariable(name: "ts", scope: !2379, file: !2, line: 718, type: !143)
!2387 = !DILocalVariable(name: "ts_s", scope: !2379, file: !2, line: 719, type: !2388)
!2388 = !DIDerivedType(tag: DW_TAG_typedef, name: "time_t", file: !2389, line: 10, baseType: !2390)
!2389 = !DIFile(filename: "/usr/include/bits/types/time_t.h", directory: "", checksumkind: CSK_MD5, checksum: "5c299a4954617c88bb03645c7864e1b1")
!2390 = !DIDerivedType(tag: DW_TAG_typedef, name: "__time_t", file: !139, line: 160, baseType: !334)
!2391 = !DILocation(line: 715, column: 37, scope: !2379)
!2392 = !DILocation(line: 715, column: 51, scope: !2379)
!2393 = !DILocation(line: 717, column: 2, scope: !2379)
!2394 = !DILocation(line: 717, column: 7, scope: !2379)
!2395 = !DILocation(line: 718, column: 2, scope: !2379)
!2396 = !DILocation(line: 718, column: 8, scope: !2379)
!2397 = !DILocation(line: 718, column: 43, scope: !2379)
!2398 = !DILocation(line: 718, column: 13, scope: !2379)
!2399 = !DILocation(line: 719, column: 2, scope: !2379)
!2400 = !DILocation(line: 719, column: 9, scope: !2379)
!2401 = !DILocation(line: 719, column: 16, scope: !2379)
!2402 = !DILocation(line: 719, column: 19, scope: !2379)
!2403 = !DILocation(line: 721, column: 11, scope: !2379)
!2404 = !DILocation(line: 721, column: 49, scope: !2379)
!2405 = !DILocation(line: 721, column: 2, scope: !2379)
!2406 = !DILocation(line: 722, column: 10, scope: !2379)
!2407 = !DILocation(line: 722, column: 31, scope: !2379)
!2408 = !DILocation(line: 722, column: 40, scope: !2379)
!2409 = !DILocation(line: 722, column: 43, scope: !2379)
!2410 = !DILocation(line: 722, column: 2, scope: !2379)
!2411 = !DILocation(line: 723, column: 1, scope: !2379)
!2412 = distinct !DISubprogram(name: "print_flow_ppvizformat", scope: !2, file: !2, line: 704, type: !2413, scopeLine: 705, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2417)
!2413 = !DISubroutineType(types: !2414)
!2414 = !{null, !305, !2415}
!2415 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2416, size: 64)
!2416 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !159)
!2417 = !{!2418, !2419, !2420, !2421}
!2418 = !DILocalVariable(name: "stream", arg: 1, scope: !2412, file: !2, line: 704, type: !305)
!2419 = !DILocalVariable(name: "flow", arg: 2, scope: !2412, file: !2, line: 704, type: !2415)
!2420 = !DILocalVariable(name: "saddr", scope: !2412, file: !2, line: 706, type: !275)
!2421 = !DILocalVariable(name: "daddr", scope: !2412, file: !2, line: 707, type: !275)
!2422 = !DILocation(line: 704, column: 42, scope: !2412)
!2423 = !DILocation(line: 704, column: 78, scope: !2412)
!2424 = !DILocation(line: 706, column: 2, scope: !2412)
!2425 = !DILocation(line: 706, column: 7, scope: !2412)
!2426 = !DILocation(line: 707, column: 2, scope: !2412)
!2427 = !DILocation(line: 707, column: 7, scope: !2412)
!2428 = !DILocation(line: 709, column: 20, scope: !2412)
!2429 = !DILocation(line: 709, column: 42, scope: !2412)
!2430 = !DILocation(line: 709, column: 48, scope: !2412)
!2431 = !{!1759, !945, i64 42}
!2432 = !DILocation(line: 709, column: 54, scope: !2412)
!2433 = !DILocation(line: 709, column: 60, scope: !2412)
!2434 = !DILocation(line: 709, column: 66, scope: !2412)
!2435 = !DILocation(line: 709, column: 2, scope: !2412)
!2436 = !DILocation(line: 710, column: 20, scope: !2412)
!2437 = !DILocation(line: 710, column: 42, scope: !2412)
!2438 = !DILocation(line: 710, column: 48, scope: !2412)
!2439 = !DILocation(line: 710, column: 54, scope: !2412)
!2440 = !DILocation(line: 710, column: 60, scope: !2412)
!2441 = !DILocation(line: 710, column: 66, scope: !2412)
!2442 = !DILocation(line: 710, column: 2, scope: !2412)
!2443 = !DILocation(line: 711, column: 10, scope: !2412)
!2444 = !DILocation(line: 711, column: 33, scope: !2412)
!2445 = !DILocation(line: 711, column: 40, scope: !2412)
!2446 = !{!1759, !1762, i64 16}
!2447 = !DILocation(line: 711, column: 65, scope: !2412)
!2448 = !DILocation(line: 712, column: 3, scope: !2412)
!2449 = !{!1759, !1762, i64 36}
!2450 = !DILocation(line: 711, column: 2, scope: !2412)
!2451 = !DILocation(line: 713, column: 1, scope: !2412)
!2452 = distinct !DISubprogram(name: "format_ip_address", scope: !2, file: !2, line: 627, type: !2453, scopeLine: 629, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2457)
!2453 = !DISubroutineType(types: !2454)
!2454 = !{!312, !314, !358, !312, !2455}
!2455 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2456, size: 64)
!2456 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !165)
!2457 = !{!2458, !2459, !2460, !2461}
!2458 = !DILocalVariable(name: "buf", arg: 1, scope: !2452, file: !2, line: 627, type: !314)
!2459 = !DILocalVariable(name: "size", arg: 2, scope: !2452, file: !2, line: 627, type: !358)
!2460 = !DILocalVariable(name: "af", arg: 3, scope: !2452, file: !2, line: 627, type: !312)
!2461 = !DILocalVariable(name: "addr", arg: 4, scope: !2452, file: !2, line: 628, type: !2455)
!2462 = !DILocation(line: 627, column: 36, scope: !2452)
!2463 = !DILocation(line: 627, column: 48, scope: !2452)
!2464 = !DILocation(line: 627, column: 58, scope: !2452)
!2465 = !DILocation(line: 628, column: 32, scope: !2452)
!2466 = !DILocation(line: 630, column: 6, scope: !2467)
!2467 = distinct !DILexicalBlock(scope: !2452, file: !2, line: 630, column: 6)
!2468 = !DILocation(line: 630, column: 9, scope: !2467)
!2469 = !DILocation(line: 630, column: 6, scope: !2452)
!2470 = !DILocation(line: 631, column: 20, scope: !2467)
!2471 = !DILocation(line: 631, column: 25, scope: !2467)
!2472 = !DILocation(line: 631, column: 31, scope: !2467)
!2473 = !DILocation(line: 632, column: 6, scope: !2467)
!2474 = !DILocation(line: 632, column: 11, scope: !2467)
!2475 = !DILocation(line: 631, column: 10, scope: !2467)
!2476 = !DILocation(line: 632, column: 20, scope: !2467)
!2477 = !DILocation(line: 632, column: 19, scope: !2467)
!2478 = !DILocation(line: 631, column: 3, scope: !2467)
!2479 = !DILocation(line: 633, column: 11, scope: !2480)
!2480 = distinct !DILexicalBlock(scope: !2467, file: !2, line: 633, column: 11)
!2481 = !DILocation(line: 633, column: 14, scope: !2480)
!2482 = !DILocation(line: 633, column: 11, scope: !2467)
!2483 = !DILocation(line: 634, column: 20, scope: !2480)
!2484 = !DILocation(line: 634, column: 24, scope: !2480)
!2485 = !DILocation(line: 634, column: 30, scope: !2480)
!2486 = !DILocation(line: 634, column: 35, scope: !2480)
!2487 = !DILocation(line: 634, column: 10, scope: !2480)
!2488 = !DILocation(line: 634, column: 44, scope: !2480)
!2489 = !DILocation(line: 634, column: 43, scope: !2480)
!2490 = !DILocation(line: 634, column: 3, scope: !2480)
!2491 = !DILocation(line: 635, column: 2, scope: !2452)
!2492 = !DILocation(line: 636, column: 1, scope: !2452)
!2493 = distinct !DISubprogram(name: "__bswap_16", scope: !2494, file: !2494, line: 34, type: !2495, scopeLine: 35, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2497)
!2494 = !DIFile(filename: "/usr/include/bits/byteswap.h", directory: "", checksumkind: CSK_MD5, checksum: "98f83253ffd9c64e7486789204e9fa05")
!2495 = !DISubroutineType(types: !2496)
!2496 = !{!146, !146}
!2497 = !{!2498}
!2498 = !DILocalVariable(name: "__bsx", arg: 1, scope: !2493, file: !2494, line: 34, type: !146)
!2499 = !{!1762, !1762, i64 0}
!2500 = !DILocation(line: 34, column: 24, scope: !2493)
!2501 = !DILocation(line: 39, column: 10, scope: !2493)
!2502 = !DILocation(line: 39, column: 3, scope: !2493)
!2503 = !DISubprogram(name: "inet_ntop", scope: !2504, file: !2504, line: 64, type: !2505, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2512)
!2504 = !DIFile(filename: "/usr/include/arpa/inet.h", directory: "", checksumkind: CSK_MD5, checksum: "b2f9474dc296b712fc0e47c2c084f87d")
!2505 = !DISubroutineType(types: !2506)
!2506 = !{!379, !312, !2507, !2508, !2509}
!2507 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !836)
!2508 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !314)
!2509 = !DIDerivedType(tag: DW_TAG_typedef, name: "socklen_t", file: !2510, line: 33, baseType: !2511)
!2510 = !DIFile(filename: "/usr/include/bits/socket.h", directory: "", checksumkind: CSK_MD5, checksum: "e3826be048699664d9ef7b080f62f2e0")
!2511 = !DIDerivedType(tag: DW_TAG_typedef, name: "__socklen_t", file: !139, line: 210, baseType: !39)
!2512 = !{!2513, !2514, !2515, !2516}
!2513 = !DILocalVariable(name: "__af", arg: 1, scope: !2503, file: !2504, line: 64, type: !312)
!2514 = !DILocalVariable(name: "__cp", arg: 2, scope: !2503, file: !2504, line: 64, type: !2507)
!2515 = !DILocalVariable(name: "__buf", arg: 3, scope: !2503, file: !2504, line: 64, type: !2508)
!2516 = !DILocalVariable(name: "__len", arg: 4, scope: !2503, file: !2504, line: 64, type: !2509)
!2517 = !DISubprogram(name: "__errno_location", scope: !2518, file: !2518, line: 37, type: !2519, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !962)
!2518 = !DIFile(filename: "/usr/include/errno.h", directory: "", checksumkind: CSK_MD5, checksum: "01c14bf4ab600a3884f5da68eb763170")
!2519 = !DISubroutineType(types: !2520)
!2520 = !{!464}
!2521 = !DILocation(line: 602, column: 50, scope: !521)
!2522 = !DILocation(line: 606, column: 2, scope: !521)
!2523 = !DILocation(line: 606, column: 8, scope: !521)
!2524 = !DILocation(line: 606, column: 18, scope: !521)
!2525 = !DILocation(line: 607, column: 2, scope: !521)
!2526 = !DILocation(line: 607, column: 8, scope: !521)
!2527 = !DILocation(line: 609, column: 6, scope: !2528)
!2528 = distinct !DILexicalBlock(scope: !521, file: !2, line: 609, column: 6)
!2529 = !DILocation(line: 609, column: 13, scope: !2528)
!2530 = !DILocation(line: 609, column: 18, scope: !2528)
!2531 = !DILocation(line: 610, column: 7, scope: !2528)
!2532 = !DILocation(line: 610, column: 17, scope: !2528)
!2533 = !DILocation(line: 610, column: 15, scope: !2528)
!2534 = !DILocation(line: 610, column: 32, scope: !2528)
!2535 = !DILocation(line: 611, column: 7, scope: !2528)
!2536 = !DILocation(line: 611, column: 17, scope: !2528)
!2537 = !DILocation(line: 611, column: 15, scope: !2528)
!2538 = !DILocation(line: 611, column: 32, scope: !2528)
!2539 = !DILocation(line: 609, column: 6, scope: !521)
!2540 = !DILocation(line: 612, column: 13, scope: !2541)
!2541 = distinct !DILexicalBlock(scope: !2528, file: !2, line: 611, column: 60)
!2542 = !DILocation(line: 612, column: 11, scope: !2541)
!2543 = !DILocation(line: 613, column: 12, scope: !2541)
!2544 = !DILocation(line: 613, column: 10, scope: !2541)
!2545 = !DILocation(line: 615, column: 7, scope: !2546)
!2546 = distinct !DILexicalBlock(scope: !2541, file: !2, line: 615, column: 7)
!2547 = !DILocation(line: 615, column: 16, scope: !2546)
!2548 = !DILocation(line: 615, column: 14, scope: !2546)
!2549 = !DILocation(line: 615, column: 7, scope: !2541)
!2550 = !DILocation(line: 616, column: 4, scope: !2546)
!2551 = !DILocation(line: 617, column: 12, scope: !2541)
!2552 = !DILocation(line: 617, column: 21, scope: !2541)
!2553 = !DILocation(line: 617, column: 19, scope: !2541)
!2554 = !DILocation(line: 617, column: 10, scope: !2541)
!2555 = !DILocation(line: 618, column: 20, scope: !2541)
!2556 = !DILocation(line: 618, column: 18, scope: !2541)
!2557 = !DILocation(line: 619, column: 2, scope: !2541)
!2558 = !DILocation(line: 620, column: 9, scope: !521)
!2559 = !DILocation(line: 620, column: 26, scope: !521)
!2560 = !DILocation(line: 620, column: 24, scope: !521)
!2561 = !DILocation(line: 620, column: 2, scope: !521)
!2562 = !DILocation(line: 621, column: 1, scope: !521)
!2563 = !DISubprogram(name: "localtime", scope: !2564, file: !2564, line: 136, type: !2565, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2584)
!2564 = !DIFile(filename: "/usr/include/time.h", directory: "", checksumkind: CSK_MD5, checksum: "db37158473a25e1d89b19f8bc6892801")
!2565 = !DISubroutineType(types: !2566)
!2566 = !{!2567, !2582}
!2567 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2568, size: 64)
!2568 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tm", file: !2569, line: 7, size: 448, elements: !2570)
!2569 = !DIFile(filename: "/usr/include/bits/types/struct_tm.h", directory: "", checksumkind: CSK_MD5, checksum: "9e5545b565ef031c4cd0faf90b69386f")
!2570 = !{!2571, !2572, !2573, !2574, !2575, !2576, !2577, !2578, !2579, !2580, !2581}
!2571 = !DIDerivedType(tag: DW_TAG_member, name: "tm_sec", scope: !2568, file: !2569, line: 9, baseType: !312, size: 32)
!2572 = !DIDerivedType(tag: DW_TAG_member, name: "tm_min", scope: !2568, file: !2569, line: 10, baseType: !312, size: 32, offset: 32)
!2573 = !DIDerivedType(tag: DW_TAG_member, name: "tm_hour", scope: !2568, file: !2569, line: 11, baseType: !312, size: 32, offset: 64)
!2574 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mday", scope: !2568, file: !2569, line: 12, baseType: !312, size: 32, offset: 96)
!2575 = !DIDerivedType(tag: DW_TAG_member, name: "tm_mon", scope: !2568, file: !2569, line: 13, baseType: !312, size: 32, offset: 128)
!2576 = !DIDerivedType(tag: DW_TAG_member, name: "tm_year", scope: !2568, file: !2569, line: 14, baseType: !312, size: 32, offset: 160)
!2577 = !DIDerivedType(tag: DW_TAG_member, name: "tm_wday", scope: !2568, file: !2569, line: 15, baseType: !312, size: 32, offset: 192)
!2578 = !DIDerivedType(tag: DW_TAG_member, name: "tm_yday", scope: !2568, file: !2569, line: 16, baseType: !312, size: 32, offset: 224)
!2579 = !DIDerivedType(tag: DW_TAG_member, name: "tm_isdst", scope: !2568, file: !2569, line: 17, baseType: !312, size: 32, offset: 256)
!2580 = !DIDerivedType(tag: DW_TAG_member, name: "tm_gmtoff", scope: !2568, file: !2569, line: 20, baseType: !334, size: 64, offset: 320)
!2581 = !DIDerivedType(tag: DW_TAG_member, name: "tm_zone", scope: !2568, file: !2569, line: 21, baseType: !379, size: 64, offset: 384)
!2582 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2583, size: 64)
!2583 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2388)
!2584 = !{!2585}
!2585 = !DILocalVariable(name: "__timer", arg: 1, scope: !2563, file: !2564, line: 136, type: !2582)
!2586 = !DISubprogram(name: "strftime", scope: !2564, file: !2564, line: 100, type: !2587, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2593)
!2587 = !DISubroutineType(types: !2588)
!2588 = !{!358, !2508, !358, !2589, !2590}
!2589 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !379)
!2590 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !2591)
!2591 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2592, size: 64)
!2592 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2568)
!2593 = !{!2594, !2595, !2596, !2597}
!2594 = !DILocalVariable(name: "__s", arg: 1, scope: !2586, file: !2564, line: 100, type: !2508)
!2595 = !DILocalVariable(name: "__maxsize", arg: 2, scope: !2586, file: !2564, line: 100, type: !358)
!2596 = !DILocalVariable(name: "__format", arg: 3, scope: !2586, file: !2564, line: 100, type: !2589)
!2597 = !DILocalVariable(name: "__tp", arg: 4, scope: !2586, file: !2564, line: 100, type: !2590)
!2598 = distinct !DISubprogram(name: "get_time_ns", scope: !2, file: !2, line: 483, type: !2599, scopeLine: 484, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2604)
!2599 = !DISubroutineType(types: !2600)
!2600 = !{!143, !2601}
!2601 = !DIDerivedType(tag: DW_TAG_typedef, name: "clockid_t", file: !2602, line: 7, baseType: !2603)
!2602 = !DIFile(filename: "/usr/include/bits/types/clockid_t.h", directory: "", checksumkind: CSK_MD5, checksum: "099a80153c2ad48bc7f5f4a188cb6d24")
!2603 = !DIDerivedType(tag: DW_TAG_typedef, name: "__clockid_t", file: !139, line: 169, baseType: !312)
!2604 = !{!2605, !2606}
!2605 = !DILocalVariable(name: "clockid", arg: 1, scope: !2598, file: !2, line: 483, type: !2601)
!2606 = !DILocalVariable(name: "t", scope: !2598, file: !2, line: 485, type: !2607)
!2607 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "timespec", file: !2608, line: 11, size: 128, elements: !2609)
!2608 = !DIFile(filename: "/usr/include/bits/types/struct_timespec.h", directory: "", checksumkind: CSK_MD5, checksum: "55dc154df3f21a5aa944dcafba9b43f6")
!2609 = !{!2610, !2611}
!2610 = !DIDerivedType(tag: DW_TAG_member, name: "tv_sec", scope: !2607, file: !2608, line: 16, baseType: !2390, size: 64)
!2611 = !DIDerivedType(tag: DW_TAG_member, name: "tv_nsec", scope: !2607, file: !2608, line: 21, baseType: !2612, size: 64, offset: 64)
!2612 = !DIDerivedType(tag: DW_TAG_typedef, name: "__syscall_slong_t", file: !139, line: 197, baseType: !334)
!2613 = !DILocation(line: 483, column: 36, scope: !2598)
!2614 = !DILocation(line: 485, column: 2, scope: !2598)
!2615 = !DILocation(line: 485, column: 18, scope: !2598)
!2616 = !DILocation(line: 486, column: 20, scope: !2617)
!2617 = distinct !DILexicalBlock(scope: !2598, file: !2, line: 486, column: 6)
!2618 = !DILocation(line: 486, column: 6, scope: !2617)
!2619 = !DILocation(line: 486, column: 33, scope: !2617)
!2620 = !DILocation(line: 486, column: 6, scope: !2598)
!2621 = !DILocation(line: 487, column: 3, scope: !2617)
!2622 = !DILocation(line: 489, column: 18, scope: !2598)
!2623 = !{!2624, !960, i64 0}
!2624 = !{!"timespec", !960, i64 0, !960, i64 8}
!2625 = !DILocation(line: 489, column: 25, scope: !2598)
!2626 = !DILocation(line: 489, column: 52, scope: !2598)
!2627 = !{!2624, !960, i64 8}
!2628 = !DILocation(line: 489, column: 41, scope: !2598)
!2629 = !DILocation(line: 489, column: 2, scope: !2598)
!2630 = !DILocation(line: 490, column: 1, scope: !2598)
!2631 = !DISubprogram(name: "clock_gettime", scope: !2564, file: !2564, line: 279, type: !2632, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2635)
!2632 = !DISubroutineType(types: !2633)
!2633 = !{!312, !2601, !2634}
!2634 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2607, size: 64)
!2635 = !{!2636, !2637}
!2636 = !DILocalVariable(name: "__clock_id", arg: 1, scope: !2631, file: !2564, line: 279, type: !2601)
!2637 = !DILocalVariable(name: "__tp", arg: 2, scope: !2631, file: !2564, line: 279, type: !2634)
!2638 = distinct !DISubprogram(name: "periodic_map_cleanup", scope: !2, file: !2, line: 585, type: !2639, scopeLine: 586, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2641)
!2639 = !DISubroutineType(types: !2640)
!2640 = !{!141, !141}
!2641 = !{!2642, !2643, !2645}
!2642 = !DILocalVariable(name: "args", arg: 1, scope: !2638, file: !2, line: 585, type: !141)
!2643 = !DILocalVariable(name: "argp", scope: !2638, file: !2, line: 587, type: !2644)
!2644 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1980, size: 64)
!2645 = !DILocalVariable(name: "interval", scope: !2638, file: !2, line: 588, type: !2607)
!2646 = !DILocation(line: 585, column: 41, scope: !2638)
!2647 = !DILocation(line: 587, column: 2, scope: !2638)
!2648 = !DILocation(line: 587, column: 27, scope: !2638)
!2649 = !DILocation(line: 587, column: 34, scope: !2638)
!2650 = !DILocation(line: 588, column: 2, scope: !2638)
!2651 = !DILocation(line: 588, column: 18, scope: !2638)
!2652 = !DILocation(line: 589, column: 20, scope: !2638)
!2653 = !DILocation(line: 589, column: 26, scope: !2638)
!2654 = !DILocation(line: 589, column: 43, scope: !2638)
!2655 = !DILocation(line: 589, column: 11, scope: !2638)
!2656 = !DILocation(line: 589, column: 18, scope: !2638)
!2657 = !DILocation(line: 590, column: 21, scope: !2638)
!2658 = !DILocation(line: 590, column: 27, scope: !2638)
!2659 = !DILocation(line: 590, column: 44, scope: !2638)
!2660 = !DILocation(line: 590, column: 11, scope: !2638)
!2661 = !DILocation(line: 590, column: 19, scope: !2638)
!2662 = !DILocation(line: 592, column: 2, scope: !2638)
!2663 = !DILocation(line: 592, column: 9, scope: !2638)
!2664 = !DILocation(line: 593, column: 13, scope: !2665)
!2665 = distinct !DILexicalBlock(scope: !2638, file: !2, line: 592, column: 23)
!2666 = !DILocation(line: 593, column: 19, scope: !2665)
!2667 = !DILocation(line: 593, column: 3, scope: !2665)
!2668 = !DILocation(line: 595, column: 13, scope: !2665)
!2669 = !DILocation(line: 595, column: 19, scope: !2665)
!2670 = !DILocation(line: 595, column: 3, scope: !2665)
!2671 = !DILocation(line: 597, column: 3, scope: !2665)
!2672 = distinct !{!2672, !2662, !2673, !1193}
!2673 = !DILocation(line: 598, column: 2, scope: !2638)
!2674 = !DILocation(line: 599, column: 2, scope: !2638)
!2675 = !DISubprogram(name: "pthread_create", scope: !2676, file: !2676, line: 202, type: !2677, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2691)
!2676 = !DIFile(filename: "/usr/include/pthread.h", directory: "", checksumkind: CSK_MD5, checksum: "5205981c6f80cc3dc1e81231df63d8ef")
!2677 = !DISubroutineType(types: !2678)
!2678 = !{!312, !2679, !2681, !2689, !2690}
!2679 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !2680)
!2680 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1977, size: 64)
!2681 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !2682)
!2682 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2683, size: 64)
!2683 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2684)
!2684 = !DIDerivedType(tag: DW_TAG_typedef, name: "pthread_attr_t", file: !1978, line: 62, baseType: !2685)
!2685 = distinct !DICompositeType(tag: DW_TAG_union_type, name: "pthread_attr_t", file: !1978, line: 56, size: 320, elements: !2686)
!2686 = !{!2687, !2688}
!2687 = !DIDerivedType(tag: DW_TAG_member, name: "__size", scope: !2685, file: !1978, line: 58, baseType: !285, size: 288)
!2688 = !DIDerivedType(tag: DW_TAG_member, name: "__align", scope: !2685, file: !1978, line: 59, baseType: !334, size: 64)
!2689 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2639, size: 64)
!2690 = !DIDerivedType(tag: DW_TAG_restrict_type, baseType: !141)
!2691 = !{!2692, !2693, !2694, !2695}
!2692 = !DILocalVariable(name: "__newthread", arg: 1, scope: !2675, file: !2676, line: 202, type: !2679)
!2693 = !DILocalVariable(name: "__attr", arg: 2, scope: !2675, file: !2676, line: 202, type: !2681)
!2694 = !DILocalVariable(name: "__start_routine", arg: 3, scope: !2675, file: !2676, line: 202, type: !2689)
!2695 = !DILocalVariable(name: "__arg", arg: 4, scope: !2675, file: !2676, line: 202, type: !2690)
!2696 = distinct !DISubprogram(name: "packet_ts_timeout", scope: !2, file: !2, line: 492, type: !2697, scopeLine: 493, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2699)
!2697 = !DISubroutineType(types: !2698)
!2698 = !{!203, !141, !141, !143}
!2699 = !{!2700, !2701, !2702, !2703}
!2700 = !DILocalVariable(name: "key_ptr", arg: 1, scope: !2696, file: !2, line: 492, type: !141)
!2701 = !DILocalVariable(name: "val_ptr", arg: 2, scope: !2696, file: !2, line: 492, type: !141)
!2702 = !DILocalVariable(name: "now", arg: 3, scope: !2696, file: !2, line: 492, type: !143)
!2703 = !DILocalVariable(name: "ts", scope: !2696, file: !2, line: 494, type: !143)
!2704 = !DILocation(line: 492, column: 37, scope: !2696)
!2705 = !DILocation(line: 492, column: 52, scope: !2696)
!2706 = !DILocation(line: 492, column: 67, scope: !2696)
!2707 = !DILocation(line: 494, column: 2, scope: !2696)
!2708 = !DILocation(line: 494, column: 8, scope: !2696)
!2709 = !DILocation(line: 494, column: 23, scope: !2696)
!2710 = !DILocation(line: 494, column: 13, scope: !2696)
!2711 = !DILocation(line: 495, column: 6, scope: !2712)
!2712 = distinct !DILexicalBlock(scope: !2696, file: !2, line: 495, column: 6)
!2713 = !DILocation(line: 495, column: 12, scope: !2712)
!2714 = !DILocation(line: 495, column: 10, scope: !2712)
!2715 = !DILocation(line: 495, column: 15, scope: !2712)
!2716 = !DILocation(line: 495, column: 18, scope: !2712)
!2717 = !DILocation(line: 495, column: 24, scope: !2712)
!2718 = !DILocation(line: 495, column: 22, scope: !2712)
!2719 = !DILocation(line: 495, column: 27, scope: !2712)
!2720 = !DILocation(line: 495, column: 6, scope: !2696)
!2721 = !DILocation(line: 496, column: 3, scope: !2712)
!2722 = !DILocation(line: 497, column: 2, scope: !2696)
!2723 = !DILocation(line: 498, column: 1, scope: !2696)
!2724 = distinct !DISubprogram(name: "clean_map", scope: !2, file: !2, line: 528, type: !2725, scopeLine: 530, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2728)
!2725 = !DISubroutineType(types: !2726)
!2726 = !{!312, !312, !358, !358, !2727}
!2727 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2697, size: 64)
!2728 = !{!2729, !2730, !2731, !2732, !2733, !2734, !2735, !2736, !2737, !2738, !2739, !2740, !2741}
!2729 = !DILocalVariable(name: "map_fd", arg: 1, scope: !2724, file: !2, line: 528, type: !312)
!2730 = !DILocalVariable(name: "key_size", arg: 2, scope: !2724, file: !2, line: 528, type: !358)
!2731 = !DILocalVariable(name: "value_size", arg: 3, scope: !2724, file: !2, line: 528, type: !358)
!2732 = !DILocalVariable(name: "del_decision_func", arg: 4, scope: !2724, file: !2, line: 529, type: !2727)
!2733 = !DILocalVariable(name: "removed", scope: !2724, file: !2, line: 531, type: !312)
!2734 = !DILocalVariable(name: "key", scope: !2724, file: !2, line: 532, type: !141)
!2735 = !DILocalVariable(name: "prev_key", scope: !2724, file: !2, line: 532, type: !141)
!2736 = !DILocalVariable(name: "value", scope: !2724, file: !2, line: 532, type: !141)
!2737 = !DILocalVariable(name: "delete_prev", scope: !2724, file: !2, line: 533, type: !203)
!2738 = !DILocalVariable(name: "now_nsec", scope: !2724, file: !2, line: 534, type: !143)
!2739 = !DILocalVariable(name: "entries", scope: !2724, file: !2, line: 537, type: !312)
!2740 = !DILocalVariable(name: "duration", scope: !2724, file: !2, line: 538, type: !143)
!2741 = !DILabel(scope: !2724, name: "cleanup", file: !2, line: 578)
!2742 = !DILocation(line: 528, column: 26, scope: !2724)
!2743 = !DILocation(line: 528, column: 41, scope: !2724)
!2744 = !DILocation(line: 528, column: 58, scope: !2724)
!2745 = !DILocation(line: 529, column: 15, scope: !2724)
!2746 = !DILocation(line: 531, column: 2, scope: !2724)
!2747 = !DILocation(line: 531, column: 6, scope: !2724)
!2748 = !DILocation(line: 532, column: 2, scope: !2724)
!2749 = !DILocation(line: 532, column: 8, scope: !2724)
!2750 = !DILocation(line: 532, column: 14, scope: !2724)
!2751 = !DILocation(line: 532, column: 25, scope: !2724)
!2752 = !DILocation(line: 533, column: 2, scope: !2724)
!2753 = !DILocation(line: 533, column: 7, scope: !2724)
!2754 = !DILocation(line: 534, column: 2, scope: !2724)
!2755 = !DILocation(line: 534, column: 8, scope: !2724)
!2756 = !DILocation(line: 534, column: 19, scope: !2724)
!2757 = !DILocation(line: 537, column: 2, scope: !2724)
!2758 = !DILocation(line: 537, column: 6, scope: !2724)
!2759 = !DILocation(line: 538, column: 2, scope: !2724)
!2760 = !DILocation(line: 538, column: 8, scope: !2724)
!2761 = !DILocation(line: 541, column: 6, scope: !2762)
!2762 = distinct !DILexicalBlock(scope: !2724, file: !2, line: 541, column: 6)
!2763 = !DILocation(line: 541, column: 15, scope: !2762)
!2764 = !DILocation(line: 541, column: 6, scope: !2724)
!2765 = !DILocation(line: 542, column: 11, scope: !2762)
!2766 = !DILocation(line: 542, column: 10, scope: !2762)
!2767 = !DILocation(line: 542, column: 3, scope: !2762)
!2768 = !DILocation(line: 544, column: 15, scope: !2724)
!2769 = !DILocation(line: 544, column: 8, scope: !2724)
!2770 = !DILocation(line: 544, column: 6, scope: !2724)
!2771 = !DILocation(line: 545, column: 20, scope: !2724)
!2772 = !DILocation(line: 545, column: 13, scope: !2724)
!2773 = !DILocation(line: 545, column: 11, scope: !2724)
!2774 = !DILocation(line: 546, column: 17, scope: !2724)
!2775 = !DILocation(line: 546, column: 10, scope: !2724)
!2776 = !DILocation(line: 546, column: 8, scope: !2724)
!2777 = !DILocation(line: 547, column: 7, scope: !2778)
!2778 = distinct !DILexicalBlock(scope: !2724, file: !2, line: 547, column: 6)
!2779 = !DILocation(line: 547, column: 11, scope: !2778)
!2780 = !DILocation(line: 547, column: 15, scope: !2778)
!2781 = !DILocation(line: 547, column: 24, scope: !2778)
!2782 = !DILocation(line: 547, column: 28, scope: !2778)
!2783 = !DILocation(line: 547, column: 6, scope: !2724)
!2784 = !DILocation(line: 548, column: 11, scope: !2785)
!2785 = distinct !DILexicalBlock(scope: !2778, file: !2, line: 547, column: 35)
!2786 = !DILocation(line: 549, column: 3, scope: !2785)
!2787 = !DILocation(line: 553, column: 2, scope: !2724)
!2788 = !DILocation(line: 553, column: 30, scope: !2724)
!2789 = !DILocation(line: 553, column: 38, scope: !2724)
!2790 = !DILocation(line: 553, column: 48, scope: !2724)
!2791 = !DILocation(line: 553, column: 9, scope: !2724)
!2792 = !DILocation(line: 553, column: 53, scope: !2724)
!2793 = !DILocation(line: 554, column: 7, scope: !2794)
!2794 = distinct !DILexicalBlock(scope: !2795, file: !2, line: 554, column: 7)
!2795 = distinct !DILexicalBlock(scope: !2724, file: !2, line: 553, column: 59)
!2796 = !DILocation(line: 554, column: 7, scope: !2795)
!2797 = !DILocation(line: 555, column: 24, scope: !2798)
!2798 = distinct !DILexicalBlock(scope: !2794, file: !2, line: 554, column: 20)
!2799 = !DILocation(line: 555, column: 32, scope: !2798)
!2800 = !DILocation(line: 555, column: 4, scope: !2798)
!2801 = !DILocation(line: 556, column: 11, scope: !2798)
!2802 = !DILocation(line: 557, column: 16, scope: !2798)
!2803 = !DILocation(line: 558, column: 3, scope: !2798)
!2804 = !DILocation(line: 560, column: 27, scope: !2805)
!2805 = distinct !DILexicalBlock(scope: !2795, file: !2, line: 560, column: 7)
!2806 = !DILocation(line: 560, column: 35, scope: !2805)
!2807 = !DILocation(line: 560, column: 40, scope: !2805)
!2808 = !DILocation(line: 560, column: 7, scope: !2805)
!2809 = !DILocation(line: 560, column: 47, scope: !2805)
!2810 = !DILocation(line: 560, column: 7, scope: !2795)
!2811 = !DILocation(line: 561, column: 18, scope: !2805)
!2812 = !DILocation(line: 561, column: 36, scope: !2805)
!2813 = !DILocation(line: 561, column: 41, scope: !2805)
!2814 = !DILocation(line: 561, column: 48, scope: !2805)
!2815 = !DILocation(line: 561, column: 16, scope: !2805)
!2816 = !DILocation(line: 561, column: 4, scope: !2805)
!2817 = !DILocation(line: 563, column: 10, scope: !2795)
!2818 = !DILocation(line: 565, column: 10, scope: !2795)
!2819 = !DILocation(line: 565, column: 20, scope: !2795)
!2820 = !DILocation(line: 565, column: 25, scope: !2795)
!2821 = !DILocation(line: 565, column: 3, scope: !2795)
!2822 = distinct !{!2822, !2787, !2823, !1193}
!2823 = !DILocation(line: 566, column: 2, scope: !2724)
!2824 = !DILocation(line: 567, column: 6, scope: !2825)
!2825 = distinct !DILexicalBlock(scope: !2724, file: !2, line: 567, column: 6)
!2826 = !DILocation(line: 567, column: 6, scope: !2724)
!2827 = !DILocation(line: 568, column: 23, scope: !2828)
!2828 = distinct !DILexicalBlock(scope: !2825, file: !2, line: 567, column: 19)
!2829 = !DILocation(line: 568, column: 31, scope: !2828)
!2830 = !DILocation(line: 568, column: 3, scope: !2828)
!2831 = !DILocation(line: 569, column: 10, scope: !2828)
!2832 = !DILocation(line: 570, column: 2, scope: !2828)
!2833 = !DILocation(line: 572, column: 13, scope: !2724)
!2834 = !DILocation(line: 572, column: 44, scope: !2724)
!2835 = !DILocation(line: 572, column: 42, scope: !2724)
!2836 = !DILocation(line: 572, column: 11, scope: !2724)
!2837 = !DILocation(line: 573, column: 10, scope: !2724)
!2838 = !DILocation(line: 575, column: 3, scope: !2724)
!2839 = !DILocation(line: 575, column: 11, scope: !2724)
!2840 = !DILocation(line: 575, column: 20, scope: !2724)
!2841 = !DILocation(line: 575, column: 29, scope: !2724)
!2842 = !DILocation(line: 575, column: 38, scope: !2724)
!2843 = !DILocation(line: 576, column: 3, scope: !2724)
!2844 = !DILocation(line: 576, column: 12, scope: !2724)
!2845 = !DILocation(line: 573, column: 2, scope: !2724)
!2846 = !DILocation(line: 578, column: 1, scope: !2724)
!2847 = !DILocation(line: 579, column: 7, scope: !2724)
!2848 = !DILocation(line: 579, column: 2, scope: !2724)
!2849 = !DILocation(line: 580, column: 7, scope: !2724)
!2850 = !DILocation(line: 580, column: 2, scope: !2724)
!2851 = !DILocation(line: 581, column: 7, scope: !2724)
!2852 = !DILocation(line: 581, column: 2, scope: !2724)
!2853 = !DILocation(line: 582, column: 9, scope: !2724)
!2854 = !DILocation(line: 582, column: 2, scope: !2724)
!2855 = !DILocation(line: 583, column: 1, scope: !2724)
!2856 = distinct !DISubprogram(name: "flow_timeout", scope: !2, file: !2, line: 500, type: !2697, scopeLine: 501, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2857)
!2857 = !{!2858, !2859, !2860, !2861, !2862}
!2858 = !DILocalVariable(name: "key_ptr", arg: 1, scope: !2856, file: !2, line: 500, type: !141)
!2859 = !DILocalVariable(name: "val_ptr", arg: 2, scope: !2856, file: !2, line: 500, type: !141)
!2860 = !DILocalVariable(name: "now", arg: 3, scope: !2856, file: !2, line: 500, type: !143)
!2861 = !DILocalVariable(name: "fe", scope: !2856, file: !2, line: 502, type: !209)
!2862 = !DILocalVariable(name: "f_state", scope: !2856, file: !2, line: 503, type: !2863)
!2863 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2864, size: 64)
!2864 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "flow_state", file: !45, line: 82, size: 512, elements: !2865)
!2865 = !{!2866, !2867, !2868, !2869, !2870, !2871, !2872, !2873, !2874, !2875, !2876}
!2866 = !DIDerivedType(tag: DW_TAG_member, name: "min_rtt", scope: !2864, file: !45, line: 83, baseType: !143, size: 64)
!2867 = !DIDerivedType(tag: DW_TAG_member, name: "srtt", scope: !2864, file: !45, line: 84, baseType: !143, size: 64, offset: 64)
!2868 = !DIDerivedType(tag: DW_TAG_member, name: "last_timestamp", scope: !2864, file: !45, line: 85, baseType: !143, size: 64, offset: 128)
!2869 = !DIDerivedType(tag: DW_TAG_member, name: "sent_pkts", scope: !2864, file: !45, line: 86, baseType: !143, size: 64, offset: 192)
!2870 = !DIDerivedType(tag: DW_TAG_member, name: "sent_bytes", scope: !2864, file: !45, line: 87, baseType: !143, size: 64, offset: 256)
!2871 = !DIDerivedType(tag: DW_TAG_member, name: "rec_pkts", scope: !2864, file: !45, line: 88, baseType: !143, size: 64, offset: 320)
!2872 = !DIDerivedType(tag: DW_TAG_member, name: "rec_bytes", scope: !2864, file: !45, line: 89, baseType: !143, size: 64, offset: 384)
!2873 = !DIDerivedType(tag: DW_TAG_member, name: "last_id", scope: !2864, file: !45, line: 90, baseType: !195, size: 32, offset: 448)
!2874 = !DIDerivedType(tag: DW_TAG_member, name: "has_opened", scope: !2864, file: !45, line: 91, baseType: !203, size: 8, offset: 480)
!2875 = !DIDerivedType(tag: DW_TAG_member, name: "opening_reason", scope: !2864, file: !45, line: 92, baseType: !52, size: 8, offset: 488)
!2876 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !2864, file: !45, line: 93, baseType: !187, size: 16, offset: 496)
!2877 = !DILocation(line: 500, column: 32, scope: !2856)
!2878 = !DILocation(line: 500, column: 47, scope: !2856)
!2879 = !DILocation(line: 500, column: 62, scope: !2856)
!2880 = !DILocation(line: 502, column: 2, scope: !2856)
!2881 = !DILocation(line: 502, column: 20, scope: !2856)
!2882 = !DILocation(line: 503, column: 2, scope: !2856)
!2883 = !DILocation(line: 503, column: 21, scope: !2856)
!2884 = !DILocation(line: 503, column: 31, scope: !2856)
!2885 = !DILocation(line: 505, column: 6, scope: !2886)
!2886 = distinct !DILexicalBlock(scope: !2856, file: !2, line: 505, column: 6)
!2887 = !DILocation(line: 505, column: 12, scope: !2886)
!2888 = !DILocation(line: 505, column: 21, scope: !2886)
!2889 = !{!2890, !956, i64 16}
!2890 = !{!"flow_state", !956, i64 0, !956, i64 8, !956, i64 16, !956, i64 24, !956, i64 32, !956, i64 40, !956, i64 48, !958, i64 56, !957, i64 60, !945, i64 61, !1762, i64 62}
!2891 = !DILocation(line: 505, column: 10, scope: !2886)
!2892 = !DILocation(line: 505, column: 36, scope: !2886)
!2893 = !DILocation(line: 506, column: 6, scope: !2886)
!2894 = !DILocation(line: 506, column: 12, scope: !2886)
!2895 = !DILocation(line: 506, column: 21, scope: !2886)
!2896 = !DILocation(line: 506, column: 10, scope: !2886)
!2897 = !DILocation(line: 506, column: 36, scope: !2886)
!2898 = !DILocation(line: 505, column: 6, scope: !2856)
!2899 = !DILocation(line: 507, column: 7, scope: !2900)
!2900 = distinct !DILexicalBlock(scope: !2901, file: !2, line: 507, column: 7)
!2901 = distinct !DILexicalBlock(scope: !2886, file: !2, line: 506, column: 53)
!2902 = !DILocation(line: 507, column: 24, scope: !2900)
!2903 = !DILocation(line: 507, column: 27, scope: !2900)
!2904 = !DILocation(line: 507, column: 36, scope: !2900)
!2905 = !{!2890, !957, i64 60}
!2906 = !DILocation(line: 507, column: 7, scope: !2901)
!2907 = !DILocation(line: 508, column: 7, scope: !2908)
!2908 = distinct !DILexicalBlock(scope: !2900, file: !2, line: 507, column: 48)
!2909 = !DILocation(line: 508, column: 18, scope: !2908)
!2910 = !{!2911, !956, i64 0}
!2911 = !{!"flow_event", !956, i64 0, !956, i64 8, !1759, i64 16, !945, i64 60, !945, i64 61, !945, i64 62, !945, i64 63}
!2912 = !DILocation(line: 509, column: 19, scope: !2908)
!2913 = !DILocation(line: 509, column: 7, scope: !2908)
!2914 = !DILocation(line: 509, column: 17, scope: !2908)
!2915 = !{!2911, !956, i64 8}
!2916 = !DILocation(line: 510, column: 21, scope: !2908)
!2917 = !DILocation(line: 510, column: 27, scope: !2908)
!2918 = !DILocation(line: 510, column: 4, scope: !2908)
!2919 = !DILocation(line: 511, column: 7, scope: !2908)
!2920 = !DILocation(line: 511, column: 23, scope: !2908)
!2921 = !{!2911, !945, i64 60}
!2922 = !DILocation(line: 512, column: 7, scope: !2908)
!2923 = !DILocation(line: 512, column: 14, scope: !2908)
!2924 = !{!2911, !945, i64 61}
!2925 = !DILocation(line: 513, column: 7, scope: !2908)
!2926 = !DILocation(line: 513, column: 14, scope: !2908)
!2927 = !{!2911, !945, i64 62}
!2928 = !DILocation(line: 514, column: 4, scope: !2908)
!2929 = !DILocation(line: 515, column: 3, scope: !2908)
!2930 = !DILocation(line: 516, column: 3, scope: !2901)
!2931 = !DILocation(line: 518, column: 2, scope: !2856)
!2932 = !DILocation(line: 519, column: 1, scope: !2856)
!2933 = !DISubprogram(name: "nanosleep", scope: !2564, file: !2564, line: 272, type: !2934, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2938)
!2934 = !DISubroutineType(types: !2935)
!2935 = !{!312, !2936, !2634}
!2936 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !2937, size: 64)
!2937 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !2607)
!2938 = !{!2939, !2940}
!2939 = !DILocalVariable(name: "__requested_time", arg: 1, scope: !2933, file: !2564, line: 272, type: !2936)
!2940 = !DILocalVariable(name: "__remaining", arg: 2, scope: !2933, file: !2564, line: 272, type: !2634)
!2941 = !DISubprogram(name: "pthread_exit", scope: !2676, file: !2676, line: 211, type: !2942, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized, retainedNodes: !2944)
!2942 = !DISubroutineType(types: !2943)
!2943 = !{null, !141}
!2944 = !{!2945}
!2945 = !DILocalVariable(name: "__retval", arg: 1, scope: !2941, file: !2676, line: 211, type: !141)
!2946 = distinct !DISubprogram(name: "reverse_flow", scope: !45, file: !45, line: 167, type: !2947, scopeLine: 168, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !2950)
!2947 = !DISubroutineType(types: !2948)
!2948 = !{null, !2949, !2949}
!2949 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !159, size: 64)
!2950 = !{!2951, !2952}
!2951 = !DILocalVariable(name: "dest", arg: 1, scope: !2946, file: !45, line: 167, type: !2949)
!2952 = !DILocalVariable(name: "src", arg: 2, scope: !2946, file: !45, line: 167, type: !2949)
!2953 = !DILocation(line: 167, column: 48, scope: !2946)
!2954 = !DILocation(line: 167, column: 76, scope: !2946)
!2955 = !DILocation(line: 169, column: 14, scope: !2946)
!2956 = !DILocation(line: 169, column: 19, scope: !2946)
!2957 = !DILocation(line: 169, column: 2, scope: !2946)
!2958 = !DILocation(line: 169, column: 8, scope: !2946)
!2959 = !DILocation(line: 169, column: 12, scope: !2946)
!2960 = !DILocation(line: 170, column: 16, scope: !2946)
!2961 = !DILocation(line: 170, column: 21, scope: !2946)
!2962 = !{!1759, !1762, i64 40}
!2963 = !DILocation(line: 170, column: 2, scope: !2946)
!2964 = !DILocation(line: 170, column: 8, scope: !2946)
!2965 = !DILocation(line: 170, column: 14, scope: !2946)
!2966 = !DILocation(line: 171, column: 2, scope: !2946)
!2967 = !DILocation(line: 171, column: 8, scope: !2946)
!2968 = !DILocation(line: 171, column: 16, scope: !2946)
!2969 = !DILocation(line: 171, column: 21, scope: !2946)
!2970 = !{i64 0, i64 16, !981, i64 0, i64 16, !981, i64 0, i64 16, !981, i64 16, i64 2, !2499, i64 18, i64 2, !2499}
!2971 = !DILocation(line: 172, column: 2, scope: !2946)
!2972 = !DILocation(line: 172, column: 8, scope: !2946)
!2973 = !DILocation(line: 172, column: 16, scope: !2946)
!2974 = !DILocation(line: 172, column: 21, scope: !2946)
!2975 = !DILocation(line: 173, column: 2, scope: !2946)
!2976 = !DILocation(line: 173, column: 8, scope: !2946)
!2977 = !DILocation(line: 173, column: 17, scope: !2946)
!2978 = !{!1759, !945, i64 43}
!2979 = !DILocation(line: 174, column: 1, scope: !2946)
!2980 = !DISubprogram(name: "malloc", scope: !2981, file: !2981, line: 540, type: !2982, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2984)
!2981 = !DIFile(filename: "/usr/include/stdlib.h", directory: "", checksumkind: CSK_MD5, checksum: "02258fad21adf111bb9df9825e61954a")
!2982 = !DISubroutineType(types: !2983)
!2983 = !{!141, !140}
!2984 = !{!2985}
!2985 = !DILocalVariable(name: "__size", arg: 1, scope: !2980, file: !2981, line: 540, type: !140)
!2986 = !DISubprogram(name: "bpf_map_get_next_key", scope: !2987, file: !2987, line: 247, type: !2988, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2990)
!2987 = !DIFile(filename: "../lib/libbpf-install/usr/include/bpf/bpf.h", directory: "/home/demo/bpf-examples/pping", checksumkind: CSK_MD5, checksum: "3b49c7bbfbc51285f35c0eb0c7ab9250")
!2988 = !DISubroutineType(types: !2989)
!2989 = !{!312, !312, !836, !141}
!2990 = !{!2991, !2992, !2993}
!2991 = !DILocalVariable(name: "fd", arg: 1, scope: !2986, file: !2987, line: 247, type: !312)
!2992 = !DILocalVariable(name: "key", arg: 2, scope: !2986, file: !2987, line: 247, type: !836)
!2993 = !DILocalVariable(name: "next_key", arg: 3, scope: !2986, file: !2987, line: 247, type: !141)
!2994 = !DISubprogram(name: "bpf_map_delete_elem", scope: !2987, file: !2987, line: 246, type: !2995, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !2997)
!2995 = !DISubroutineType(types: !2996)
!2996 = !{!312, !312, !836}
!2997 = !{!2998, !2999}
!2998 = !DILocalVariable(name: "fd", arg: 1, scope: !2994, file: !2987, line: 246, type: !312)
!2999 = !DILocalVariable(name: "key", arg: 2, scope: !2994, file: !2987, line: 246, type: !836)
!3000 = !DISubprogram(name: "bpf_map_lookup_elem", scope: !2987, file: !2987, line: 239, type: !2988, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3001)
!3001 = !{!3002, !3003, !3004}
!3002 = !DILocalVariable(name: "fd", arg: 1, scope: !3000, file: !2987, line: 239, type: !312)
!3003 = !DILocalVariable(name: "key", arg: 2, scope: !3000, file: !2987, line: 239, type: !836)
!3004 = !DILocalVariable(name: "value", arg: 3, scope: !3000, file: !2987, line: 239, type: !141)
!3005 = !DISubprogram(name: "free", scope: !2981, file: !2981, line: 555, type: !2942, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3006)
!3006 = !{!3007}
!3007 = !DILocalVariable(name: "__ptr", arg: 1, scope: !3005, file: !2981, line: 555, type: !141)
!3008 = !DISubprogram(name: "bpf_object__open", scope: !70, file: !70, line: 153, type: !3009, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3011)
!3009 = !DISubroutineType(types: !3010)
!3010 = !{!1010, !379}
!3011 = !{!3012}
!3012 = !DILocalVariable(name: "path", arg: 1, scope: !3008, file: !70, line: 153, type: !379)
!3013 = distinct !DISubprogram(name: "init_rodata", scope: !2, file: !2, line: 323, type: !3014, scopeLine: 324, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !3016)
!3014 = !DISubroutineType(types: !3015)
!3015 = !{!312, !1010, !141, !358}
!3016 = !{!3017, !3018, !3019, !3020}
!3017 = !DILocalVariable(name: "obj", arg: 1, scope: !3013, file: !2, line: 323, type: !1010)
!3018 = !DILocalVariable(name: "src", arg: 2, scope: !3013, file: !2, line: 323, type: !141)
!3019 = !DILocalVariable(name: "size", arg: 3, scope: !3013, file: !2, line: 323, type: !358)
!3020 = !DILocalVariable(name: "map", scope: !3013, file: !2, line: 325, type: !3021)
!3021 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3022, size: 64)
!3022 = !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_map", file: !70, line: 513, flags: DIFlagFwdDecl)
!3023 = !DILocation(line: 323, column: 43, scope: !3013)
!3024 = !DILocation(line: 323, column: 54, scope: !3013)
!3025 = !DILocation(line: 323, column: 66, scope: !3013)
!3026 = !DILocation(line: 325, column: 2, scope: !3013)
!3027 = !DILocation(line: 325, column: 18, scope: !3013)
!3028 = !DILocation(line: 326, column: 2, scope: !3029)
!3029 = distinct !DILexicalBlock(scope: !3013, file: !2, line: 326, column: 2)
!3030 = !DILocation(line: 326, column: 2, scope: !3031)
!3031 = distinct !DILexicalBlock(scope: !3029, file: !2, line: 326, column: 2)
!3032 = !DILocation(line: 327, column: 28, scope: !3033)
!3033 = distinct !DILexicalBlock(scope: !3034, file: !2, line: 327, column: 7)
!3034 = distinct !DILexicalBlock(scope: !3031, file: !2, line: 326, column: 37)
!3035 = !DILocation(line: 327, column: 14, scope: !3033)
!3036 = !DILocation(line: 327, column: 7, scope: !3033)
!3037 = !DILocation(line: 327, column: 7, scope: !3034)
!3038 = !DILocation(line: 328, column: 38, scope: !3033)
!3039 = !DILocation(line: 328, column: 43, scope: !3033)
!3040 = !DILocation(line: 328, column: 48, scope: !3033)
!3041 = !DILocation(line: 328, column: 11, scope: !3033)
!3042 = !DILocation(line: 328, column: 4, scope: !3033)
!3043 = !DILocation(line: 329, column: 2, scope: !3034)
!3044 = distinct !{!3044, !3028, !3045, !1193}
!3045 = !DILocation(line: 329, column: 2, scope: !3029)
!3046 = !DILocation(line: 332, column: 2, scope: !3013)
!3047 = !DILocation(line: 333, column: 1, scope: !3013)
!3048 = distinct !DISubprogram(name: "set_programs_to_load", scope: !2, file: !2, line: 865, type: !1971, scopeLine: 867, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !3049)
!3049 = !{!3050, !3051, !3052, !3055}
!3050 = !DILocalVariable(name: "obj", arg: 1, scope: !3048, file: !2, line: 865, type: !1010)
!3051 = !DILocalVariable(name: "config", arg: 2, scope: !3048, file: !2, line: 866, type: !901)
!3052 = !DILocalVariable(name: "prog", scope: !3048, file: !2, line: 868, type: !3053)
!3053 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3054, size: 64)
!3054 = !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_program", file: !70, line: 231, flags: DIFlagFwdDecl)
!3055 = !DILocalVariable(name: "unload_prog", scope: !3048, file: !2, line: 869, type: !314)
!3056 = !DILocation(line: 865, column: 52, scope: !3048)
!3057 = !DILocation(line: 866, column: 26, scope: !3048)
!3058 = !DILocation(line: 868, column: 2, scope: !3048)
!3059 = !DILocation(line: 868, column: 22, scope: !3048)
!3060 = !DILocation(line: 869, column: 2, scope: !3048)
!3061 = !DILocation(line: 869, column: 8, scope: !3048)
!3062 = !DILocation(line: 870, column: 10, scope: !3048)
!3063 = !DILocation(line: 870, column: 18, scope: !3048)
!3064 = !DILocation(line: 870, column: 3, scope: !3048)
!3065 = !DILocation(line: 870, column: 53, scope: !3048)
!3066 = !DILocation(line: 874, column: 42, scope: !3048)
!3067 = !DILocation(line: 874, column: 47, scope: !3048)
!3068 = !DILocation(line: 874, column: 9, scope: !3048)
!3069 = !DILocation(line: 874, column: 7, scope: !3048)
!3070 = !DILocation(line: 875, column: 23, scope: !3071)
!3071 = distinct !DILexicalBlock(scope: !3048, file: !2, line: 875, column: 6)
!3072 = !DILocation(line: 875, column: 6, scope: !3071)
!3073 = !DILocation(line: 875, column: 6, scope: !3048)
!3074 = !DILocation(line: 876, column: 27, scope: !3071)
!3075 = !DILocation(line: 876, column: 10, scope: !3071)
!3076 = !DILocation(line: 876, column: 3, scope: !3071)
!3077 = !DILocation(line: 878, column: 35, scope: !3048)
!3078 = !DILocation(line: 878, column: 9, scope: !3048)
!3079 = !DILocation(line: 878, column: 2, scope: !3048)
!3080 = !DILocation(line: 879, column: 1, scope: !3048)
!3081 = !DISubprogram(name: "bpf_object__load", scope: !70, file: !70, line: 216, type: !3082, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3084)
!3082 = !DISubroutineType(types: !3083)
!3083 = !{!312, !1010}
!3084 = !{!3085}
!3085 = !DILocalVariable(name: "obj", arg: 1, scope: !3081, file: !70, line: 216, type: !1010)
!3086 = distinct !DISubprogram(name: "tc_attach", scope: !2, file: !2, line: 395, type: !3087, scopeLine: 399, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !3090)
!3087 = !DISubroutineType(types: !3088)
!3088 = !{!312, !1010, !312, !69, !379, !2322, !3089}
!3089 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !203, size: 64)
!3090 = !{!3091, !3092, !3093, !3094, !3095, !3096, !3097, !3098, !3099, !3100, !3101}
!3091 = !DILocalVariable(name: "obj", arg: 1, scope: !3086, file: !2, line: 395, type: !1010)
!3092 = !DILocalVariable(name: "ifindex", arg: 2, scope: !3086, file: !2, line: 395, type: !312)
!3093 = !DILocalVariable(name: "attach_point", arg: 3, scope: !3086, file: !2, line: 396, type: !69)
!3094 = !DILocalVariable(name: "prog_name", arg: 4, scope: !3086, file: !2, line: 397, type: !379)
!3095 = !DILocalVariable(name: "opts", arg: 5, scope: !3086, file: !2, line: 397, type: !2322)
!3096 = !DILocalVariable(name: "new_hook", arg: 6, scope: !3086, file: !2, line: 398, type: !3089)
!3097 = !DILocalVariable(name: "err", scope: !3086, file: !2, line: 400, type: !312)
!3098 = !DILocalVariable(name: "prog_fd", scope: !3086, file: !2, line: 401, type: !312)
!3099 = !DILocalVariable(name: "created_hook", scope: !3086, file: !2, line: 402, type: !203)
!3100 = !DILocalVariable(name: "hook", scope: !3086, file: !2, line: 403, type: !2248)
!3101 = !DILabel(scope: !3086, name: "err_after_hook", file: !2, line: 429)
!3102 = !DILocation(line: 395, column: 41, scope: !3086)
!3103 = !DILocation(line: 395, column: 50, scope: !3086)
!3104 = !DILocation(line: 396, column: 33, scope: !3086)
!3105 = !DILocation(line: 397, column: 20, scope: !3086)
!3106 = !DILocation(line: 397, column: 51, scope: !3086)
!3107 = !DILocation(line: 398, column: 14, scope: !3086)
!3108 = !DILocation(line: 400, column: 2, scope: !3086)
!3109 = !DILocation(line: 400, column: 6, scope: !3086)
!3110 = !DILocation(line: 401, column: 2, scope: !3086)
!3111 = !DILocation(line: 401, column: 6, scope: !3086)
!3112 = !DILocation(line: 402, column: 2, scope: !3086)
!3113 = !DILocation(line: 402, column: 7, scope: !3086)
!3114 = !DILocation(line: 403, column: 2, scope: !3086)
!3115 = !DILocation(line: 403, column: 2, scope: !3116)
!3116 = distinct !DILexicalBlock(scope: !3086, file: !2, line: 403, column: 2)
!3117 = !DILocation(line: 406, column: 8, scope: !3086)
!3118 = !DILocation(line: 406, column: 6, scope: !3086)
!3119 = !DILocation(line: 407, column: 6, scope: !3120)
!3120 = distinct !DILexicalBlock(scope: !3086, file: !2, line: 407, column: 6)
!3121 = !DILocation(line: 407, column: 10, scope: !3120)
!3122 = !DILocation(line: 407, column: 6, scope: !3086)
!3123 = !DILocation(line: 408, column: 16, scope: !3120)
!3124 = !DILocation(line: 408, column: 3, scope: !3120)
!3125 = !DILocation(line: 409, column: 11, scope: !3126)
!3126 = distinct !DILexicalBlock(scope: !3120, file: !2, line: 409, column: 11)
!3127 = !DILocation(line: 409, column: 11, scope: !3120)
!3128 = !DILocation(line: 410, column: 10, scope: !3126)
!3129 = !DILocation(line: 410, column: 3, scope: !3126)
!3130 = !DILocation(line: 413, column: 36, scope: !3086)
!3131 = !DILocation(line: 413, column: 41, scope: !3086)
!3132 = !DILocation(line: 413, column: 3, scope: !3086)
!3133 = !DILocation(line: 412, column: 12, scope: !3086)
!3134 = !DILocation(line: 412, column: 10, scope: !3086)
!3135 = !DILocation(line: 414, column: 6, scope: !3136)
!3136 = distinct !DILexicalBlock(scope: !3086, file: !2, line: 414, column: 6)
!3137 = !DILocation(line: 414, column: 14, scope: !3136)
!3138 = !DILocation(line: 414, column: 6, scope: !3086)
!3139 = !DILocation(line: 415, column: 9, scope: !3140)
!3140 = distinct !DILexicalBlock(scope: !3136, file: !2, line: 414, column: 19)
!3141 = !DILocation(line: 415, column: 7, scope: !3140)
!3142 = !DILocation(line: 416, column: 3, scope: !3140)
!3143 = !DILocation(line: 419, column: 18, scope: !3086)
!3144 = !DILocation(line: 419, column: 2, scope: !3086)
!3145 = !DILocation(line: 419, column: 8, scope: !3086)
!3146 = !DILocation(line: 419, column: 16, scope: !3086)
!3147 = !DILocation(line: 420, column: 2, scope: !3086)
!3148 = !DILocation(line: 420, column: 8, scope: !3086)
!3149 = !DILocation(line: 420, column: 16, scope: !3086)
!3150 = !DILocation(line: 421, column: 29, scope: !3086)
!3151 = !DILocation(line: 421, column: 8, scope: !3086)
!3152 = !DILocation(line: 421, column: 6, scope: !3086)
!3153 = !DILocation(line: 422, column: 6, scope: !3154)
!3154 = distinct !DILexicalBlock(scope: !3086, file: !2, line: 422, column: 6)
!3155 = !DILocation(line: 422, column: 6, scope: !3086)
!3156 = !DILocation(line: 423, column: 3, scope: !3154)
!3157 = !DILocation(line: 425, column: 6, scope: !3158)
!3158 = distinct !DILexicalBlock(scope: !3086, file: !2, line: 425, column: 6)
!3159 = !DILocation(line: 425, column: 6, scope: !3086)
!3160 = !DILocation(line: 426, column: 15, scope: !3158)
!3161 = !DILocation(line: 426, column: 4, scope: !3158)
!3162 = !DILocation(line: 426, column: 13, scope: !3158)
!3163 = !DILocation(line: 426, column: 3, scope: !3158)
!3164 = !DILocation(line: 427, column: 9, scope: !3086)
!3165 = !DILocation(line: 427, column: 15, scope: !3086)
!3166 = !DILocation(line: 427, column: 2, scope: !3086)
!3167 = !DILocation(line: 429, column: 1, scope: !3086)
!3168 = !DILocation(line: 435, column: 6, scope: !3169)
!3169 = distinct !DILexicalBlock(scope: !3086, file: !2, line: 435, column: 6)
!3170 = !DILocation(line: 435, column: 6, scope: !3086)
!3171 = !DILocation(line: 436, column: 8, scope: !3172)
!3172 = distinct !DILexicalBlock(scope: !3169, file: !2, line: 435, column: 20)
!3173 = !DILocation(line: 436, column: 21, scope: !3172)
!3174 = !DILocation(line: 437, column: 3, scope: !3172)
!3175 = !DILocation(line: 438, column: 2, scope: !3172)
!3176 = !DILocation(line: 439, column: 9, scope: !3086)
!3177 = !DILocation(line: 439, column: 2, scope: !3086)
!3178 = !DILocation(line: 440, column: 1, scope: !3086)
!3179 = distinct !DISubprogram(name: "xdp_attach", scope: !2, file: !2, line: 340, type: !3180, scopeLine: 342, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !3182)
!3180 = !DISubroutineType(types: !3181)
!3181 = !{!312, !1010, !379, !312, !195}
!3182 = !{!3183, !3184, !3185, !3186, !3187, !3188, !3189, !3190}
!3183 = !DILocalVariable(name: "obj", arg: 1, scope: !3179, file: !2, line: 340, type: !1010)
!3184 = !DILocalVariable(name: "prog_name", arg: 2, scope: !3179, file: !2, line: 340, type: !379)
!3185 = !DILocalVariable(name: "ifindex", arg: 3, scope: !3179, file: !2, line: 341, type: !312)
!3186 = !DILocalVariable(name: "xdp_flags", arg: 4, scope: !3179, file: !2, line: 341, type: !195)
!3187 = !DILocalVariable(name: "prog", scope: !3179, file: !2, line: 343, type: !3053)
!3188 = !DILocalVariable(name: "prog_fd", scope: !3179, file: !2, line: 344, type: !312)
!3189 = !DILocalVariable(name: "err", scope: !3179, file: !2, line: 344, type: !312)
!3190 = !DILocalVariable(name: "prog_id", scope: !3179, file: !2, line: 345, type: !195)
!3191 = !DILocation(line: 340, column: 42, scope: !3179)
!3192 = !DILocation(line: 340, column: 59, scope: !3179)
!3193 = !DILocation(line: 341, column: 13, scope: !3179)
!3194 = !DILocation(line: 341, column: 28, scope: !3179)
!3195 = !DILocation(line: 343, column: 2, scope: !3179)
!3196 = !DILocation(line: 343, column: 22, scope: !3179)
!3197 = !DILocation(line: 344, column: 2, scope: !3179)
!3198 = !DILocation(line: 344, column: 6, scope: !3179)
!3199 = !DILocation(line: 344, column: 15, scope: !3179)
!3200 = !DILocation(line: 345, column: 2, scope: !3179)
!3201 = !DILocation(line: 345, column: 8, scope: !3179)
!3202 = !DILocation(line: 347, column: 6, scope: !3203)
!3203 = distinct !DILexicalBlock(scope: !3179, file: !2, line: 347, column: 6)
!3204 = !DILocation(line: 347, column: 6, scope: !3179)
!3205 = !DILocation(line: 348, column: 43, scope: !3203)
!3206 = !DILocation(line: 348, column: 48, scope: !3203)
!3207 = !DILocation(line: 348, column: 10, scope: !3203)
!3208 = !DILocation(line: 348, column: 8, scope: !3203)
!3209 = !DILocation(line: 348, column: 3, scope: !3203)
!3210 = !DILocation(line: 350, column: 35, scope: !3203)
!3211 = !DILocation(line: 350, column: 10, scope: !3203)
!3212 = !DILocation(line: 350, column: 8, scope: !3203)
!3213 = !DILocation(line: 352, column: 28, scope: !3179)
!3214 = !DILocation(line: 352, column: 12, scope: !3179)
!3215 = !DILocation(line: 352, column: 10, scope: !3179)
!3216 = !DILocation(line: 353, column: 6, scope: !3217)
!3217 = distinct !DILexicalBlock(scope: !3179, file: !2, line: 353, column: 6)
!3218 = !DILocation(line: 353, column: 14, scope: !3217)
!3219 = !DILocation(line: 353, column: 6, scope: !3179)
!3220 = !DILocation(line: 354, column: 10, scope: !3217)
!3221 = !DILocation(line: 354, column: 3, scope: !3217)
!3222 = !DILocation(line: 356, column: 28, scope: !3179)
!3223 = !DILocation(line: 356, column: 37, scope: !3179)
!3224 = !DILocation(line: 356, column: 46, scope: !3179)
!3225 = !DILocation(line: 356, column: 8, scope: !3179)
!3226 = !DILocation(line: 356, column: 6, scope: !3179)
!3227 = !DILocation(line: 357, column: 6, scope: !3228)
!3228 = distinct !DILexicalBlock(scope: !3179, file: !2, line: 357, column: 6)
!3229 = !DILocation(line: 357, column: 6, scope: !3179)
!3230 = !DILocation(line: 358, column: 10, scope: !3228)
!3231 = !DILocation(line: 358, column: 3, scope: !3228)
!3232 = !DILocation(line: 360, column: 28, scope: !3179)
!3233 = !DILocation(line: 360, column: 47, scope: !3179)
!3234 = !DILocation(line: 360, column: 8, scope: !3179)
!3235 = !DILocation(line: 360, column: 6, scope: !3179)
!3236 = !DILocation(line: 361, column: 6, scope: !3237)
!3237 = distinct !DILexicalBlock(scope: !3179, file: !2, line: 361, column: 6)
!3238 = !DILocation(line: 361, column: 6, scope: !3179)
!3239 = !DILocation(line: 362, column: 23, scope: !3240)
!3240 = distinct !DILexicalBlock(scope: !3237, file: !2, line: 361, column: 11)
!3241 = !DILocation(line: 362, column: 36, scope: !3240)
!3242 = !DILocation(line: 362, column: 3, scope: !3240)
!3243 = !DILocation(line: 363, column: 10, scope: !3240)
!3244 = !DILocation(line: 363, column: 3, scope: !3240)
!3245 = !DILocation(line: 366, column: 9, scope: !3179)
!3246 = !DILocation(line: 366, column: 2, scope: !3179)
!3247 = !DILocation(line: 367, column: 1, scope: !3179)
!3248 = distinct !DISubprogram(name: "print_xdp_error_hints", scope: !2, file: !2, line: 886, type: !3249, scopeLine: 887, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !3251)
!3249 = !DISubroutineType(types: !3250)
!3250 = !{null, !305, !312}
!3251 = !{!3252, !3253}
!3252 = !DILocalVariable(name: "stream", arg: 1, scope: !3248, file: !2, line: 886, type: !305)
!3253 = !DILocalVariable(name: "err", arg: 2, scope: !3248, file: !2, line: 886, type: !312)
!3254 = !DILocation(line: 886, column: 41, scope: !3248)
!3255 = !DILocation(line: 886, column: 53, scope: !3248)
!3256 = !DILocation(line: 888, column: 8, scope: !3248)
!3257 = !DILocation(line: 888, column: 12, scope: !3248)
!3258 = !DILocation(line: 888, column: 18, scope: !3248)
!3259 = !DILocation(line: 888, column: 25, scope: !3248)
!3260 = !DILocation(line: 888, column: 24, scope: !3248)
!3261 = !DILocation(line: 888, column: 6, scope: !3248)
!3262 = !DILocation(line: 889, column: 10, scope: !3248)
!3263 = !DILocation(line: 889, column: 2, scope: !3248)
!3264 = !DILocation(line: 892, column: 11, scope: !3265)
!3265 = distinct !DILexicalBlock(scope: !3248, file: !2, line: 889, column: 15)
!3266 = !DILocation(line: 892, column: 3, scope: !3265)
!3267 = !DILocation(line: 894, column: 3, scope: !3265)
!3268 = !DILocation(line: 896, column: 11, scope: !3265)
!3269 = !DILocation(line: 896, column: 3, scope: !3265)
!3270 = !DILocation(line: 897, column: 3, scope: !3265)
!3271 = !DILocation(line: 899, column: 1, scope: !3248)
!3272 = !DISubprogram(name: "bpf_object__find_program_by_name", scope: !70, file: !70, line: 235, type: !3273, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3275)
!3273 = !DISubroutineType(types: !3274)
!3274 = !{!3053, !2064, !379}
!3275 = !{!3276, !3277}
!3276 = !DILocalVariable(name: "obj", arg: 1, scope: !3272, file: !70, line: 235, type: !2064)
!3277 = !DILocalVariable(name: "name", arg: 2, scope: !3272, file: !70, line: 235, type: !379)
!3278 = !DISubprogram(name: "bpf_object__next_program", scope: !70, file: !70, line: 265, type: !3279, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3281)
!3279 = !DISubroutineType(types: !3280)
!3280 = !{!3053, !2064, !3053}
!3281 = !{!3282, !3283}
!3282 = !DILocalVariable(name: "obj", arg: 1, scope: !3278, file: !70, line: 265, type: !2064)
!3283 = !DILocalVariable(name: "prog", arg: 2, scope: !3278, file: !70, line: 265, type: !3053)
!3284 = !DISubprogram(name: "bpf_program__fd", scope: !70, file: !70, line: 334, type: !3285, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3289)
!3285 = !DISubroutineType(types: !3286)
!3286 = !{!312, !3287}
!3287 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3288, size: 64)
!3288 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !3054)
!3289 = !{!3290}
!3290 = !DILocalVariable(name: "prog", arg: 1, scope: !3284, file: !70, line: 334, type: !3287)
!3291 = !DISubprogram(name: "bpf_tc_hook_create", scope: !70, file: !70, line: 877, type: !2333, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3292)
!3292 = !{!3293}
!3293 = !DILocalVariable(name: "hook", arg: 1, scope: !3291, file: !70, line: 877, type: !2335)
!3294 = !DISubprogram(name: "bpf_tc_attach", scope: !70, file: !70, line: 879, type: !2318, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3295)
!3295 = !{!3296, !3297}
!3296 = !DILocalVariable(name: "hook", arg: 1, scope: !3294, file: !70, line: 879, type: !2320)
!3297 = !DILocalVariable(name: "opts", arg: 2, scope: !3294, file: !70, line: 879, type: !2322)
!3298 = !DISubprogram(name: "bpf_program__set_autoload", scope: !70, file: !70, line: 292, type: !3299, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3301)
!3299 = !DISubroutineType(types: !3300)
!3300 = !{!312, !3053, !203}
!3301 = !{!3302, !3303}
!3302 = !DILocalVariable(name: "prog", arg: 1, scope: !3298, file: !70, line: 292, type: !3053)
!3303 = !DILocalVariable(name: "autoload", arg: 2, scope: !3298, file: !70, line: 292, type: !203)
!3304 = !DISubprogram(name: "bpf_object__next_map", scope: !70, file: !70, line: 687, type: !3305, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3309)
!3305 = !DISubroutineType(types: !3306)
!3306 = !{!3021, !2064, !3307}
!3307 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3308, size: 64)
!3308 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !3022)
!3309 = !{!3310, !3311}
!3310 = !DILocalVariable(name: "obj", arg: 1, scope: !3304, file: !70, line: 687, type: !2064)
!3311 = !DILocalVariable(name: "map", arg: 2, scope: !3304, file: !70, line: 687, type: !3307)
!3312 = !DISubprogram(name: "bpf_map__name", scope: !70, file: !70, line: 712, type: !3313, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3315)
!3313 = !DISubroutineType(types: !3314)
!3314 = !{!379, !3307}
!3315 = !{!3316}
!3316 = !DILocalVariable(name: "map", arg: 1, scope: !3312, file: !70, line: 712, type: !3307)
!3317 = !DISubprogram(name: "strstr", scope: !2186, file: !2186, line: 350, type: !3318, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3320)
!3318 = !DISubroutineType(types: !3319)
!3319 = !{!314, !379, !379}
!3320 = !{!3321, !3322}
!3321 = !DILocalVariable(name: "__haystack", arg: 1, scope: !3317, file: !2186, line: 350, type: !379)
!3322 = !DILocalVariable(name: "__needle", arg: 2, scope: !3317, file: !2186, line: 350, type: !379)
!3323 = !DISubprogram(name: "bpf_map__set_initial_value", scope: !70, file: !70, line: 746, type: !3324, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3326)
!3324 = !DISubroutineType(types: !3325)
!3325 = !{!312, !3021, !836, !358}
!3326 = !{!3327, !3328, !3329}
!3327 = !DILocalVariable(name: "map", arg: 1, scope: !3323, file: !70, line: 746, type: !3021)
!3328 = !DILocalVariable(name: "data", arg: 2, scope: !3323, file: !70, line: 746, type: !836)
!3329 = !DILocalVariable(name: "size", arg: 3, scope: !3323, file: !70, line: 746, type: !358)
!3330 = !DISubprogram(name: "jsonw_new", scope: !688, file: !688, line: 24, type: !3331, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3333)
!3331 = !DISubroutineType(types: !3332)
!3332 = !{!686, !305}
!3333 = !{!3334}
!3334 = !DILocalVariable(name: "f", arg: 1, scope: !3330, file: !688, line: 24, type: !305)
!3335 = !DISubprogram(name: "jsonw_start_array", scope: !688, file: !688, line: 73, type: !2170, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3336)
!3336 = !{!3337}
!3337 = !DILocalVariable(name: "self", arg: 1, scope: !3335, file: !688, line: 73, type: !686)
!3338 = !DISubprogram(name: "jsonw_start_object", scope: !688, file: !688, line: 70, type: !2170, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3339)
!3339 = !{!3340}
!3340 = !DILocalVariable(name: "self", arg: 1, scope: !3338, file: !688, line: 70, type: !686)
!3341 = distinct !DISubprogram(name: "print_common_fields_json", scope: !2, file: !2, line: 764, type: !3342, scopeLine: 766, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !3344)
!3342 = !DISubroutineType(types: !3343)
!3343 = !{null, !686, !581}
!3344 = !{!3345, !3346, !3347, !3348, !3349}
!3345 = !DILocalVariable(name: "ctx", arg: 1, scope: !3341, file: !2, line: 764, type: !686)
!3346 = !DILocalVariable(name: "e", arg: 2, scope: !3341, file: !2, line: 765, type: !581)
!3347 = !DILocalVariable(name: "flow", scope: !3341, file: !2, line: 767, type: !2415)
!3348 = !DILocalVariable(name: "saddr", scope: !3341, file: !2, line: 768, type: !275)
!3349 = !DILocalVariable(name: "daddr", scope: !3341, file: !2, line: 769, type: !275)
!3350 = !DILocation(line: 764, column: 53, scope: !3341)
!3351 = !DILocation(line: 765, column: 35, scope: !3341)
!3352 = !DILocation(line: 767, column: 2, scope: !3341)
!3353 = !DILocation(line: 767, column: 30, scope: !3341)
!3354 = !DILocation(line: 767, column: 38, scope: !3341)
!3355 = !DILocation(line: 767, column: 51, scope: !3341)
!3356 = !DILocation(line: 768, column: 2, scope: !3341)
!3357 = !DILocation(line: 768, column: 7, scope: !3341)
!3358 = !DILocation(line: 769, column: 2, scope: !3341)
!3359 = !DILocation(line: 769, column: 7, scope: !3341)
!3360 = !DILocation(line: 771, column: 20, scope: !3341)
!3361 = !DILocation(line: 771, column: 42, scope: !3341)
!3362 = !DILocation(line: 771, column: 48, scope: !3341)
!3363 = !DILocation(line: 771, column: 54, scope: !3341)
!3364 = !DILocation(line: 771, column: 60, scope: !3341)
!3365 = !DILocation(line: 771, column: 66, scope: !3341)
!3366 = !DILocation(line: 771, column: 2, scope: !3341)
!3367 = !DILocation(line: 772, column: 20, scope: !3341)
!3368 = !DILocation(line: 772, column: 42, scope: !3341)
!3369 = !DILocation(line: 772, column: 48, scope: !3341)
!3370 = !DILocation(line: 772, column: 54, scope: !3341)
!3371 = !DILocation(line: 772, column: 60, scope: !3341)
!3372 = !DILocation(line: 772, column: 66, scope: !3341)
!3373 = !DILocation(line: 772, column: 2, scope: !3341)
!3374 = !DILocation(line: 774, column: 18, scope: !3341)
!3375 = !DILocation(line: 775, column: 34, scope: !3341)
!3376 = !DILocation(line: 775, column: 47, scope: !3341)
!3377 = !DILocation(line: 775, column: 4, scope: !3341)
!3378 = !DILocation(line: 774, column: 2, scope: !3341)
!3379 = !DILocation(line: 776, column: 21, scope: !3341)
!3380 = !DILocation(line: 776, column: 36, scope: !3341)
!3381 = !DILocation(line: 776, column: 2, scope: !3341)
!3382 = !DILocation(line: 777, column: 17, scope: !3341)
!3383 = !DILocation(line: 777, column: 34, scope: !3341)
!3384 = !DILocation(line: 777, column: 2, scope: !3341)
!3385 = !DILocation(line: 778, column: 21, scope: !3341)
!3386 = !DILocation(line: 778, column: 37, scope: !3341)
!3387 = !DILocation(line: 778, column: 2, scope: !3341)
!3388 = !DILocation(line: 779, column: 17, scope: !3341)
!3389 = !DILocation(line: 779, column: 35, scope: !3341)
!3390 = !DILocation(line: 779, column: 2, scope: !3341)
!3391 = !DILocation(line: 780, column: 21, scope: !3341)
!3392 = !DILocation(line: 780, column: 51, scope: !3341)
!3393 = !DILocation(line: 780, column: 57, scope: !3341)
!3394 = !DILocation(line: 780, column: 38, scope: !3341)
!3395 = !DILocation(line: 780, column: 2, scope: !3341)
!3396 = !DILocation(line: 781, column: 1, scope: !3341)
!3397 = distinct !DISubprogram(name: "print_rttevent_fields_json", scope: !2, file: !2, line: 783, type: !3398, scopeLine: 785, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !3400)
!3398 = !DISubroutineType(types: !3399)
!3399 = !{null, !686, !1740}
!3400 = !{!3401, !3402}
!3401 = !DILocalVariable(name: "ctx", arg: 1, scope: !3397, file: !2, line: 783, type: !686)
!3402 = !DILocalVariable(name: "re", arg: 2, scope: !3397, file: !2, line: 784, type: !1740)
!3403 = !DILocation(line: 783, column: 55, scope: !3397)
!3404 = !DILocation(line: 784, column: 36, scope: !3397)
!3405 = !DILocation(line: 786, column: 18, scope: !3397)
!3406 = !DILocation(line: 786, column: 30, scope: !3397)
!3407 = !DILocation(line: 786, column: 34, scope: !3397)
!3408 = !DILocation(line: 786, column: 2, scope: !3397)
!3409 = !DILocation(line: 787, column: 18, scope: !3397)
!3410 = !DILocation(line: 787, column: 34, scope: !3397)
!3411 = !DILocation(line: 787, column: 38, scope: !3397)
!3412 = !DILocation(line: 787, column: 2, scope: !3397)
!3413 = !DILocation(line: 788, column: 18, scope: !3397)
!3414 = !DILocation(line: 788, column: 39, scope: !3397)
!3415 = !DILocation(line: 788, column: 43, scope: !3397)
!3416 = !{!1758, !956, i64 80}
!3417 = !DILocation(line: 788, column: 2, scope: !3397)
!3418 = !DILocation(line: 789, column: 18, scope: !3397)
!3419 = !DILocation(line: 789, column: 37, scope: !3397)
!3420 = !DILocation(line: 789, column: 41, scope: !3397)
!3421 = !{!1758, !956, i64 88}
!3422 = !DILocation(line: 789, column: 2, scope: !3397)
!3423 = !DILocation(line: 790, column: 18, scope: !3397)
!3424 = !DILocation(line: 790, column: 38, scope: !3397)
!3425 = !DILocation(line: 790, column: 42, scope: !3397)
!3426 = !{!1758, !956, i64 96}
!3427 = !DILocation(line: 790, column: 2, scope: !3397)
!3428 = !DILocation(line: 791, column: 18, scope: !3397)
!3429 = !DILocation(line: 791, column: 36, scope: !3397)
!3430 = !DILocation(line: 791, column: 40, scope: !3397)
!3431 = !{!1758, !956, i64 104}
!3432 = !DILocation(line: 791, column: 2, scope: !3397)
!3433 = !DILocation(line: 792, column: 19, scope: !3397)
!3434 = !DILocation(line: 792, column: 43, scope: !3397)
!3435 = !DILocation(line: 792, column: 47, scope: !3397)
!3436 = !{!1758, !957, i64 112}
!3437 = !DILocation(line: 792, column: 2, scope: !3397)
!3438 = !DILocation(line: 793, column: 1, scope: !3397)
!3439 = distinct !DISubprogram(name: "print_flowevent_fields_json", scope: !2, file: !2, line: 795, type: !3440, scopeLine: 797, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !3444)
!3440 = !DISubroutineType(types: !3441)
!3441 = !{null, !686, !3442}
!3442 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3443, size: 64)
!3443 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !209)
!3444 = !{!3445, !3446}
!3445 = !DILocalVariable(name: "ctx", arg: 1, scope: !3439, file: !2, line: 795, type: !686)
!3446 = !DILocalVariable(name: "fe", arg: 2, scope: !3439, file: !2, line: 796, type: !3442)
!3447 = !DILocation(line: 795, column: 56, scope: !3439)
!3448 = !DILocation(line: 796, column: 31, scope: !3439)
!3449 = !DILocation(line: 798, column: 21, scope: !3439)
!3450 = !DILocation(line: 799, column: 24, scope: !3439)
!3451 = !DILocation(line: 799, column: 28, scope: !3439)
!3452 = !DILocation(line: 799, column: 7, scope: !3439)
!3453 = !DILocation(line: 798, column: 2, scope: !3439)
!3454 = !DILocation(line: 800, column: 21, scope: !3439)
!3455 = !DILocation(line: 801, column: 26, scope: !3439)
!3456 = !DILocation(line: 801, column: 30, scope: !3439)
!3457 = !DILocation(line: 801, column: 7, scope: !3439)
!3458 = !DILocation(line: 800, column: 2, scope: !3439)
!3459 = !DILocation(line: 802, column: 21, scope: !3439)
!3460 = !DILocation(line: 802, column: 61, scope: !3439)
!3461 = !DILocation(line: 802, column: 65, scope: !3439)
!3462 = !DILocation(line: 802, column: 42, scope: !3439)
!3463 = !DILocation(line: 802, column: 2, scope: !3439)
!3464 = !DILocation(line: 803, column: 1, scope: !3439)
!3465 = !DISubprogram(name: "jsonw_end_object", scope: !688, file: !688, line: 71, type: !2170, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3466)
!3466 = !{!3467}
!3467 = !DILocalVariable(name: "self", arg: 1, scope: !3465, file: !688, line: 71, type: !686)
!3468 = distinct !DISubprogram(name: "flowevent_to_str", scope: !2, file: !2, line: 655, type: !3469, scopeLine: 656, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !3471)
!3469 = !DISubroutineType(types: !3470)
!3470 = !{!379, !44}
!3471 = !{!3472}
!3472 = !DILocalVariable(name: "fe", arg: 1, scope: !3468, file: !2, line: 655, type: !44)
!3473 = !DILocation(line: 655, column: 58, scope: !3468)
!3474 = !DILocation(line: 657, column: 10, scope: !3468)
!3475 = !DILocation(line: 657, column: 2, scope: !3468)
!3476 = !DILocation(line: 659, column: 3, scope: !3477)
!3477 = distinct !DILexicalBlock(scope: !3468, file: !2, line: 657, column: 14)
!3478 = !DILocation(line: 661, column: 3, scope: !3477)
!3479 = !DILocation(line: 664, column: 3, scope: !3477)
!3480 = !DILocation(line: 666, column: 3, scope: !3477)
!3481 = !DILocation(line: 668, column: 1, scope: !3468)
!3482 = !DISubprogram(name: "jsonw_string_field", scope: !688, file: !688, line: 53, type: !3483, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3485)
!3483 = !DISubroutineType(types: !3484)
!3484 = !{null, !686, !379, !379}
!3485 = !{!3486, !3487, !3488}
!3486 = !DILocalVariable(name: "self", arg: 1, scope: !3482, file: !688, line: 53, type: !686)
!3487 = !DILocalVariable(name: "prop", arg: 2, scope: !3482, file: !688, line: 53, type: !379)
!3488 = !DILocalVariable(name: "val", arg: 3, scope: !3482, file: !688, line: 53, type: !379)
!3489 = distinct !DISubprogram(name: "eventreason_to_str", scope: !2, file: !2, line: 670, type: !3490, scopeLine: 671, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !3492)
!3490 = !DISubroutineType(types: !3491)
!3491 = !{!379, !52}
!3492 = !{!3493}
!3493 = !DILocalVariable(name: "er", arg: 1, scope: !3489, file: !2, line: 670, type: !52)
!3494 = !DILocation(line: 670, column: 62, scope: !3489)
!3495 = !DILocation(line: 672, column: 10, scope: !3489)
!3496 = !DILocation(line: 672, column: 2, scope: !3489)
!3497 = !DILocation(line: 674, column: 3, scope: !3498)
!3498 = distinct !DILexicalBlock(scope: !3489, file: !2, line: 672, column: 14)
!3499 = !DILocation(line: 676, column: 3, scope: !3498)
!3500 = !DILocation(line: 678, column: 3, scope: !3498)
!3501 = !DILocation(line: 680, column: 3, scope: !3498)
!3502 = !DILocation(line: 682, column: 3, scope: !3498)
!3503 = !DILocation(line: 684, column: 3, scope: !3498)
!3504 = !DILocation(line: 686, column: 3, scope: !3498)
!3505 = !DILocation(line: 688, column: 1, scope: !3489)
!3506 = distinct !DISubprogram(name: "eventsource_to_str", scope: !2, file: !2, line: 690, type: !3507, scopeLine: 691, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !3509)
!3507 = !DISubroutineType(types: !3508)
!3508 = !{!379, !60}
!3509 = !{!3510}
!3510 = !DILocalVariable(name: "es", arg: 1, scope: !3506, file: !2, line: 690, type: !60)
!3511 = !DILocation(line: 690, column: 62, scope: !3506)
!3512 = !DILocation(line: 692, column: 10, scope: !3506)
!3513 = !DILocation(line: 692, column: 2, scope: !3506)
!3514 = !DILocation(line: 694, column: 3, scope: !3515)
!3515 = distinct !DILexicalBlock(scope: !3506, file: !2, line: 692, column: 14)
!3516 = !DILocation(line: 696, column: 3, scope: !3515)
!3517 = !DILocation(line: 698, column: 3, scope: !3515)
!3518 = !DILocation(line: 700, column: 3, scope: !3515)
!3519 = !DILocation(line: 702, column: 1, scope: !3506)
!3520 = !DISubprogram(name: "jsonw_u64_field", scope: !688, file: !688, line: 57, type: !3521, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3525)
!3521 = !DISubroutineType(types: !3522)
!3522 = !{null, !686, !379, !3523}
!3523 = !DIDerivedType(tag: DW_TAG_typedef, name: "uint64_t", file: !173, line: 27, baseType: !3524)
!3524 = !DIDerivedType(tag: DW_TAG_typedef, name: "__uint64_t", file: !139, line: 48, baseType: !145)
!3525 = !{!3526, !3527, !3528}
!3526 = !DILocalVariable(name: "self", arg: 1, scope: !3520, file: !688, line: 57, type: !686)
!3527 = !DILocalVariable(name: "prop", arg: 2, scope: !3520, file: !688, line: 57, type: !379)
!3528 = !DILocalVariable(name: "num", arg: 3, scope: !3520, file: !688, line: 57, type: !3523)
!3529 = !DISubprogram(name: "jsonw_bool_field", scope: !688, file: !688, line: 54, type: !3530, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3532)
!3530 = !DISubroutineType(types: !3531)
!3531 = !{null, !686, !379, !203}
!3532 = !{!3533, !3534, !3535}
!3533 = !DILocalVariable(name: "self", arg: 1, scope: !3529, file: !688, line: 54, type: !686)
!3534 = !DILocalVariable(name: "prop", arg: 2, scope: !3529, file: !688, line: 54, type: !379)
!3535 = !DILocalVariable(name: "value", arg: 3, scope: !3529, file: !688, line: 54, type: !203)
!3536 = !DISubprogram(name: "jsonw_hu_field", scope: !688, file: !688, line: 60, type: !3537, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3539)
!3537 = !DISubroutineType(types: !3538)
!3538 = !{null, !686, !379, !147}
!3539 = !{!3540, !3541, !3542}
!3540 = !DILocalVariable(name: "self", arg: 1, scope: !3536, file: !688, line: 60, type: !686)
!3541 = !DILocalVariable(name: "prop", arg: 2, scope: !3536, file: !688, line: 60, type: !379)
!3542 = !DILocalVariable(name: "num", arg: 3, scope: !3536, file: !688, line: 60, type: !147)
!3543 = !DILocation(line: 638, column: 39, scope: !532)
!3544 = !DILocation(line: 642, column: 10, scope: !532)
!3545 = !DILocation(line: 642, column: 2, scope: !532)
!3546 = !DILocation(line: 644, column: 3, scope: !3547)
!3547 = distinct !DILexicalBlock(scope: !532, file: !2, line: 642, column: 17)
!3548 = !DILocation(line: 646, column: 3, scope: !3547)
!3549 = !DILocation(line: 648, column: 3, scope: !3547)
!3550 = !DILocation(line: 650, column: 36, scope: !3547)
!3551 = !DILocation(line: 650, column: 3, scope: !3547)
!3552 = !DILocation(line: 651, column: 3, scope: !3547)
!3553 = !DILocation(line: 653, column: 1, scope: !532)
!3554 = !DISubprogram(name: "snprintf", scope: !304, file: !304, line: 378, type: !3555, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3557)
!3555 = !DISubroutineType(types: !3556)
!3556 = !{!312, !314, !140, !379, null}
!3557 = !{!3558, !3559, !3560}
!3558 = !DILocalVariable(name: "__s", arg: 1, scope: !3554, file: !304, line: 378, type: !314)
!3559 = !DILocalVariable(name: "__maxlen", arg: 2, scope: !3554, file: !304, line: 378, type: !140)
!3560 = !DILocalVariable(name: "__format", arg: 3, scope: !3554, file: !304, line: 378, type: !379)
!3561 = !DISubprogram(name: "getopt_long", scope: !459, file: !459, line: 66, type: !3562, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3567)
!3562 = !DISubroutineType(types: !3563)
!3563 = !{!312, !312, !3564, !379, !3566, !464}
!3564 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3565, size: 64)
!3565 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !314)
!3566 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !457, size: 64)
!3567 = !{!3568, !3569, !3570, !3571, !3572}
!3568 = !DILocalVariable(name: "___argc", arg: 1, scope: !3561, file: !459, line: 66, type: !312)
!3569 = !DILocalVariable(name: "___argv", arg: 2, scope: !3561, file: !459, line: 66, type: !3564)
!3570 = !DILocalVariable(name: "__shortopts", arg: 3, scope: !3561, file: !459, line: 66, type: !379)
!3571 = !DILocalVariable(name: "__longopts", arg: 4, scope: !3561, file: !459, line: 66, type: !3566)
!3572 = !DILocalVariable(name: "__longind", arg: 5, scope: !3561, file: !459, line: 66, type: !464)
!3573 = !DISubprogram(name: "strlen", scope: !2186, file: !2186, line: 407, type: !3574, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3576)
!3574 = !DISubroutineType(types: !3575)
!3575 = !{!140, !379}
!3576 = !{!3577}
!3577 = !DILocalVariable(name: "__s", arg: 1, scope: !3573, file: !2186, line: 407, type: !379)
!3578 = !DISubprogram(name: "strncpy", scope: !2186, file: !2186, line: 144, type: !3579, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3581)
!3579 = !DISubroutineType(types: !3580)
!3580 = !{!314, !314, !379, !140}
!3581 = !{!3582, !3583, !3584}
!3582 = !DILocalVariable(name: "__dest", arg: 1, scope: !3578, file: !2186, line: 144, type: !314)
!3583 = !DILocalVariable(name: "__src", arg: 2, scope: !3578, file: !2186, line: 144, type: !379)
!3584 = !DILocalVariable(name: "__n", arg: 3, scope: !3578, file: !2186, line: 144, type: !140)
!3585 = !DISubprogram(name: "if_nametoindex", scope: !3586, file: !3586, line: 193, type: !3587, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3589)
!3586 = !DIFile(filename: "/usr/include/net/if.h", directory: "", checksumkind: CSK_MD5, checksum: "ef0f4d1e9791a3fdd927ef15876d20ed")
!3587 = !DISubroutineType(types: !3588)
!3588 = !{!39, !379}
!3589 = !{!3590}
!3590 = !DILocalVariable(name: "__ifname", arg: 1, scope: !3585, file: !3586, line: 193, type: !379)
!3591 = distinct !DISubprogram(name: "parse_bounded_double", scope: !2, file: !2, line: 150, type: !3592, scopeLine: 152, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !36, retainedNodes: !3595)
!3592 = !DISubroutineType(types: !3593)
!3593 = !{!312, !3594, !379, !1314, !1314, !379}
!3594 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !1314, size: 64)
!3595 = !{!3596, !3597, !3598, !3599, !3600, !3601}
!3596 = !DILocalVariable(name: "res", arg: 1, scope: !3591, file: !2, line: 150, type: !3594)
!3597 = !DILocalVariable(name: "str", arg: 2, scope: !3591, file: !2, line: 150, type: !379)
!3598 = !DILocalVariable(name: "low", arg: 3, scope: !3591, file: !2, line: 150, type: !1314)
!3599 = !DILocalVariable(name: "high", arg: 4, scope: !3591, file: !2, line: 151, type: !1314)
!3600 = !DILocalVariable(name: "name", arg: 5, scope: !3591, file: !2, line: 151, type: !379)
!3601 = !DILocalVariable(name: "endptr", scope: !3591, file: !2, line: 153, type: !314)
!3602 = !DILocation(line: 150, column: 41, scope: !3591)
!3603 = !DILocation(line: 150, column: 58, scope: !3591)
!3604 = !DILocation(line: 150, column: 70, scope: !3591)
!3605 = !DILocation(line: 151, column: 15, scope: !3591)
!3606 = !DILocation(line: 151, column: 33, scope: !3591)
!3607 = !DILocation(line: 153, column: 2, scope: !3591)
!3608 = !DILocation(line: 153, column: 8, scope: !3591)
!3609 = !DILocation(line: 154, column: 16, scope: !3591)
!3610 = !DILocation(line: 154, column: 9, scope: !3591)
!3611 = !DILocation(line: 154, column: 3, scope: !3591)
!3612 = !DILocation(line: 154, column: 7, scope: !3591)
!3613 = !DILocation(line: 155, column: 13, scope: !3614)
!3614 = distinct !DILexicalBlock(scope: !3591, file: !2, line: 155, column: 6)
!3615 = !DILocation(line: 155, column: 6, scope: !3614)
!3616 = !DILocation(line: 155, column: 21, scope: !3614)
!3617 = !DILocation(line: 155, column: 30, scope: !3614)
!3618 = !DILocation(line: 155, column: 28, scope: !3614)
!3619 = !DILocation(line: 155, column: 18, scope: !3614)
!3620 = !DILocation(line: 155, column: 6, scope: !3591)
!3621 = !DILocation(line: 156, column: 11, scope: !3622)
!3622 = distinct !DILexicalBlock(scope: !3614, file: !2, line: 155, column: 35)
!3623 = !DILocation(line: 156, column: 52, scope: !3622)
!3624 = !DILocation(line: 156, column: 58, scope: !3622)
!3625 = !DILocation(line: 156, column: 3, scope: !3622)
!3626 = !DILocation(line: 157, column: 3, scope: !3622)
!3627 = !DILocation(line: 159, column: 7, scope: !3628)
!3628 = distinct !DILexicalBlock(scope: !3591, file: !2, line: 159, column: 6)
!3629 = !DILocation(line: 159, column: 6, scope: !3628)
!3630 = !DILocation(line: 159, column: 13, scope: !3628)
!3631 = !DILocation(line: 159, column: 11, scope: !3628)
!3632 = !DILocation(line: 159, column: 17, scope: !3628)
!3633 = !DILocation(line: 159, column: 21, scope: !3628)
!3634 = !DILocation(line: 159, column: 20, scope: !3628)
!3635 = !DILocation(line: 159, column: 27, scope: !3628)
!3636 = !DILocation(line: 159, column: 25, scope: !3628)
!3637 = !DILocation(line: 159, column: 6, scope: !3591)
!3638 = !DILocation(line: 160, column: 11, scope: !3639)
!3639 = distinct !DILexicalBlock(scope: !3628, file: !2, line: 159, column: 33)
!3640 = !DILocation(line: 160, column: 50, scope: !3639)
!3641 = !DILocation(line: 160, column: 56, scope: !3639)
!3642 = !DILocation(line: 160, column: 61, scope: !3639)
!3643 = !DILocation(line: 160, column: 3, scope: !3639)
!3644 = !DILocation(line: 161, column: 3, scope: !3639)
!3645 = !DILocation(line: 164, column: 2, scope: !3591)
!3646 = !DILocation(line: 165, column: 1, scope: !3591)
!3647 = !DISubprogram(name: "exit", scope: !2981, file: !2981, line: 624, type: !992, flags: DIFlagPrototyped | DIFlagNoReturn, spFlags: DISPFlagOptimized, retainedNodes: !3648)
!3648 = !{!3649}
!3649 = !DILocalVariable(name: "__status", arg: 1, scope: !3647, file: !2981, line: 624, type: !312)
!3650 = !DISubprogram(name: "strtod", scope: !2981, file: !2981, line: 118, type: !3651, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3653)
!3651 = !DISubroutineType(types: !3652)
!3652 = !{!1314, !379, !1003}
!3653 = !{!3654, !3655}
!3654 = !DILocalVariable(name: "__nptr", arg: 1, scope: !3650, file: !2981, line: 118, type: !379)
!3655 = !DILocalVariable(name: "__endptr", arg: 2, scope: !3650, file: !2981, line: 118, type: !1003)
!3656 = !DISubprogram(name: "libbpf_strerror", scope: !70, file: !70, line: 52, type: !3657, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3659)
!3657 = !DISubroutineType(types: !3658)
!3658 = !{!312, !312, !314, !358}
!3659 = !{!3660, !3661, !3662}
!3660 = !DILocalVariable(name: "err", arg: 1, scope: !3656, file: !70, line: 52, type: !312)
!3661 = !DILocalVariable(name: "buf", arg: 2, scope: !3656, file: !70, line: 52, type: !314)
!3662 = !DILocalVariable(name: "size", arg: 3, scope: !3656, file: !70, line: 52, type: !358)
!3663 = !DISubprogram(name: "setrlimit", scope: !3664, file: !3664, line: 70, type: !3665, flags: DIFlagPrototyped, spFlags: DISPFlagOptimized, retainedNodes: !3670)
!3664 = !DIFile(filename: "/usr/include/sys/resource.h", directory: "", checksumkind: CSK_MD5, checksum: "e55940cb1bf33174af2c45f02cd69e8a")
!3665 = !DISubroutineType(types: !3666)
!3666 = !{!312, !3667, !3668}
!3667 = !DIDerivedType(tag: DW_TAG_typedef, name: "__rlimit_resource_t", file: !3664, line: 42, baseType: !312)
!3668 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3669, size: 64)
!3669 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !1274)
!3670 = !{!3671, !3672}
!3671 = !DILocalVariable(name: "__resource", arg: 1, scope: !3663, file: !3664, line: 70, type: !3667)
!3672 = !DILocalVariable(name: "__rlimits", arg: 2, scope: !3663, file: !3664, line: 70, type: !3668)
!3673 = distinct !DISubprogram(name: "pping_tc_egress", scope: !694, file: !694, line: 715, type: !3674, scopeLine: 716, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !3764)
!3674 = !DISubroutineType(types: !3675)
!3675 = !{!312, !3676}
!3676 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3677, size: 64)
!3677 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sk_buff", file: !697, line: 4183, size: 1472, elements: !3678)
!3678 = !{!3679, !3680, !3681, !3682, !3683, !3684, !3685, !3686, !3687, !3688, !3689, !3690, !3691, !3693, !3694, !3695, !3696, !3697, !3698, !3699, !3700, !3701, !3702, !3703, !3704, !3705, !3706, !3738, !3739, !3740, !3741, !3763}
!3679 = !DIDerivedType(tag: DW_TAG_member, name: "len", scope: !3677, file: !697, line: 4184, baseType: !195, size: 32)
!3680 = !DIDerivedType(tag: DW_TAG_member, name: "pkt_type", scope: !3677, file: !697, line: 4185, baseType: !195, size: 32, offset: 32)
!3681 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !3677, file: !697, line: 4186, baseType: !195, size: 32, offset: 64)
!3682 = !DIDerivedType(tag: DW_TAG_member, name: "queue_mapping", scope: !3677, file: !697, line: 4187, baseType: !195, size: 32, offset: 96)
!3683 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !3677, file: !697, line: 4188, baseType: !195, size: 32, offset: 128)
!3684 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_present", scope: !3677, file: !697, line: 4189, baseType: !195, size: 32, offset: 160)
!3685 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_tci", scope: !3677, file: !697, line: 4190, baseType: !195, size: 32, offset: 192)
!3686 = !DIDerivedType(tag: DW_TAG_member, name: "vlan_proto", scope: !3677, file: !697, line: 4191, baseType: !195, size: 32, offset: 224)
!3687 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !3677, file: !697, line: 4192, baseType: !195, size: 32, offset: 256)
!3688 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !3677, file: !697, line: 4193, baseType: !195, size: 32, offset: 288)
!3689 = !DIDerivedType(tag: DW_TAG_member, name: "ifindex", scope: !3677, file: !697, line: 4194, baseType: !195, size: 32, offset: 320)
!3690 = !DIDerivedType(tag: DW_TAG_member, name: "tc_index", scope: !3677, file: !697, line: 4195, baseType: !195, size: 32, offset: 352)
!3691 = !DIDerivedType(tag: DW_TAG_member, name: "cb", scope: !3677, file: !697, line: 4196, baseType: !3692, size: 160, offset: 384)
!3692 = !DICompositeType(tag: DW_TAG_array_type, baseType: !195, size: 160, elements: !15)
!3693 = !DIDerivedType(tag: DW_TAG_member, name: "hash", scope: !3677, file: !697, line: 4197, baseType: !195, size: 32, offset: 544)
!3694 = !DIDerivedType(tag: DW_TAG_member, name: "tc_classid", scope: !3677, file: !697, line: 4198, baseType: !195, size: 32, offset: 576)
!3695 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !3677, file: !697, line: 4199, baseType: !195, size: 32, offset: 608)
!3696 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !3677, file: !697, line: 4200, baseType: !195, size: 32, offset: 640)
!3697 = !DIDerivedType(tag: DW_TAG_member, name: "napi_id", scope: !3677, file: !697, line: 4201, baseType: !195, size: 32, offset: 672)
!3698 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !3677, file: !697, line: 4204, baseType: !195, size: 32, offset: 704)
!3699 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip4", scope: !3677, file: !697, line: 4205, baseType: !195, size: 32, offset: 736)
!3700 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip4", scope: !3677, file: !697, line: 4206, baseType: !195, size: 32, offset: 768)
!3701 = !DIDerivedType(tag: DW_TAG_member, name: "remote_ip6", scope: !3677, file: !697, line: 4207, baseType: !877, size: 128, offset: 800)
!3702 = !DIDerivedType(tag: DW_TAG_member, name: "local_ip6", scope: !3677, file: !697, line: 4208, baseType: !877, size: 128, offset: 928)
!3703 = !DIDerivedType(tag: DW_TAG_member, name: "remote_port", scope: !3677, file: !697, line: 4209, baseType: !195, size: 32, offset: 1056)
!3704 = !DIDerivedType(tag: DW_TAG_member, name: "local_port", scope: !3677, file: !697, line: 4210, baseType: !195, size: 32, offset: 1088)
!3705 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !3677, file: !697, line: 4213, baseType: !195, size: 32, offset: 1120)
!3706 = !DIDerivedType(tag: DW_TAG_member, scope: !3677, file: !697, line: 4214, baseType: !3707, size: 64, align: 64, offset: 1152)
!3707 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !3677, file: !697, line: 4214, size: 64, align: 64, elements: !3708)
!3708 = !{!3709}
!3709 = !DIDerivedType(tag: DW_TAG_member, name: "flow_keys", scope: !3707, file: !697, line: 4214, baseType: !3710, size: 64)
!3710 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3711, size: 64)
!3711 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_flow_keys", file: !697, line: 5041, size: 448, elements: !3712)
!3712 = !{!3713, !3714, !3715, !3716, !3717, !3718, !3719, !3720, !3721, !3722, !3723, !3736, !3737}
!3713 = !DIDerivedType(tag: DW_TAG_member, name: "nhoff", scope: !3711, file: !697, line: 5042, baseType: !187, size: 16)
!3714 = !DIDerivedType(tag: DW_TAG_member, name: "thoff", scope: !3711, file: !697, line: 5043, baseType: !187, size: 16, offset: 16)
!3715 = !DIDerivedType(tag: DW_TAG_member, name: "addr_proto", scope: !3711, file: !697, line: 5044, baseType: !187, size: 16, offset: 32)
!3716 = !DIDerivedType(tag: DW_TAG_member, name: "is_frag", scope: !3711, file: !697, line: 5045, baseType: !192, size: 8, offset: 48)
!3717 = !DIDerivedType(tag: DW_TAG_member, name: "is_first_frag", scope: !3711, file: !697, line: 5046, baseType: !192, size: 8, offset: 56)
!3718 = !DIDerivedType(tag: DW_TAG_member, name: "is_encap", scope: !3711, file: !697, line: 5047, baseType: !192, size: 8, offset: 64)
!3719 = !DIDerivedType(tag: DW_TAG_member, name: "ip_proto", scope: !3711, file: !697, line: 5048, baseType: !192, size: 8, offset: 72)
!3720 = !DIDerivedType(tag: DW_TAG_member, name: "n_proto", scope: !3711, file: !697, line: 5049, baseType: !742, size: 16, offset: 80)
!3721 = !DIDerivedType(tag: DW_TAG_member, name: "sport", scope: !3711, file: !697, line: 5050, baseType: !742, size: 16, offset: 96)
!3722 = !DIDerivedType(tag: DW_TAG_member, name: "dport", scope: !3711, file: !697, line: 5051, baseType: !742, size: 16, offset: 112)
!3723 = !DIDerivedType(tag: DW_TAG_member, scope: !3711, file: !697, line: 5052, baseType: !3724, size: 256, offset: 128)
!3724 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !3711, file: !697, line: 5052, size: 256, elements: !3725)
!3725 = !{!3726, !3731}
!3726 = !DIDerivedType(tag: DW_TAG_member, scope: !3724, file: !697, line: 5053, baseType: !3727, size: 64)
!3727 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !3724, file: !697, line: 5053, size: 64, elements: !3728)
!3728 = !{!3729, !3730}
!3729 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_src", scope: !3727, file: !697, line: 5054, baseType: !746, size: 32)
!3730 = !DIDerivedType(tag: DW_TAG_member, name: "ipv4_dst", scope: !3727, file: !697, line: 5055, baseType: !746, size: 32, offset: 32)
!3731 = !DIDerivedType(tag: DW_TAG_member, scope: !3724, file: !697, line: 5057, baseType: !3732, size: 256)
!3732 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !3724, file: !697, line: 5057, size: 256, elements: !3733)
!3733 = !{!3734, !3735}
!3734 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_src", scope: !3732, file: !697, line: 5058, baseType: !877, size: 128)
!3735 = !DIDerivedType(tag: DW_TAG_member, name: "ipv6_dst", scope: !3732, file: !697, line: 5059, baseType: !877, size: 128, offset: 128)
!3736 = !DIDerivedType(tag: DW_TAG_member, name: "flags", scope: !3711, file: !697, line: 5062, baseType: !195, size: 32, offset: 384)
!3737 = !DIDerivedType(tag: DW_TAG_member, name: "flow_label", scope: !3711, file: !697, line: 5063, baseType: !746, size: 32, offset: 416)
!3738 = !DIDerivedType(tag: DW_TAG_member, name: "tstamp", scope: !3677, file: !697, line: 4215, baseType: !143, size: 64, offset: 1216)
!3739 = !DIDerivedType(tag: DW_TAG_member, name: "wire_len", scope: !3677, file: !697, line: 4216, baseType: !195, size: 32, offset: 1280)
!3740 = !DIDerivedType(tag: DW_TAG_member, name: "gso_segs", scope: !3677, file: !697, line: 4217, baseType: !195, size: 32, offset: 1312)
!3741 = !DIDerivedType(tag: DW_TAG_member, scope: !3677, file: !697, line: 4218, baseType: !3742, size: 64, align: 64, offset: 1344)
!3742 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !3677, file: !697, line: 4218, size: 64, align: 64, elements: !3743)
!3743 = !{!3744}
!3744 = !DIDerivedType(tag: DW_TAG_member, name: "sk", scope: !3742, file: !697, line: 4218, baseType: !3745, size: 64)
!3745 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3746, size: 64)
!3746 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "bpf_sock", file: !697, line: 4272, size: 640, elements: !3747)
!3747 = !{!3748, !3749, !3750, !3751, !3752, !3753, !3754, !3755, !3756, !3757, !3758, !3759, !3760, !3761}
!3748 = !DIDerivedType(tag: DW_TAG_member, name: "bound_dev_if", scope: !3746, file: !697, line: 4273, baseType: !195, size: 32)
!3749 = !DIDerivedType(tag: DW_TAG_member, name: "family", scope: !3746, file: !697, line: 4274, baseType: !195, size: 32, offset: 32)
!3750 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !3746, file: !697, line: 4275, baseType: !195, size: 32, offset: 64)
!3751 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !3746, file: !697, line: 4276, baseType: !195, size: 32, offset: 96)
!3752 = !DIDerivedType(tag: DW_TAG_member, name: "mark", scope: !3746, file: !697, line: 4277, baseType: !195, size: 32, offset: 128)
!3753 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !3746, file: !697, line: 4278, baseType: !195, size: 32, offset: 160)
!3754 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip4", scope: !3746, file: !697, line: 4280, baseType: !195, size: 32, offset: 192)
!3755 = !DIDerivedType(tag: DW_TAG_member, name: "src_ip6", scope: !3746, file: !697, line: 4281, baseType: !877, size: 128, offset: 224)
!3756 = !DIDerivedType(tag: DW_TAG_member, name: "src_port", scope: !3746, file: !697, line: 4282, baseType: !195, size: 32, offset: 352)
!3757 = !DIDerivedType(tag: DW_TAG_member, name: "dst_port", scope: !3746, file: !697, line: 4283, baseType: !195, size: 32, offset: 384)
!3758 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip4", scope: !3746, file: !697, line: 4284, baseType: !195, size: 32, offset: 416)
!3759 = !DIDerivedType(tag: DW_TAG_member, name: "dst_ip6", scope: !3746, file: !697, line: 4285, baseType: !877, size: 128, offset: 448)
!3760 = !DIDerivedType(tag: DW_TAG_member, name: "state", scope: !3746, file: !697, line: 4286, baseType: !195, size: 32, offset: 576)
!3761 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_mapping", scope: !3746, file: !697, line: 4287, baseType: !3762, size: 32, offset: 608)
!3762 = !DIDerivedType(tag: DW_TAG_typedef, name: "__s32", file: !144, line: 26, baseType: !312)
!3763 = !DIDerivedType(tag: DW_TAG_member, name: "gso_size", scope: !3677, file: !697, line: 4219, baseType: !195, size: 32, offset: 1408)
!3764 = !{!3765, !3766}
!3765 = !DILocalVariable(name: "skb", arg: 1, scope: !3673, file: !694, line: 715, type: !3676)
!3766 = !DILocalVariable(name: "pctx", scope: !3673, file: !694, line: 717, type: !3767)
!3767 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "parsing_context", file: !694, line: 42, size: 320, elements: !3768)
!3768 = !{!3769, !3770, !3771, !3776, !3777, !3778}
!3769 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !3767, file: !694, line: 43, baseType: !141, size: 64)
!3770 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !3767, file: !694, line: 44, baseType: !141, size: 64, offset: 64)
!3771 = !DIDerivedType(tag: DW_TAG_member, name: "nh", scope: !3767, file: !694, line: 45, baseType: !3772, size: 64, offset: 128)
!3772 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "hdr_cursor", file: !3773, line: 35, size: 64, elements: !3774)
!3773 = !DIFile(filename: "../lib/../include/xdp/parsing_helpers.h", directory: "/home/demo/bpf-examples/pping", checksumkind: CSK_MD5, checksum: "e41ee3c44bb7300a1b081f0ef073eeff")
!3774 = !{!3775}
!3775 = !DIDerivedType(tag: DW_TAG_member, name: "pos", scope: !3772, file: !3773, line: 36, baseType: !141, size: 64)
!3776 = !DIDerivedType(tag: DW_TAG_member, name: "pkt_len", scope: !3767, file: !694, line: 46, baseType: !195, size: 32, offset: 192)
!3777 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !3767, file: !694, line: 47, baseType: !195, size: 32, offset: 224)
!3778 = !DIDerivedType(tag: DW_TAG_member, name: "is_egress", scope: !3767, file: !694, line: 48, baseType: !203, size: 8, offset: 256)
!3779 = !DILocation(line: 715, column: 39, scope: !3673)
!3780 = !DILocation(line: 717, column: 2, scope: !3673)
!3781 = !DILocation(line: 717, column: 25, scope: !3673)
!3782 = !DILocation(line: 717, column: 32, scope: !3673)
!3783 = !DILocation(line: 718, column: 25, scope: !3673)
!3784 = !DILocation(line: 718, column: 30, scope: !3673)
!3785 = !{!3786, !958, i64 76}
!3786 = !{!"__sk_buff", !958, i64 0, !958, i64 4, !958, i64 8, !958, i64 12, !958, i64 16, !958, i64 20, !958, i64 24, !958, i64 28, !958, i64 32, !958, i64 36, !958, i64 40, !958, i64 44, !945, i64 48, !958, i64 68, !958, i64 72, !958, i64 76, !958, i64 80, !958, i64 84, !958, i64 88, !958, i64 92, !958, i64 96, !945, i64 100, !945, i64 116, !958, i64 132, !958, i64 136, !958, i64 140, !945, i64 144, !956, i64 152, !958, i64 160, !958, i64 164, !945, i64 168, !958, i64 176}
!3787 = !DILocation(line: 718, column: 19, scope: !3673)
!3788 = !DILocation(line: 718, column: 11, scope: !3673)
!3789 = !{!3790, !944, i64 0}
!3790 = !{!"parsing_context", !944, i64 0, !944, i64 8, !3791, i64 16, !958, i64 24, !958, i64 28, !957, i64 32}
!3791 = !{!"hdr_cursor", !944, i64 0}
!3792 = !DILocation(line: 719, column: 29, scope: !3673)
!3793 = !DILocation(line: 719, column: 34, scope: !3673)
!3794 = !{!3786, !958, i64 80}
!3795 = !DILocation(line: 719, column: 23, scope: !3673)
!3796 = !DILocation(line: 719, column: 15, scope: !3673)
!3797 = !{!3790, !944, i64 8}
!3798 = !DILocation(line: 721, column: 9, scope: !3673)
!3799 = !DILocation(line: 721, column: 23, scope: !3673)
!3800 = !{!3791, !944, i64 0}
!3801 = !DILocation(line: 720, column: 14, scope: !3673)
!3802 = !DILocation(line: 720, column: 19, scope: !3673)
!3803 = !{!3786, !958, i64 0}
!3804 = !{!3790, !958, i64 24}
!3805 = !{!3790, !958, i64 28}
!3806 = !{!3790, !957, i64 32}
!3807 = !DILocation(line: 725, column: 8, scope: !3673)
!3808 = !DILocation(line: 725, column: 2, scope: !3673)
!3809 = !DILocation(line: 728, column: 1, scope: !3673)
!3810 = !DILocation(line: 727, column: 2, scope: !3673)
!3811 = distinct !DISubprogram(name: "pping_tc_ingress", scope: !694, file: !694, line: 732, type: !3674, scopeLine: 733, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !3812)
!3812 = !{!3813, !3814}
!3813 = !DILocalVariable(name: "skb", arg: 1, scope: !3811, file: !694, line: 732, type: !3676)
!3814 = !DILocalVariable(name: "pctx", scope: !3811, file: !694, line: 734, type: !3767)
!3815 = !DILocation(line: 732, column: 40, scope: !3811)
!3816 = !DILocation(line: 734, column: 2, scope: !3811)
!3817 = !DILocation(line: 734, column: 25, scope: !3811)
!3818 = !DILocation(line: 734, column: 32, scope: !3811)
!3819 = !DILocation(line: 735, column: 25, scope: !3811)
!3820 = !DILocation(line: 735, column: 30, scope: !3811)
!3821 = !DILocation(line: 735, column: 19, scope: !3811)
!3822 = !DILocation(line: 735, column: 11, scope: !3811)
!3823 = !DILocation(line: 736, column: 29, scope: !3811)
!3824 = !DILocation(line: 736, column: 34, scope: !3811)
!3825 = !DILocation(line: 736, column: 23, scope: !3811)
!3826 = !DILocation(line: 736, column: 15, scope: !3811)
!3827 = !DILocation(line: 738, column: 9, scope: !3811)
!3828 = !DILocation(line: 738, column: 23, scope: !3811)
!3829 = !DILocation(line: 737, column: 14, scope: !3811)
!3830 = !DILocation(line: 737, column: 19, scope: !3811)
!3831 = !DILocation(line: 739, column: 22, scope: !3811)
!3832 = !DILocation(line: 739, column: 27, scope: !3811)
!3833 = !{!3786, !958, i64 36}
!3834 = !DILocation(line: 743, column: 8, scope: !3811)
!3835 = !DILocation(line: 743, column: 2, scope: !3811)
!3836 = !DILocation(line: 746, column: 1, scope: !3811)
!3837 = !DILocation(line: 745, column: 2, scope: !3811)
!3838 = distinct !DISubprogram(name: "pping_xdp_ingress", scope: !694, file: !694, line: 750, type: !3839, scopeLine: 751, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !3850)
!3839 = !DISubroutineType(types: !3840)
!3840 = !{!312, !3841}
!3841 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3842, size: 64)
!3842 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "xdp_md", file: !697, line: 4374, size: 192, elements: !3843)
!3843 = !{!3844, !3845, !3846, !3847, !3848, !3849}
!3844 = !DIDerivedType(tag: DW_TAG_member, name: "data", scope: !3842, file: !697, line: 4375, baseType: !195, size: 32)
!3845 = !DIDerivedType(tag: DW_TAG_member, name: "data_end", scope: !3842, file: !697, line: 4376, baseType: !195, size: 32, offset: 32)
!3846 = !DIDerivedType(tag: DW_TAG_member, name: "data_meta", scope: !3842, file: !697, line: 4377, baseType: !195, size: 32, offset: 64)
!3847 = !DIDerivedType(tag: DW_TAG_member, name: "ingress_ifindex", scope: !3842, file: !697, line: 4379, baseType: !195, size: 32, offset: 96)
!3848 = !DIDerivedType(tag: DW_TAG_member, name: "rx_queue_index", scope: !3842, file: !697, line: 4380, baseType: !195, size: 32, offset: 128)
!3849 = !DIDerivedType(tag: DW_TAG_member, name: "egress_ifindex", scope: !3842, file: !697, line: 4382, baseType: !195, size: 32, offset: 160)
!3850 = !{!3851, !3852}
!3851 = !DILocalVariable(name: "ctx", arg: 1, scope: !3838, file: !694, line: 750, type: !3841)
!3852 = !DILocalVariable(name: "pctx", scope: !3838, file: !694, line: 752, type: !3767)
!3853 = !DILocation(line: 750, column: 38, scope: !3838)
!3854 = !DILocation(line: 752, column: 2, scope: !3838)
!3855 = !DILocation(line: 752, column: 25, scope: !3838)
!3856 = !DILocation(line: 752, column: 32, scope: !3838)
!3857 = !DILocation(line: 753, column: 25, scope: !3838)
!3858 = !DILocation(line: 753, column: 30, scope: !3838)
!3859 = !{!3860, !958, i64 0}
!3860 = !{!"xdp_md", !958, i64 0, !958, i64 4, !958, i64 8, !958, i64 12, !958, i64 16, !958, i64 20}
!3861 = !DILocation(line: 753, column: 19, scope: !3838)
!3862 = !DILocation(line: 753, column: 11, scope: !3838)
!3863 = !DILocation(line: 754, column: 29, scope: !3838)
!3864 = !DILocation(line: 754, column: 34, scope: !3838)
!3865 = !{!3860, !958, i64 4}
!3866 = !DILocation(line: 754, column: 23, scope: !3838)
!3867 = !DILocation(line: 754, column: 15, scope: !3838)
!3868 = !DILocation(line: 756, column: 9, scope: !3838)
!3869 = !DILocation(line: 756, column: 23, scope: !3838)
!3870 = !DILocation(line: 755, column: 19, scope: !3838)
!3871 = !DILocation(line: 755, column: 35, scope: !3838)
!3872 = !DILocation(line: 755, column: 28, scope: !3838)
!3873 = !DILocation(line: 755, column: 14, scope: !3838)
!3874 = !DILocation(line: 757, column: 22, scope: !3838)
!3875 = !DILocation(line: 757, column: 27, scope: !3838)
!3876 = !{!3860, !958, i64 12}
!3877 = !DILocation(line: 761, column: 8, scope: !3838)
!3878 = !DILocation(line: 761, column: 2, scope: !3838)
!3879 = !DILocation(line: 764, column: 1, scope: !3838)
!3880 = !DILocation(line: 763, column: 2, scope: !3838)
!3881 = distinct !DISubprogram(name: "pping", scope: !694, file: !694, line: 692, type: !3882, scopeLine: 693, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !3885)
!3882 = !DISubroutineType(types: !3883)
!3883 = !{null, !141, !3884}
!3884 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3767, size: 64)
!3885 = !{!3886, !3887, !3888, !4042, !4043, !4044}
!3886 = !DILocalVariable(name: "ctx", arg: 1, scope: !3881, file: !694, line: 692, type: !141)
!3887 = !DILocalVariable(name: "pctx", arg: 2, scope: !3881, file: !694, line: 692, type: !3884)
!3888 = !DILocalVariable(name: "p_info", scope: !3881, file: !694, line: 694, type: !3889)
!3889 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "packet_info", file: !694, line: 62, size: 1024, elements: !3890)
!3890 = !{!3891, !3946, !4034, !4035, !4036, !4037, !4038, !4039, !4040, !4041}
!3891 = !DIDerivedType(tag: DW_TAG_member, scope: !3889, file: !694, line: 63, baseType: !3892, size: 64)
!3892 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !3889, file: !694, line: 63, size: 64, elements: !3893)
!3893 = !{!3894, !3922}
!3894 = !DIDerivedType(tag: DW_TAG_member, name: "iph", scope: !3892, file: !694, line: 64, baseType: !3895, size: 64)
!3895 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3896, size: 64)
!3896 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "iphdr", file: !3897, line: 87, size: 160, elements: !3898)
!3897 = !DIFile(filename: "/usr/include/linux/ip.h", directory: "", checksumkind: CSK_MD5, checksum: "042b09a58768855e3578a0a8eba49be7")
!3898 = !{!3899, !3900, !3901, !3902, !3903, !3904, !3905, !3906, !3907, !3909}
!3899 = !DIDerivedType(tag: DW_TAG_member, name: "ihl", scope: !3896, file: !3897, line: 89, baseType: !192, size: 4, flags: DIFlagBitField, extraData: i64 0)
!3900 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !3896, file: !3897, line: 90, baseType: !192, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!3901 = !DIDerivedType(tag: DW_TAG_member, name: "tos", scope: !3896, file: !3897, line: 97, baseType: !192, size: 8, offset: 8)
!3902 = !DIDerivedType(tag: DW_TAG_member, name: "tot_len", scope: !3896, file: !3897, line: 98, baseType: !742, size: 16, offset: 16)
!3903 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !3896, file: !3897, line: 99, baseType: !742, size: 16, offset: 32)
!3904 = !DIDerivedType(tag: DW_TAG_member, name: "frag_off", scope: !3896, file: !3897, line: 100, baseType: !742, size: 16, offset: 48)
!3905 = !DIDerivedType(tag: DW_TAG_member, name: "ttl", scope: !3896, file: !3897, line: 101, baseType: !192, size: 8, offset: 64)
!3906 = !DIDerivedType(tag: DW_TAG_member, name: "protocol", scope: !3896, file: !3897, line: 102, baseType: !192, size: 8, offset: 72)
!3907 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !3896, file: !3897, line: 103, baseType: !3908, size: 16, offset: 80)
!3908 = !DIDerivedType(tag: DW_TAG_typedef, name: "__sum16", file: !743, line: 31, baseType: !187)
!3909 = !DIDerivedType(tag: DW_TAG_member, scope: !3896, file: !3897, line: 104, baseType: !3910, size: 64, offset: 96)
!3910 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !3896, file: !3897, line: 104, size: 64, elements: !3911)
!3911 = !{!3912, !3917}
!3912 = !DIDerivedType(tag: DW_TAG_member, scope: !3910, file: !3897, line: 104, baseType: !3913, size: 64)
!3913 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !3910, file: !3897, line: 104, size: 64, elements: !3914)
!3914 = !{!3915, !3916}
!3915 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !3913, file: !3897, line: 104, baseType: !746, size: 32)
!3916 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !3913, file: !3897, line: 104, baseType: !746, size: 32, offset: 32)
!3917 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !3910, file: !3897, line: 104, baseType: !3918, size: 64)
!3918 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !3910, file: !3897, line: 104, size: 64, elements: !3919)
!3919 = !{!3920, !3921}
!3920 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !3918, file: !3897, line: 104, baseType: !746, size: 32)
!3921 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !3918, file: !3897, line: 104, baseType: !746, size: 32, offset: 32)
!3922 = !DIDerivedType(tag: DW_TAG_member, name: "ip6h", scope: !3892, file: !694, line: 65, baseType: !3923, size: 64)
!3923 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3924, size: 64)
!3924 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6hdr", file: !3925, line: 118, size: 320, elements: !3926)
!3925 = !DIFile(filename: "/usr/include/linux/ipv6.h", directory: "", checksumkind: CSK_MD5, checksum: "9926d49458ea1e0cc4651362e733e03e")
!3926 = !{!3927, !3928, !3929, !3930, !3931, !3932, !3933}
!3927 = !DIDerivedType(tag: DW_TAG_member, name: "priority", scope: !3924, file: !3925, line: 120, baseType: !192, size: 4, flags: DIFlagBitField, extraData: i64 0)
!3928 = !DIDerivedType(tag: DW_TAG_member, name: "version", scope: !3924, file: !3925, line: 121, baseType: !192, size: 4, offset: 4, flags: DIFlagBitField, extraData: i64 0)
!3929 = !DIDerivedType(tag: DW_TAG_member, name: "flow_lbl", scope: !3924, file: !3925, line: 128, baseType: !226, size: 24, offset: 8)
!3930 = !DIDerivedType(tag: DW_TAG_member, name: "payload_len", scope: !3924, file: !3925, line: 130, baseType: !742, size: 16, offset: 32)
!3931 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !3924, file: !3925, line: 131, baseType: !192, size: 8, offset: 48)
!3932 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !3924, file: !3925, line: 132, baseType: !192, size: 8, offset: 56)
!3933 = !DIDerivedType(tag: DW_TAG_member, scope: !3924, file: !3925, line: 134, baseType: !3934, size: 256, offset: 64)
!3934 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !3924, file: !3925, line: 134, size: 256, elements: !3935)
!3935 = !{!3936, !3941}
!3936 = !DIDerivedType(tag: DW_TAG_member, scope: !3934, file: !3925, line: 134, baseType: !3937, size: 256)
!3937 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !3934, file: !3925, line: 134, size: 256, elements: !3938)
!3938 = !{!3939, !3940}
!3939 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !3937, file: !3925, line: 134, baseType: !732, size: 128)
!3940 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !3937, file: !3925, line: 134, baseType: !732, size: 128, offset: 128)
!3941 = !DIDerivedType(tag: DW_TAG_member, name: "addrs", scope: !3934, file: !3925, line: 134, baseType: !3942, size: 256)
!3942 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !3934, file: !3925, line: 134, size: 256, elements: !3943)
!3943 = !{!3944, !3945}
!3944 = !DIDerivedType(tag: DW_TAG_member, name: "saddr", scope: !3942, file: !3925, line: 134, baseType: !732, size: 128)
!3945 = !DIDerivedType(tag: DW_TAG_member, name: "daddr", scope: !3942, file: !3925, line: 134, baseType: !732, size: 128, offset: 128)
!3946 = !DIDerivedType(tag: DW_TAG_member, scope: !3889, file: !694, line: 67, baseType: !3947, size: 64, offset: 64)
!3947 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !3889, file: !694, line: 67, size: 64, elements: !3948)
!3948 = !{!3949, !3973, !4012}
!3949 = !DIDerivedType(tag: DW_TAG_member, name: "icmph", scope: !3947, file: !694, line: 68, baseType: !3950, size: 64)
!3950 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3951, size: 64)
!3951 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmphdr", file: !3952, line: 89, size: 64, elements: !3953)
!3952 = !DIFile(filename: "/usr/include/linux/icmp.h", directory: "", checksumkind: CSK_MD5, checksum: "a505632898dce546638b3344627d334b")
!3953 = !{!3954, !3955, !3956, !3957}
!3954 = !DIDerivedType(tag: DW_TAG_member, name: "type", scope: !3951, file: !3952, line: 90, baseType: !192, size: 8)
!3955 = !DIDerivedType(tag: DW_TAG_member, name: "code", scope: !3951, file: !3952, line: 91, baseType: !192, size: 8, offset: 8)
!3956 = !DIDerivedType(tag: DW_TAG_member, name: "checksum", scope: !3951, file: !3952, line: 92, baseType: !3908, size: 16, offset: 16)
!3957 = !DIDerivedType(tag: DW_TAG_member, name: "un", scope: !3951, file: !3952, line: 104, baseType: !3958, size: 32, offset: 32)
!3958 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !3951, file: !3952, line: 93, size: 32, elements: !3959)
!3959 = !{!3960, !3965, !3966, !3971}
!3960 = !DIDerivedType(tag: DW_TAG_member, name: "echo", scope: !3958, file: !3952, line: 97, baseType: !3961, size: 32)
!3961 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !3958, file: !3952, line: 94, size: 32, elements: !3962)
!3962 = !{!3963, !3964}
!3963 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !3961, file: !3952, line: 95, baseType: !742, size: 16)
!3964 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !3961, file: !3952, line: 96, baseType: !742, size: 16, offset: 16)
!3965 = !DIDerivedType(tag: DW_TAG_member, name: "gateway", scope: !3958, file: !3952, line: 98, baseType: !746, size: 32)
!3966 = !DIDerivedType(tag: DW_TAG_member, name: "frag", scope: !3958, file: !3952, line: 102, baseType: !3967, size: 32)
!3967 = distinct !DICompositeType(tag: DW_TAG_structure_type, scope: !3958, file: !3952, line: 99, size: 32, elements: !3968)
!3968 = !{!3969, !3970}
!3969 = !DIDerivedType(tag: DW_TAG_member, name: "__unused", scope: !3967, file: !3952, line: 100, baseType: !742, size: 16)
!3970 = !DIDerivedType(tag: DW_TAG_member, name: "mtu", scope: !3967, file: !3952, line: 101, baseType: !742, size: 16, offset: 16)
!3971 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !3958, file: !3952, line: 103, baseType: !3972, size: 32)
!3972 = !DICompositeType(tag: DW_TAG_array_type, baseType: !192, size: 32, elements: !10)
!3973 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6h", scope: !3947, file: !694, line: 69, baseType: !3974, size: 64)
!3974 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3975, size: 64)
!3975 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmp6hdr", file: !3976, line: 8, size: 64, elements: !3977)
!3976 = !DIFile(filename: "/usr/include/linux/icmpv6.h", directory: "", checksumkind: CSK_MD5, checksum: "0310ca5584e6f44f6eea6cf040ee84b9")
!3977 = !{!3978, !3979, !3980, !3981}
!3978 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_type", scope: !3975, file: !3976, line: 10, baseType: !192, size: 8)
!3979 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_code", scope: !3975, file: !3976, line: 11, baseType: !192, size: 8, offset: 8)
!3980 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_cksum", scope: !3975, file: !3976, line: 12, baseType: !3908, size: 16, offset: 16)
!3981 = !DIDerivedType(tag: DW_TAG_member, name: "icmp6_dataun", scope: !3975, file: !3976, line: 63, baseType: !3982, size: 32, offset: 32)
!3982 = distinct !DICompositeType(tag: DW_TAG_union_type, scope: !3975, file: !3976, line: 15, size: 32, elements: !3983)
!3983 = !{!3984, !3986, !3988, !3989, !3994, !4002}
!3984 = !DIDerivedType(tag: DW_TAG_member, name: "un_data32", scope: !3982, file: !3976, line: 16, baseType: !3985, size: 32)
!3985 = !DICompositeType(tag: DW_TAG_array_type, baseType: !746, size: 32, elements: !340)
!3986 = !DIDerivedType(tag: DW_TAG_member, name: "un_data16", scope: !3982, file: !3976, line: 17, baseType: !3987, size: 32)
!3987 = !DICompositeType(tag: DW_TAG_array_type, baseType: !742, size: 32, elements: !481)
!3988 = !DIDerivedType(tag: DW_TAG_member, name: "un_data8", scope: !3982, file: !3976, line: 18, baseType: !3972, size: 32)
!3989 = !DIDerivedType(tag: DW_TAG_member, name: "u_echo", scope: !3982, file: !3976, line: 23, baseType: !3990, size: 32)
!3990 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_echo", file: !3976, line: 20, size: 32, elements: !3991)
!3991 = !{!3992, !3993}
!3992 = !DIDerivedType(tag: DW_TAG_member, name: "identifier", scope: !3990, file: !3976, line: 21, baseType: !742, size: 16)
!3993 = !DIDerivedType(tag: DW_TAG_member, name: "sequence", scope: !3990, file: !3976, line: 22, baseType: !742, size: 16, offset: 16)
!3994 = !DIDerivedType(tag: DW_TAG_member, name: "u_nd_advt", scope: !3982, file: !3976, line: 40, baseType: !3995, size: 32)
!3995 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_nd_advt", file: !3976, line: 25, size: 32, elements: !3996)
!3996 = !{!3997, !3998, !3999, !4000, !4001}
!3997 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !3995, file: !3976, line: 27, baseType: !195, size: 5, flags: DIFlagBitField, extraData: i64 0)
!3998 = !DIDerivedType(tag: DW_TAG_member, name: "override", scope: !3995, file: !3976, line: 28, baseType: !195, size: 1, offset: 5, flags: DIFlagBitField, extraData: i64 0)
!3999 = !DIDerivedType(tag: DW_TAG_member, name: "solicited", scope: !3995, file: !3976, line: 29, baseType: !195, size: 1, offset: 6, flags: DIFlagBitField, extraData: i64 0)
!4000 = !DIDerivedType(tag: DW_TAG_member, name: "router", scope: !3995, file: !3976, line: 30, baseType: !195, size: 1, offset: 7, flags: DIFlagBitField, extraData: i64 0)
!4001 = !DIDerivedType(tag: DW_TAG_member, name: "reserved2", scope: !3995, file: !3976, line: 31, baseType: !195, size: 24, offset: 8, flags: DIFlagBitField, extraData: i64 0)
!4002 = !DIDerivedType(tag: DW_TAG_member, name: "u_nd_ra", scope: !3982, file: !3976, line: 61, baseType: !4003, size: 32)
!4003 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "icmpv6_nd_ra", file: !3976, line: 42, size: 32, elements: !4004)
!4004 = !{!4005, !4006, !4007, !4008, !4009, !4010, !4011}
!4005 = !DIDerivedType(tag: DW_TAG_member, name: "hop_limit", scope: !4003, file: !3976, line: 43, baseType: !192, size: 8)
!4006 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !4003, file: !3976, line: 45, baseType: !192, size: 3, offset: 8, flags: DIFlagBitField, extraData: i64 8)
!4007 = !DIDerivedType(tag: DW_TAG_member, name: "router_pref", scope: !4003, file: !3976, line: 46, baseType: !192, size: 2, offset: 11, flags: DIFlagBitField, extraData: i64 8)
!4008 = !DIDerivedType(tag: DW_TAG_member, name: "home_agent", scope: !4003, file: !3976, line: 47, baseType: !192, size: 1, offset: 13, flags: DIFlagBitField, extraData: i64 8)
!4009 = !DIDerivedType(tag: DW_TAG_member, name: "other", scope: !4003, file: !3976, line: 48, baseType: !192, size: 1, offset: 14, flags: DIFlagBitField, extraData: i64 8)
!4010 = !DIDerivedType(tag: DW_TAG_member, name: "managed", scope: !4003, file: !3976, line: 49, baseType: !192, size: 1, offset: 15, flags: DIFlagBitField, extraData: i64 8)
!4011 = !DIDerivedType(tag: DW_TAG_member, name: "rt_lifetime", scope: !4003, file: !3976, line: 60, baseType: !742, size: 16, offset: 16)
!4012 = !DIDerivedType(tag: DW_TAG_member, name: "tcph", scope: !3947, file: !694, line: 70, baseType: !4013, size: 64)
!4013 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4014, size: 64)
!4014 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "tcphdr", file: !4015, line: 25, size: 160, elements: !4016)
!4015 = !DIFile(filename: "/usr/include/linux/tcp.h", directory: "", checksumkind: CSK_MD5, checksum: "8d74bf2133e7b3dab885994b9916aa13")
!4016 = !{!4017, !4018, !4019, !4020, !4021, !4022, !4023, !4024, !4025, !4026, !4027, !4028, !4029, !4030, !4031, !4032, !4033}
!4017 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !4014, file: !4015, line: 26, baseType: !742, size: 16)
!4018 = !DIDerivedType(tag: DW_TAG_member, name: "dest", scope: !4014, file: !4015, line: 27, baseType: !742, size: 16, offset: 16)
!4019 = !DIDerivedType(tag: DW_TAG_member, name: "seq", scope: !4014, file: !4015, line: 28, baseType: !746, size: 32, offset: 32)
!4020 = !DIDerivedType(tag: DW_TAG_member, name: "ack_seq", scope: !4014, file: !4015, line: 29, baseType: !746, size: 32, offset: 64)
!4021 = !DIDerivedType(tag: DW_TAG_member, name: "res1", scope: !4014, file: !4015, line: 31, baseType: !187, size: 4, offset: 96, flags: DIFlagBitField, extraData: i64 96)
!4022 = !DIDerivedType(tag: DW_TAG_member, name: "doff", scope: !4014, file: !4015, line: 32, baseType: !187, size: 4, offset: 100, flags: DIFlagBitField, extraData: i64 96)
!4023 = !DIDerivedType(tag: DW_TAG_member, name: "fin", scope: !4014, file: !4015, line: 33, baseType: !187, size: 1, offset: 104, flags: DIFlagBitField, extraData: i64 96)
!4024 = !DIDerivedType(tag: DW_TAG_member, name: "syn", scope: !4014, file: !4015, line: 34, baseType: !187, size: 1, offset: 105, flags: DIFlagBitField, extraData: i64 96)
!4025 = !DIDerivedType(tag: DW_TAG_member, name: "rst", scope: !4014, file: !4015, line: 35, baseType: !187, size: 1, offset: 106, flags: DIFlagBitField, extraData: i64 96)
!4026 = !DIDerivedType(tag: DW_TAG_member, name: "psh", scope: !4014, file: !4015, line: 36, baseType: !187, size: 1, offset: 107, flags: DIFlagBitField, extraData: i64 96)
!4027 = !DIDerivedType(tag: DW_TAG_member, name: "ack", scope: !4014, file: !4015, line: 37, baseType: !187, size: 1, offset: 108, flags: DIFlagBitField, extraData: i64 96)
!4028 = !DIDerivedType(tag: DW_TAG_member, name: "urg", scope: !4014, file: !4015, line: 38, baseType: !187, size: 1, offset: 109, flags: DIFlagBitField, extraData: i64 96)
!4029 = !DIDerivedType(tag: DW_TAG_member, name: "ece", scope: !4014, file: !4015, line: 39, baseType: !187, size: 1, offset: 110, flags: DIFlagBitField, extraData: i64 96)
!4030 = !DIDerivedType(tag: DW_TAG_member, name: "cwr", scope: !4014, file: !4015, line: 40, baseType: !187, size: 1, offset: 111, flags: DIFlagBitField, extraData: i64 96)
!4031 = !DIDerivedType(tag: DW_TAG_member, name: "window", scope: !4014, file: !4015, line: 55, baseType: !742, size: 16, offset: 112)
!4032 = !DIDerivedType(tag: DW_TAG_member, name: "check", scope: !4014, file: !4015, line: 56, baseType: !3908, size: 16, offset: 128)
!4033 = !DIDerivedType(tag: DW_TAG_member, name: "urg_ptr", scope: !4014, file: !4015, line: 57, baseType: !742, size: 16, offset: 144)
!4034 = !DIDerivedType(tag: DW_TAG_member, name: "time", scope: !3889, file: !694, line: 72, baseType: !143, size: 64, offset: 128)
!4035 = !DIDerivedType(tag: DW_TAG_member, name: "payload", scope: !3889, file: !694, line: 73, baseType: !195, size: 32, offset: 192)
!4036 = !DIDerivedType(tag: DW_TAG_member, name: "pid", scope: !3889, file: !694, line: 74, baseType: !758, size: 384, offset: 224)
!4037 = !DIDerivedType(tag: DW_TAG_member, name: "reply_pid", scope: !3889, file: !694, line: 75, baseType: !758, size: 384, offset: 608)
!4038 = !DIDerivedType(tag: DW_TAG_member, name: "pid_valid", scope: !3889, file: !694, line: 76, baseType: !203, size: 8, offset: 992)
!4039 = !DIDerivedType(tag: DW_TAG_member, name: "reply_pid_valid", scope: !3889, file: !694, line: 77, baseType: !203, size: 8, offset: 1000)
!4040 = !DIDerivedType(tag: DW_TAG_member, name: "event_type", scope: !3889, file: !694, line: 78, baseType: !44, size: 8, offset: 1008)
!4041 = !DIDerivedType(tag: DW_TAG_member, name: "event_reason", scope: !3889, file: !694, line: 79, baseType: !52, size: 8, offset: 1016)
!4042 = !DILocalVariable(name: "flow", scope: !3881, file: !694, line: 695, type: !788)
!4043 = !DILocalVariable(name: "rev_flow", scope: !3881, file: !694, line: 695, type: !788)
!4044 = !DILocalVariable(name: "new_flow", scope: !3881, file: !694, line: 696, type: !203)
!4045 = !DILocation(line: 692, column: 25, scope: !3881)
!4046 = !DILocation(line: 692, column: 54, scope: !3881)
!4047 = !DILocation(line: 694, column: 2, scope: !3881)
!4048 = !DILocation(line: 694, column: 21, scope: !3881)
!4049 = !DILocation(line: 695, column: 2, scope: !3881)
!4050 = !DILocation(line: 695, column: 21, scope: !3881)
!4051 = !DILocation(line: 695, column: 28, scope: !3881)
!4052 = !DILocation(line: 696, column: 2, scope: !3881)
!4053 = !DILocation(line: 696, column: 7, scope: !3881)
!4054 = !DILocation(line: 698, column: 31, scope: !4055)
!4055 = distinct !DILexicalBlock(scope: !3881, file: !694, line: 698, column: 7)
!4056 = !DILocation(line: 698, column: 7, scope: !4055)
!4057 = !DILocation(line: 698, column: 46, scope: !4055)
!4058 = !DILocation(line: 698, column: 7, scope: !3881)
!4059 = !DILocation(line: 699, column: 3, scope: !4055)
!4060 = !DILocation(line: 701, column: 21, scope: !3881)
!4061 = !DILocation(line: 701, column: 9, scope: !3881)
!4062 = !DILocation(line: 701, column: 7, scope: !3881)
!4063 = !DILocation(line: 702, column: 25, scope: !3881)
!4064 = !DILocation(line: 702, column: 31, scope: !3881)
!4065 = !DILocation(line: 702, column: 36, scope: !3881)
!4066 = !DILocation(line: 702, column: 51, scope: !3881)
!4067 = !DILocation(line: 702, column: 2, scope: !3881)
!4068 = !DILocation(line: 704, column: 29, scope: !3881)
!4069 = !DILocation(line: 704, column: 13, scope: !3881)
!4070 = !DILocation(line: 704, column: 11, scope: !3881)
!4071 = !DILocation(line: 705, column: 21, scope: !3881)
!4072 = !DILocation(line: 705, column: 31, scope: !3881)
!4073 = !DILocation(line: 705, column: 36, scope: !3881)
!4074 = !DILocation(line: 705, column: 2, scope: !3881)
!4075 = !DILocation(line: 707, column: 22, scope: !3881)
!4076 = !DILocation(line: 707, column: 36, scope: !3881)
!4077 = !DILocation(line: 707, column: 42, scope: !3881)
!4078 = !DILocation(line: 707, column: 2, scope: !3881)
!4079 = !DILocation(line: 709, column: 1, scope: !3881)
!4080 = distinct !DISubprogram(name: "parse_packet_identifier", scope: !694, file: !694, line: 318, type: !4081, scopeLine: 320, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !4084)
!4081 = !DISubroutineType(types: !4082)
!4082 = !{!312, !3884, !4083}
!4083 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3889, size: 64)
!4084 = !{!4085, !4086, !4087, !4088, !4089}
!4085 = !DILocalVariable(name: "pctx", arg: 1, scope: !4080, file: !694, line: 318, type: !3884)
!4086 = !DILocalVariable(name: "p_info", arg: 2, scope: !4080, file: !694, line: 319, type: !4083)
!4087 = !DILocalVariable(name: "proto", scope: !4080, file: !694, line: 321, type: !312)
!4088 = !DILocalVariable(name: "err", scope: !4080, file: !694, line: 321, type: !312)
!4089 = !DILocalVariable(name: "eth", scope: !4080, file: !694, line: 322, type: !4090)
!4090 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4091, size: 64)
!4091 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ethhdr", file: !4092, line: 168, size: 112, elements: !4093)
!4092 = !DIFile(filename: "/usr/include/linux/if_ether.h", directory: "", checksumkind: CSK_MD5, checksum: "ab0320da726e75d904811ce344979934")
!4093 = !{!4094, !4096, !4097}
!4094 = !DIDerivedType(tag: DW_TAG_member, name: "h_dest", scope: !4091, file: !4092, line: 169, baseType: !4095, size: 48)
!4095 = !DICompositeType(tag: DW_TAG_array_type, baseType: !46, size: 48, elements: !27)
!4096 = !DIDerivedType(tag: DW_TAG_member, name: "h_source", scope: !4091, file: !4092, line: 170, baseType: !4095, size: 48, offset: 48)
!4097 = !DIDerivedType(tag: DW_TAG_member, name: "h_proto", scope: !4091, file: !4092, line: 171, baseType: !742, size: 16, offset: 96)
!4098 = !DILocation(line: 318, column: 60, scope: !4080)
!4099 = !DILocation(line: 319, column: 28, scope: !4080)
!4100 = !DILocation(line: 321, column: 2, scope: !4080)
!4101 = !DILocation(line: 321, column: 6, scope: !4080)
!4102 = !DILocation(line: 321, column: 13, scope: !4080)
!4103 = !DILocation(line: 322, column: 2, scope: !4080)
!4104 = !DILocation(line: 322, column: 17, scope: !4080)
!4105 = !DILocation(line: 324, column: 17, scope: !4080)
!4106 = !DILocation(line: 324, column: 2, scope: !4080)
!4107 = !DILocation(line: 324, column: 10, scope: !4080)
!4108 = !DILocation(line: 324, column: 15, scope: !4080)
!4109 = !{!4110, !956, i64 16}
!4110 = !{!"packet_info", !945, i64 0, !945, i64 8, !956, i64 16, !958, i64 24, !4111, i64 28, !4111, i64 76, !957, i64 124, !957, i64 125, !945, i64 126, !945, i64 127}
!4111 = !{!"packet_id", !1759, i64 0, !958, i64 44}
!4112 = !DILocation(line: 325, column: 24, scope: !4080)
!4113 = !DILocation(line: 325, column: 30, scope: !4080)
!4114 = !DILocation(line: 325, column: 34, scope: !4080)
!4115 = !DILocation(line: 325, column: 40, scope: !4080)
!4116 = !DILocation(line: 325, column: 10, scope: !4080)
!4117 = !DILocation(line: 325, column: 8, scope: !4080)
!4118 = !DILocation(line: 328, column: 6, scope: !4119)
!4119 = distinct !DILexicalBlock(scope: !4080, file: !694, line: 328, column: 6)
!4120 = !DILocation(line: 328, column: 12, scope: !4119)
!4121 = !DILocation(line: 328, column: 6, scope: !4080)
!4122 = !DILocation(line: 329, column: 3, scope: !4123)
!4123 = distinct !DILexicalBlock(scope: !4119, file: !694, line: 328, column: 36)
!4124 = !DILocation(line: 329, column: 11, scope: !4123)
!4125 = !DILocation(line: 329, column: 15, scope: !4123)
!4126 = !DILocation(line: 329, column: 20, scope: !4123)
!4127 = !DILocation(line: 329, column: 24, scope: !4123)
!4128 = !{!4110, !945, i64 70}
!4129 = !DILocation(line: 331, column: 17, scope: !4123)
!4130 = !DILocation(line: 331, column: 23, scope: !4123)
!4131 = !DILocation(line: 331, column: 27, scope: !4123)
!4132 = !DILocation(line: 331, column: 33, scope: !4123)
!4133 = !DILocation(line: 331, column: 44, scope: !4123)
!4134 = !DILocation(line: 331, column: 52, scope: !4123)
!4135 = !DILocation(line: 331, column: 4, scope: !4123)
!4136 = !DILocation(line: 330, column: 3, scope: !4123)
!4137 = !DILocation(line: 330, column: 11, scope: !4123)
!4138 = !DILocation(line: 330, column: 15, scope: !4123)
!4139 = !DILocation(line: 330, column: 20, scope: !4123)
!4140 = !DILocation(line: 330, column: 26, scope: !4123)
!4141 = !{!4110, !1762, i64 68}
!4142 = !DILocation(line: 332, column: 2, scope: !4123)
!4143 = !DILocation(line: 332, column: 13, scope: !4144)
!4144 = distinct !DILexicalBlock(scope: !4119, file: !694, line: 332, column: 13)
!4145 = !DILocation(line: 332, column: 19, scope: !4144)
!4146 = !DILocation(line: 332, column: 13, scope: !4119)
!4147 = !DILocation(line: 333, column: 3, scope: !4148)
!4148 = distinct !DILexicalBlock(scope: !4144, file: !694, line: 332, column: 45)
!4149 = !DILocation(line: 333, column: 11, scope: !4148)
!4150 = !DILocation(line: 333, column: 15, scope: !4148)
!4151 = !DILocation(line: 333, column: 20, scope: !4148)
!4152 = !DILocation(line: 333, column: 24, scope: !4148)
!4153 = !DILocation(line: 335, column: 18, scope: !4148)
!4154 = !DILocation(line: 335, column: 24, scope: !4148)
!4155 = !DILocation(line: 335, column: 28, scope: !4148)
!4156 = !DILocation(line: 335, column: 34, scope: !4148)
!4157 = !DILocation(line: 335, column: 45, scope: !4148)
!4158 = !DILocation(line: 335, column: 53, scope: !4148)
!4159 = !DILocation(line: 335, column: 4, scope: !4148)
!4160 = !DILocation(line: 334, column: 3, scope: !4148)
!4161 = !DILocation(line: 334, column: 11, scope: !4148)
!4162 = !DILocation(line: 334, column: 15, scope: !4148)
!4163 = !DILocation(line: 334, column: 20, scope: !4148)
!4164 = !DILocation(line: 334, column: 26, scope: !4148)
!4165 = !DILocation(line: 336, column: 2, scope: !4148)
!4166 = !DILocation(line: 337, column: 3, scope: !4167)
!4167 = distinct !DILexicalBlock(scope: !4144, file: !694, line: 336, column: 9)
!4168 = !DILocation(line: 341, column: 13, scope: !4169)
!4169 = distinct !DILexicalBlock(scope: !4080, file: !694, line: 341, column: 6)
!4170 = !DILocation(line: 341, column: 23, scope: !4169)
!4171 = !DILocation(line: 341, column: 26, scope: !4169)
!4172 = !DILocation(line: 341, column: 34, scope: !4169)
!4173 = !DILocation(line: 341, column: 38, scope: !4169)
!4174 = !DILocation(line: 341, column: 43, scope: !4169)
!4175 = !DILocation(line: 341, column: 49, scope: !4169)
!4176 = !DILocation(line: 341, column: 6, scope: !4080)
!4177 = !DILocation(line: 342, column: 30, scope: !4169)
!4178 = !DILocation(line: 342, column: 36, scope: !4169)
!4179 = !DILocation(line: 342, column: 9, scope: !4169)
!4180 = !DILocation(line: 342, column: 7, scope: !4169)
!4181 = !DILocation(line: 342, column: 3, scope: !4169)
!4182 = !DILocation(line: 343, column: 18, scope: !4183)
!4183 = distinct !DILexicalBlock(scope: !4169, file: !694, line: 343, column: 11)
!4184 = !DILocation(line: 343, column: 29, scope: !4183)
!4185 = !DILocation(line: 344, column: 4, scope: !4183)
!4186 = !DILocation(line: 344, column: 12, scope: !4183)
!4187 = !DILocation(line: 344, column: 16, scope: !4183)
!4188 = !DILocation(line: 344, column: 21, scope: !4183)
!4189 = !DILocation(line: 344, column: 27, scope: !4183)
!4190 = !DILocation(line: 344, column: 45, scope: !4183)
!4191 = !DILocation(line: 345, column: 4, scope: !4183)
!4192 = !DILocation(line: 345, column: 12, scope: !4183)
!4193 = !DILocation(line: 345, column: 16, scope: !4183)
!4194 = !DILocation(line: 345, column: 21, scope: !4183)
!4195 = !DILocation(line: 345, column: 25, scope: !4183)
!4196 = !DILocation(line: 343, column: 11, scope: !4169)
!4197 = !DILocation(line: 346, column: 32, scope: !4183)
!4198 = !DILocation(line: 346, column: 38, scope: !4183)
!4199 = !DILocation(line: 346, column: 9, scope: !4183)
!4200 = !DILocation(line: 346, column: 7, scope: !4183)
!4201 = !DILocation(line: 346, column: 3, scope: !4183)
!4202 = !DILocation(line: 347, column: 18, scope: !4203)
!4203 = distinct !DILexicalBlock(scope: !4183, file: !694, line: 347, column: 11)
!4204 = !DILocation(line: 347, column: 29, scope: !4203)
!4205 = !DILocation(line: 347, column: 32, scope: !4203)
!4206 = !DILocation(line: 347, column: 40, scope: !4203)
!4207 = !DILocation(line: 347, column: 44, scope: !4203)
!4208 = !DILocation(line: 347, column: 49, scope: !4203)
!4209 = !DILocation(line: 347, column: 55, scope: !4203)
!4210 = !DILocation(line: 347, column: 71, scope: !4203)
!4211 = !DILocation(line: 348, column: 4, scope: !4203)
!4212 = !DILocation(line: 348, column: 12, scope: !4203)
!4213 = !DILocation(line: 348, column: 16, scope: !4203)
!4214 = !DILocation(line: 348, column: 21, scope: !4203)
!4215 = !DILocation(line: 348, column: 25, scope: !4203)
!4216 = !DILocation(line: 347, column: 11, scope: !4183)
!4217 = !DILocation(line: 349, column: 31, scope: !4203)
!4218 = !DILocation(line: 349, column: 37, scope: !4203)
!4219 = !DILocation(line: 349, column: 9, scope: !4203)
!4220 = !DILocation(line: 349, column: 7, scope: !4203)
!4221 = !DILocation(line: 349, column: 3, scope: !4203)
!4222 = !DILocation(line: 351, column: 3, scope: !4203)
!4223 = !DILocation(line: 352, column: 6, scope: !4224)
!4224 = distinct !DILexicalBlock(scope: !4080, file: !694, line: 352, column: 6)
!4225 = !DILocation(line: 352, column: 6, scope: !4080)
!4226 = !DILocation(line: 353, column: 3, scope: !4224)
!4227 = !DILocation(line: 356, column: 6, scope: !4228)
!4228 = distinct !DILexicalBlock(scope: !4080, file: !694, line: 356, column: 6)
!4229 = !DILocation(line: 356, column: 14, scope: !4228)
!4230 = !DILocation(line: 356, column: 18, scope: !4228)
!4231 = !DILocation(line: 356, column: 23, scope: !4228)
!4232 = !DILocation(line: 356, column: 27, scope: !4228)
!4233 = !DILocation(line: 356, column: 6, scope: !4080)
!4234 = !DILocation(line: 357, column: 21, scope: !4235)
!4235 = distinct !DILexicalBlock(scope: !4228, file: !694, line: 356, column: 39)
!4236 = !DILocation(line: 357, column: 29, scope: !4235)
!4237 = !DILocation(line: 357, column: 33, scope: !4235)
!4238 = !DILocation(line: 357, column: 38, scope: !4235)
!4239 = !DILocation(line: 357, column: 44, scope: !4235)
!4240 = !DILocation(line: 358, column: 6, scope: !4235)
!4241 = !DILocation(line: 358, column: 14, scope: !4235)
!4242 = !DILocation(line: 358, column: 19, scope: !4235)
!4243 = !DILocation(line: 357, column: 3, scope: !4235)
!4244 = !DILocation(line: 359, column: 21, scope: !4235)
!4245 = !DILocation(line: 359, column: 29, scope: !4235)
!4246 = !DILocation(line: 359, column: 33, scope: !4235)
!4247 = !DILocation(line: 359, column: 38, scope: !4235)
!4248 = !DILocation(line: 359, column: 44, scope: !4235)
!4249 = !DILocation(line: 360, column: 6, scope: !4235)
!4250 = !DILocation(line: 360, column: 14, scope: !4235)
!4251 = !DILocation(line: 360, column: 19, scope: !4235)
!4252 = !DILocation(line: 359, column: 3, scope: !4235)
!4253 = !DILocation(line: 361, column: 2, scope: !4235)
!4254 = !DILocation(line: 362, column: 3, scope: !4255)
!4255 = distinct !DILexicalBlock(scope: !4228, file: !694, line: 361, column: 9)
!4256 = !DILocation(line: 362, column: 11, scope: !4255)
!4257 = !DILocation(line: 362, column: 15, scope: !4255)
!4258 = !DILocation(line: 362, column: 20, scope: !4255)
!4259 = !DILocation(line: 362, column: 26, scope: !4255)
!4260 = !DILocation(line: 362, column: 31, scope: !4255)
!4261 = !DILocation(line: 362, column: 39, scope: !4255)
!4262 = !DILocation(line: 362, column: 45, scope: !4255)
!4263 = !{i64 0, i64 16, !981, i64 0, i64 16, !981, i64 0, i64 16, !981}
!4264 = !DILocation(line: 363, column: 3, scope: !4255)
!4265 = !DILocation(line: 363, column: 11, scope: !4255)
!4266 = !DILocation(line: 363, column: 15, scope: !4255)
!4267 = !DILocation(line: 363, column: 20, scope: !4255)
!4268 = !DILocation(line: 363, column: 26, scope: !4255)
!4269 = !DILocation(line: 363, column: 31, scope: !4255)
!4270 = !DILocation(line: 363, column: 39, scope: !4255)
!4271 = !DILocation(line: 363, column: 45, scope: !4255)
!4272 = !DILocation(line: 366, column: 16, scope: !4080)
!4273 = !DILocation(line: 366, column: 24, scope: !4080)
!4274 = !DILocation(line: 366, column: 34, scope: !4080)
!4275 = !DILocation(line: 366, column: 41, scope: !4080)
!4276 = !DILocation(line: 366, column: 49, scope: !4080)
!4277 = !DILocation(line: 366, column: 53, scope: !4080)
!4278 = !DILocation(line: 366, column: 2, scope: !4080)
!4279 = !DILocation(line: 367, column: 42, scope: !4080)
!4280 = !DILocation(line: 367, column: 20, scope: !4080)
!4281 = !DILocation(line: 367, column: 2, scope: !4080)
!4282 = !DILocation(line: 367, column: 10, scope: !4080)
!4283 = !DILocation(line: 367, column: 18, scope: !4080)
!4284 = !{!4110, !958, i64 24}
!4285 = !DILocation(line: 369, column: 2, scope: !4080)
!4286 = !DILocation(line: 370, column: 1, scope: !4080)
!4287 = distinct !DISubprogram(name: "update_flow", scope: !694, file: !694, line: 496, type: !4288, scopeLine: 498, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !4290)
!4288 = !DISubroutineType(types: !4289)
!4289 = !{!788, !141, !4083, !3089}
!4290 = !{!4291, !4292, !4293, !4294}
!4291 = !DILocalVariable(name: "ctx", arg: 1, scope: !4287, file: !694, line: 496, type: !141)
!4292 = !DILocalVariable(name: "p_info", arg: 2, scope: !4287, file: !694, line: 496, type: !4083)
!4293 = !DILocalVariable(name: "new_flow", arg: 3, scope: !4287, file: !694, line: 497, type: !3089)
!4294 = !DILocalVariable(name: "f_state", scope: !4287, file: !694, line: 499, type: !788)
!4295 = !DILocation(line: 496, column: 45, scope: !4287)
!4296 = !DILocation(line: 496, column: 70, scope: !4287)
!4297 = !DILocation(line: 497, column: 17, scope: !4287)
!4298 = !DILocation(line: 499, column: 2, scope: !4287)
!4299 = !DILocation(line: 499, column: 21, scope: !4287)
!4300 = !DILocation(line: 500, column: 3, scope: !4287)
!4301 = !DILocation(line: 500, column: 12, scope: !4287)
!4302 = !DILocation(line: 502, column: 12, scope: !4287)
!4303 = !DILocation(line: 502, column: 46, scope: !4287)
!4304 = !DILocation(line: 502, column: 54, scope: !4287)
!4305 = !DILocation(line: 502, column: 58, scope: !4287)
!4306 = !DILocation(line: 502, column: 10, scope: !4287)
!4307 = !DILocation(line: 505, column: 7, scope: !4308)
!4308 = distinct !DILexicalBlock(scope: !4287, file: !694, line: 505, column: 6)
!4309 = !DILocation(line: 505, column: 15, scope: !4308)
!4310 = !DILocation(line: 505, column: 18, scope: !4308)
!4311 = !DILocation(line: 505, column: 26, scope: !4308)
!4312 = !{!4110, !957, i64 124}
!4313 = !DILocation(line: 505, column: 36, scope: !4308)
!4314 = !DILocation(line: 506, column: 8, scope: !4308)
!4315 = !DILocation(line: 506, column: 16, scope: !4308)
!4316 = !{!4110, !945, i64 126}
!4317 = !DILocation(line: 506, column: 27, scope: !4308)
!4318 = !DILocation(line: 506, column: 49, scope: !4308)
!4319 = !DILocation(line: 507, column: 8, scope: !4308)
!4320 = !DILocation(line: 507, column: 16, scope: !4308)
!4321 = !DILocation(line: 507, column: 27, scope: !4308)
!4322 = !DILocation(line: 505, column: 6, scope: !4287)
!4323 = !DILocation(line: 508, column: 4, scope: !4324)
!4324 = distinct !DILexicalBlock(scope: !4308, file: !694, line: 507, column: 56)
!4325 = !DILocation(line: 508, column: 13, scope: !4324)
!4326 = !DILocation(line: 509, column: 25, scope: !4324)
!4327 = !DILocation(line: 509, column: 30, scope: !4324)
!4328 = !DILocation(line: 509, column: 13, scope: !4324)
!4329 = !DILocation(line: 509, column: 11, scope: !4324)
!4330 = !DILocation(line: 510, column: 2, scope: !4324)
!4331 = !DILocation(line: 512, column: 7, scope: !4332)
!4332 = distinct !DILexicalBlock(scope: !4287, file: !694, line: 512, column: 6)
!4333 = !DILocation(line: 512, column: 6, scope: !4287)
!4334 = !DILocation(line: 513, column: 3, scope: !4332)
!4335 = !DILocation(line: 516, column: 2, scope: !4287)
!4336 = !DILocation(line: 516, column: 11, scope: !4287)
!4337 = !DILocation(line: 516, column: 20, scope: !4287)
!4338 = !{!2890, !956, i64 24}
!4339 = !DILocation(line: 517, column: 25, scope: !4287)
!4340 = !DILocation(line: 517, column: 33, scope: !4287)
!4341 = !DILocation(line: 517, column: 2, scope: !4287)
!4342 = !DILocation(line: 517, column: 11, scope: !4287)
!4343 = !DILocation(line: 517, column: 22, scope: !4287)
!4344 = !{!2890, !956, i64 32}
!4345 = !DILocation(line: 519, column: 9, scope: !4287)
!4346 = !DILocation(line: 519, column: 2, scope: !4287)
!4347 = !DILocation(line: 520, column: 1, scope: !4287)
!4348 = distinct !DISubprogram(name: "pping_timestamp_packet", scope: !694, file: !694, line: 615, type: !4349, scopeLine: 618, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !4351)
!4349 = !DISubroutineType(types: !4350)
!4350 = !{null, !788, !141, !3884, !4083, !203}
!4351 = !{!4352, !4353, !4354, !4355, !4356}
!4352 = !DILocalVariable(name: "f_state", arg: 1, scope: !4348, file: !694, line: 615, type: !788)
!4353 = !DILocalVariable(name: "ctx", arg: 2, scope: !4348, file: !694, line: 615, type: !141)
!4354 = !DILocalVariable(name: "pctx", arg: 3, scope: !4348, file: !694, line: 616, type: !3884)
!4355 = !DILocalVariable(name: "p_info", arg: 4, scope: !4348, file: !694, line: 617, type: !4083)
!4356 = !DILocalVariable(name: "new_flow", arg: 5, scope: !4348, file: !694, line: 617, type: !203)
!4357 = !DILocation(line: 615, column: 55, scope: !4348)
!4358 = !DILocation(line: 615, column: 70, scope: !4348)
!4359 = !DILocation(line: 616, column: 32, scope: !4348)
!4360 = !DILocation(line: 617, column: 28, scope: !4348)
!4361 = !DILocation(line: 617, column: 41, scope: !4348)
!4362 = !DILocation(line: 619, column: 7, scope: !4363)
!4363 = distinct !DILexicalBlock(scope: !4348, file: !694, line: 619, column: 6)
!4364 = !DILocation(line: 619, column: 15, scope: !4363)
!4365 = !DILocation(line: 619, column: 19, scope: !4363)
!4366 = !DILocation(line: 619, column: 27, scope: !4363)
!4367 = !DILocation(line: 619, column: 6, scope: !4348)
!4368 = !DILocation(line: 620, column: 3, scope: !4363)
!4369 = !DILocation(line: 622, column: 13, scope: !4370)
!4370 = distinct !DILexicalBlock(scope: !4348, file: !694, line: 622, column: 6)
!4371 = !DILocation(line: 622, column: 23, scope: !4370)
!4372 = !DILocation(line: 622, column: 27, scope: !4370)
!4373 = !DILocation(line: 622, column: 33, scope: !4370)
!4374 = !DILocation(line: 622, column: 43, scope: !4370)
!4375 = !DILocation(line: 623, column: 23, scope: !4370)
!4376 = !DILocation(line: 623, column: 31, scope: !4370)
!4377 = !DILocation(line: 623, column: 36, scope: !4370)
!4378 = !DILocation(line: 623, column: 6, scope: !4370)
!4379 = !DILocation(line: 622, column: 6, scope: !4348)
!4380 = !DILocation(line: 624, column: 3, scope: !4370)
!4381 = !DILocation(line: 627, column: 7, scope: !4382)
!4382 = distinct !DILexicalBlock(scope: !4348, file: !694, line: 627, column: 6)
!4383 = !DILocation(line: 627, column: 16, scope: !4382)
!4384 = !DILocation(line: 627, column: 19, scope: !4382)
!4385 = !DILocation(line: 627, column: 28, scope: !4382)
!4386 = !{!2890, !958, i64 56}
!4387 = !DILocation(line: 627, column: 39, scope: !4382)
!4388 = !DILocation(line: 627, column: 47, scope: !4382)
!4389 = !DILocation(line: 627, column: 51, scope: !4382)
!4390 = !{!4110, !958, i64 72}
!4391 = !DILocation(line: 627, column: 36, scope: !4382)
!4392 = !DILocation(line: 627, column: 6, scope: !4348)
!4393 = !DILocation(line: 628, column: 3, scope: !4382)
!4394 = !DILocation(line: 629, column: 21, scope: !4348)
!4395 = !DILocation(line: 629, column: 29, scope: !4348)
!4396 = !DILocation(line: 629, column: 33, scope: !4348)
!4397 = !DILocation(line: 629, column: 2, scope: !4348)
!4398 = !DILocation(line: 629, column: 11, scope: !4348)
!4399 = !DILocation(line: 629, column: 19, scope: !4348)
!4400 = !DILocation(line: 632, column: 7, scope: !4401)
!4401 = distinct !DILexicalBlock(scope: !4348, file: !694, line: 632, column: 6)
!4402 = !DILocation(line: 632, column: 16, scope: !4401)
!4403 = !DILocation(line: 633, column: 22, scope: !4401)
!4404 = !DILocation(line: 633, column: 30, scope: !4401)
!4405 = !DILocation(line: 633, column: 36, scope: !4401)
!4406 = !DILocation(line: 633, column: 45, scope: !4401)
!4407 = !DILocation(line: 634, column: 15, scope: !4401)
!4408 = !DILocation(line: 634, column: 8, scope: !4401)
!4409 = !DILocation(line: 634, column: 26, scope: !4401)
!4410 = !DILocation(line: 634, column: 35, scope: !4401)
!4411 = !{!2890, !956, i64 8}
!4412 = !DILocation(line: 634, column: 42, scope: !4401)
!4413 = !DILocation(line: 634, column: 51, scope: !4401)
!4414 = !{!2890, !956, i64 0}
!4415 = !DILocation(line: 633, column: 6, scope: !4401)
!4416 = !DILocation(line: 632, column: 6, scope: !4348)
!4417 = !DILocation(line: 635, column: 3, scope: !4401)
!4418 = !DILocation(line: 643, column: 28, scope: !4348)
!4419 = !DILocation(line: 643, column: 36, scope: !4348)
!4420 = !DILocation(line: 643, column: 2, scope: !4348)
!4421 = !DILocation(line: 643, column: 11, scope: !4348)
!4422 = !DILocation(line: 643, column: 26, scope: !4348)
!4423 = !DILocation(line: 645, column: 6, scope: !4424)
!4424 = distinct !DILexicalBlock(scope: !4348, file: !694, line: 645, column: 6)
!4425 = !DILocation(line: 645, column: 39, scope: !4424)
!4426 = !DILocation(line: 645, column: 47, scope: !4424)
!4427 = !DILocation(line: 645, column: 53, scope: !4424)
!4428 = !DILocation(line: 645, column: 61, scope: !4424)
!4429 = !DILocation(line: 646, column: 18, scope: !4424)
!4430 = !DILocation(line: 645, column: 6, scope: !4348)
!4431 = !DILocation(line: 647, column: 23, scope: !4424)
!4432 = !DILocation(line: 647, column: 28, scope: !4424)
!4433 = !DILocation(line: 647, column: 3, scope: !4424)
!4434 = !DILocation(line: 648, column: 1, scope: !4348)
!4435 = distinct !DISubprogram(name: "update_rev_flow", scope: !694, file: !694, line: 522, type: !4436, scopeLine: 523, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !4438)
!4436 = !DISubroutineType(types: !4437)
!4437 = !{!788, !141, !4083}
!4438 = !{!4439, !4440, !4441}
!4439 = !DILocalVariable(name: "ctx", arg: 1, scope: !4435, file: !694, line: 522, type: !141)
!4440 = !DILocalVariable(name: "p_info", arg: 2, scope: !4435, file: !694, line: 522, type: !4083)
!4441 = !DILocalVariable(name: "f_state", scope: !4435, file: !694, line: 524, type: !788)
!4442 = !DILocation(line: 522, column: 49, scope: !4435)
!4443 = !DILocation(line: 522, column: 74, scope: !4435)
!4444 = !DILocation(line: 524, column: 2, scope: !4435)
!4445 = !DILocation(line: 524, column: 21, scope: !4435)
!4446 = !DILocation(line: 526, column: 12, scope: !4435)
!4447 = !DILocation(line: 526, column: 46, scope: !4435)
!4448 = !DILocation(line: 526, column: 54, scope: !4435)
!4449 = !DILocation(line: 526, column: 64, scope: !4435)
!4450 = !DILocation(line: 526, column: 10, scope: !4435)
!4451 = !DILocation(line: 527, column: 7, scope: !4452)
!4452 = distinct !DILexicalBlock(scope: !4435, file: !694, line: 527, column: 6)
!4453 = !DILocation(line: 527, column: 6, scope: !4435)
!4454 = !DILocation(line: 528, column: 3, scope: !4452)
!4455 = !DILocation(line: 531, column: 7, scope: !4456)
!4456 = distinct !DILexicalBlock(scope: !4435, file: !694, line: 531, column: 6)
!4457 = !DILocation(line: 531, column: 16, scope: !4456)
!4458 = !DILocation(line: 531, column: 27, scope: !4456)
!4459 = !DILocation(line: 532, column: 6, scope: !4456)
!4460 = !DILocation(line: 532, column: 14, scope: !4456)
!4461 = !DILocation(line: 532, column: 25, scope: !4456)
!4462 = !DILocation(line: 531, column: 6, scope: !4435)
!4463 = !DILocation(line: 533, column: 3, scope: !4464)
!4464 = distinct !DILexicalBlock(scope: !4456, file: !694, line: 532, column: 53)
!4465 = !DILocation(line: 533, column: 12, scope: !4464)
!4466 = !DILocation(line: 533, column: 23, scope: !4464)
!4467 = !DILocation(line: 534, column: 24, scope: !4464)
!4468 = !DILocation(line: 534, column: 29, scope: !4464)
!4469 = !DILocation(line: 534, column: 37, scope: !4464)
!4470 = !DILocation(line: 534, column: 3, scope: !4464)
!4471 = !DILocation(line: 535, column: 2, scope: !4464)
!4472 = !DILocation(line: 538, column: 2, scope: !4435)
!4473 = !DILocation(line: 538, column: 11, scope: !4435)
!4474 = !DILocation(line: 538, column: 19, scope: !4435)
!4475 = !{!2890, !956, i64 40}
!4476 = !DILocation(line: 539, column: 24, scope: !4435)
!4477 = !DILocation(line: 539, column: 32, scope: !4435)
!4478 = !DILocation(line: 539, column: 2, scope: !4435)
!4479 = !DILocation(line: 539, column: 11, scope: !4435)
!4480 = !DILocation(line: 539, column: 21, scope: !4435)
!4481 = !{!2890, !956, i64 48}
!4482 = !DILocation(line: 541, column: 9, scope: !4435)
!4483 = !DILocation(line: 541, column: 2, scope: !4435)
!4484 = !DILocation(line: 542, column: 1, scope: !4435)
!4485 = distinct !DISubprogram(name: "pping_match_packet", scope: !694, file: !694, line: 653, type: !4486, scopeLine: 656, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !4488)
!4486 = !DISubroutineType(types: !4487)
!4487 = !{null, !788, !141, !3884, !4083}
!4488 = !{!4489, !4490, !4491, !4492, !4493, !4508}
!4489 = !DILocalVariable(name: "f_state", arg: 1, scope: !4485, file: !694, line: 653, type: !788)
!4490 = !DILocalVariable(name: "ctx", arg: 2, scope: !4485, file: !694, line: 653, type: !141)
!4491 = !DILocalVariable(name: "pctx", arg: 3, scope: !4485, file: !694, line: 654, type: !3884)
!4492 = !DILocalVariable(name: "p_info", arg: 4, scope: !4485, file: !694, line: 655, type: !4083)
!4493 = !DILocalVariable(name: "re", scope: !4485, file: !694, line: 657, type: !4494)
!4494 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "rtt_event", file: !45, line: 114, size: 960, elements: !4495)
!4495 = !{!4496, !4497, !4498, !4499, !4500, !4501, !4502, !4503, !4504, !4505, !4506, !4507}
!4496 = !DIDerivedType(tag: DW_TAG_member, name: "event_type", scope: !4494, file: !45, line: 115, baseType: !143, size: 64)
!4497 = !DIDerivedType(tag: DW_TAG_member, name: "timestamp", scope: !4494, file: !45, line: 116, baseType: !143, size: 64, offset: 64)
!4498 = !DIDerivedType(tag: DW_TAG_member, name: "flow", scope: !4494, file: !45, line: 117, baseType: !761, size: 352, offset: 128)
!4499 = !DIDerivedType(tag: DW_TAG_member, name: "padding", scope: !4494, file: !45, line: 118, baseType: !195, size: 32, offset: 480)
!4500 = !DIDerivedType(tag: DW_TAG_member, name: "rtt", scope: !4494, file: !45, line: 119, baseType: !143, size: 64, offset: 512)
!4501 = !DIDerivedType(tag: DW_TAG_member, name: "min_rtt", scope: !4494, file: !45, line: 120, baseType: !143, size: 64, offset: 576)
!4502 = !DIDerivedType(tag: DW_TAG_member, name: "sent_pkts", scope: !4494, file: !45, line: 121, baseType: !143, size: 64, offset: 640)
!4503 = !DIDerivedType(tag: DW_TAG_member, name: "sent_bytes", scope: !4494, file: !45, line: 122, baseType: !143, size: 64, offset: 704)
!4504 = !DIDerivedType(tag: DW_TAG_member, name: "rec_pkts", scope: !4494, file: !45, line: 123, baseType: !143, size: 64, offset: 768)
!4505 = !DIDerivedType(tag: DW_TAG_member, name: "rec_bytes", scope: !4494, file: !45, line: 124, baseType: !143, size: 64, offset: 832)
!4506 = !DIDerivedType(tag: DW_TAG_member, name: "match_on_egress", scope: !4494, file: !45, line: 125, baseType: !203, size: 8, offset: 896)
!4507 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !4494, file: !45, line: 126, baseType: !205, size: 56, offset: 904)
!4508 = !DILocalVariable(name: "p_ts", scope: !4485, file: !694, line: 658, type: !148)
!4509 = !DILocation(line: 653, column: 51, scope: !4485)
!4510 = !DILocation(line: 653, column: 66, scope: !4485)
!4511 = !DILocation(line: 654, column: 35, scope: !4485)
!4512 = !DILocation(line: 655, column: 31, scope: !4485)
!4513 = !DILocation(line: 657, column: 2, scope: !4485)
!4514 = !DILocation(line: 657, column: 19, scope: !4485)
!4515 = !DILocation(line: 658, column: 2, scope: !4485)
!4516 = !DILocation(line: 658, column: 9, scope: !4485)
!4517 = !DILocation(line: 660, column: 7, scope: !4518)
!4518 = distinct !DILexicalBlock(scope: !4485, file: !694, line: 660, column: 6)
!4519 = !DILocation(line: 660, column: 15, scope: !4518)
!4520 = !DILocation(line: 660, column: 19, scope: !4518)
!4521 = !DILocation(line: 660, column: 27, scope: !4518)
!4522 = !{!4110, !957, i64 125}
!4523 = !DILocation(line: 660, column: 6, scope: !4485)
!4524 = !DILocation(line: 661, column: 3, scope: !4518)
!4525 = !DILocation(line: 663, column: 9, scope: !4485)
!4526 = !DILocation(line: 663, column: 42, scope: !4485)
!4527 = !DILocation(line: 663, column: 50, scope: !4485)
!4528 = !DILocation(line: 663, column: 7, scope: !4485)
!4529 = !DILocation(line: 664, column: 7, scope: !4530)
!4530 = distinct !DILexicalBlock(scope: !4485, file: !694, line: 664, column: 6)
!4531 = !DILocation(line: 664, column: 12, scope: !4530)
!4532 = !DILocation(line: 664, column: 15, scope: !4530)
!4533 = !DILocation(line: 664, column: 23, scope: !4530)
!4534 = !DILocation(line: 664, column: 31, scope: !4530)
!4535 = !DILocation(line: 664, column: 30, scope: !4530)
!4536 = !DILocation(line: 664, column: 28, scope: !4530)
!4537 = !DILocation(line: 664, column: 6, scope: !4485)
!4538 = !DILocation(line: 665, column: 3, scope: !4530)
!4539 = !DILocation(line: 667, column: 11, scope: !4485)
!4540 = !DILocation(line: 667, column: 19, scope: !4485)
!4541 = !DILocation(line: 667, column: 27, scope: !4485)
!4542 = !DILocation(line: 667, column: 26, scope: !4485)
!4543 = !DILocation(line: 667, column: 24, scope: !4485)
!4544 = !DILocation(line: 667, column: 5, scope: !4485)
!4545 = !DILocation(line: 667, column: 9, scope: !4485)
!4546 = !DILocation(line: 669, column: 2, scope: !4485)
!4547 = !DILocation(line: 669, column: 35, scope: !4485)
!4548 = !DILocation(line: 669, column: 43, scope: !4485)
!4549 = !DILocation(line: 671, column: 6, scope: !4550)
!4550 = distinct !DILexicalBlock(scope: !4485, file: !694, line: 671, column: 6)
!4551 = !DILocation(line: 671, column: 15, scope: !4550)
!4552 = !DILocation(line: 671, column: 23, scope: !4550)
!4553 = !DILocation(line: 671, column: 28, scope: !4550)
!4554 = !DILocation(line: 671, column: 34, scope: !4550)
!4555 = !DILocation(line: 671, column: 40, scope: !4550)
!4556 = !DILocation(line: 671, column: 49, scope: !4550)
!4557 = !DILocation(line: 671, column: 38, scope: !4550)
!4558 = !DILocation(line: 671, column: 6, scope: !4485)
!4559 = !DILocation(line: 672, column: 25, scope: !4550)
!4560 = !DILocation(line: 672, column: 3, scope: !4550)
!4561 = !DILocation(line: 672, column: 12, scope: !4550)
!4562 = !DILocation(line: 672, column: 20, scope: !4550)
!4563 = !DILocation(line: 673, column: 33, scope: !4485)
!4564 = !DILocation(line: 673, column: 42, scope: !4485)
!4565 = !DILocation(line: 673, column: 51, scope: !4485)
!4566 = !DILocation(line: 673, column: 18, scope: !4485)
!4567 = !DILocation(line: 673, column: 2, scope: !4485)
!4568 = !DILocation(line: 673, column: 11, scope: !4485)
!4569 = !DILocation(line: 673, column: 16, scope: !4485)
!4570 = !DILocation(line: 676, column: 5, scope: !4485)
!4571 = !DILocation(line: 676, column: 16, scope: !4485)
!4572 = !{!1758, !956, i64 0}
!4573 = !DILocation(line: 677, column: 17, scope: !4485)
!4574 = !DILocation(line: 677, column: 25, scope: !4485)
!4575 = !DILocation(line: 677, column: 5, scope: !4485)
!4576 = !DILocation(line: 677, column: 15, scope: !4485)
!4577 = !DILocation(line: 678, column: 15, scope: !4485)
!4578 = !DILocation(line: 678, column: 24, scope: !4485)
!4579 = !DILocation(line: 678, column: 5, scope: !4485)
!4580 = !DILocation(line: 678, column: 13, scope: !4485)
!4581 = !DILocation(line: 679, column: 17, scope: !4485)
!4582 = !DILocation(line: 679, column: 26, scope: !4485)
!4583 = !DILocation(line: 679, column: 5, scope: !4485)
!4584 = !DILocation(line: 679, column: 15, scope: !4485)
!4585 = !DILocation(line: 680, column: 18, scope: !4485)
!4586 = !DILocation(line: 680, column: 27, scope: !4485)
!4587 = !DILocation(line: 680, column: 5, scope: !4485)
!4588 = !DILocation(line: 680, column: 16, scope: !4485)
!4589 = !DILocation(line: 681, column: 16, scope: !4485)
!4590 = !DILocation(line: 681, column: 25, scope: !4485)
!4591 = !DILocation(line: 681, column: 5, scope: !4485)
!4592 = !DILocation(line: 681, column: 14, scope: !4485)
!4593 = !DILocation(line: 682, column: 17, scope: !4485)
!4594 = !DILocation(line: 682, column: 26, scope: !4485)
!4595 = !DILocation(line: 682, column: 5, scope: !4485)
!4596 = !DILocation(line: 682, column: 15, scope: !4485)
!4597 = !DILocation(line: 683, column: 5, scope: !4485)
!4598 = !DILocation(line: 683, column: 12, scope: !4485)
!4599 = !DILocation(line: 683, column: 20, scope: !4485)
!4600 = !DILocation(line: 683, column: 24, scope: !4485)
!4601 = !{i64 0, i64 16, !981, i64 0, i64 16, !981, i64 0, i64 16, !981, i64 16, i64 2, !2499, i64 18, i64 2, !2499, i64 20, i64 16, !981, i64 20, i64 16, !981, i64 20, i64 16, !981, i64 36, i64 2, !2499, i64 38, i64 2, !2499, i64 40, i64 2, !2499, i64 42, i64 1, !981, i64 43, i64 1, !981}
!4602 = !DILocation(line: 684, column: 23, scope: !4485)
!4603 = !DILocation(line: 684, column: 29, scope: !4485)
!4604 = !DILocation(line: 684, column: 5, scope: !4485)
!4605 = !DILocation(line: 684, column: 21, scope: !4485)
!4606 = !DILocation(line: 685, column: 2, scope: !4485)
!4607 = !DILocation(line: 685, column: 24, scope: !4485)
!4608 = !DILocation(line: 686, column: 1, scope: !4485)
!4609 = distinct !DISubprogram(name: "delete_closed_flows", scope: !694, file: !694, line: 544, type: !4610, scopeLine: 547, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !4612)
!4610 = !DISubroutineType(types: !4611)
!4611 = !{null, !141, !4083, !788, !788}
!4612 = !{!4613, !4614, !4615, !4616, !4617}
!4613 = !DILocalVariable(name: "ctx", arg: 1, scope: !4609, file: !694, line: 544, type: !141)
!4614 = !DILocalVariable(name: "p_info", arg: 2, scope: !4609, file: !694, line: 544, type: !4083)
!4615 = !DILocalVariable(name: "flow", arg: 3, scope: !4609, file: !694, line: 545, type: !788)
!4616 = !DILocalVariable(name: "rev_flow", arg: 4, scope: !4609, file: !694, line: 546, type: !788)
!4617 = !DILocalVariable(name: "has_opened", scope: !4609, file: !694, line: 548, type: !203)
!4618 = !DILocation(line: 544, column: 39, scope: !4609)
!4619 = !DILocation(line: 544, column: 64, scope: !4609)
!4620 = !DILocation(line: 545, column: 24, scope: !4609)
!4621 = !DILocation(line: 546, column: 24, scope: !4609)
!4622 = !DILocation(line: 548, column: 2, scope: !4609)
!4623 = !DILocation(line: 548, column: 7, scope: !4609)
!4624 = !DILocation(line: 551, column: 6, scope: !4625)
!4625 = distinct !DILexicalBlock(scope: !4609, file: !694, line: 551, column: 6)
!4626 = !DILocation(line: 551, column: 11, scope: !4625)
!4627 = !DILocation(line: 551, column: 15, scope: !4625)
!4628 = !DILocation(line: 551, column: 23, scope: !4625)
!4629 = !DILocation(line: 551, column: 34, scope: !4625)
!4630 = !DILocation(line: 551, column: 56, scope: !4625)
!4631 = !DILocation(line: 552, column: 8, scope: !4625)
!4632 = !DILocation(line: 552, column: 16, scope: !4625)
!4633 = !DILocation(line: 552, column: 27, scope: !4625)
!4634 = !DILocation(line: 551, column: 6, scope: !4609)
!4635 = !DILocation(line: 553, column: 16, scope: !4636)
!4636 = distinct !DILexicalBlock(scope: !4625, file: !694, line: 552, column: 56)
!4637 = !DILocation(line: 553, column: 22, scope: !4636)
!4638 = !DILocation(line: 553, column: 14, scope: !4636)
!4639 = !DILocation(line: 554, column: 8, scope: !4640)
!4640 = distinct !DILexicalBlock(scope: !4636, file: !694, line: 554, column: 7)
!4641 = !DILocation(line: 554, column: 42, scope: !4640)
!4642 = !DILocation(line: 554, column: 50, scope: !4640)
!4643 = !DILocation(line: 554, column: 54, scope: !4640)
!4644 = !DILocation(line: 554, column: 60, scope: !4640)
!4645 = !DILocation(line: 555, column: 7, scope: !4640)
!4646 = !DILocation(line: 554, column: 7, scope: !4636)
!4647 = !DILocation(line: 556, column: 20, scope: !4640)
!4648 = !DILocation(line: 556, column: 25, scope: !4640)
!4649 = !DILocation(line: 556, column: 4, scope: !4640)
!4650 = !DILocation(line: 557, column: 2, scope: !4636)
!4651 = !DILocation(line: 560, column: 6, scope: !4652)
!4652 = distinct !DILexicalBlock(scope: !4609, file: !694, line: 560, column: 6)
!4653 = !DILocation(line: 560, column: 15, scope: !4652)
!4654 = !DILocation(line: 560, column: 18, scope: !4652)
!4655 = !DILocation(line: 560, column: 26, scope: !4652)
!4656 = !DILocation(line: 560, column: 37, scope: !4652)
!4657 = !DILocation(line: 560, column: 6, scope: !4609)
!4658 = !DILocation(line: 561, column: 16, scope: !4659)
!4659 = distinct !DILexicalBlock(scope: !4652, file: !694, line: 560, column: 65)
!4660 = !DILocation(line: 561, column: 26, scope: !4659)
!4661 = !DILocation(line: 561, column: 14, scope: !4659)
!4662 = !DILocation(line: 562, column: 8, scope: !4663)
!4663 = distinct !DILexicalBlock(scope: !4659, file: !694, line: 562, column: 7)
!4664 = !DILocation(line: 563, column: 8, scope: !4663)
!4665 = !DILocation(line: 563, column: 16, scope: !4663)
!4666 = !DILocation(line: 563, column: 26, scope: !4663)
!4667 = !DILocation(line: 563, column: 32, scope: !4663)
!4668 = !DILocation(line: 564, column: 7, scope: !4663)
!4669 = !DILocation(line: 562, column: 7, scope: !4659)
!4670 = !DILocation(line: 565, column: 20, scope: !4663)
!4671 = !DILocation(line: 565, column: 25, scope: !4663)
!4672 = !DILocation(line: 565, column: 4, scope: !4663)
!4673 = !DILocation(line: 566, column: 2, scope: !4659)
!4674 = !DILocation(line: 567, column: 1, scope: !4609)
!4675 = distinct !DISubprogram(name: "send_flow_event", scope: !694, file: !694, line: 428, type: !4676, scopeLine: 430, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !4678)
!4676 = !DISubroutineType(types: !4677)
!4677 = !{null, !141, !4083, !203}
!4678 = !{!4679, !4680, !4681, !4682}
!4679 = !DILocalVariable(name: "ctx", arg: 1, scope: !4675, file: !694, line: 428, type: !141)
!4680 = !DILocalVariable(name: "p_info", arg: 2, scope: !4675, file: !694, line: 428, type: !4083)
!4681 = !DILocalVariable(name: "rev_flow", arg: 3, scope: !4675, file: !694, line: 429, type: !203)
!4682 = !DILocalVariable(name: "fe", scope: !4675, file: !694, line: 431, type: !4683)
!4683 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "flow_event", file: !45, line: 132, size: 512, elements: !4684)
!4684 = !{!4685, !4686, !4687, !4688, !4689, !4690, !4691}
!4685 = !DIDerivedType(tag: DW_TAG_member, name: "event_type", scope: !4683, file: !45, line: 133, baseType: !143, size: 64)
!4686 = !DIDerivedType(tag: DW_TAG_member, name: "timestamp", scope: !4683, file: !45, line: 134, baseType: !143, size: 64, offset: 64)
!4687 = !DIDerivedType(tag: DW_TAG_member, name: "flow", scope: !4683, file: !45, line: 135, baseType: !761, size: 352, offset: 128)
!4688 = !DIDerivedType(tag: DW_TAG_member, name: "flow_event_type", scope: !4683, file: !45, line: 136, baseType: !44, size: 8, offset: 480)
!4689 = !DIDerivedType(tag: DW_TAG_member, name: "reason", scope: !4683, file: !45, line: 137, baseType: !52, size: 8, offset: 488)
!4690 = !DIDerivedType(tag: DW_TAG_member, name: "source", scope: !4683, file: !45, line: 138, baseType: !60, size: 8, offset: 496)
!4691 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !4683, file: !45, line: 139, baseType: !192, size: 8, offset: 504)
!4692 = !DILocation(line: 428, column: 35, scope: !4675)
!4693 = !DILocation(line: 428, column: 60, scope: !4675)
!4694 = !DILocation(line: 429, column: 13, scope: !4675)
!4695 = !DILocation(line: 431, column: 2, scope: !4675)
!4696 = !DILocation(line: 431, column: 20, scope: !4675)
!4697 = !DILocation(line: 431, column: 25, scope: !4675)
!4698 = !DILocation(line: 435, column: 16, scope: !4675)
!4699 = !DILocation(line: 435, column: 24, scope: !4675)
!4700 = !DILocation(line: 433, column: 22, scope: !4675)
!4701 = !DILocation(line: 433, column: 30, scope: !4675)
!4702 = !DILocation(line: 434, column: 13, scope: !4675)
!4703 = !DILocation(line: 434, column: 21, scope: !4675)
!4704 = !{!4110, !945, i64 127}
!4705 = !{!2911, !945, i64 63}
!4706 = !DILocation(line: 439, column: 6, scope: !4707)
!4707 = distinct !DILexicalBlock(scope: !4675, file: !694, line: 439, column: 6)
!4708 = !DILocation(line: 439, column: 6, scope: !4675)
!4709 = !DILocation(line: 440, column: 6, scope: !4710)
!4710 = distinct !DILexicalBlock(scope: !4707, file: !694, line: 439, column: 16)
!4711 = !DILocation(line: 440, column: 13, scope: !4710)
!4712 = !DILocation(line: 440, column: 21, scope: !4710)
!4713 = !DILocation(line: 440, column: 25, scope: !4710)
!4714 = !DILocation(line: 441, column: 6, scope: !4710)
!4715 = !DILocation(line: 441, column: 13, scope: !4710)
!4716 = !DILocation(line: 442, column: 2, scope: !4710)
!4717 = !DILocation(line: 443, column: 6, scope: !4718)
!4718 = distinct !DILexicalBlock(scope: !4707, file: !694, line: 442, column: 9)
!4719 = !DILocation(line: 443, column: 13, scope: !4718)
!4720 = !DILocation(line: 443, column: 21, scope: !4718)
!4721 = !DILocation(line: 443, column: 31, scope: !4718)
!4722 = !DILocation(line: 444, column: 6, scope: !4718)
!4723 = !DILocation(line: 444, column: 13, scope: !4718)
!4724 = !DILocation(line: 447, column: 2, scope: !4675)
!4725 = !DILocation(line: 447, column: 24, scope: !4675)
!4726 = !DILocation(line: 448, column: 1, scope: !4675)
!4727 = distinct !DISubprogram(name: "calculate_srtt", scope: !694, file: !694, line: 378, type: !4728, scopeLine: 379, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !4730)
!4728 = !DISubroutineType(types: !4729)
!4729 = !{!143, !143, !143}
!4730 = !{!4731, !4732}
!4731 = !DILocalVariable(name: "prev_srtt", arg: 1, scope: !4727, file: !694, line: 378, type: !143)
!4732 = !DILocalVariable(name: "rtt", arg: 2, scope: !4727, file: !694, line: 378, type: !143)
!4733 = !DILocation(line: 378, column: 35, scope: !4727)
!4734 = !DILocation(line: 378, column: 52, scope: !4727)
!4735 = !DILocation(line: 380, column: 7, scope: !4736)
!4736 = distinct !DILexicalBlock(scope: !4727, file: !694, line: 380, column: 6)
!4737 = !DILocation(line: 380, column: 6, scope: !4727)
!4738 = !DILocation(line: 381, column: 10, scope: !4736)
!4739 = !DILocation(line: 381, column: 3, scope: !4736)
!4740 = !DILocation(line: 383, column: 9, scope: !4727)
!4741 = !DILocation(line: 383, column: 22, scope: !4727)
!4742 = !DILocation(line: 383, column: 32, scope: !4727)
!4743 = !DILocation(line: 383, column: 19, scope: !4727)
!4744 = !DILocation(line: 383, column: 41, scope: !4727)
!4745 = !DILocation(line: 383, column: 45, scope: !4727)
!4746 = !DILocation(line: 383, column: 38, scope: !4727)
!4747 = !DILocation(line: 383, column: 2, scope: !4727)
!4748 = !DILocation(line: 384, column: 1, scope: !4727)
!4749 = distinct !DISubprogram(name: "send_flow_open_event", scope: !694, file: !694, line: 405, type: !4750, scopeLine: 407, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !4752)
!4750 = !DISubroutineType(types: !4751)
!4751 = !{null, !141, !4083, !788}
!4752 = !{!4753, !4754, !4755, !4756}
!4753 = !DILocalVariable(name: "ctx", arg: 1, scope: !4749, file: !694, line: 405, type: !141)
!4754 = !DILocalVariable(name: "p_info", arg: 2, scope: !4749, file: !694, line: 405, type: !4083)
!4755 = !DILocalVariable(name: "rev_flow", arg: 3, scope: !4749, file: !694, line: 406, type: !788)
!4756 = !DILocalVariable(name: "fe", scope: !4749, file: !694, line: 408, type: !4683)
!4757 = !DILocation(line: 405, column: 40, scope: !4749)
!4758 = !DILocation(line: 405, column: 65, scope: !4749)
!4759 = !DILocation(line: 406, column: 25, scope: !4749)
!4760 = !DILocation(line: 408, column: 2, scope: !4749)
!4761 = !DILocation(line: 408, column: 20, scope: !4749)
!4762 = !DILocation(line: 408, column: 25, scope: !4749)
!4763 = !DILocation(line: 414, column: 16, scope: !4749)
!4764 = !DILocation(line: 414, column: 26, scope: !4749)
!4765 = !DILocation(line: 412, column: 11, scope: !4749)
!4766 = !DILocation(line: 412, column: 19, scope: !4749)
!4767 = !DILocation(line: 412, column: 23, scope: !4749)
!4768 = !DILocation(line: 413, column: 13, scope: !4749)
!4769 = !DILocation(line: 413, column: 23, scope: !4749)
!4770 = !{!2890, !945, i64 61}
!4771 = !DILocation(line: 418, column: 2, scope: !4749)
!4772 = !DILocation(line: 418, column: 24, scope: !4749)
!4773 = !DILocation(line: 419, column: 1, scope: !4749)
!4774 = distinct !DISubprogram(name: "is_local_address", scope: !694, file: !694, line: 577, type: !4775, scopeLine: 579, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !4777)
!4775 = !DISubroutineType(types: !4776)
!4776 = !{!203, !4083, !141, !3884}
!4777 = !{!4778, !4779, !4780, !4781, !4782, !4783, !4787}
!4778 = !DILocalVariable(name: "p_info", arg: 1, scope: !4774, file: !694, line: 577, type: !4083)
!4779 = !DILocalVariable(name: "ctx", arg: 2, scope: !4774, file: !694, line: 577, type: !141)
!4780 = !DILocalVariable(name: "pctx", arg: 3, scope: !4774, file: !694, line: 578, type: !3884)
!4781 = !DILocalVariable(name: "ret", scope: !4774, file: !694, line: 580, type: !312)
!4782 = !DILocalVariable(name: "lookup", scope: !4774, file: !694, line: 581, type: !858)
!4783 = !DILocalVariable(name: "src", scope: !4784, file: !694, line: 593, type: !731)
!4784 = distinct !DILexicalBlock(scope: !4785, file: !694, line: 592, column: 40)
!4785 = distinct !DILexicalBlock(scope: !4786, file: !694, line: 592, column: 13)
!4786 = distinct !DILexicalBlock(scope: !4774, file: !694, line: 587, column: 6)
!4787 = !DILocalVariable(name: "dst", scope: !4784, file: !694, line: 594, type: !731)
!4788 = !DILocation(line: 577, column: 50, scope: !4774)
!4789 = !DILocation(line: 577, column: 64, scope: !4774)
!4790 = !DILocation(line: 578, column: 33, scope: !4774)
!4791 = !DILocation(line: 580, column: 2, scope: !4774)
!4792 = !DILocation(line: 580, column: 6, scope: !4774)
!4793 = !DILocation(line: 581, column: 2, scope: !4774)
!4794 = !DILocation(line: 581, column: 24, scope: !4774)
!4795 = !DILocation(line: 582, column: 2, scope: !4774)
!4796 = !DILocation(line: 584, column: 19, scope: !4774)
!4797 = !DILocation(line: 584, column: 25, scope: !4774)
!4798 = !DILocation(line: 584, column: 9, scope: !4774)
!4799 = !DILocation(line: 584, column: 17, scope: !4774)
!4800 = !{!4801, !958, i64 8}
!4801 = !{!"bpf_fib_lookup", !945, i64 0, !945, i64 1, !1762, i64 2, !1762, i64 4, !1762, i64 6, !958, i64 8, !945, i64 12, !945, i64 16, !945, i64 32, !1762, i64 48, !1762, i64 50, !945, i64 52, !945, i64 58}
!4802 = !DILocation(line: 585, column: 18, scope: !4774)
!4803 = !DILocation(line: 585, column: 26, scope: !4774)
!4804 = !DILocation(line: 585, column: 30, scope: !4774)
!4805 = !DILocation(line: 585, column: 35, scope: !4774)
!4806 = !DILocation(line: 585, column: 9, scope: !4774)
!4807 = !DILocation(line: 585, column: 16, scope: !4774)
!4808 = !{!4801, !945, i64 0}
!4809 = !DILocation(line: 587, column: 13, scope: !4786)
!4810 = !DILocation(line: 587, column: 6, scope: !4786)
!4811 = !DILocation(line: 587, column: 20, scope: !4786)
!4812 = !DILocation(line: 587, column: 6, scope: !4774)
!4813 = !DILocation(line: 588, column: 16, scope: !4814)
!4814 = distinct !DILexicalBlock(scope: !4786, file: !694, line: 587, column: 32)
!4815 = !DILocation(line: 588, column: 24, scope: !4814)
!4816 = !DILocation(line: 588, column: 29, scope: !4814)
!4817 = !{!4818, !945, i64 1}
!4818 = !{!"iphdr", !945, i64 0, !945, i64 0, !945, i64 1, !1762, i64 2, !1762, i64 4, !1762, i64 6, !945, i64 8, !945, i64 9, !1762, i64 10, !945, i64 12}
!4819 = !DILocation(line: 588, column: 10, scope: !4814)
!4820 = !DILocation(line: 588, column: 14, scope: !4814)
!4821 = !DILocation(line: 589, column: 20, scope: !4814)
!4822 = !{!4818, !1762, i64 2}
!4823 = !DILocation(line: 589, column: 10, scope: !4814)
!4824 = !DILocation(line: 589, column: 18, scope: !4814)
!4825 = !{!4801, !1762, i64 6}
!4826 = !DILocation(line: 590, column: 21, scope: !4814)
!4827 = !DILocation(line: 590, column: 29, scope: !4814)
!4828 = !DILocation(line: 590, column: 34, scope: !4814)
!4829 = !DILocation(line: 590, column: 10, scope: !4814)
!4830 = !DILocation(line: 590, column: 19, scope: !4814)
!4831 = !DILocation(line: 591, column: 21, scope: !4814)
!4832 = !DILocation(line: 591, column: 29, scope: !4814)
!4833 = !DILocation(line: 591, column: 34, scope: !4814)
!4834 = !DILocation(line: 591, column: 10, scope: !4814)
!4835 = !DILocation(line: 591, column: 19, scope: !4814)
!4836 = !DILocation(line: 592, column: 2, scope: !4814)
!4837 = !DILocation(line: 592, column: 20, scope: !4785)
!4838 = !DILocation(line: 592, column: 13, scope: !4785)
!4839 = !DILocation(line: 592, column: 27, scope: !4785)
!4840 = !DILocation(line: 592, column: 13, scope: !4786)
!4841 = !DILocation(line: 593, column: 3, scope: !4784)
!4842 = !DILocation(line: 593, column: 20, scope: !4784)
!4843 = !DILocation(line: 593, column: 52, scope: !4784)
!4844 = !DILocation(line: 593, column: 45, scope: !4784)
!4845 = !DILocation(line: 594, column: 3, scope: !4784)
!4846 = !DILocation(line: 594, column: 20, scope: !4784)
!4847 = !DILocation(line: 594, column: 52, scope: !4784)
!4848 = !DILocation(line: 594, column: 45, scope: !4784)
!4849 = !DILocation(line: 596, column: 32, scope: !4784)
!4850 = !DILocation(line: 596, column: 40, scope: !4784)
!4851 = !DILocation(line: 596, column: 21, scope: !4784)
!4852 = !DILocation(line: 596, column: 45, scope: !4784)
!4853 = !DILocation(line: 596, column: 10, scope: !4784)
!4854 = !DILocation(line: 596, column: 19, scope: !4784)
!4855 = !DILocation(line: 597, column: 20, scope: !4784)
!4856 = !{!4857, !1762, i64 4}
!4857 = !{!"ipv6hdr", !945, i64 0, !945, i64 0, !945, i64 1, !1762, i64 4, !945, i64 6, !945, i64 7, !945, i64 8}
!4858 = !DILocation(line: 597, column: 10, scope: !4784)
!4859 = !DILocation(line: 597, column: 18, scope: !4784)
!4860 = !DILocation(line: 598, column: 4, scope: !4784)
!4861 = !DILocation(line: 598, column: 10, scope: !4784)
!4862 = !DILocation(line: 598, column: 18, scope: !4784)
!4863 = !DILocation(line: 598, column: 22, scope: !4784)
!4864 = !DILocation(line: 598, column: 27, scope: !4784)
!4865 = !DILocation(line: 598, column: 33, scope: !4784)
!4866 = !DILocation(line: 599, column: 4, scope: !4784)
!4867 = !DILocation(line: 599, column: 10, scope: !4784)
!4868 = !DILocation(line: 599, column: 18, scope: !4784)
!4869 = !DILocation(line: 599, column: 22, scope: !4784)
!4870 = !DILocation(line: 599, column: 27, scope: !4784)
!4871 = !DILocation(line: 599, column: 33, scope: !4784)
!4872 = !DILocation(line: 600, column: 2, scope: !4785)
!4873 = !DILocation(line: 600, column: 2, scope: !4784)
!4874 = !DILocation(line: 602, column: 23, scope: !4774)
!4875 = !DILocation(line: 602, column: 31, scope: !4774)
!4876 = !DILocation(line: 602, column: 35, scope: !4774)
!4877 = !DILocation(line: 602, column: 40, scope: !4774)
!4878 = !DILocation(line: 602, column: 9, scope: !4774)
!4879 = !DILocation(line: 602, column: 21, scope: !4774)
!4880 = !{!4801, !945, i64 1}
!4881 = !DILocation(line: 603, column: 9, scope: !4774)
!4882 = !DILocation(line: 603, column: 15, scope: !4774)
!4883 = !{!4801, !1762, i64 2}
!4884 = !DILocation(line: 604, column: 9, scope: !4774)
!4885 = !DILocation(line: 604, column: 15, scope: !4774)
!4886 = !{!4801, !1762, i64 4}
!4887 = !DILocation(line: 606, column: 8, scope: !4774)
!4888 = !DILocation(line: 606, column: 23, scope: !4774)
!4889 = !DILocation(line: 606, column: 6, scope: !4774)
!4890 = !DILocation(line: 608, column: 9, scope: !4774)
!4891 = !DILocation(line: 608, column: 13, scope: !4774)
!4892 = !DILocation(line: 608, column: 43, scope: !4774)
!4893 = !DILocation(line: 609, column: 9, scope: !4774)
!4894 = !DILocation(line: 609, column: 13, scope: !4774)
!4895 = !DILocation(line: 610, column: 1, scope: !4774)
!4896 = !DILocation(line: 608, column: 2, scope: !4774)
!4897 = distinct !DISubprogram(name: "is_rate_limited", scope: !694, file: !694, line: 386, type: !4898, scopeLine: 387, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !4900)
!4898 = !DISubroutineType(types: !4899)
!4899 = !{!203, !143, !143, !143}
!4900 = !{!4901, !4902, !4903}
!4901 = !DILocalVariable(name: "now", arg: 1, scope: !4897, file: !694, line: 386, type: !143)
!4902 = !DILocalVariable(name: "last_ts", arg: 2, scope: !4897, file: !694, line: 386, type: !143)
!4903 = !DILocalVariable(name: "rtt", arg: 3, scope: !4897, file: !694, line: 386, type: !143)
!4904 = !DILocation(line: 386, column: 35, scope: !4897)
!4905 = !DILocation(line: 386, column: 46, scope: !4897)
!4906 = !DILocation(line: 386, column: 61, scope: !4897)
!4907 = !DILocation(line: 388, column: 6, scope: !4908)
!4908 = distinct !DILexicalBlock(scope: !4897, file: !694, line: 388, column: 6)
!4909 = !DILocation(line: 388, column: 12, scope: !4908)
!4910 = !DILocation(line: 388, column: 10, scope: !4908)
!4911 = !DILocation(line: 388, column: 6, scope: !4897)
!4912 = !DILocation(line: 389, column: 3, scope: !4908)
!4913 = !DILocation(line: 392, column: 13, scope: !4914)
!4914 = distinct !DILexicalBlock(scope: !4897, file: !694, line: 392, column: 6)
!4915 = !DILocation(line: 392, column: 6, scope: !4914)
!4916 = !DILocation(line: 392, column: 22, scope: !4914)
!4917 = !DILocation(line: 392, column: 25, scope: !4914)
!4918 = !DILocation(line: 392, column: 6, scope: !4897)
!4919 = !DILocation(line: 393, column: 10, scope: !4914)
!4920 = !DILocation(line: 393, column: 16, scope: !4914)
!4921 = !DILocation(line: 393, column: 14, scope: !4914)
!4922 = !DILocation(line: 393, column: 26, scope: !4914)
!4923 = !DILocation(line: 393, column: 24, scope: !4914)
!4924 = !DILocation(line: 393, column: 3, scope: !4914)
!4925 = !DILocation(line: 396, column: 9, scope: !4897)
!4926 = !DILocation(line: 396, column: 15, scope: !4897)
!4927 = !DILocation(line: 396, column: 13, scope: !4897)
!4928 = !DILocation(line: 396, column: 32, scope: !4897)
!4929 = !DILocation(line: 396, column: 23, scope: !4897)
!4930 = !DILocation(line: 396, column: 2, scope: !4897)
!4931 = !DILocation(line: 397, column: 1, scope: !4897)
!4932 = distinct !DISubprogram(name: "send_map_full_event", scope: !694, file: !694, line: 454, type: !4933, scopeLine: 456, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !4935)
!4933 = !DISubroutineType(types: !4934)
!4934 = !{null, !141, !4083, !65}
!4935 = !{!4936, !4937, !4938, !4939}
!4936 = !DILocalVariable(name: "ctx", arg: 1, scope: !4932, file: !694, line: 454, type: !141)
!4937 = !DILocalVariable(name: "p_info", arg: 2, scope: !4932, file: !694, line: 454, type: !4083)
!4938 = !DILocalVariable(name: "map", arg: 3, scope: !4932, file: !694, line: 455, type: !65)
!4939 = !DILocalVariable(name: "me", scope: !4932, file: !694, line: 457, type: !4940)
!4940 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "map_full_event", file: !45, line: 146, size: 512, elements: !4941)
!4941 = !{!4942, !4943, !4944, !4945, !4946}
!4942 = !DIDerivedType(tag: DW_TAG_member, name: "event_type", scope: !4940, file: !45, line: 147, baseType: !143, size: 64)
!4943 = !DIDerivedType(tag: DW_TAG_member, name: "timestamp", scope: !4940, file: !45, line: 148, baseType: !143, size: 64, offset: 64)
!4944 = !DIDerivedType(tag: DW_TAG_member, name: "flow", scope: !4940, file: !45, line: 149, baseType: !761, size: 352, offset: 128)
!4945 = !DIDerivedType(tag: DW_TAG_member, name: "map", scope: !4940, file: !45, line: 150, baseType: !65, size: 8, offset: 480)
!4946 = !DIDerivedType(tag: DW_TAG_member, name: "reserved", scope: !4940, file: !45, line: 151, baseType: !226, size: 24, offset: 488)
!4947 = !DILocation(line: 454, column: 39, scope: !4932)
!4948 = !DILocation(line: 454, column: 64, scope: !4932)
!4949 = !DILocation(line: 455, column: 20, scope: !4932)
!4950 = !DILocation(line: 457, column: 2, scope: !4932)
!4951 = !DILocation(line: 457, column: 24, scope: !4932)
!4952 = !DILocation(line: 459, column: 6, scope: !4953)
!4953 = distinct !DILexicalBlock(scope: !4932, file: !694, line: 459, column: 6)
!4954 = !DILocation(line: 459, column: 14, scope: !4953)
!4955 = !DILocation(line: 459, column: 36, scope: !4953)
!4956 = !DILocation(line: 459, column: 21, scope: !4953)
!4957 = !DILocation(line: 459, column: 19, scope: !4953)
!4958 = !DILocation(line: 459, column: 41, scope: !4953)
!4959 = !DILocation(line: 460, column: 6, scope: !4953)
!4960 = !DILocation(line: 460, column: 14, scope: !4953)
!4961 = !DILocation(line: 460, column: 36, scope: !4953)
!4962 = !DILocation(line: 460, column: 21, scope: !4953)
!4963 = !DILocation(line: 460, column: 19, scope: !4953)
!4964 = !DILocation(line: 460, column: 41, scope: !4953)
!4965 = !DILocation(line: 459, column: 6, scope: !4932)
!4966 = !DILocation(line: 461, column: 3, scope: !4953)
!4967 = !DILocation(line: 463, column: 24, scope: !4932)
!4968 = !DILocation(line: 463, column: 32, scope: !4932)
!4969 = !DILocation(line: 463, column: 17, scope: !4932)
!4970 = !DILocation(line: 463, column: 2, scope: !4932)
!4971 = !DILocation(line: 463, column: 22, scope: !4932)
!4972 = !DILocation(line: 465, column: 2, scope: !4932)
!4973 = !DILocation(line: 466, column: 5, scope: !4932)
!4974 = !DILocation(line: 466, column: 16, scope: !4932)
!4975 = !{!2364, !956, i64 0}
!4976 = !DILocation(line: 467, column: 17, scope: !4932)
!4977 = !DILocation(line: 467, column: 25, scope: !4932)
!4978 = !DILocation(line: 467, column: 5, scope: !4932)
!4979 = !DILocation(line: 467, column: 15, scope: !4932)
!4980 = !DILocation(line: 468, column: 5, scope: !4932)
!4981 = !DILocation(line: 468, column: 12, scope: !4932)
!4982 = !DILocation(line: 468, column: 20, scope: !4932)
!4983 = !DILocation(line: 468, column: 24, scope: !4932)
!4984 = !DILocation(line: 469, column: 11, scope: !4932)
!4985 = !DILocation(line: 469, column: 5, scope: !4932)
!4986 = !DILocation(line: 469, column: 9, scope: !4932)
!4987 = !DILocation(line: 471, column: 2, scope: !4932)
!4988 = !DILocation(line: 471, column: 24, scope: !4932)
!4989 = !DILocation(line: 472, column: 1, scope: !4932)
!4990 = distinct !DISubprogram(name: "create_flow", scope: !694, file: !694, line: 478, type: !4436, scopeLine: 479, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !4991)
!4991 = !{!4992, !4993, !4994}
!4992 = !DILocalVariable(name: "ctx", arg: 1, scope: !4990, file: !694, line: 478, type: !141)
!4993 = !DILocalVariable(name: "p_info", arg: 2, scope: !4990, file: !694, line: 478, type: !4083)
!4994 = !DILocalVariable(name: "new_state", scope: !4990, file: !694, line: 480, type: !789)
!4995 = !DILocation(line: 478, column: 45, scope: !4990)
!4996 = !DILocation(line: 478, column: 70, scope: !4990)
!4997 = !DILocation(line: 480, column: 2, scope: !4990)
!4998 = !DILocation(line: 480, column: 20, scope: !4990)
!4999 = !DILocation(line: 482, column: 29, scope: !4990)
!5000 = !DILocation(line: 482, column: 37, scope: !4990)
!5001 = !DILocation(line: 482, column: 12, scope: !4990)
!5002 = !DILocation(line: 482, column: 27, scope: !4990)
!5003 = !DILocation(line: 483, column: 29, scope: !4990)
!5004 = !DILocation(line: 483, column: 37, scope: !4990)
!5005 = !DILocation(line: 483, column: 48, scope: !4990)
!5006 = !DILocation(line: 484, column: 13, scope: !4990)
!5007 = !DILocation(line: 484, column: 21, scope: !4990)
!5008 = !DILocation(line: 483, column: 12, scope: !4990)
!5009 = !DILocation(line: 483, column: 27, scope: !4990)
!5010 = !DILocation(line: 487, column: 6, scope: !5011)
!5011 = distinct !DILexicalBlock(scope: !4990, file: !694, line: 487, column: 6)
!5012 = !DILocation(line: 487, column: 40, scope: !5011)
!5013 = !DILocation(line: 487, column: 48, scope: !5011)
!5014 = !DILocation(line: 487, column: 52, scope: !5011)
!5015 = !DILocation(line: 488, column: 18, scope: !5011)
!5016 = !DILocation(line: 487, column: 6, scope: !4990)
!5017 = !DILocation(line: 489, column: 23, scope: !5018)
!5018 = distinct !DILexicalBlock(scope: !5011, file: !694, line: 488, column: 24)
!5019 = !DILocation(line: 489, column: 28, scope: !5018)
!5020 = !DILocation(line: 489, column: 3, scope: !5018)
!5021 = !DILocation(line: 490, column: 3, scope: !5018)
!5022 = !DILocation(line: 493, column: 9, scope: !4990)
!5023 = !DILocation(line: 493, column: 43, scope: !4990)
!5024 = !DILocation(line: 493, column: 51, scope: !4990)
!5025 = !DILocation(line: 493, column: 55, scope: !4990)
!5026 = !DILocation(line: 493, column: 2, scope: !4990)
!5027 = !DILocation(line: 494, column: 1, scope: !4990)
!5028 = distinct !DISubprogram(name: "parse_ethhdr", scope: !3773, file: !3773, line: 131, type: !5029, scopeLine: 134, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !5033)
!5029 = !DISubroutineType(types: !5030)
!5030 = !{!312, !5031, !141, !5032}
!5031 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3772, size: 64)
!5032 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4090, size: 64)
!5033 = !{!5034, !5035, !5036}
!5034 = !DILocalVariable(name: "nh", arg: 1, scope: !5028, file: !3773, line: 131, type: !5031)
!5035 = !DILocalVariable(name: "data_end", arg: 2, scope: !5028, file: !3773, line: 132, type: !141)
!5036 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !5028, file: !3773, line: 133, type: !5032)
!5037 = !DILocation(line: 131, column: 60, scope: !5028)
!5038 = !DILocation(line: 132, column: 12, scope: !5028)
!5039 = !DILocation(line: 133, column: 22, scope: !5028)
!5040 = !DILocation(line: 136, column: 27, scope: !5028)
!5041 = !DILocation(line: 136, column: 31, scope: !5028)
!5042 = !DILocation(line: 136, column: 41, scope: !5028)
!5043 = !DILocation(line: 136, column: 9, scope: !5028)
!5044 = !DILocation(line: 136, column: 2, scope: !5028)
!5045 = distinct !DISubprogram(name: "parse_iphdr", scope: !3773, file: !3773, line: 196, type: !5046, scopeLine: 199, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !5049)
!5046 = !DISubroutineType(types: !5047)
!5047 = !{!312, !5031, !141, !5048}
!5048 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3895, size: 64)
!5049 = !{!5050, !5051, !5052, !5053, !5054}
!5050 = !DILocalVariable(name: "nh", arg: 1, scope: !5045, file: !3773, line: 196, type: !5031)
!5051 = !DILocalVariable(name: "data_end", arg: 2, scope: !5045, file: !3773, line: 197, type: !141)
!5052 = !DILocalVariable(name: "iphdr", arg: 3, scope: !5045, file: !3773, line: 198, type: !5048)
!5053 = !DILocalVariable(name: "iph", scope: !5045, file: !3773, line: 200, type: !3895)
!5054 = !DILocalVariable(name: "hdrsize", scope: !5045, file: !3773, line: 201, type: !312)
!5055 = !DILocation(line: 196, column: 59, scope: !5045)
!5056 = !DILocation(line: 197, column: 18, scope: !5045)
!5057 = !DILocation(line: 198, column: 27, scope: !5045)
!5058 = !DILocation(line: 200, column: 2, scope: !5045)
!5059 = !DILocation(line: 200, column: 16, scope: !5045)
!5060 = !DILocation(line: 200, column: 22, scope: !5045)
!5061 = !DILocation(line: 200, column: 26, scope: !5045)
!5062 = !DILocation(line: 201, column: 2, scope: !5045)
!5063 = !DILocation(line: 201, column: 6, scope: !5045)
!5064 = !DILocation(line: 203, column: 6, scope: !5065)
!5065 = distinct !DILexicalBlock(scope: !5045, file: !3773, line: 203, column: 6)
!5066 = !DILocation(line: 203, column: 10, scope: !5065)
!5067 = !DILocation(line: 203, column: 16, scope: !5065)
!5068 = !DILocation(line: 203, column: 14, scope: !5065)
!5069 = !DILocation(line: 203, column: 6, scope: !5045)
!5070 = !DILocation(line: 204, column: 3, scope: !5065)
!5071 = !DILocation(line: 206, column: 6, scope: !5072)
!5072 = distinct !DILexicalBlock(scope: !5045, file: !3773, line: 206, column: 6)
!5073 = !DILocation(line: 206, column: 11, scope: !5072)
!5074 = !DILocation(line: 206, column: 19, scope: !5072)
!5075 = !DILocation(line: 206, column: 6, scope: !5045)
!5076 = !DILocation(line: 207, column: 3, scope: !5072)
!5077 = !DILocation(line: 209, column: 12, scope: !5045)
!5078 = !DILocation(line: 209, column: 17, scope: !5045)
!5079 = !DILocation(line: 209, column: 21, scope: !5045)
!5080 = !DILocation(line: 209, column: 10, scope: !5045)
!5081 = !DILocation(line: 211, column: 5, scope: !5082)
!5082 = distinct !DILexicalBlock(scope: !5045, file: !3773, line: 211, column: 5)
!5083 = !DILocation(line: 211, column: 13, scope: !5082)
!5084 = !DILocation(line: 211, column: 5, scope: !5045)
!5085 = !DILocation(line: 212, column: 3, scope: !5082)
!5086 = !DILocation(line: 215, column: 6, scope: !5087)
!5087 = distinct !DILexicalBlock(scope: !5045, file: !3773, line: 215, column: 6)
!5088 = !DILocation(line: 215, column: 10, scope: !5087)
!5089 = !DILocation(line: 215, column: 16, scope: !5087)
!5090 = !DILocation(line: 215, column: 14, scope: !5087)
!5091 = !DILocation(line: 215, column: 26, scope: !5087)
!5092 = !DILocation(line: 215, column: 24, scope: !5087)
!5093 = !DILocation(line: 215, column: 6, scope: !5045)
!5094 = !DILocation(line: 216, column: 3, scope: !5087)
!5095 = !DILocation(line: 218, column: 13, scope: !5045)
!5096 = !DILocation(line: 218, column: 2, scope: !5045)
!5097 = !DILocation(line: 218, column: 6, scope: !5045)
!5098 = !DILocation(line: 218, column: 10, scope: !5045)
!5099 = !DILocation(line: 219, column: 11, scope: !5045)
!5100 = !DILocation(line: 219, column: 3, scope: !5045)
!5101 = !DILocation(line: 219, column: 9, scope: !5045)
!5102 = !DILocation(line: 221, column: 9, scope: !5045)
!5103 = !DILocation(line: 221, column: 14, scope: !5045)
!5104 = !{!4818, !945, i64 9}
!5105 = !DILocation(line: 221, column: 2, scope: !5045)
!5106 = !DILocation(line: 222, column: 1, scope: !5045)
!5107 = distinct !DISubprogram(name: "parse_ip6hdr", scope: !3773, file: !3773, line: 174, type: !5108, scopeLine: 177, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !5111)
!5108 = !DISubroutineType(types: !5109)
!5109 = !{!312, !5031, !141, !5110}
!5110 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3923, size: 64)
!5111 = !{!5112, !5113, !5114, !5115}
!5112 = !DILocalVariable(name: "nh", arg: 1, scope: !5107, file: !3773, line: 174, type: !5031)
!5113 = !DILocalVariable(name: "data_end", arg: 2, scope: !5107, file: !3773, line: 175, type: !141)
!5114 = !DILocalVariable(name: "ip6hdr", arg: 3, scope: !5107, file: !3773, line: 176, type: !5110)
!5115 = !DILocalVariable(name: "ip6h", scope: !5107, file: !3773, line: 178, type: !3923)
!5116 = !DILocation(line: 174, column: 60, scope: !5107)
!5117 = !DILocation(line: 175, column: 12, scope: !5107)
!5118 = !DILocation(line: 176, column: 23, scope: !5107)
!5119 = !DILocation(line: 178, column: 2, scope: !5107)
!5120 = !DILocation(line: 178, column: 18, scope: !5107)
!5121 = !DILocation(line: 178, column: 25, scope: !5107)
!5122 = !DILocation(line: 178, column: 29, scope: !5107)
!5123 = !DILocation(line: 184, column: 6, scope: !5124)
!5124 = distinct !DILexicalBlock(scope: !5107, file: !3773, line: 184, column: 6)
!5125 = !DILocation(line: 184, column: 11, scope: !5124)
!5126 = !DILocation(line: 184, column: 17, scope: !5124)
!5127 = !DILocation(line: 184, column: 15, scope: !5124)
!5128 = !DILocation(line: 184, column: 6, scope: !5107)
!5129 = !DILocation(line: 185, column: 3, scope: !5124)
!5130 = !DILocation(line: 187, column: 6, scope: !5131)
!5131 = distinct !DILexicalBlock(scope: !5107, file: !3773, line: 187, column: 6)
!5132 = !DILocation(line: 187, column: 12, scope: !5131)
!5133 = !DILocation(line: 187, column: 20, scope: !5131)
!5134 = !DILocation(line: 187, column: 6, scope: !5107)
!5135 = !DILocation(line: 188, column: 3, scope: !5131)
!5136 = !DILocation(line: 190, column: 12, scope: !5107)
!5137 = !DILocation(line: 190, column: 17, scope: !5107)
!5138 = !DILocation(line: 190, column: 2, scope: !5107)
!5139 = !DILocation(line: 190, column: 6, scope: !5107)
!5140 = !DILocation(line: 190, column: 10, scope: !5107)
!5141 = !DILocation(line: 191, column: 12, scope: !5107)
!5142 = !DILocation(line: 191, column: 3, scope: !5107)
!5143 = !DILocation(line: 191, column: 10, scope: !5107)
!5144 = !DILocation(line: 193, column: 24, scope: !5107)
!5145 = !DILocation(line: 193, column: 28, scope: !5107)
!5146 = !DILocation(line: 193, column: 38, scope: !5107)
!5147 = !DILocation(line: 193, column: 44, scope: !5107)
!5148 = !{!4857, !945, i64 6}
!5149 = !DILocation(line: 193, column: 9, scope: !5107)
!5150 = !DILocation(line: 193, column: 2, scope: !5107)
!5151 = !DILocation(line: 194, column: 1, scope: !5107)
!5152 = distinct !DISubprogram(name: "parse_tcp_identifier", scope: !694, file: !694, line: 198, type: !4081, scopeLine: 200, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !5153)
!5153 = !{!5154, !5155}
!5154 = !DILocalVariable(name: "pctx", arg: 1, scope: !5152, file: !694, line: 198, type: !3884)
!5155 = !DILocalVariable(name: "p_info", arg: 2, scope: !5152, file: !694, line: 199, type: !4083)
!5156 = !DILocation(line: 198, column: 57, scope: !5152)
!5157 = !DILocation(line: 199, column: 25, scope: !5152)
!5158 = !DILocation(line: 201, column: 20, scope: !5159)
!5159 = distinct !DILexicalBlock(scope: !5152, file: !694, line: 201, column: 6)
!5160 = !DILocation(line: 201, column: 26, scope: !5159)
!5161 = !DILocation(line: 201, column: 30, scope: !5159)
!5162 = !DILocation(line: 201, column: 36, scope: !5159)
!5163 = !DILocation(line: 201, column: 47, scope: !5159)
!5164 = !DILocation(line: 201, column: 55, scope: !5159)
!5165 = !DILocation(line: 201, column: 6, scope: !5159)
!5166 = !DILocation(line: 201, column: 61, scope: !5159)
!5167 = !DILocation(line: 201, column: 6, scope: !5152)
!5168 = !DILocation(line: 202, column: 3, scope: !5159)
!5169 = !DILocation(line: 204, column: 19, scope: !5170)
!5170 = distinct !DILexicalBlock(scope: !5152, file: !694, line: 204, column: 6)
!5171 = !DILocation(line: 204, column: 27, scope: !5170)
!5172 = !DILocation(line: 204, column: 33, scope: !5170)
!5173 = !DILocation(line: 204, column: 39, scope: !5170)
!5174 = !DILocation(line: 204, column: 50, scope: !5170)
!5175 = !DILocation(line: 204, column: 58, scope: !5170)
!5176 = !DILocation(line: 204, column: 62, scope: !5170)
!5177 = !DILocation(line: 205, column: 6, scope: !5170)
!5178 = !DILocation(line: 205, column: 14, scope: !5170)
!5179 = !DILocation(line: 205, column: 24, scope: !5170)
!5180 = !DILocation(line: 204, column: 6, scope: !5170)
!5181 = !DILocation(line: 205, column: 36, scope: !5170)
!5182 = !DILocation(line: 204, column: 6, scope: !5152)
!5183 = !DILocation(line: 206, column: 3, scope: !5170)
!5184 = !DILocation(line: 208, column: 32, scope: !5152)
!5185 = !DILocation(line: 208, column: 40, scope: !5152)
!5186 = !DILocation(line: 208, column: 46, scope: !5152)
!5187 = !{!5188, !1762, i64 0}
!5188 = !{!"tcphdr", !1762, i64 0, !1762, i64 2, !958, i64 4, !958, i64 8, !1762, i64 12, !1762, i64 12, !1762, i64 13, !1762, i64 13, !1762, i64 13, !1762, i64 13, !1762, i64 13, !1762, i64 13, !1762, i64 13, !1762, i64 13, !1762, i64 14, !1762, i64 16, !1762, i64 18}
!5189 = !DILocation(line: 208, column: 2, scope: !5152)
!5190 = !DILocation(line: 208, column: 10, scope: !5152)
!5191 = !DILocation(line: 208, column: 14, scope: !5152)
!5192 = !DILocation(line: 208, column: 19, scope: !5152)
!5193 = !DILocation(line: 208, column: 25, scope: !5152)
!5194 = !DILocation(line: 208, column: 30, scope: !5152)
!5195 = !{!4110, !1762, i64 44}
!5196 = !DILocation(line: 209, column: 32, scope: !5152)
!5197 = !DILocation(line: 209, column: 40, scope: !5152)
!5198 = !DILocation(line: 209, column: 46, scope: !5152)
!5199 = !{!5188, !1762, i64 2}
!5200 = !DILocation(line: 209, column: 2, scope: !5152)
!5201 = !DILocation(line: 209, column: 10, scope: !5152)
!5202 = !DILocation(line: 209, column: 14, scope: !5152)
!5203 = !DILocation(line: 209, column: 19, scope: !5152)
!5204 = !DILocation(line: 209, column: 25, scope: !5152)
!5205 = !DILocation(line: 209, column: 30, scope: !5152)
!5206 = !{!4110, !1762, i64 64}
!5207 = !DILocation(line: 213, column: 3, scope: !5152)
!5208 = !DILocation(line: 213, column: 9, scope: !5152)
!5209 = !DILocation(line: 213, column: 12, scope: !5152)
!5210 = !{!3790, !944, i64 16}
!5211 = !DILocation(line: 213, column: 18, scope: !5152)
!5212 = !DILocation(line: 213, column: 24, scope: !5152)
!5213 = !DILocation(line: 213, column: 16, scope: !5152)
!5214 = !DILocation(line: 213, column: 31, scope: !5152)
!5215 = !DILocation(line: 213, column: 37, scope: !5152)
!5216 = !DILocation(line: 213, column: 29, scope: !5152)
!5217 = !DILocation(line: 213, column: 45, scope: !5152)
!5218 = !DILocation(line: 213, column: 48, scope: !5152)
!5219 = !DILocation(line: 213, column: 56, scope: !5152)
!5220 = !DILocation(line: 213, column: 62, scope: !5152)
!5221 = !DILocation(line: 212, column: 2, scope: !5152)
!5222 = !DILocation(line: 212, column: 10, scope: !5152)
!5223 = !DILocation(line: 212, column: 20, scope: !5152)
!5224 = !DILocation(line: 216, column: 28, scope: !5152)
!5225 = !DILocation(line: 216, column: 36, scope: !5152)
!5226 = !DILocation(line: 216, column: 42, scope: !5152)
!5227 = !DILocation(line: 216, column: 2, scope: !5152)
!5228 = !DILocation(line: 216, column: 10, scope: !5152)
!5229 = !DILocation(line: 216, column: 26, scope: !5152)
!5230 = !DILocation(line: 219, column: 6, scope: !5231)
!5231 = distinct !DILexicalBlock(scope: !5152, file: !694, line: 219, column: 6)
!5232 = !DILocation(line: 219, column: 14, scope: !5231)
!5233 = !DILocation(line: 219, column: 20, scope: !5231)
!5234 = !DILocation(line: 219, column: 6, scope: !5152)
!5235 = !DILocation(line: 220, column: 3, scope: !5236)
!5236 = distinct !DILexicalBlock(scope: !5231, file: !694, line: 219, column: 25)
!5237 = !DILocation(line: 220, column: 11, scope: !5236)
!5238 = !DILocation(line: 220, column: 22, scope: !5236)
!5239 = !DILocation(line: 221, column: 3, scope: !5236)
!5240 = !DILocation(line: 221, column: 11, scope: !5236)
!5241 = !DILocation(line: 221, column: 24, scope: !5236)
!5242 = !DILocation(line: 222, column: 2, scope: !5236)
!5243 = !DILocation(line: 222, column: 13, scope: !5244)
!5244 = distinct !DILexicalBlock(scope: !5231, file: !694, line: 222, column: 13)
!5245 = !DILocation(line: 222, column: 21, scope: !5244)
!5246 = !DILocation(line: 222, column: 27, scope: !5244)
!5247 = !DILocation(line: 222, column: 13, scope: !5231)
!5248 = !DILocation(line: 223, column: 3, scope: !5249)
!5249 = distinct !DILexicalBlock(scope: !5244, file: !694, line: 222, column: 32)
!5250 = !DILocation(line: 223, column: 11, scope: !5249)
!5251 = !DILocation(line: 223, column: 22, scope: !5249)
!5252 = !DILocation(line: 224, column: 3, scope: !5249)
!5253 = !DILocation(line: 224, column: 11, scope: !5249)
!5254 = !DILocation(line: 224, column: 24, scope: !5249)
!5255 = !DILocation(line: 225, column: 2, scope: !5249)
!5256 = !DILocation(line: 225, column: 13, scope: !5257)
!5257 = distinct !DILexicalBlock(scope: !5244, file: !694, line: 225, column: 13)
!5258 = !DILocation(line: 225, column: 21, scope: !5257)
!5259 = !DILocation(line: 225, column: 27, scope: !5257)
!5260 = !DILocation(line: 225, column: 13, scope: !5244)
!5261 = !DILocation(line: 226, column: 3, scope: !5262)
!5262 = distinct !DILexicalBlock(scope: !5257, file: !694, line: 225, column: 32)
!5263 = !DILocation(line: 226, column: 11, scope: !5262)
!5264 = !DILocation(line: 226, column: 22, scope: !5262)
!5265 = !DILocation(line: 227, column: 26, scope: !5262)
!5266 = !DILocation(line: 227, column: 34, scope: !5262)
!5267 = !DILocation(line: 227, column: 40, scope: !5262)
!5268 = !DILocation(line: 227, column: 3, scope: !5262)
!5269 = !DILocation(line: 227, column: 11, scope: !5262)
!5270 = !DILocation(line: 227, column: 24, scope: !5262)
!5271 = !DILocation(line: 230, column: 2, scope: !5262)
!5272 = !DILocation(line: 231, column: 3, scope: !5273)
!5273 = distinct !DILexicalBlock(scope: !5257, file: !694, line: 230, column: 9)
!5274 = !DILocation(line: 231, column: 11, scope: !5273)
!5275 = !DILocation(line: 231, column: 22, scope: !5273)
!5276 = !DILocation(line: 234, column: 2, scope: !5152)
!5277 = !DILocation(line: 235, column: 1, scope: !5152)
!5278 = distinct !DISubprogram(name: "parse_icmp6_identifier", scope: !694, file: !694, line: 253, type: !4081, scopeLine: 255, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !5279)
!5279 = !{!5280, !5281}
!5280 = !DILocalVariable(name: "pctx", arg: 1, scope: !5278, file: !694, line: 253, type: !3884)
!5281 = !DILocalVariable(name: "p_info", arg: 2, scope: !5278, file: !694, line: 254, type: !4083)
!5282 = !DILocation(line: 253, column: 59, scope: !5278)
!5283 = !DILocation(line: 254, column: 27, scope: !5278)
!5284 = !DILocation(line: 256, column: 22, scope: !5285)
!5285 = distinct !DILexicalBlock(scope: !5278, file: !694, line: 256, column: 6)
!5286 = !DILocation(line: 256, column: 28, scope: !5285)
!5287 = !DILocation(line: 256, column: 32, scope: !5285)
!5288 = !DILocation(line: 256, column: 38, scope: !5285)
!5289 = !DILocation(line: 256, column: 49, scope: !5285)
!5290 = !DILocation(line: 256, column: 57, scope: !5285)
!5291 = !DILocation(line: 256, column: 6, scope: !5285)
!5292 = !DILocation(line: 256, column: 65, scope: !5285)
!5293 = !DILocation(line: 256, column: 6, scope: !5278)
!5294 = !DILocation(line: 257, column: 3, scope: !5285)
!5295 = !DILocation(line: 259, column: 6, scope: !5296)
!5296 = distinct !DILexicalBlock(scope: !5278, file: !694, line: 259, column: 6)
!5297 = !DILocation(line: 259, column: 14, scope: !5296)
!5298 = !DILocation(line: 259, column: 22, scope: !5296)
!5299 = !{!5300, !945, i64 1}
!5300 = !{!"icmp6hdr", !945, i64 0, !945, i64 1, !1762, i64 2, !945, i64 4}
!5301 = !DILocation(line: 259, column: 33, scope: !5296)
!5302 = !DILocation(line: 259, column: 6, scope: !5278)
!5303 = !DILocation(line: 260, column: 3, scope: !5296)
!5304 = !DILocation(line: 262, column: 6, scope: !5305)
!5305 = distinct !DILexicalBlock(scope: !5278, file: !694, line: 262, column: 6)
!5306 = !DILocation(line: 262, column: 14, scope: !5305)
!5307 = !DILocation(line: 262, column: 22, scope: !5305)
!5308 = !{!5300, !945, i64 0}
!5309 = !DILocation(line: 262, column: 33, scope: !5305)
!5310 = !DILocation(line: 262, column: 6, scope: !5278)
!5311 = !DILocation(line: 263, column: 28, scope: !5312)
!5312 = distinct !DILexicalBlock(scope: !5305, file: !694, line: 262, column: 57)
!5313 = !DILocation(line: 263, column: 36, scope: !5312)
!5314 = !DILocation(line: 263, column: 44, scope: !5312)
!5315 = !DILocation(line: 263, column: 3, scope: !5312)
!5316 = !DILocation(line: 263, column: 11, scope: !5312)
!5317 = !DILocation(line: 263, column: 15, scope: !5312)
!5318 = !DILocation(line: 263, column: 26, scope: !5312)
!5319 = !DILocation(line: 264, column: 3, scope: !5312)
!5320 = !DILocation(line: 264, column: 11, scope: !5312)
!5321 = !DILocation(line: 264, column: 21, scope: !5312)
!5322 = !DILocation(line: 265, column: 3, scope: !5312)
!5323 = !DILocation(line: 265, column: 11, scope: !5312)
!5324 = !DILocation(line: 265, column: 27, scope: !5312)
!5325 = !DILocation(line: 266, column: 2, scope: !5312)
!5326 = !DILocation(line: 266, column: 13, scope: !5327)
!5327 = distinct !DILexicalBlock(scope: !5305, file: !694, line: 266, column: 13)
!5328 = !DILocation(line: 266, column: 21, scope: !5327)
!5329 = !DILocation(line: 266, column: 29, scope: !5327)
!5330 = !DILocation(line: 266, column: 40, scope: !5327)
!5331 = !DILocation(line: 266, column: 13, scope: !5305)
!5332 = !DILocation(line: 267, column: 34, scope: !5333)
!5333 = distinct !DILexicalBlock(scope: !5327, file: !694, line: 266, column: 62)
!5334 = !DILocation(line: 267, column: 42, scope: !5333)
!5335 = !DILocation(line: 267, column: 50, scope: !5333)
!5336 = !DILocation(line: 267, column: 3, scope: !5333)
!5337 = !DILocation(line: 267, column: 11, scope: !5333)
!5338 = !DILocation(line: 267, column: 21, scope: !5333)
!5339 = !DILocation(line: 267, column: 32, scope: !5333)
!5340 = !{!4110, !958, i64 120}
!5341 = !DILocation(line: 268, column: 3, scope: !5333)
!5342 = !DILocation(line: 268, column: 11, scope: !5333)
!5343 = !DILocation(line: 268, column: 27, scope: !5333)
!5344 = !DILocation(line: 269, column: 3, scope: !5333)
!5345 = !DILocation(line: 269, column: 11, scope: !5333)
!5346 = !DILocation(line: 269, column: 21, scope: !5333)
!5347 = !DILocation(line: 270, column: 2, scope: !5333)
!5348 = !DILocation(line: 271, column: 3, scope: !5349)
!5349 = distinct !DILexicalBlock(scope: !5327, file: !694, line: 270, column: 9)
!5350 = !DILocation(line: 274, column: 2, scope: !5278)
!5351 = !DILocation(line: 274, column: 10, scope: !5278)
!5352 = !DILocation(line: 274, column: 21, scope: !5278)
!5353 = !DILocation(line: 275, column: 32, scope: !5278)
!5354 = !DILocation(line: 275, column: 40, scope: !5278)
!5355 = !DILocation(line: 275, column: 48, scope: !5278)
!5356 = !DILocation(line: 275, column: 2, scope: !5278)
!5357 = !DILocation(line: 275, column: 10, scope: !5278)
!5358 = !DILocation(line: 275, column: 14, scope: !5278)
!5359 = !DILocation(line: 275, column: 19, scope: !5278)
!5360 = !DILocation(line: 275, column: 25, scope: !5278)
!5361 = !DILocation(line: 275, column: 30, scope: !5278)
!5362 = !DILocation(line: 276, column: 32, scope: !5278)
!5363 = !DILocation(line: 276, column: 40, scope: !5278)
!5364 = !DILocation(line: 276, column: 44, scope: !5278)
!5365 = !DILocation(line: 276, column: 49, scope: !5278)
!5366 = !DILocation(line: 276, column: 55, scope: !5278)
!5367 = !DILocation(line: 276, column: 2, scope: !5278)
!5368 = !DILocation(line: 276, column: 10, scope: !5278)
!5369 = !DILocation(line: 276, column: 14, scope: !5278)
!5370 = !DILocation(line: 276, column: 19, scope: !5278)
!5371 = !DILocation(line: 276, column: 25, scope: !5278)
!5372 = !DILocation(line: 276, column: 30, scope: !5278)
!5373 = !DILocation(line: 277, column: 2, scope: !5278)
!5374 = !DILocation(line: 278, column: 1, scope: !5278)
!5375 = distinct !DISubprogram(name: "parse_icmp_identifier", scope: !694, file: !694, line: 283, type: !4081, scopeLine: 285, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !5376)
!5376 = !{!5377, !5378}
!5377 = !DILocalVariable(name: "pctx", arg: 1, scope: !5375, file: !694, line: 283, type: !3884)
!5378 = !DILocalVariable(name: "p_info", arg: 2, scope: !5375, file: !694, line: 284, type: !4083)
!5379 = !DILocation(line: 283, column: 58, scope: !5375)
!5380 = !DILocation(line: 284, column: 26, scope: !5375)
!5381 = !DILocation(line: 286, column: 21, scope: !5382)
!5382 = distinct !DILexicalBlock(scope: !5375, file: !694, line: 286, column: 6)
!5383 = !DILocation(line: 286, column: 27, scope: !5382)
!5384 = !DILocation(line: 286, column: 31, scope: !5382)
!5385 = !DILocation(line: 286, column: 37, scope: !5382)
!5386 = !DILocation(line: 286, column: 48, scope: !5382)
!5387 = !DILocation(line: 286, column: 56, scope: !5382)
!5388 = !DILocation(line: 286, column: 6, scope: !5382)
!5389 = !DILocation(line: 286, column: 63, scope: !5382)
!5390 = !DILocation(line: 286, column: 6, scope: !5375)
!5391 = !DILocation(line: 287, column: 3, scope: !5382)
!5392 = !DILocation(line: 289, column: 6, scope: !5393)
!5393 = distinct !DILexicalBlock(scope: !5375, file: !694, line: 289, column: 6)
!5394 = !DILocation(line: 289, column: 14, scope: !5393)
!5395 = !DILocation(line: 289, column: 21, scope: !5393)
!5396 = !{!5397, !945, i64 1}
!5397 = !{!"icmphdr", !945, i64 0, !945, i64 1, !1762, i64 2, !945, i64 4}
!5398 = !DILocation(line: 289, column: 26, scope: !5393)
!5399 = !DILocation(line: 289, column: 6, scope: !5375)
!5400 = !DILocation(line: 290, column: 3, scope: !5393)
!5401 = !DILocation(line: 292, column: 6, scope: !5402)
!5402 = distinct !DILexicalBlock(scope: !5375, file: !694, line: 292, column: 6)
!5403 = !DILocation(line: 292, column: 14, scope: !5402)
!5404 = !DILocation(line: 292, column: 21, scope: !5402)
!5405 = !{!5397, !945, i64 0}
!5406 = !DILocation(line: 292, column: 26, scope: !5402)
!5407 = !DILocation(line: 292, column: 6, scope: !5375)
!5408 = !DILocation(line: 293, column: 28, scope: !5409)
!5409 = distinct !DILexicalBlock(scope: !5402, file: !694, line: 292, column: 40)
!5410 = !DILocation(line: 293, column: 36, scope: !5409)
!5411 = !DILocation(line: 293, column: 43, scope: !5409)
!5412 = !DILocation(line: 293, column: 51, scope: !5409)
!5413 = !DILocation(line: 293, column: 3, scope: !5409)
!5414 = !DILocation(line: 293, column: 11, scope: !5409)
!5415 = !DILocation(line: 293, column: 15, scope: !5409)
!5416 = !DILocation(line: 293, column: 26, scope: !5409)
!5417 = !DILocation(line: 294, column: 3, scope: !5409)
!5418 = !DILocation(line: 294, column: 11, scope: !5409)
!5419 = !DILocation(line: 294, column: 21, scope: !5409)
!5420 = !DILocation(line: 295, column: 3, scope: !5409)
!5421 = !DILocation(line: 295, column: 11, scope: !5409)
!5422 = !DILocation(line: 295, column: 27, scope: !5409)
!5423 = !DILocation(line: 296, column: 2, scope: !5409)
!5424 = !DILocation(line: 296, column: 13, scope: !5425)
!5425 = distinct !DILexicalBlock(scope: !5402, file: !694, line: 296, column: 13)
!5426 = !DILocation(line: 296, column: 21, scope: !5425)
!5427 = !DILocation(line: 296, column: 28, scope: !5425)
!5428 = !DILocation(line: 296, column: 33, scope: !5425)
!5429 = !DILocation(line: 296, column: 13, scope: !5402)
!5430 = !DILocation(line: 297, column: 34, scope: !5431)
!5431 = distinct !DILexicalBlock(scope: !5425, file: !694, line: 296, column: 52)
!5432 = !DILocation(line: 297, column: 42, scope: !5431)
!5433 = !DILocation(line: 297, column: 49, scope: !5431)
!5434 = !DILocation(line: 297, column: 57, scope: !5431)
!5435 = !DILocation(line: 297, column: 3, scope: !5431)
!5436 = !DILocation(line: 297, column: 11, scope: !5431)
!5437 = !DILocation(line: 297, column: 21, scope: !5431)
!5438 = !DILocation(line: 297, column: 32, scope: !5431)
!5439 = !DILocation(line: 298, column: 3, scope: !5431)
!5440 = !DILocation(line: 298, column: 11, scope: !5431)
!5441 = !DILocation(line: 298, column: 27, scope: !5431)
!5442 = !DILocation(line: 299, column: 3, scope: !5431)
!5443 = !DILocation(line: 299, column: 11, scope: !5431)
!5444 = !DILocation(line: 299, column: 21, scope: !5431)
!5445 = !DILocation(line: 300, column: 2, scope: !5431)
!5446 = !DILocation(line: 301, column: 3, scope: !5447)
!5447 = distinct !DILexicalBlock(scope: !5425, file: !694, line: 300, column: 9)
!5448 = !DILocation(line: 304, column: 2, scope: !5375)
!5449 = !DILocation(line: 304, column: 10, scope: !5375)
!5450 = !DILocation(line: 304, column: 21, scope: !5375)
!5451 = !DILocation(line: 305, column: 32, scope: !5375)
!5452 = !DILocation(line: 305, column: 40, scope: !5375)
!5453 = !DILocation(line: 305, column: 47, scope: !5375)
!5454 = !DILocation(line: 305, column: 55, scope: !5375)
!5455 = !DILocation(line: 305, column: 2, scope: !5375)
!5456 = !DILocation(line: 305, column: 10, scope: !5375)
!5457 = !DILocation(line: 305, column: 14, scope: !5375)
!5458 = !DILocation(line: 305, column: 19, scope: !5375)
!5459 = !DILocation(line: 305, column: 25, scope: !5375)
!5460 = !DILocation(line: 305, column: 30, scope: !5375)
!5461 = !DILocation(line: 306, column: 32, scope: !5375)
!5462 = !DILocation(line: 306, column: 40, scope: !5375)
!5463 = !DILocation(line: 306, column: 44, scope: !5375)
!5464 = !DILocation(line: 306, column: 49, scope: !5375)
!5465 = !DILocation(line: 306, column: 55, scope: !5375)
!5466 = !DILocation(line: 306, column: 2, scope: !5375)
!5467 = !DILocation(line: 306, column: 10, scope: !5375)
!5468 = !DILocation(line: 306, column: 14, scope: !5375)
!5469 = !DILocation(line: 306, column: 19, scope: !5375)
!5470 = !DILocation(line: 306, column: 25, scope: !5375)
!5471 = !DILocation(line: 306, column: 30, scope: !5375)
!5472 = !DILocation(line: 307, column: 2, scope: !5375)
!5473 = !DILocation(line: 308, column: 1, scope: !5375)
!5474 = distinct !DISubprogram(name: "map_ipv4_to_ipv6", scope: !694, file: !694, line: 114, type: !5475, scopeLine: 115, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !5477)
!5475 = !DISubroutineType(types: !5476)
!5476 = !{null, !731, !746}
!5477 = !{!5478, !5479}
!5478 = !DILocalVariable(name: "ipv6", arg: 1, scope: !5474, file: !694, line: 114, type: !731)
!5479 = !DILocalVariable(name: "ipv4", arg: 2, scope: !5474, file: !694, line: 114, type: !746)
!5480 = !DILocation(line: 114, column: 47, scope: !5474)
!5481 = !DILocation(line: 114, column: 60, scope: !5474)
!5482 = !DILocation(line: 116, column: 20, scope: !5474)
!5483 = !DILocation(line: 116, column: 26, scope: !5474)
!5484 = !DILocation(line: 116, column: 2, scope: !5474)
!5485 = !DILocation(line: 117, column: 20, scope: !5474)
!5486 = !DILocation(line: 117, column: 26, scope: !5474)
!5487 = !DILocation(line: 117, column: 2, scope: !5474)
!5488 = !DILocation(line: 118, column: 29, scope: !5474)
!5489 = !DILocation(line: 118, column: 2, scope: !5474)
!5490 = !DILocation(line: 118, column: 8, scope: !5474)
!5491 = !DILocation(line: 118, column: 27, scope: !5474)
!5492 = !DILocation(line: 119, column: 1, scope: !5474)
!5493 = distinct !DISubprogram(name: "reverse_flow", scope: !45, file: !45, line: 167, type: !5494, scopeLine: 168, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !5496)
!5494 = !DISubroutineType(types: !5495)
!5495 = !{null, !786, !786}
!5496 = !{!5497, !5498}
!5497 = !DILocalVariable(name: "dest", arg: 1, scope: !5493, file: !45, line: 167, type: !786)
!5498 = !DILocalVariable(name: "src", arg: 2, scope: !5493, file: !45, line: 167, type: !786)
!5499 = !DILocation(line: 167, column: 48, scope: !5493)
!5500 = !DILocation(line: 167, column: 76, scope: !5493)
!5501 = !DILocation(line: 169, column: 14, scope: !5493)
!5502 = !DILocation(line: 169, column: 19, scope: !5493)
!5503 = !DILocation(line: 169, column: 2, scope: !5493)
!5504 = !DILocation(line: 169, column: 8, scope: !5493)
!5505 = !DILocation(line: 169, column: 12, scope: !5493)
!5506 = !DILocation(line: 170, column: 16, scope: !5493)
!5507 = !DILocation(line: 170, column: 21, scope: !5493)
!5508 = !DILocation(line: 170, column: 2, scope: !5493)
!5509 = !DILocation(line: 170, column: 8, scope: !5493)
!5510 = !DILocation(line: 170, column: 14, scope: !5493)
!5511 = !DILocation(line: 171, column: 2, scope: !5493)
!5512 = !DILocation(line: 171, column: 8, scope: !5493)
!5513 = !DILocation(line: 171, column: 16, scope: !5493)
!5514 = !DILocation(line: 171, column: 21, scope: !5493)
!5515 = !DILocation(line: 172, column: 2, scope: !5493)
!5516 = !DILocation(line: 172, column: 8, scope: !5493)
!5517 = !DILocation(line: 172, column: 16, scope: !5493)
!5518 = !DILocation(line: 172, column: 21, scope: !5493)
!5519 = !DILocation(line: 173, column: 2, scope: !5493)
!5520 = !DILocation(line: 173, column: 8, scope: !5493)
!5521 = !DILocation(line: 173, column: 17, scope: !5493)
!5522 = !DILocation(line: 174, column: 1, scope: !5493)
!5523 = distinct !DISubprogram(name: "remaining_pkt_payload", scope: !694, file: !694, line: 124, type: !5524, scopeLine: 125, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !5526)
!5524 = !DISubroutineType(types: !5525)
!5525 = !{!195, !3884}
!5526 = !{!5527, !5528}
!5527 = !DILocalVariable(name: "ctx", arg: 1, scope: !5523, file: !694, line: 124, type: !3884)
!5528 = !DILocalVariable(name: "parsed_bytes", scope: !5523, file: !694, line: 128, type: !195)
!5529 = !DILocation(line: 124, column: 60, scope: !5523)
!5530 = !DILocation(line: 128, column: 2, scope: !5523)
!5531 = !DILocation(line: 128, column: 8, scope: !5523)
!5532 = !DILocation(line: 128, column: 23, scope: !5523)
!5533 = !DILocation(line: 128, column: 28, scope: !5523)
!5534 = !DILocation(line: 128, column: 31, scope: !5523)
!5535 = !DILocation(line: 128, column: 37, scope: !5523)
!5536 = !DILocation(line: 128, column: 42, scope: !5523)
!5537 = !DILocation(line: 128, column: 35, scope: !5523)
!5538 = !DILocation(line: 129, column: 9, scope: !5523)
!5539 = !DILocation(line: 129, column: 24, scope: !5523)
!5540 = !DILocation(line: 129, column: 29, scope: !5523)
!5541 = !DILocation(line: 129, column: 22, scope: !5523)
!5542 = !DILocation(line: 129, column: 39, scope: !5523)
!5543 = !DILocation(line: 129, column: 44, scope: !5523)
!5544 = !DILocation(line: 129, column: 54, scope: !5523)
!5545 = !DILocation(line: 129, column: 52, scope: !5523)
!5546 = !DILocation(line: 130, column: 1, scope: !5523)
!5547 = !DILocation(line: 129, column: 2, scope: !5523)
!5548 = distinct !DISubprogram(name: "parse_icmphdr", scope: !3773, file: !3773, line: 239, type: !5549, scopeLine: 242, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !5552)
!5549 = !DISubroutineType(types: !5550)
!5550 = !{!312, !5031, !141, !5551}
!5551 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3950, size: 64)
!5552 = !{!5553, !5554, !5555, !5556}
!5553 = !DILocalVariable(name: "nh", arg: 1, scope: !5548, file: !3773, line: 239, type: !5031)
!5554 = !DILocalVariable(name: "data_end", arg: 2, scope: !5548, file: !3773, line: 240, type: !141)
!5555 = !DILocalVariable(name: "icmphdr", arg: 3, scope: !5548, file: !3773, line: 241, type: !5551)
!5556 = !DILocalVariable(name: "icmph", scope: !5548, file: !3773, line: 243, type: !3950)
!5557 = !DILocation(line: 239, column: 61, scope: !5548)
!5558 = !DILocation(line: 240, column: 13, scope: !5548)
!5559 = !DILocation(line: 241, column: 24, scope: !5548)
!5560 = !DILocation(line: 243, column: 2, scope: !5548)
!5561 = !DILocation(line: 243, column: 18, scope: !5548)
!5562 = !DILocation(line: 243, column: 26, scope: !5548)
!5563 = !DILocation(line: 243, column: 30, scope: !5548)
!5564 = !DILocation(line: 245, column: 6, scope: !5565)
!5565 = distinct !DILexicalBlock(scope: !5548, file: !3773, line: 245, column: 6)
!5566 = !DILocation(line: 245, column: 12, scope: !5565)
!5567 = !DILocation(line: 245, column: 18, scope: !5565)
!5568 = !DILocation(line: 245, column: 16, scope: !5565)
!5569 = !DILocation(line: 245, column: 6, scope: !5548)
!5570 = !DILocation(line: 246, column: 3, scope: !5565)
!5571 = !DILocation(line: 248, column: 13, scope: !5548)
!5572 = !DILocation(line: 248, column: 19, scope: !5548)
!5573 = !DILocation(line: 248, column: 2, scope: !5548)
!5574 = !DILocation(line: 248, column: 6, scope: !5548)
!5575 = !DILocation(line: 248, column: 11, scope: !5548)
!5576 = !DILocation(line: 249, column: 13, scope: !5548)
!5577 = !DILocation(line: 249, column: 3, scope: !5548)
!5578 = !DILocation(line: 249, column: 11, scope: !5548)
!5579 = !DILocation(line: 251, column: 9, scope: !5548)
!5580 = !DILocation(line: 251, column: 16, scope: !5548)
!5581 = !DILocation(line: 251, column: 2, scope: !5548)
!5582 = !DILocation(line: 252, column: 1, scope: !5548)
!5583 = distinct !DISubprogram(name: "parse_icmp6hdr", scope: !3773, file: !3773, line: 224, type: !5584, scopeLine: 227, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !5587)
!5584 = !DISubroutineType(types: !5585)
!5585 = !{!312, !5031, !141, !5586}
!5586 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !3974, size: 64)
!5587 = !{!5588, !5589, !5590, !5591}
!5588 = !DILocalVariable(name: "nh", arg: 1, scope: !5583, file: !3773, line: 224, type: !5031)
!5589 = !DILocalVariable(name: "data_end", arg: 2, scope: !5583, file: !3773, line: 225, type: !141)
!5590 = !DILocalVariable(name: "icmp6hdr", arg: 3, scope: !5583, file: !3773, line: 226, type: !5586)
!5591 = !DILocalVariable(name: "icmp6h", scope: !5583, file: !3773, line: 228, type: !3974)
!5592 = !DILocation(line: 224, column: 62, scope: !5583)
!5593 = !DILocation(line: 225, column: 14, scope: !5583)
!5594 = !DILocation(line: 226, column: 26, scope: !5583)
!5595 = !DILocation(line: 228, column: 2, scope: !5583)
!5596 = !DILocation(line: 228, column: 19, scope: !5583)
!5597 = !DILocation(line: 228, column: 28, scope: !5583)
!5598 = !DILocation(line: 228, column: 32, scope: !5583)
!5599 = !DILocation(line: 230, column: 6, scope: !5600)
!5600 = distinct !DILexicalBlock(scope: !5583, file: !3773, line: 230, column: 6)
!5601 = !DILocation(line: 230, column: 13, scope: !5600)
!5602 = !DILocation(line: 230, column: 19, scope: !5600)
!5603 = !DILocation(line: 230, column: 17, scope: !5600)
!5604 = !DILocation(line: 230, column: 6, scope: !5583)
!5605 = !DILocation(line: 231, column: 3, scope: !5600)
!5606 = !DILocation(line: 233, column: 14, scope: !5583)
!5607 = !DILocation(line: 233, column: 21, scope: !5583)
!5608 = !DILocation(line: 233, column: 2, scope: !5583)
!5609 = !DILocation(line: 233, column: 6, scope: !5583)
!5610 = !DILocation(line: 233, column: 12, scope: !5583)
!5611 = !DILocation(line: 234, column: 14, scope: !5583)
!5612 = !DILocation(line: 234, column: 3, scope: !5583)
!5613 = !DILocation(line: 234, column: 12, scope: !5583)
!5614 = !DILocation(line: 236, column: 9, scope: !5583)
!5615 = !DILocation(line: 236, column: 17, scope: !5583)
!5616 = !DILocation(line: 236, column: 2, scope: !5583)
!5617 = !DILocation(line: 237, column: 1, scope: !5583)
!5618 = distinct !DISubprogram(name: "parse_tcphdr", scope: !3773, file: !3773, line: 295, type: !5619, scopeLine: 298, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !5622)
!5619 = !DISubroutineType(types: !5620)
!5620 = !{!312, !5031, !141, !5621}
!5621 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4013, size: 64)
!5622 = !{!5623, !5624, !5625, !5626, !5627}
!5623 = !DILocalVariable(name: "nh", arg: 1, scope: !5618, file: !3773, line: 295, type: !5031)
!5624 = !DILocalVariable(name: "data_end", arg: 2, scope: !5618, file: !3773, line: 296, type: !141)
!5625 = !DILocalVariable(name: "tcphdr", arg: 3, scope: !5618, file: !3773, line: 297, type: !5621)
!5626 = !DILocalVariable(name: "len", scope: !5618, file: !3773, line: 299, type: !312)
!5627 = !DILocalVariable(name: "h", scope: !5618, file: !3773, line: 300, type: !4013)
!5628 = !DILocation(line: 295, column: 60, scope: !5618)
!5629 = !DILocation(line: 296, column: 12, scope: !5618)
!5630 = !DILocation(line: 297, column: 22, scope: !5618)
!5631 = !DILocation(line: 299, column: 2, scope: !5618)
!5632 = !DILocation(line: 299, column: 6, scope: !5618)
!5633 = !DILocation(line: 300, column: 2, scope: !5618)
!5634 = !DILocation(line: 300, column: 17, scope: !5618)
!5635 = !DILocation(line: 300, column: 21, scope: !5618)
!5636 = !DILocation(line: 300, column: 25, scope: !5618)
!5637 = !DILocation(line: 302, column: 6, scope: !5638)
!5638 = distinct !DILexicalBlock(scope: !5618, file: !3773, line: 302, column: 6)
!5639 = !DILocation(line: 302, column: 8, scope: !5638)
!5640 = !DILocation(line: 302, column: 14, scope: !5638)
!5641 = !DILocation(line: 302, column: 12, scope: !5638)
!5642 = !DILocation(line: 302, column: 6, scope: !5618)
!5643 = !DILocation(line: 303, column: 3, scope: !5638)
!5644 = !DILocation(line: 305, column: 8, scope: !5618)
!5645 = !DILocation(line: 305, column: 11, scope: !5618)
!5646 = !DILocation(line: 305, column: 16, scope: !5618)
!5647 = !DILocation(line: 305, column: 6, scope: !5618)
!5648 = !DILocation(line: 307, column: 5, scope: !5649)
!5649 = distinct !DILexicalBlock(scope: !5618, file: !3773, line: 307, column: 5)
!5650 = !DILocation(line: 307, column: 9, scope: !5649)
!5651 = !DILocation(line: 307, column: 5, scope: !5618)
!5652 = !DILocation(line: 308, column: 3, scope: !5649)
!5653 = !DILocation(line: 311, column: 6, scope: !5654)
!5654 = distinct !DILexicalBlock(scope: !5618, file: !3773, line: 311, column: 6)
!5655 = !DILocation(line: 311, column: 10, scope: !5654)
!5656 = !DILocation(line: 311, column: 16, scope: !5654)
!5657 = !DILocation(line: 311, column: 14, scope: !5654)
!5658 = !DILocation(line: 311, column: 22, scope: !5654)
!5659 = !DILocation(line: 311, column: 20, scope: !5654)
!5660 = !DILocation(line: 311, column: 6, scope: !5618)
!5661 = !DILocation(line: 312, column: 3, scope: !5654)
!5662 = !DILocation(line: 314, column: 13, scope: !5618)
!5663 = !DILocation(line: 314, column: 2, scope: !5618)
!5664 = !DILocation(line: 314, column: 6, scope: !5618)
!5665 = !DILocation(line: 314, column: 10, scope: !5618)
!5666 = !DILocation(line: 315, column: 12, scope: !5618)
!5667 = !DILocation(line: 315, column: 3, scope: !5618)
!5668 = !DILocation(line: 315, column: 10, scope: !5618)
!5669 = !DILocation(line: 317, column: 9, scope: !5618)
!5670 = !DILocation(line: 317, column: 2, scope: !5618)
!5671 = !DILocation(line: 318, column: 1, scope: !5618)
!5672 = distinct !DISubprogram(name: "parse_tcp_ts", scope: !694, file: !694, line: 138, type: !5673, scopeLine: 140, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !5675)
!5673 = !DISubroutineType(types: !5674)
!5674 = !{!312, !4013, !141, !730, !730}
!5675 = !{!5676, !5677, !5678, !5679, !5680, !5681, !5682, !5683, !5684, !5685}
!5676 = !DILocalVariable(name: "tcph", arg: 1, scope: !5672, file: !694, line: 138, type: !4013)
!5677 = !DILocalVariable(name: "data_end", arg: 2, scope: !5672, file: !694, line: 138, type: !141)
!5678 = !DILocalVariable(name: "tsval", arg: 3, scope: !5672, file: !694, line: 138, type: !730)
!5679 = !DILocalVariable(name: "tsecr", arg: 4, scope: !5672, file: !694, line: 139, type: !730)
!5680 = !DILocalVariable(name: "len", scope: !5672, file: !694, line: 141, type: !312)
!5681 = !DILocalVariable(name: "opt_end", scope: !5672, file: !694, line: 142, type: !141)
!5682 = !DILocalVariable(name: "pos", scope: !5672, file: !694, line: 143, type: !729)
!5683 = !DILocalVariable(name: "i", scope: !5672, file: !694, line: 144, type: !192)
!5684 = !DILocalVariable(name: "opt", scope: !5672, file: !694, line: 144, type: !192)
!5685 = !DILocalVariable(name: "opt_size", scope: !5672, file: !694, line: 146, type: !5686)
!5686 = !DIDerivedType(tag: DW_TAG_volatile_type, baseType: !192)
!5687 = !DILocation(line: 138, column: 40, scope: !5672)
!5688 = !DILocation(line: 138, column: 52, scope: !5672)
!5689 = !DILocation(line: 138, column: 69, scope: !5672)
!5690 = !DILocation(line: 139, column: 11, scope: !5672)
!5691 = !DILocation(line: 141, column: 2, scope: !5672)
!5692 = !DILocation(line: 141, column: 6, scope: !5672)
!5693 = !DILocation(line: 141, column: 12, scope: !5672)
!5694 = !DILocation(line: 141, column: 18, scope: !5672)
!5695 = !DILocation(line: 141, column: 23, scope: !5672)
!5696 = !DILocation(line: 142, column: 2, scope: !5672)
!5697 = !DILocation(line: 142, column: 8, scope: !5672)
!5698 = !DILocation(line: 142, column: 26, scope: !5672)
!5699 = !DILocation(line: 142, column: 33, scope: !5672)
!5700 = !DILocation(line: 142, column: 31, scope: !5672)
!5701 = !DILocation(line: 143, column: 2, scope: !5672)
!5702 = !DILocation(line: 143, column: 8, scope: !5672)
!5703 = !DILocation(line: 143, column: 23, scope: !5672)
!5704 = !DILocation(line: 143, column: 28, scope: !5672)
!5705 = !DILocation(line: 144, column: 2, scope: !5672)
!5706 = !DILocation(line: 144, column: 7, scope: !5672)
!5707 = !DILocation(line: 144, column: 10, scope: !5672)
!5708 = !DILocation(line: 145, column: 2, scope: !5672)
!5709 = !DILocation(line: 146, column: 3, scope: !5672)
!5710 = !DILocation(line: 148, column: 6, scope: !5711)
!5711 = distinct !DILexicalBlock(scope: !5672, file: !694, line: 148, column: 6)
!5712 = !DILocation(line: 148, column: 11, scope: !5711)
!5713 = !DILocation(line: 148, column: 17, scope: !5711)
!5714 = !DILocation(line: 148, column: 15, scope: !5711)
!5715 = !DILocation(line: 148, column: 26, scope: !5711)
!5716 = !DILocation(line: 148, column: 29, scope: !5711)
!5717 = !DILocation(line: 148, column: 33, scope: !5711)
!5718 = !DILocation(line: 148, column: 6, scope: !5672)
!5719 = !DILocation(line: 149, column: 3, scope: !5711)
!5720 = !DILocation(line: 151, column: 9, scope: !5721)
!5721 = distinct !DILexicalBlock(scope: !5672, file: !694, line: 151, column: 2)
!5722 = !DILocation(line: 151, column: 7, scope: !5721)
!5723 = !DILocation(line: 151, column: 14, scope: !5724)
!5724 = distinct !DILexicalBlock(scope: !5721, file: !694, line: 151, column: 2)
!5725 = !DILocation(line: 151, column: 16, scope: !5724)
!5726 = !DILocation(line: 151, column: 2, scope: !5721)
!5727 = !DILocation(line: 152, column: 7, scope: !5728)
!5728 = distinct !DILexicalBlock(scope: !5729, file: !694, line: 152, column: 7)
!5729 = distinct !DILexicalBlock(scope: !5724, file: !694, line: 151, column: 40)
!5730 = !DILocation(line: 152, column: 11, scope: !5728)
!5731 = !DILocation(line: 152, column: 17, scope: !5728)
!5732 = !DILocation(line: 152, column: 15, scope: !5728)
!5733 = !DILocation(line: 152, column: 25, scope: !5728)
!5734 = !DILocation(line: 152, column: 28, scope: !5728)
!5735 = !DILocation(line: 152, column: 32, scope: !5728)
!5736 = !DILocation(line: 152, column: 38, scope: !5728)
!5737 = !DILocation(line: 152, column: 36, scope: !5728)
!5738 = !DILocation(line: 152, column: 7, scope: !5729)
!5739 = !DILocation(line: 153, column: 4, scope: !5728)
!5740 = !DILocation(line: 155, column: 10, scope: !5729)
!5741 = !DILocation(line: 155, column: 9, scope: !5729)
!5742 = !DILocation(line: 155, column: 7, scope: !5729)
!5743 = !DILocation(line: 156, column: 7, scope: !5744)
!5744 = distinct !DILexicalBlock(scope: !5729, file: !694, line: 156, column: 7)
!5745 = !DILocation(line: 156, column: 11, scope: !5744)
!5746 = !DILocation(line: 156, column: 7, scope: !5729)
!5747 = !DILocation(line: 157, column: 4, scope: !5744)
!5748 = !DILocation(line: 159, column: 7, scope: !5749)
!5749 = distinct !DILexicalBlock(scope: !5729, file: !694, line: 159, column: 7)
!5750 = !DILocation(line: 159, column: 11, scope: !5749)
!5751 = !DILocation(line: 159, column: 7, scope: !5729)
!5752 = !DILocation(line: 160, column: 7, scope: !5753)
!5753 = distinct !DILexicalBlock(scope: !5749, file: !694, line: 159, column: 17)
!5754 = !DILocation(line: 161, column: 4, scope: !5753)
!5755 = !DILocation(line: 165, column: 7, scope: !5756)
!5756 = distinct !DILexicalBlock(scope: !5729, file: !694, line: 165, column: 7)
!5757 = !DILocation(line: 165, column: 11, scope: !5756)
!5758 = !DILocation(line: 165, column: 17, scope: !5756)
!5759 = !DILocation(line: 165, column: 15, scope: !5756)
!5760 = !DILocation(line: 165, column: 25, scope: !5756)
!5761 = !DILocation(line: 165, column: 28, scope: !5756)
!5762 = !DILocation(line: 165, column: 32, scope: !5756)
!5763 = !DILocation(line: 165, column: 38, scope: !5756)
!5764 = !DILocation(line: 165, column: 36, scope: !5756)
!5765 = !DILocation(line: 165, column: 7, scope: !5729)
!5766 = !DILocation(line: 166, column: 4, scope: !5756)
!5767 = !DILocation(line: 167, column: 16, scope: !5729)
!5768 = !DILocation(line: 167, column: 20, scope: !5729)
!5769 = !DILocation(line: 167, column: 14, scope: !5729)
!5770 = !DILocation(line: 167, column: 12, scope: !5729)
!5771 = !DILocation(line: 168, column: 7, scope: !5772)
!5772 = distinct !DILexicalBlock(scope: !5729, file: !694, line: 168, column: 7)
!5773 = !DILocation(line: 168, column: 16, scope: !5772)
!5774 = !DILocation(line: 168, column: 7, scope: !5729)
!5775 = !DILocation(line: 169, column: 4, scope: !5772)
!5776 = !DILocation(line: 172, column: 7, scope: !5777)
!5777 = distinct !DILexicalBlock(scope: !5729, file: !694, line: 172, column: 7)
!5778 = !DILocation(line: 172, column: 11, scope: !5777)
!5779 = !DILocation(line: 172, column: 16, scope: !5777)
!5780 = !DILocation(line: 172, column: 19, scope: !5777)
!5781 = !DILocation(line: 172, column: 28, scope: !5777)
!5782 = !DILocation(line: 172, column: 7, scope: !5729)
!5783 = !DILocation(line: 173, column: 8, scope: !5784)
!5784 = distinct !DILexicalBlock(scope: !5785, file: !694, line: 173, column: 8)
!5785 = distinct !DILexicalBlock(scope: !5777, file: !694, line: 172, column: 35)
!5786 = !DILocation(line: 173, column: 12, scope: !5784)
!5787 = !DILocation(line: 173, column: 19, scope: !5784)
!5788 = !DILocation(line: 173, column: 17, scope: !5784)
!5789 = !DILocation(line: 173, column: 27, scope: !5784)
!5790 = !DILocation(line: 173, column: 30, scope: !5784)
!5791 = !DILocation(line: 173, column: 34, scope: !5784)
!5792 = !DILocation(line: 173, column: 41, scope: !5784)
!5793 = !DILocation(line: 173, column: 39, scope: !5784)
!5794 = !DILocation(line: 173, column: 8, scope: !5785)
!5795 = !DILocation(line: 174, column: 5, scope: !5784)
!5796 = !DILocation(line: 175, column: 24, scope: !5785)
!5797 = !DILocation(line: 175, column: 28, scope: !5785)
!5798 = !DILocation(line: 175, column: 13, scope: !5785)
!5799 = !DILocation(line: 175, column: 5, scope: !5785)
!5800 = !DILocation(line: 175, column: 11, scope: !5785)
!5801 = !DILocation(line: 176, column: 24, scope: !5785)
!5802 = !DILocation(line: 176, column: 28, scope: !5785)
!5803 = !DILocation(line: 176, column: 13, scope: !5785)
!5804 = !DILocation(line: 176, column: 5, scope: !5785)
!5805 = !DILocation(line: 176, column: 11, scope: !5785)
!5806 = !DILocation(line: 177, column: 4, scope: !5785)
!5807 = !DILocation(line: 181, column: 10, scope: !5729)
!5808 = !DILocation(line: 181, column: 7, scope: !5729)
!5809 = !DILocation(line: 182, column: 2, scope: !5729)
!5810 = !DILocation(line: 151, column: 36, scope: !5724)
!5811 = !DILocation(line: 151, column: 2, scope: !5724)
!5812 = distinct !{!5812, !5726, !5813, !1193, !5814}
!5813 = !DILocation(line: 182, column: 2, scope: !5721)
!5814 = !{!"llvm.loop.unroll.enable"}
!5815 = !DILocation(line: 183, column: 2, scope: !5672)
!5816 = !DILocation(line: 184, column: 1, scope: !5672)
!5817 = distinct !DISubprogram(name: "skip_ip6hdrext", scope: !3773, file: !3773, line: 139, type: !5818, scopeLine: 142, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !5820)
!5818 = !DISubroutineType(types: !5819)
!5819 = !{!312, !5031, !141, !192}
!5820 = !{!5821, !5822, !5823, !5824, !5826}
!5821 = !DILocalVariable(name: "nh", arg: 1, scope: !5817, file: !3773, line: 139, type: !5031)
!5822 = !DILocalVariable(name: "data_end", arg: 2, scope: !5817, file: !3773, line: 140, type: !141)
!5823 = !DILocalVariable(name: "next_hdr_type", arg: 3, scope: !5817, file: !3773, line: 141, type: !192)
!5824 = !DILocalVariable(name: "i", scope: !5825, file: !3773, line: 143, type: !312)
!5825 = distinct !DILexicalBlock(scope: !5817, file: !3773, line: 143, column: 2)
!5826 = !DILocalVariable(name: "hdr", scope: !5827, file: !3773, line: 144, type: !5829)
!5827 = distinct !DILexicalBlock(scope: !5828, file: !3773, line: 143, column: 47)
!5828 = distinct !DILexicalBlock(scope: !5825, file: !3773, line: 143, column: 2)
!5829 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5830, size: 64)
!5830 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "ipv6_opt_hdr", file: !3925, line: 63, size: 16, elements: !5831)
!5831 = !{!5832, !5833}
!5832 = !DIDerivedType(tag: DW_TAG_member, name: "nexthdr", scope: !5830, file: !3925, line: 64, baseType: !192, size: 8)
!5833 = !DIDerivedType(tag: DW_TAG_member, name: "hdrlen", scope: !5830, file: !3925, line: 65, baseType: !192, size: 8, offset: 8)
!5834 = !DILocation(line: 139, column: 62, scope: !5817)
!5835 = !DILocation(line: 140, column: 14, scope: !5817)
!5836 = !DILocation(line: 141, column: 13, scope: !5817)
!5837 = !DILocation(line: 143, column: 7, scope: !5825)
!5838 = !DILocation(line: 143, column: 11, scope: !5825)
!5839 = !DILocation(line: 143, column: 18, scope: !5828)
!5840 = !DILocation(line: 143, column: 20, scope: !5828)
!5841 = !DILocation(line: 143, column: 2, scope: !5825)
!5842 = !DILocation(line: 144, column: 3, scope: !5827)
!5843 = !DILocation(line: 144, column: 24, scope: !5827)
!5844 = !DILocation(line: 144, column: 30, scope: !5827)
!5845 = !DILocation(line: 144, column: 34, scope: !5827)
!5846 = !DILocation(line: 146, column: 7, scope: !5847)
!5847 = distinct !DILexicalBlock(scope: !5827, file: !3773, line: 146, column: 7)
!5848 = !DILocation(line: 146, column: 11, scope: !5847)
!5849 = !DILocation(line: 146, column: 17, scope: !5847)
!5850 = !DILocation(line: 146, column: 15, scope: !5847)
!5851 = !DILocation(line: 146, column: 7, scope: !5827)
!5852 = !DILocation(line: 147, column: 4, scope: !5847)
!5853 = !DILocation(line: 149, column: 11, scope: !5827)
!5854 = !DILocation(line: 149, column: 3, scope: !5827)
!5855 = !DILocation(line: 154, column: 22, scope: !5856)
!5856 = distinct !DILexicalBlock(scope: !5827, file: !3773, line: 149, column: 26)
!5857 = !DILocation(line: 154, column: 29, scope: !5856)
!5858 = !DILocation(line: 154, column: 34, scope: !5856)
!5859 = !{!5860, !945, i64 1}
!5860 = !{!"ipv6_opt_hdr", !945, i64 0, !945, i64 1}
!5861 = !DILocation(line: 154, column: 41, scope: !5856)
!5862 = !DILocation(line: 154, column: 46, scope: !5856)
!5863 = !DILocation(line: 154, column: 26, scope: !5856)
!5864 = !DILocation(line: 154, column: 4, scope: !5856)
!5865 = !DILocation(line: 154, column: 8, scope: !5856)
!5866 = !DILocation(line: 154, column: 12, scope: !5856)
!5867 = !DILocation(line: 155, column: 20, scope: !5856)
!5868 = !DILocation(line: 155, column: 25, scope: !5856)
!5869 = !{!5860, !945, i64 0}
!5870 = !DILocation(line: 155, column: 18, scope: !5856)
!5871 = !DILocation(line: 156, column: 4, scope: !5856)
!5872 = !DILocation(line: 158, column: 22, scope: !5856)
!5873 = !DILocation(line: 158, column: 29, scope: !5856)
!5874 = !DILocation(line: 158, column: 34, scope: !5856)
!5875 = !DILocation(line: 158, column: 41, scope: !5856)
!5876 = !DILocation(line: 158, column: 46, scope: !5856)
!5877 = !DILocation(line: 158, column: 26, scope: !5856)
!5878 = !DILocation(line: 158, column: 4, scope: !5856)
!5879 = !DILocation(line: 158, column: 8, scope: !5856)
!5880 = !DILocation(line: 158, column: 12, scope: !5856)
!5881 = !DILocation(line: 159, column: 20, scope: !5856)
!5882 = !DILocation(line: 159, column: 25, scope: !5856)
!5883 = !DILocation(line: 159, column: 18, scope: !5856)
!5884 = !DILocation(line: 160, column: 4, scope: !5856)
!5885 = !DILocation(line: 162, column: 22, scope: !5856)
!5886 = !DILocation(line: 162, column: 26, scope: !5856)
!5887 = !DILocation(line: 162, column: 4, scope: !5856)
!5888 = !DILocation(line: 162, column: 8, scope: !5856)
!5889 = !DILocation(line: 162, column: 12, scope: !5856)
!5890 = !DILocation(line: 163, column: 20, scope: !5856)
!5891 = !DILocation(line: 163, column: 25, scope: !5856)
!5892 = !DILocation(line: 163, column: 18, scope: !5856)
!5893 = !DILocation(line: 164, column: 4, scope: !5856)
!5894 = !DILocation(line: 167, column: 11, scope: !5856)
!5895 = !DILocation(line: 167, column: 4, scope: !5856)
!5896 = !DILocation(line: 169, column: 2, scope: !5828)
!5897 = !DILocation(line: 169, column: 2, scope: !5827)
!5898 = !DILocation(line: 143, column: 42, scope: !5828)
!5899 = !DILocation(line: 143, column: 2, scope: !5828)
!5900 = distinct !{!5900, !5841, !5901, !1193}
!5901 = !DILocation(line: 169, column: 2, scope: !5825)
!5902 = !DILocation(line: 171, column: 2, scope: !5817)
!5903 = !DILocation(line: 172, column: 1, scope: !5817)
!5904 = distinct !DISubprogram(name: "parse_ethhdr_vlan", scope: !3773, file: !3773, line: 86, type: !5905, scopeLine: 90, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !5912)
!5905 = !DISubroutineType(types: !5906)
!5906 = !{!312, !5031, !141, !5032, !5907}
!5907 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5908, size: 64)
!5908 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "collect_vlans", file: !3773, line: 71, size: 32, elements: !5909)
!5909 = !{!5910}
!5910 = !DIDerivedType(tag: DW_TAG_member, name: "id", scope: !5908, file: !3773, line: 72, baseType: !5911, size: 32)
!5911 = !DICompositeType(tag: DW_TAG_array_type, baseType: !187, size: 32, elements: !481)
!5912 = !{!5913, !5914, !5915, !5916, !5917, !5918, !5919, !5925, !5926}
!5913 = !DILocalVariable(name: "nh", arg: 1, scope: !5904, file: !3773, line: 86, type: !5031)
!5914 = !DILocalVariable(name: "data_end", arg: 2, scope: !5904, file: !3773, line: 87, type: !141)
!5915 = !DILocalVariable(name: "ethhdr", arg: 3, scope: !5904, file: !3773, line: 88, type: !5032)
!5916 = !DILocalVariable(name: "vlans", arg: 4, scope: !5904, file: !3773, line: 89, type: !5907)
!5917 = !DILocalVariable(name: "eth", scope: !5904, file: !3773, line: 91, type: !4090)
!5918 = !DILocalVariable(name: "hdrsize", scope: !5904, file: !3773, line: 92, type: !312)
!5919 = !DILocalVariable(name: "vlh", scope: !5904, file: !3773, line: 93, type: !5920)
!5920 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !5921, size: 64)
!5921 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "vlan_hdr", file: !3773, line: 44, size: 32, elements: !5922)
!5922 = !{!5923, !5924}
!5923 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_TCI", scope: !5921, file: !3773, line: 45, baseType: !742, size: 16)
!5924 = !DIDerivedType(tag: DW_TAG_member, name: "h_vlan_encapsulated_proto", scope: !5921, file: !3773, line: 46, baseType: !742, size: 16, offset: 16)
!5925 = !DILocalVariable(name: "h_proto", scope: !5904, file: !3773, line: 94, type: !187)
!5926 = !DILocalVariable(name: "i", scope: !5904, file: !3773, line: 95, type: !312)
!5927 = !DILocation(line: 86, column: 65, scope: !5904)
!5928 = !DILocation(line: 87, column: 17, scope: !5904)
!5929 = !DILocation(line: 88, column: 27, scope: !5904)
!5930 = !DILocation(line: 89, column: 33, scope: !5904)
!5931 = !DILocation(line: 91, column: 2, scope: !5904)
!5932 = !DILocation(line: 91, column: 17, scope: !5904)
!5933 = !DILocation(line: 91, column: 23, scope: !5904)
!5934 = !DILocation(line: 91, column: 27, scope: !5904)
!5935 = !DILocation(line: 92, column: 2, scope: !5904)
!5936 = !DILocation(line: 92, column: 6, scope: !5904)
!5937 = !DILocation(line: 93, column: 2, scope: !5904)
!5938 = !DILocation(line: 93, column: 19, scope: !5904)
!5939 = !DILocation(line: 94, column: 2, scope: !5904)
!5940 = !DILocation(line: 94, column: 8, scope: !5904)
!5941 = !DILocation(line: 95, column: 2, scope: !5904)
!5942 = !DILocation(line: 95, column: 6, scope: !5904)
!5943 = !DILocation(line: 100, column: 6, scope: !5944)
!5944 = distinct !DILexicalBlock(scope: !5904, file: !3773, line: 100, column: 6)
!5945 = !DILocation(line: 100, column: 10, scope: !5944)
!5946 = !DILocation(line: 100, column: 16, scope: !5944)
!5947 = !DILocation(line: 100, column: 14, scope: !5944)
!5948 = !DILocation(line: 100, column: 26, scope: !5944)
!5949 = !DILocation(line: 100, column: 24, scope: !5944)
!5950 = !DILocation(line: 100, column: 6, scope: !5904)
!5951 = !DILocation(line: 101, column: 3, scope: !5944)
!5952 = !DILocation(line: 103, column: 13, scope: !5904)
!5953 = !DILocation(line: 103, column: 2, scope: !5904)
!5954 = !DILocation(line: 103, column: 6, scope: !5904)
!5955 = !DILocation(line: 103, column: 10, scope: !5904)
!5956 = !DILocation(line: 104, column: 12, scope: !5904)
!5957 = !DILocation(line: 104, column: 3, scope: !5904)
!5958 = !DILocation(line: 104, column: 10, scope: !5904)
!5959 = !DILocation(line: 105, column: 8, scope: !5904)
!5960 = !DILocation(line: 105, column: 12, scope: !5904)
!5961 = !DILocation(line: 105, column: 6, scope: !5904)
!5962 = !DILocation(line: 106, column: 12, scope: !5904)
!5963 = !DILocation(line: 106, column: 17, scope: !5904)
!5964 = !{!5965, !1762, i64 12}
!5965 = !{!"ethhdr", !945, i64 0, !945, i64 6, !1762, i64 12}
!5966 = !DILocation(line: 106, column: 10, scope: !5904)
!5967 = !DILocation(line: 112, column: 9, scope: !5968)
!5968 = distinct !DILexicalBlock(scope: !5904, file: !3773, line: 112, column: 2)
!5969 = !DILocation(line: 112, column: 7, scope: !5968)
!5970 = !DILocation(line: 112, column: 14, scope: !5971)
!5971 = distinct !DILexicalBlock(scope: !5968, file: !3773, line: 112, column: 2)
!5972 = !DILocation(line: 112, column: 16, scope: !5971)
!5973 = !DILocation(line: 112, column: 2, scope: !5968)
!5974 = !DILocation(line: 113, column: 22, scope: !5975)
!5975 = distinct !DILexicalBlock(scope: !5976, file: !3773, line: 113, column: 7)
!5976 = distinct !DILexicalBlock(scope: !5971, file: !3773, line: 112, column: 39)
!5977 = !DILocation(line: 113, column: 8, scope: !5975)
!5978 = !DILocation(line: 113, column: 7, scope: !5976)
!5979 = !DILocation(line: 114, column: 4, scope: !5975)
!5980 = !DILocation(line: 116, column: 7, scope: !5981)
!5981 = distinct !DILexicalBlock(scope: !5976, file: !3773, line: 116, column: 7)
!5982 = !DILocation(line: 116, column: 11, scope: !5981)
!5983 = !DILocation(line: 116, column: 17, scope: !5981)
!5984 = !DILocation(line: 116, column: 15, scope: !5981)
!5985 = !DILocation(line: 116, column: 7, scope: !5976)
!5986 = !DILocation(line: 117, column: 4, scope: !5981)
!5987 = !DILocation(line: 119, column: 13, scope: !5976)
!5988 = !DILocation(line: 119, column: 18, scope: !5976)
!5989 = !{!5990, !1762, i64 2}
!5990 = !{!"vlan_hdr", !1762, i64 0, !1762, i64 2}
!5991 = !DILocation(line: 119, column: 11, scope: !5976)
!5992 = !DILocation(line: 120, column: 7, scope: !5993)
!5993 = distinct !DILexicalBlock(scope: !5976, file: !3773, line: 120, column: 7)
!5994 = !DILocation(line: 120, column: 7, scope: !5976)
!5995 = !DILocation(line: 122, column: 6, scope: !5993)
!5996 = !{!5990, !1762, i64 0}
!5997 = !DILocation(line: 122, column: 33, scope: !5993)
!5998 = !DILocation(line: 122, column: 5, scope: !5993)
!5999 = !DILocation(line: 121, column: 4, scope: !5993)
!6000 = !DILocation(line: 121, column: 11, scope: !5993)
!6001 = !DILocation(line: 121, column: 14, scope: !5993)
!6002 = !DILocation(line: 121, column: 17, scope: !5993)
!6003 = !DILocation(line: 124, column: 6, scope: !5976)
!6004 = !DILocation(line: 125, column: 2, scope: !5976)
!6005 = !DILocation(line: 112, column: 35, scope: !5971)
!6006 = !DILocation(line: 112, column: 2, scope: !5971)
!6007 = distinct !{!6007, !5973, !6008, !1193, !5814}
!6008 = !DILocation(line: 125, column: 2, scope: !5968)
!6009 = !DILocation(line: 127, column: 12, scope: !5904)
!6010 = !DILocation(line: 127, column: 2, scope: !5904)
!6011 = !DILocation(line: 127, column: 6, scope: !5904)
!6012 = !DILocation(line: 127, column: 10, scope: !5904)
!6013 = !DILocation(line: 128, column: 9, scope: !5904)
!6014 = !DILocation(line: 128, column: 2, scope: !5904)
!6015 = !DILocation(line: 129, column: 1, scope: !5904)
!6016 = distinct !DISubprogram(name: "proto_is_vlan", scope: !3773, file: !3773, line: 75, type: !6017, scopeLine: 76, flags: DIFlagPrototyped | DIFlagAllCallsDescribed, spFlags: DISPFlagLocalToUnit | DISPFlagDefinition | DISPFlagOptimized, unit: !693, retainedNodes: !6019)
!6017 = !DISubroutineType(types: !6018)
!6018 = !{!312, !187}
!6019 = !{!6020}
!6020 = !DILocalVariable(name: "h_proto", arg: 1, scope: !6016, file: !3773, line: 75, type: !187)
!6021 = !DILocation(line: 75, column: 48, scope: !6016)
!6022 = !DILocation(line: 77, column: 12, scope: !6016)
!6023 = !DILocation(line: 77, column: 20, scope: !6016)
!6024 = !DILocation(line: 77, column: 46, scope: !6016)
!6025 = !DILocation(line: 78, column: 5, scope: !6016)
!6026 = !DILocation(line: 78, column: 13, scope: !6016)
!6027 = !DILocation(line: 77, column: 10, scope: !6016)
!6028 = !DILocation(line: 77, column: 9, scope: !6016)
!6029 = !DILocation(line: 77, column: 2, scope: !6016)
