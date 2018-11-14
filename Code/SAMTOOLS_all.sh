#!/bin/bash
sample_name='WTrep1.rna'
samtools view -bS ../${sample_name}.sam > ../${sample_name}.bam
wait
samtools sort ../${sample_name}.bam ../${sample_name}.sorted
wait
samtools index ../${sample_name}.sorted.bam ../${sample_name}.sorted.bai
wait
#
sample_name='WTrep2.rna'
samtools view -bS ../${sample_name}.sam > ../${sample_name}.bam
wait
samtools sort ../${sample_name}.bam ../${sample_name}.sorted
wait
samtools index ../${sample_name}.sorted.bam ../${sample_name}.sorted.bai
wait
#
sample_name='WTrep1.ribo'
samtools view -bS ../${sample_name}.sam > ../${sample_name}.bam
wait
samtools sort ../${sample_name}.bam ../${sample_name}.sorted
wait
samtools index ../${sample_name}.sorted.bam ../${sample_name}.sorted.bai
wait
#
sample_name='WTrep2.ribo'
samtools view -bS ../${sample_name}.sam > ../${sample_name}.bam
wait
samtools sort ../${sample_name}.bam ../${sample_name}.sorted
wait
samtools index ../${sample_name}.sorted.bam ../${sample_name}.sorted.bai
wait
########################################
sample_name='RIBOTrep1.rna'
samtools view -bS ../${sample_name}.sam > ../${sample_name}.bam
wait
samtools sort ../${sample_name}.bam ../${sample_name}.sorted
wait
samtools index ../${sample_name}.sorted.bam ../${sample_name}.sorted.bai
wait
#
sample_name='RIBOTrep2.rna'
samtools view -bS ../${sample_name}.sam > ../${sample_name}.bam
wait
samtools sort ../${sample_name}.bam ../${sample_name}.sorted
wait
samtools index ../${sample_name}.sorted.bam ../${sample_name}.sorted.bai
wait
#
sample_name='RIBOTrep1.ribo'
samtools view -bS ../${sample_name}.sam > ../${sample_name}.bam
wait
samtools sort ../${sample_name}.bam ../${sample_name}.sorted
wait
samtools index ../${sample_name}.sorted.bam ../${sample_name}.sorted.bai
wait
#
sample_name='RIBOTrep2.ribo'
samtools view -bS ../${sample_name}.sam > ../${sample_name}.bam
wait
samtools sort ../${sample_name}.bam ../${sample_name}.sorted
wait
samtools index ../${sample_name}.sorted.bam ../${sample_name}.sorted.bai
wait

#samtools sort bamfile sortedbamfile
#samtools index sortedbamfile
