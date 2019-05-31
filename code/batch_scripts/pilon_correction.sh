#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 01:00:00
#SBATCH -J pilon_correction_selma_edenstahl
#SBATCH --mail-type=ALL
#SBATCH --mail-user selma.edenstahl@gmail.com

#Load modules
module load bioinfo-tools
module load Pilon/1.22

#My commands
pilon --genome /home/seed5004/genome_analyses/analyses/02_genome_assembly/pacbio_assembly_20190411_scaffold_11.contigs.fasta --bam /home/seed5004/genome_analyses/analyses/02_genome_assembly/bwa_alignment/bwa_alignment.sorted.bam --output pilon_assembly_correction_scaffold_11 --outdir /home/seed5004/genome_analyses/analyses/02_genome_assembly/pilon_correction --diploid --threads 4