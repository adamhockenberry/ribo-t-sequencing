##My first step is to simply remove the 3' adapter sequence and filter so that the resulting reads are at least
##20nts long. All of the "nohup" terminology that you'll see here and throughout is to just store the run-time
##output into a file. These output files are the ones that say essentially how many reads the adapter was found
##in/removed from, which in this case I know is like 99.5% of the reads for each of the different lanes.
 
##This is an example, and I do this for each of the 8 lanes of data that we initially received.
nohup cutadapt -a AGATCGGAAGAGCACACGTCTGAACTCCAGTCAC -m 20 -o ribo1.trimmed.fastq.gz AM-ribo_S1_L001_R1_001.fastq.gz &> nohup.ribo1.out&

##Next I'm demultiplexing each "lane" fastq file into the subsequent "samples" based on the barcode sequences (read from 
##a little file that I made which contains the barcodes). As before, I also impose a resulting length threshold (here 15 nts)
##as well as storing the output. When run on each lane this creates a lot of files, 5 for each lane (one for each of the 4 barcodes, 
##and an "unknown" file for any reads without one of the 4 barcodes on it, which I essentially throw away from here on out).  
nohup cutadapt -m 15 -a file:../barcodes.fasta -o {name}.ribo1.fastq.gz ribo1.trimmed.fastq.gz &> nohup.demultiplex.ribo1.out&

##Now i want to put all the samples together from their constitutent lane files. In this example, since "RIBOTrep1" reads were found
##in each of the 4 "ribo" lanes, I have 4 fastq.gz files that I concatenate together into one. And of course repeat this process for 
##all samples
$ cat RIBOTrep1.ribo1.fastq.gz RIBOTrep1.ribo2.fastq.gz RIBOTrep1.ribo3.fastq.gz RIBOTrep1.ribo4.fastq.gz > RIBOTrep1.ribo.fastq.gz

##Now I can remove the last 5nt's of EVERY read since these were degenerate N's. I don't save any output here which is why
##you don't see "> blahblah&" at the end of the code line.
$ nohup cutadapt -u -5 -o RIBOTrep1.ribo.clipped.fastq.gz RIBOTrep1.ribo.fastq.gz & 

##Now, I go ahead and attempt to remove the 5' adapter sequence if it's there at all. And make sure resulting reads are at least 10nts long.
##This step does a little bit, but not much. In practice, part of the adapter is found only in between 1-5% of the reads (compared with >99% for
##the 3' adapter. But I've been aligning things all along the way and I found that the percent of reads that can be aligned is slightly
##higher by performing this step. Which is to say, the 5' adapter isn't actually on many reads, but if it is we might as well remove it
nohup cutadapt -g XACACTCTTTCCCTACACGACGCTCTTCCGATCT -m 10 -o RIBOTrep1.ribo.clippedV2.fastq.gz RIBOTrep1.ribo.clipped.fastq.gz &> nohup.RIBOTrep1.ribo.5clip.out&

##Finally, I remove the first 2 nt's of each read because these may/may not be N's. No output necessary
nohup cutadapt -u 2 -m 10 -o RIBOTrep1.ribo.final.fastq.gz RIBOTrep1.ribo.clippedV2.fastq.gz &


####END OF ADAPTER CUTTING PROTOCOL.

#On to read mapping

##HISAT2 index building. Note that I move some files around afterwars to put these guys in different folders that 
##should be clear below
$ ~/workspace/hisat2-2.1.0/hisat2-build ../Genome_files/U00096.3.fasta U00096.3.hisat2.index
$ ~/workspace/hisat2-2.1.0/hisat2-build ../Previous_genome_files/U00096_Ribo-T.frn U00096.3.hisat2.RIBOTRNA.index
$ ~/workspace/hisat2-2.1.0/hisat2-build ../Previous_genome_files/U00096.frn U00096.3.hisat2.WTRNA.index


##HISAT2 RNA filtering
##I performed this for all samples using the HISAT2_rRNA_all.sh script. Here I give brief examples
##The relevant flags here are really just saying that I use 8 cores (-p), don't write unaligned reads to a SAM file (--no-unal),
##do not allow for spliced alignment (ala eukaryotes, --no-spliced-alignment). It's also worth noting that I throw the actual mapping results 
##away since I'm curious how many reads map here but don't find it necessary to store or do anything with this
nohup ~/workspace/hisat2-2.1.0/hisat2 -x ../Previous_genome_files/HISAT2_indices/U00096.3.hisat2.WTRNA.index -p 8 --no-unal --no-spliced-alignment -U ../FASTQs/FINALS/WTrep1.rna.final.fastq.gz -S ./trash.sam &> ../nohup.WTrep1.rna.hisat2.RNAALIGN.out&
##In the case of RIBOT samples, make sure to map to the different RIBOT index that I created above
nohup ~/workspace/hisat2-2.1.0/hisat2 -x ../Previous_genome_files/HISAT2_indices/U00096.3.hisat2.RIBOTRNA.index -p 8 --no-unal --no-spliced-alignment -U ../FASTQs/FINALS/RIBOTrep1.rna.final.fastq.gz -S ./trash.sam &> ../nohup.RIBOTrep1.rna.hisat2.RNAALIGN.out&

##Okay, on to actual genome mappings that I will store
##As above this is run for all samples using the HISAT2_all.sh script but here is an example.
##Relevant flags/parameters are identical to above. Just note that I care about the SAM file now and thus name it something (-S flag)
nohup ~/workspace/hisat2-2.1.0/hisat2 -x ../Genome_files/HISAT2_indices/U00096.3.hisat2.index -p 8 --no-unal --no-spliced-alignment -U ../FASTQs/FINALS/WTrep1.rna.final.fastq.gz -S ../WTrep1.rna.sam &> ../nohup.WTrep1.rna.hisat2.out&

##Now I have .SAM files of all the reads that mapped. SAM files are enormous and can be condense a bit
##so I use samtools. Specifically, I run the script SAMTOOLS_all.sh. Here I'll annotate an example:
##This just sets a bash variable to make my life easy
sample_name='WTrep1.rna'
##Here, I create the BAM file from the SAM file
samtools view -bS ../${sample_name}.sam > ../${sample_name}.bam
##Next, I sort the BAM file which I think is usually more useful
samtools sort ../${sample_name}.bam ../${sample_name}.sorted
##Finally I index the BAM file, not sure what exactly these index files are used for but here they are incase they're needed
samtools index ../${sample_name}.sorted.bam ../${sample_name}.sorted.bai

##We can use HTSEQ to count reads mapped to each feature, and I experimented with this but ultimately am not using it. There is, however,
##a script called HTSEQ_all.sh that can be used to count feature reads if necessary.

##Finally, the last thing I am doing on the computing cluster is creating .wig files from the .SAM files. Ultimately, .SAM files will/should
##probably be deleted because they're enormous and unnecessary but they're readable and were easier to write this custom python script.
##Was looking how .wig files are normally made and it doesn't appear to be standard at all so the script sam_to_wig.py does the trick for me
##and I tested it a lot to make sure it does what I want it to. The only really important note with using this script is that I'm
##only selecting "primary" HISAT2 reads and discarding all information about multi-mapped (secondary) reads. Think this is an okay choice.
##Up until now, this is the only custom code that I'm using as opposed to off the shelf tools to manipulate the reads 

python sam_to_wig.py ../WTrep1.rna.sam

##Downstream analyses and code decriptions can be found in another location. Also in another location are the instructions for RNA-seq
##analysis using Kallisto/Sleuth as opposed to HISAT2/HTSEQ
