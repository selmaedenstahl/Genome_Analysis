#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 2 
#SBATCH -t 02:00:00
#SBATCH -J bowtie_indexing_selma_edenstahl_paperV
#SBATCH --mail-type=ALL
#SBATCH --mail-user selma.edenstahl@gmail.com  

# Load modules
module load bioinfo-tools
module load bowtie2

# Commands
bowtie2-build /home/seed5004/home/seed5004/genome_analyses/analyses/02_genome_assembly/pilon_correction/pilon_assembly_correction_scaffold_11.fasta /home/seed5004/home/seed5004/genome_analyses/analyses/03_transcriptome_assembly/tophat_alignment/genome_assembly_index