#!/bin/bash

sample_name='WTrep1.rna'
samtools view - 0  ../Data/BAM_files_sorted/${sample_name}.sorted.bam | awk '{print length($10)}' > ${sample_name}.0.readlengths.txt
#samtools view -f 16 ../Data/BAM_files_sorted/${sample_name}.sorted.bam | awk '{print length($10)}' > ${sample_name}.16.readlengths.txt
