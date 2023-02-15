#!/bin/sh

#SBATCH --nodes=2

# Check required env vars are set 
if [[ -z $S3_ACCESS_KEY || -z $S3_SECRET_KEY ]]; then
    echo "The environment variables S3_ACCESS_KEY and S3_SECRET_KEY must be set."
    exit 1
fi

# Benchmark config
# ----------------
# Web adress for the object storage to be benchmarked
S3_ADDRESS=fs-perf-dev-login-0:9000
# Number of concurrent threads to use of S3 requests
THREADS_PER_NODE=10
# Number of test files to upload
NUM_FILES=1000
# Max size for any single test file
MAX_FILE_SIZE=10MiB
# Duration for which the benchmark should run
BENCHMARK_DURATION=5m
# ----------------

# Start a warp client on each job node
srun --spread-job singularity run warp.sif client --no-color &

#Unpack list of nodes which have a warp client running
CLIENT_NODES=$(scontrol show hostname $SLURN_JOB_NODELIST | paste -d, -s)

# Trigger benchmark run on all clients
singularity run warp.sif get \
    --host $S3_ADDRESS \
    --access-key $S3_ACCESS_KEY \
    --secret-key $S3_SECRET_KEY \
    --concurrent $THREADS_PER_NODE \
    --objects $NUM_FILES \
    --obj.size $MAX_FILE_SIZE \
    --obj.randsize \
    --duration $BENCHMARK_DURATION \
    --no-color \
    --warp-client $CLIENT_NODES
