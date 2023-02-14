# S3-warp-singularity

Benchmark S3-compliant object storage systems using [Warp](https://github.com/minio/warp) running in [Slurm](https://slurm.schedmd.com/documentation.html).

## Requirements

- Access to an object storage system
- A slurm cluster with [singularity](https://docs.sylabs.io/guides/latest/user-guide/) or [apptainer](https://apptainer.org/docs/user/latest/) installed (such that supplied via [Azimuth](https://github.com/stackhpc/azimuth))

## Usage 

Edit the config variables at the top of the `submit-benchmarks-job.sh` script to your fit your test requirements then submit the benchmark job to slurm with `sbatch submit-benchmarks-job.sh`.
