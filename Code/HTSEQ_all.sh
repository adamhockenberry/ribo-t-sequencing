#!/bin/bash
sample_name='WTrep1.rna'
htseq-count -i=gene -t CDS -f bam ../${sample_name}.sorted.bam ../Genome_files/U00096.3.gff3 > ../${sample_name}.htseq.txt
sample_name='WTrep2.rna'
htseq-count -i=gene -t CDS -f bam ../${sample_name}.sorted.bam ../Genome_files/U00096.3.gff3 > ../${sample_name}.htseq.txt
sample_name='WTrep1.ribo'
htseq-count -i=gene -t CDS -f bam ../${sample_name}.sorted.bam ../Genome_files/U00096.3.gff3 > ../${sample_name}.htseq.txt
sample_name='WTrep2.ribo'
htseq-count -i=gene -t CDS -f bam ../${sample_name}.sorted.bam ../Genome_files/U00096.3.gff3 > ../${sample_name}.htseq.txt
#
#
sample_name='RIBOTrep1.rna'
htseq-count -i=gene -t CDS -f bam ../${sample_name}.sorted.bam ../Genome_files/U00096.3.gff3 > ../${sample_name}.htseq.txt
sample_name='RIBOTrep2.rna'
htseq-count -i=gene -t CDS -f bam ../${sample_name}.sorted.bam ../Genome_files/U00096.3.gff3 > ../${sample_name}.htseq.txt
sample_name='RIBOTrep1.ribo'
htseq-count -i=gene -t CDS -f bam ../${sample_name}.sorted.bam ../Genome_files/U00096.3.gff3 > ../${sample_name}.htseq.txt
sample_name='RIBOTrep2.ribo'
htseq-count -i=gene -t CDS -f bam ../${sample_name}.sorted.bam ../Genome_files/U00096.3.gff3 > ../${sample_name}.htseq.txt
