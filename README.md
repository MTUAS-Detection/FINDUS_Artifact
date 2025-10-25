# FINDUAS_artifact

# Dependencies
```
sudo apt install build-essential libncurses5 libncurses-dev cmake zlib1g-dev z3 libz3-dev
```
**Note: If you encounter an error with libncurses5 installation, follow the steps below**

 1. Open the sources list file:
```
sudo nano /etc/apt/sources.list.d/focal-security.list
```
2. Add the below line to the file

```
deb http://security.ubuntu.com/ubuntu focal-security main universe
```
3. run the following commands
```
sudo apt-get update
sudo apt-get install libncurses5
```

# Setup
```
cd FINDUS
./build.sh
```

# Real-world Benchmarks
Real-world benchmarks are located at  ```FINDUAS_artifact/FINDUS/Benchmarks/Real_world```.
Due to lot of header dependencies for the ease of evaluation we have only provided the ll files generated form the source code.

# Synthetic Benchmarks Evaluation
./synthetic_eval.sh'

# Running FINDUAS
```
cd Release-build
```

./bin/findus -add-td-edge=2 <path to input .ll file>

eg
```
./bin/findus -add-td-edge=2  ../Benchmarks/Real_world/android_bionic/setjmp_test_lambda_removed_assert_removed.ll

```