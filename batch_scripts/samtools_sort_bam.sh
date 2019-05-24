#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 01:00:00
#SBATCH -J sorting_bam_selma_edenstahl
#SBATCH --mail-type=ALL
#SBATCH --mail-user selma.edenstahl@gmail.com

# Load modules
module load bioinfo-tools
module load samtools

# My commands
for file in /home/seed5004/genome_analyses/analyses/03_transcriptome_assembly/tophat_alignment/tophat_output/*
do
	output=$(basename $file)
	samtools sort $file/accepted_hits.bam -o /home/seed5004/genome_analyses/analyses/03_transcriptome_assembly/tophat_alignment/tophat_output_sorted/accepted_hits_sorted_$output.bam
done