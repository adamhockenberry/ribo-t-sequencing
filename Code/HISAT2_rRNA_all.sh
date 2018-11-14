#!/bin/bash
###HOW TO BULID THE INDEX   
#~/workspace/hisat2-2.1.0/hisat2-build ../U00096.frn U00096.3.hisat2.WTRNA.index
#~/workspace/hisat2-2.1.0/hisat2-build ../U00096_Ribo-T.frn U00096.3.hisat2.RIBOTRNA.index
#
#
#
sample_name='WTrep1.rna'
nohup ~/workspace/hisat2-2.1.0/hisat2 -x ../kolya_genome_files/HISAT2_indices/U00096.3.hisat2.WTRNA.index -p 8 --no-unal --no-spliced-alignment -U ../FASTQs/FINALS/${sample_name}.final.fastq.gz -S ./trash.sam &> ../nohup.${sample_name}.hisat2.RNAALIGN.out&
wait
sample_name='WTrep2.rna'
nohup ~/workspace/hisat2-2.1.0/hisat2 -x ../kolya_genome_files/HISAT2_indices/U00096.3.hisat2.WTRNA.index -p 8 --no-unal --no-spliced-alignment -U ../FASTQs/FINALS/${sample_name}.final.fastq.gz -S ./trash.sam &> ../nohup.${sample_name}.hisat2.RNAALIGN.out&
wait
sample_name='WTrep1.ribo'
nohup ~/workspace/hisat2-2.1.0/hisat2 -x ../kolya_genome_files/HISAT2_indices/U00096.3.hisat2.WTRNA.index -p 8 --no-unal --no-spliced-alignment -U ../FASTQs/FINALS/${sample_name}.final.fastq.gz -S ./trash.sam &> ../nohup.${sample_name}.hisat2.RNAALIGN.out&
wait
sample_name='WTrep2.ribo'
nohup ~/workspace/hisat2-2.1.0/hisat2 -x ../kolya_genome_files/HISAT2_indices/U00096.3.hisat2.WTRNA.index -p 8 --no-unal --no-spliced-alignment -U ../FASTQs/FINALS/${sample_name}.final.fastq.gz -S ./trash.sam &> ../nohup.${sample_name}.hisat2.RNAALIGN.out&
wait
##################################################
#####Note the change in input index file to match the Ribo-T construct
##################################################
sample_name='RIBOTrep1.rna'
nohup ~/workspace/hisat2-2.1.0/hisat2 -x ../kolya_genome_files/HISAT2_indices/U00096.3.hisat2.RIBOTRNA.index -p 8 --no-unal --no-spliced-alignment -U ../FASTQs/FINALS/${sample_name}.final.fastq.gz -S ./trash.sam &> ../nohup.${sample_name}.hisat2.RNAALIGN.out&
wait
sample_name='RIBOTrep2.rna'
nohup ~/workspace/hisat2-2.1.0/hisat2 -x ../kolya_genome_files/HISAT2_indices/U00096.3.hisat2.RIBOTRNA.index -p 8 --no-unal --no-spliced-alignment -U ../FASTQs/FINALS/${sample_name}.final.fastq.gz -S ./trash.sam &> ../nohup.${sample_name}.hisat2.RNAALIGN.out&
wait
sample_name='RIBOTrep1.ribo'
nohup ~/workspace/hisat2-2.1.0/hisat2 -x ../kolya_genome_files/HISAT2_indices/U00096.3.hisat2.RIBOTRNA.index -p 8 --no-unal --no-spliced-alignment -U ../FASTQs/FINALS/${sample_name}.final.fastq.gz -S ./trash.sam &> ../nohup.${sample_name}.hisat2.RNAALIGN.out&
wait
sample_name='RIBOTrep2.ribo'
nohup ~/workspace/hisat2-2.1.0/hisat2 -x ../kolya_genome_files/HISAT2_indices/U00096.3.hisat2.RIBOTRNA.index -p 8 --no-unal --no-spliced-alignment -U ../FASTQs/FINALS/${sample_name}.final.fastq.gz -S ./trash.sam &> ../nohup.${sample_name}.hisat2.RNAALIGN.out&
wait
