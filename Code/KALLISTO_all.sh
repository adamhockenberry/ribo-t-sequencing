#!/bin/bash
####Optional flags to consider include "--bias" and "--single-overhang"
sample_name='WTrep1.rna'
kallisto quant -i ../Data/Genome_files/KALLISTO_indices/U00096.3.k17.transcripts.index -o ../Data/Kallisto_output/${sample_name}.k17 --single --bias --single-overhang -l 100 -s 20 -b 100 ../Data/FASTQs/REMOVED2N/${sample_name}.final.fastq.gz 
sample_name='WTrep2.rna'
kallisto quant -i ../Data/Genome_files/KALLISTO_indices/U00096.3.k17.transcripts.index -o ../Data/Kallisto_output/${sample_name}.k17 --single --bias --single-overhang -l 100 -s 20 -b 100 ../Data/FASTQs/REMOVED2N/${sample_name}.final.fastq.gz 
sample_name='RIBOTrep1.rna'
kallisto quant -i ../Data/Genome_files/KALLISTO_indices/U00096.3.k17.transcripts.index -o ../Data/Kallisto_output/${sample_name}.k17 --single --bias --single-overhang -l 100 -s 20 -b 100 ../Data/FASTQs/REMOVED2N/${sample_name}.final.fastq.gz 
sample_name='RIBOTrep2.rna'
kallisto quant -i ../Data/Genome_files/KALLISTO_indices/U00096.3.k17.transcripts.index -o ../Data/Kallisto_output/${sample_name}.k17 --single --bias --single-overhang -l 100 -s 20 -b 100 ../Data/FASTQs/REMOVED2N/${sample_name}.final.fastq.gz 

####Repeating without bias correction or overhang mapping
sample_name='WTrep1.rna'
kallisto quant -i ../Data/Genome_files/KALLISTO_indices/U00096.3.k17.transcripts.index -o ../Data/Kallisto_output/${sample_name}.k17_nooverhang_nobias --single -l 100 -s 20 -b 100 ../Data/FASTQs/REMOVED2N/${sample_name}.final.fastq.gz 
sample_name='WTrep2.rna'
kallisto quant -i ../Data/Genome_files/KALLISTO_indices/U00096.3.k17.transcripts.index -o ../Data/Kallisto_output/${sample_name}.k17_nooverhang_nobias --single -l 100 -s 20 -b 100 ../Data/FASTQs/REMOVED2N/${sample_name}.final.fastq.gz 
sample_name='RIBOTrep1.rna'
kallisto quant -i ../Data/Genome_files/KALLISTO_indices/U00096.3.k17.transcripts.index -o ../Data/Kallisto_output/${sample_name}.k17_nooverhang_nobias --single -l 100 -s 20 -b 100 ../Data/FASTQs/REMOVED2N/${sample_name}.final.fastq.gz 
sample_name='RIBOTrep2.rna'
kallisto quant -i ../Data/Genome_files/KALLISTO_indices/U00096.3.k17.transcripts.index -o ../Data/Kallisto_output/${sample_name}.k17_nooverhang_nobias --single -l 100 -s 20 -b 100 ../Data/FASTQs/REMOVED2N/${sample_name}.final.fastq.gz 
