#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 10:00:00
#SBATCH -J trinity_transcriptome_selma_edenstahl
#SBATCH --mail-type=ALL
#SBATCH --mail-user selma.edenstahl@gmail.com

# Load modules
module load bioinfo-tools
module load trinity

# My commands
Trinity --genome_guided_bam /home/seed5004/genome_analyses/analyses/03_transcriptome_assembly/tophat_alignment/merged_tophat_output/sorted_merged_tophat_output.bam --max_memory 30G --genome_guided_max_intron 10000 --CPU 4 --output /home/seed5004/genome_analyses/analyses/03_transcriptome_assembly/trinity_assembly/trinity_output