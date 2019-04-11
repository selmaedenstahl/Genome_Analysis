#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4 
#SBATCH -t 20:00:00
#SBATCH -J dna_assembly_canu_selma_edenstahl_paperV
#SBATCH --mail-type=ALL
#SBATCH --mail-user selma.edenstahl@gmail.com  

# Load modules
module load bioinfo-tools
module load canu/1.7

# Commands
canu -p pacbio_assembly_20190411_scaffold_11 -d /home/seed5004/genome_analyses/analyses/02_genome_assembly genomeSize=24M -pacbio-raw /home/seed5004/genome_analyses/data/raw_data/pacbio/SRR6037732_scaffold_11.fq.gz

