#!/bin/bash
sample_name='WTrep1.rna'
zcat ../Data/FASTQs/FINALS/${sample_name}.final.fastq.gz | awk 'NR%4 == 2 {lengths[length($0)]++} END {for (l in lengths) {print l, lengths[l]}}' > ${sample_name}.final.readlengths.txt
sample_name='WTrep2.rna'
zcat ../Data/FASTQs/FINALS/${sample_name}.final.fastq.gz | awk 'NR%4 == 2 {lengths[length($0)]++} END {for (l in lengths) {print l, lengths[l]}}' > ${sample_name}.final.readlengths.txt
sample_name='WTrep1.ribo'
zcat ../Data/FASTQs/FINALS/${sample_name}.final.fastq.gz | awk 'NR%4 == 2 {lengths[length($0)]++} END {for (l in lengths) {print l, lengths[l]}}' > ${sample_name}.final.readlengths.txt
sample_name='WTrep2.ribo'
zcat ../Data/FASTQs/FINALS/${sample_name}.final.fastq.gz | awk 'NR%4 == 2 {lengths[length($0)]++} END {for (l in lengths) {print l, lengths[l]}}' > ${sample_name}.final.readlengths.txt
sample_name='RIBOTrep1.rna'
zcat ../Data/FASTQs/FINALS/${sample_name}.final.fastq.gz | awk 'NR%4 == 2 {lengths[length($0)]++} END {for (l in lengths) {print l, lengths[l]}}' > ${sample_name}.final.readlengths.txt
sample_name='RIBOTrep2.rna'
zcat ../Data/FASTQs/FINALS/${sample_name}.final.fastq.gz | awk 'NR%4 == 2 {lengths[length($0)]++} END {for (l in lengths) {print l, lengths[l]}}' > ${sample_name}.final.readlengths.txt
sample_name='RIBOTrep1.ribo'
zcat ../Data/FASTQs/FINALS/${sample_name}.final.fastq.gz | awk 'NR%4 == 2 {lengths[length($0)]++} END {for (l in lengths) {print l, lengths[l]}}' > ${sample_name}.final.readlengths.txt
sample_name='RIBOTrep2.ribo'
zcat ../Data/FASTQs/FINALS/${sample_name}.final.fastq.gz | awk 'NR%4 == 2 {lengths[length($0)]++} END {for (l in lengths) {print l, lengths[l]}}' > ${sample_name}.final.readlengths.txt
#
sample_name='AM-ribo_S1_L001_R1_001'
zcat ../Data/FASTQs/ORIGINALS/${sample_name}.fastq.gz | awk 'NR%4 == 2 {lengths[length($0)]++} END {for (l in lengths) {print l, lengths[l]}}' > ${sample_name}.readlengths.txt
sample_name='AM-ribo_S1_L002_R1_001'
zcat ../Data/FASTQs/ORIGINALS/${sample_name}.fastq.gz | awk 'NR%4 == 2 {lengths[length($0)]++} END {for (l in lengths) {print l, lengths[l]}}' > ${sample_name}.readlengths.txt
sample_name='AM-ribo_S1_L003_R1_001'
zcat ../Data/FASTQs/ORIGINALS/${sample_name}.fastq.gz | awk 'NR%4 == 2 {lengths[length($0)]++} END {for (l in lengths) {print l, lengths[l]}}' > ${sample_name}.readlengths.txt
sample_name='AM-ribo_S1_L004_R1_001'
zcat ../Data/FASTQs/ORIGINALS/${sample_name}.fastq.gz | awk 'NR%4 == 2 {lengths[length($0)]++} END {for (l in lengths) {print l, lengths[l]}}' > ${sample_name}.readlengths.txt
sample_name='AM-RNA_S2_L001_R1_001'
zcat ../Data/FASTQs/ORIGINALS/${sample_name}.fastq.gz | awk 'NR%4 == 2 {lengths[length($0)]++} END {for (l in lengths) {print l, lengths[l]}}' > ${sample_name}.readlengths.txt
sample_name='AM-RNA_S2_L002_R1_001'
zcat ../Data/FASTQs/ORIGINALS/${sample_name}.fastq.gz | awk 'NR%4 == 2 {lengths[length($0)]++} END {for (l in lengths) {print l, lengths[l]}}' > ${sample_name}.readlengths.txt
sample_name='AM-RNA_S2_L003_R1_001'
zcat ../Data/FASTQs/ORIGINALS/${sample_name}.fastq.gz | awk 'NR%4 == 2 {lengths[length($0)]++} END {for (l in lengths) {print l, lengths[l]}}' > ${sample_name}.readlengths.txt
sample_name='AM-RNA_S2_L004_R1_001'
zcat ../Data/FASTQs/ORIGINALS/${sample_name}.fastq.gz | awk 'NR%4 == 2 {lengths[length($0)]++} END {for (l in lengths) {print l, lengths[l]}}' > ${sample_name}.readlengths.txt
