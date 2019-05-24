for file in /home/seed5004/genome_analyses/analyses/03_transcriptome_assembly/tophat_alignment/tophat_output_sorted/*
do
	output=$(basename $file)
	htseq-count -f bam -t CDS -r pos $file /home/seed5004/genome_analyses/data/ncbi_data/changed_head_annotation.gtf -o /home/seed5004/genome_analyses/analyses/04_annotation/htseq_count/htseq_output_$output.txt
done