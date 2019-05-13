#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 15:00:00
#SBATCH -J maker_annotation_step2_selma_edenstahl
#SBATCH --mail-type=ALL
#SBATCH --mail-user selma.edenstahl@gmail.com

# Load modules
module load bioinfo-tools
module load maker/3.01.1-beta

# My commands
cd /home/seed5004/genome_analyses/analyses/04_annotation/maker_annotation/step_1/pilon_assembly_correction_scaffold_11.maker.output

hmm-assembler.pl /home/seed5004/genome_analyses/analyses/02_genome_assembly/pilon_correction/pilon_assembly_correction_scaffold_11.fasta . > pilon_assembly_correction_scaffold_11.hmm