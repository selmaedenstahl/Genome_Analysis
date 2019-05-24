for file in /home/seed5004/genome_analyses/analyses/03_transcriptome_assembly/tophat_alignment/tophat_output_sorted/*
do
	output=$(basename $file)
	htseq-count -f bam -s no -t gene -i ID -r pos $file /home/seed5004/genome_analyses/data/ncbi_data/annotation_scaffold-11.gff3 -o /home/seed5004/genome_analyses/analyses/04_annotation/htseq_count/htseq_output_$output
done