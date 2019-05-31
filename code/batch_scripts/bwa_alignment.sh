#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 5:00:00
#SBATCH -J bwa_alignment_selma_edenstahl
#SBATCH --mail-type=ALL
#SBATCH --mail-user selma.edenstahl@gmail.com

# Load modules
module load bioinfo-tools
module load bwa/0.7.17

# Your commands
bwa mem /home/seed5004/genome_analyses/analyses/02_genome_assembly/pacbio_assembly_20190411_scaffold_11.contigs.fasta /home/seed5004/genome_analyses/data/raw_data/illumina/SRR6058604_scaffold_11.1P.fastq.gz /home/seed5004/genome_analyses/data/raw_data/illumina/SRR6058604_scaffold_11.2P.fastq.gz > /home/seed5004/genome_analyses/analyses/02_genome_assembly/bwa_alignment/bwa_alignment.sam
