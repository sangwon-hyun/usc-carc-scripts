#!/bin/bash
#SBATCH --ntasks=20
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=1GB
#SBATCH --time=1-00:00:00
#SBATCH --export=none  # Ensures job gets a fresh login environment
#SBATCH --mail-user=robohyun66@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --job-name=v2-run
#SBATCH --output=./logs/v2.%A_%a.log

# not using this:   SBATCH --partition=scavenge

## New system:
module load gcc/8.3.0
module load openblas/0.3.8
module load r/3.6.3

# Main CV
Rscript v2.R\
	geo=2\
	blocknum=2
