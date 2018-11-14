#!/bin/bash
###HOW TO BULID THE INDEX   
#~/workspace/hisat2-2.1.0/hisat2-build U00096.3.fasta U00096.3.hisat2.index
#
#
#
sample_name='WTrep1.rna'
nohup ~/workspace/hisat2-2.1.0/hisat2 -x ../Genome_files/HISAT2_indices/U00096.3.hisat2.index -p 8 --no-unal --no-spliced-alignment -U ../FASTQs/FINALS/${sample_name}.final.fastq.gz -S ../${sample_name}.sam &> ../nohup.${sample_name}.hisat2.out&
wait
#
sample_name='WTrep2.rna'
nohup ~/workspace/hisat2-2.1.0/hisat2 -x ../Genome_files/HISAT2_indices/U00096.3.hisat2.index -p 8 --no-unal --no-spliced-alignment -U ../FASTQs/FINALS/${sample_name}.final.fastq.gz -S ../${sample_name}.sam &> ../nohup.${sample_name}.hisat2.out&
wait
#
sample_name='RIBOTrep1.rna'
nohup ~/workspace/hisat2-2.1.0/hisat2 -x ../Genome_files/HISAT2_indices/U00096.3.hisat2.index -p 8 --no-unal --no-spliced-alignment -U ../FASTQs/FINALS/${sample_name}.final.fastq.gz -S ../${sample_name}.sam &> ../nohup.${sample_name}.hisat2.out&
wait
#
sample_name='RIBOTrep2.rna'
nohup ~/workspace/hisat2-2.1.0/hisat2 -x ../Genome_files/HISAT2_indices/U00096.3.hisat2.index -p 8 --no-unal --no-spliced-alignment -U ../FASTQs/FINALS/${sample_name}.final.fastq.gz -S ../${sample_name}.sam &> ../nohup.${sample_name}.hisat2.out&
wait
#
sample_name='WTrep1.ribo'
nohup ~/workspace/hisat2-2.1.0/hisat2 -x ../Genome_files/HISAT2_indices/U00096.3.hisat2.index -p 8 --no-unal --no-spliced-alignment -U ../FASTQs/FINALS/${sample_name}.final.fastq.gz -S ../${sample_name}.sam &> ../nohup.${sample_name}.hisat2.out&
wait
#
sample_name='WTrep2.ribo'
nohup ~/workspace/hisat2-2.1.0/hisat2 -x ../Genome_files/HISAT2_indices/U00096.3.hisat2.index -p 8 --no-unal --no-spliced-alignment -U ../FASTQs/FINALS/${sample_name}.final.fastq.gz -S ../${sample_name}.sam &> ../nohup.${sample_name}.hisat2.out&
wait
#
sample_name='RIBOTrep1.ribo'
nohup ~/workspace/hisat2-2.1.0/hisat2 -x ../Genome_files/HISAT2_indices/U00096.3.hisat2.index -p 8 --no-unal --no-spliced-alignment -U ../FASTQs/FINALS/${sample_name}.final.fastq.gz -S ../${sample_name}.sam &> ../nohup.${sample_name}.hisat2.out&
wait
#
sample_name='RIBOTrep2.ribo'
nohup ~/workspace/hisat2-2.1.0/hisat2 -x ../Genome_files/HISAT2_indices/U00096.3.hisat2.index -p 8 --no-unal --no-spliced-alignment -U ../FASTQs/FINALS/${sample_name}.final.fastq.gz -S ../${sample_name}.sam &> ../nohup.${sample_name}.hisat2.out&
wait

