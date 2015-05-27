#!/bin/bash

# NOTE: Lines starting with "#SBATCH" are valid SLURM commands or statements,
#       while those starting with "#" and "##SBATCH" are comments.  Uncomment
#       "##SBATCH" line means to remove one # and start with #SBATCH to be a
#       SLURM command or statement.

#SBATCH -J <+Job Name +> #Slurm job name
#SBATCH --output=slurm.%N.%j.out
#SBATCH --error=slurm.%N.%j.err

# Set the maximum runtime, uncomment if you need it
##SBATCH -t 72:00:00 #Maximum runtime of 72 hours

# Enable email notificaitons when job begins and ends, uncomment if you need it
##SBATCH --mail-user=zhuangaj@ust.hk #Update your email address
##SBATCH --mail-type=begin
##SBATCH --mail-type=end

# Use queue (partition), for example, choose gpu-k
#SBATCH -p gpu-k

# Use 2 nodes and 32 cores
#SBATCH -N 2 -n 32


./executable
