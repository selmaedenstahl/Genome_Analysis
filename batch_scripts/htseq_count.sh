#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 02:00:00
#SBATCH -J ht_seq_count_selma_edenstahl
#SBATCH --mail-type=ALL
#SBATCH --mail-user selma.edenstahl@gmail.com

# Load modules
module load bioinfo-tools
module load samtools/1.9
module load htseq/0.9.1

for file in /home/seed5004/genome_analyses/analyses/03_transcriptome_assembly/tophat_alignment/tophat_output_sorted/*
do
	output=$(basename $file)
	htseq-count -o /home/seed5004/genome_analyses/analyses/04_annotation/htseq_count/htseq_output_$output.txt -f bam -t CDS -r pos $file /home/seed5004/genome_analyses/data/ncbi_data/changed_head_annotation.gtf > htseq_count_text$output.txt 
done