#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 15:00:00
#SBATCH -J augustus_opt_selma_edenstahl
#SBATCH --mail-type=ALL
#SBATCH --mail-user selma.edenstahl@gmail.com

# Load modules
module load bioinfo-tools
module load maker

# My commands

cd /home/seed5004/genome_analyses/analyses/04_annotation/maker_annotation/scaffold-11_from_paper.maker.output

optimize_augustus.pl --species=arabidopsis augustus.gbk.train --cpus=4 --AUGUSTUS_CONFIG_PATH=/home/seed5004/genome_analyses/analyses/04_annotation/maker_annotation/scaffold-11_from_paper.maker.output/config/