# S3-warp-singularity

Benchmark S3-compliant object storage systems using [Warp](https://github.com/minio/warp) running in [Slurm](https://slurm.schedmd.com/documentation.html).

## Requirements

- Access to an object storage system
- Access to a slurm cluster with [singularity](https://docs.sylabs.io/guides/latest/user-guide/) or [apptainer](https://apptainer.org/docs/user/latest/) installed (such as that supplied via [Azimuth](https://github.com/stackhpc/azimuth))

## Usage 

Fetch the singularity container image file and save it as `warp.sif` by running `singularity build warp.sif docker://ghcr.io/stackhpc/s3-warp-singularity:<version-tag>` from the slurm login node.

Edit the config variables at the top of the `submit-benchmarks-job.sh` script to fit your test requirements then submit the job to slurm with `sbatch submit-benchmarks-job.sh`.
