#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 10:00:00
#SBATCH -J augustus_opt_selma_edenstahl
#SBATCH --mail-type=ALL
#SBATCH --mail-user selma.edenstahl@gmail.com

# Load modules
module load bioinfo-tools
module load maker/3.01.1-beta

# My commands

cd /home/seed5004/genome_analyses/analyses/04_annotation/maker_annotation/step_1/augustus

optimize_augustus.pl --species=arabidopsis augustus.gbk.train