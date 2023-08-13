#!/bin/bash --login
#SBATCH --time = 2:00:00
#SBATCH --cpus-per-task = 2
#SBATCH --mem = 8G
#SBATCH --partition = debug
#SBATCH --constraint = intel
#SBATCH --job-name = create-conda-env
#SBATCH --mail-type=ALL
#SBATCH --output=bin/%x-%j-slurm.out
#SBATCH --error=bin/%x-%j-slurm.err
# create the conda environment
export ENV_PREFIX=$PWD/env
conda env create --prefix $ENV_PREFIX --file environment.yml --force
conda activate $ENV_PREFIX
source postBuild
