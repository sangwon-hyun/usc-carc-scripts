#!/bin/bash
#SBATCH --ntasks=8
#SBATCH --nodes=1
#SBATCH --mem-per-cpu=1GB
#SBATCH --time=7-00:00:00
#SBATCH --export=none  # Ensures job gets a fresh login environment
#SBATCH --mail-user=robohyun66@gmail.com
#SBATCH --mail-type=ALL
#SBATCH --job-name=blockcv-2-75-5
#SBATCH --output=./logs/blockcv-2-75-5.%A_%a.log
#SBATCH --array=1-200
#SBATCH --partition=scavenge
#SBATCH --exclusive

# not using this:   SBATCH --partition=scavenge

# Set the session up to use R
a=$(( ( RANDOM % 1000 )  + 1 ))
echo $a
sleep $a
source /staging/sh7/sangwonh/software/R/3.6.1/setup.sh

echo This is SLURM task $SLURM_ARRAY_TASK_ID


# Fit only
Rscript blockcv.R\
	arraynum=$SLURM_ARRAY_TASK_ID\
	arraynum_max=200\
	blocktype=2\
	datatype=75\
	numclust=5\
	cv_gridsize=10\
	nfold=5\
	nrep=10\
	random_order=0\
	maxres_once=0\
	fitonly=1\
	high_range_beta=0\
	high_range=0\
	blocksize=1\


# Main CV
Rscript blockcv.R\
	arraynum=$SLURM_ARRAY_TASK_ID\
	arraynum_max=200\
	blocktype=2\
	datatype=75\
	numclust=5\
	cv_gridsize=10\
	nfold=5\
	nrep=10\
	random_order=0\
	maxres_once=0\
	fitonly=0\
	high_range_beta=0\
	high_range=0\
	blocksize=1\
