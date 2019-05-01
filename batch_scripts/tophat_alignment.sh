#!/bin/bash -l

#SBATCH -A g2019003
#SBATCH -p core
#SBATCH -n 4
#SBATCH -t 10:00:00
#SBATCH -J tophat_transcriptome_selma_edenstahl
#SBATCH --mail-type=ALL
#SBATCH --mail-user selma.edenstahl@gmail.com

# Load modules
module load bioinfo-tools
module load samtools 
module load bowtie2
module load tophat/2.1.1

# My commands
for file in /home/seed5004/genome_analyses/data/raw_data/transcriptome/trimmed/*_11.1.fastq.gz
do 
	file2="$(sed 's/_11\.1/_11.2/' <<<$file)"
	output=$(basename $file)
	tophat -o /home/seed5004/genome_analyses/analyses/03_transcriptome_assembly/tophat_alignment/tophat_output/tophat_out_${output%.fastq.gz} \
	-p 4 /home/seed5004/genome_analyses/analyses/03_transcriptome_assembly/tophat_alignment/genome_index/genome_assembly_index $file $file2
done
