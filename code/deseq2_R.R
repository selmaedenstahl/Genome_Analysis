#if (!requireNamespace("BiocManager", quietly = TRUE))
#  install.packages("BiocManager")
#BiocManager::install("DESeq2")

#browseVignettes("DESeq2")
#install.packages("tidyverse")
#install.packages('pheatmap')

library(DESeq2)
library(tidyverse)
library(gplots)
library(RColorBrewer)
library(genefilter)

#setwd("~/Downloads/Uppmax/htseq_counts")

# Reading in files
#SRR6040092_counts <- read.delim("~/Downloads/Uppmax/htseq_counts/htseq_count_textaccepted_hits_sorted_tophat_out_SRR6040092_scaffold_11.1.bam.txt", header = FALSE)
#View(SRR6040092_counts)

#SRR6040093_counts <- read.delim("~/Downloads/Uppmax/htseq_counts/htseq_count_textaccepted_hits_sorted_tophat_out_SRR6040093_scaffold_11.1.bam.txt", header = FALSE)
#View(SRR6040093_counts)

#SRR6040096_counts <- read.delim("~/Downloads/Uppmax/htseq_counts/htseq_count_textaccepted_hits_sorted_tophat_out_SRR6040096_scaffold_11.1.bam.txt", header = FALSE)
#View(SRR6040096_counts)

#SRR6040097_counts <- read.delim("~/Downloads/Uppmax/htseq_counts/htseq_count_textaccepted_hits_sorted_tophat_out_SRR6040097_scaffold_11.1.bam.txt", header = FALSE)
#View(SRR6040097_counts)

# Naming columns
names(SRR6040092_counts)[2]<- "leaf"
names(SRR6040093_counts)[2]<- "root"
names(SRR6040096_counts)[2]<- "stem" 
names(SRR6040097_counts)[2]<- "aril"

# Merge data frames
countData <- merge(SRR6040092_counts, SRR6040093_counts, by="V1")
countData <- merge(countData,SRR6040096_counts, by="V1")
countData <- merge(countData,SRR6040097_counts, by="V1")

# Name gene column
names(countData)[1] <- "gene"

# Remove unwanted lines from data frame
countData <- countData[-c(1,2,3,4,5),]

condition <- c("non-fruit","non-fruit","non-fruit","fruit" )
names <- countData[,-1]
metaData <- data.frame(row.names=colnames(names), condition)
countData <- data.frame(row.names=countData[,1], leaf=countData[2], root=countData[3], stem=countData[4], aril=countData[5])

#View(metaData)
#View(countData)

# Analyse
dds <- DESeqDataSetFromMatrix(countData=countData, colData=metaData, design=~condition)
dds <- DESeq(dds)

# PCA
rld <- rlog(dds)
colData(dds)
plotPCA(rld,intgroup=c("condition", "sizeFactor"))

#MA
res <- results(dds)
plotMA(res)

resOrdered <- res[order(res$padj),]  #order by padj(adjusted p-value), small padj indicates large difference
sub_res <- subset(resOrdered, padj <0.01)
plotMA(sub_res) #p-val < 0.01

#Ordering
head(res)
summary(res)
#resOrdered <- res[order(res$padj),]  #order by padj(adjusted p-value), small padj indicates large difference
resOrdered=as.data.frame(resOrdered)
head(resOrdered)
resOrdered=na.omit(resOrdered)  #delete NA values
write.csv(resOrdered,"resOrdered.csv")

#write.csv(sub_res,"sub_res.csv")

#Heatmap
select<-order(rowMeans(counts(dds,normalized=TRUE)),decreasing = TRUE)[1:1057] 
nt<-normTransform(dds)
log2.norm.counts<-assay(nt)[select,]
df<-as.data.frame(colData(dds))
library(pheatmap)
pheatmap(log2.norm.counts,cluster_rows = TRUE,show_rownames = FALSE,cluster_cols = TRUE,annotation_col = df)

# Heatmap 10 genes
topVarGenes <- head( order( rowVars( assay(rld) ), decreasing=TRUE ), 10 )
heatmap.2( assay(rld)[ topVarGenes, ], scale="row",
           trace="none", dendrogram="column",
           col = colorRampPalette( rev(brewer.pal(9, "RdBu")) )(255), margins=c(1,8))




