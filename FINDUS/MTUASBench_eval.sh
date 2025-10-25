LLVM16_BIN="$(pwd)/llvm-16.0.0.obj/bin"
CLANG="$LLVM16_BIN/clang"
CLANGXX="$LLVM16_BIN/clang++"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SRC_DIR="$SCRIPT_DIR/Benchmarks/MTUASBench/PTHREAD_VERSION"

# --- Clean up old .ll files ---
echo "🧹 Removing old .ll files under $SRC_DIR..."
find "$SRC_DIR" -type f -name "*.ll" -delete
echo "✅ Old .ll files deleted"

find "$SRC_DIR" \
  -type f \( -name '*.c' -o -name '*.cpp' \) \
  -exec sh -c '
    CLANG="$1"
    CLANGXX="$2"
    shift 2
    for src do
      base=${src%.*}
      case "$src" in
        *.c)   "$CLANG"  -S -g -emit-llvm -O1 -Xclang -disable-llvm-passes "$src" -o "${base}.ll" ;;
        *.cpp) "$CLANG" -S -g -fno-exceptions -emit-llvm -O1 -Xclang -disable-llvm-passes "$src" -o "${base}.ll" ;;
      esac
    done
  ' sh "$CLANG" "$CLANGXX" {} +
echo "✅ All .ll files generated using Clang 16 from $LLVM16_BIN"





# Root directory to scan for .ll files recursively
LL_DIR="$(pwd)/Benchmarks/MTUASBench/PTHREAD_VERSION"
FINDUS="./Release-build/bin/findus"

# Final output file
FINAL_LOG="$(pwd)/Benchmarks/MTUASBench_results.txt"

# Clear previous log
> "$FINAL_LOG"

# Recursively find all .ll files
find "$LL_DIR" -type f -name "*.ll" | while read -r ll_file; do
    rel_path="${ll_file#$LL_DIR/}"  # Get relative path
    echo "Processing: $rel_path"

    # Temp file to store full output
    full_output=$(mktemp)
    "$FINDUS" -add-td-edge=2 "$ll_file" > "$full_output" 2>&1

    # Extract lines of interest
    uas_lines=$(sed 's/\x1b\[[0-9;]*m//g' "$full_output" | grep -E 'Shared object|UAS Bug Status:')

    if [[ -n "$uas_lines" ]]; then
        {
            echo "===================="
            echo "File: $rel_path"
            echo "===================="
            echo "$uas_lines"
            echo ""
        } >> "$FINAL_LOG"
    fi

    rm "$full_output"
done
echo "✅ All bug info saved to: $FINAL_LOG"


# --- Clean up old .ll files ---
echo "🧹 final cleanup of ll files  $SRC_DIR..."
find "$SRC_DIR" -type f -name "*.ll" -delete
echo "✅ done"
