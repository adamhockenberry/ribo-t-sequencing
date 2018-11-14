from Bio import SeqIO
import argparse
import numpy as np

'''
Only input necessary is the path to the .SAM file that you want to analyze.
Genome file location is necessary to be correct (see below) for the code to run.

Free parameters that can be changed below are whether to restrict lengths of reads,
currently this is being done.

Super important is the parsing of the CIGAR strings. Depending on your file
this script may need to be altered, but for these files it was tested extensively
to ensure that reads are periodic, positive and negative strand genes look correct, etc.
But that all being said if any new files are run you must check this section and 
possibly alter it substantially.

Also worth noting is that this code only selects HISAT2's primary alignment and ignores
secondary alignments entirely.

-AJH

'''

if __name__ == '__main__':
    ######Parse input arguments
    parser = argparse.ArgumentParser()
    parser.add_argument('filename')
    args = parser.parse_args()
    # print(args.filename)
    assert args.filename.count('.sam') == 1
    #######Set free parameters
    length_restriction = (20, 40)
    #######Get file names to write wig data to
    wiggle_out_f = args.filename.replace('.sam', '_cigar_fulladjust_f.wig')
    wiggle_out_r = args.filename.replace('.sam', '_cigar_fulladjust_r.wig')
    #######Read the genome
    genome_list = list(SeqIO.parse('../Genome_files/U00096.3.gb', 'genbank'))
    assert len(genome_list) == 1
    genome = genome_list[0]
    
    #######Instantiate empty arrays to hold information
    genome_length = len(genome.seq)
    fwd_array = np.zeros(genome_length, dtype=np.int) #These arrays will contain position:read_count pairs for all mapped locations
    rev_array = np.zeros(genome_length, dtype=np.int)
    errors = []
    with open(args.filename, 'r') as infile:
        for line in infile:
            if line[0] == '@': #Ignore these lines. They are headers
                continue
            split_line = line.split('\t')
            seq = split_line[9] #In the sam file position 10 (index 9) should contain the mapped sequence
            seq_length = len(seq)
            if seq_length < length_restriction[0] or seq_length > length_restriction[1]: #ignore reads outside of length restriction
                continue
            #####Get positions of the reads
            start_loc = int(split_line[3])-1 #I noticed the subtraction of one is necessary for proper indexing
            end_loc = start_loc+seq_length

            #######################################################################################################
            #####Much tuning went into parsing the cigar lines to make sure they work. No promises for new data files
            #####but tests show that these flags/manipulations all seem correct
            #######################################################################################################
            cigar = split_line[5]
            if len(cigar) == 3: ###The read should be pretty straightforward
                pass
            elif len(cigar) == 5: ###Slight alignment errors require adjustments depending on the strand
                if split_line[1] in ['16', '272']: ###Everything should be straightforward for these though
                    pass
                elif cigar[1] == 'S' and split_line[1] in ['0', '256']: ###HERE ARE ADJUSTMENTS THAT NEED TO BE MADE
                    end_loc = end_loc - int(cigar[0])
                elif cigar[-1] == 'S' and split_line[1] in ['0', '256']:
                    end_loc = end_loc - int(cigar[-2])
            elif len(cigar) == 7 and cigar[1] == 'S' and cigar[-1] == 'S': ##Slightly more complicated errors
                if split_line[1] in ['16', '272']:
                    pass
                elif split_line[1] in ['0', '256']:
                    end_loc = end_loc - int(cigar[0])-int(cigar[-2])
            else: ###Write the other errors to file later to inspect and consider how to fix
                #print(split_line)
                #if split_line[1] in ['0', '16']:
                #    print(line)
                #    print(genome.seq[start_loc:end_loc])
                errors.append(line)
                continue
            #########################################################################
            ######Add read to relevant dictionaries, BUT ONLY IF IT IS A PRIMARY READ
            #########################################################################
            if split_line[1] in ['0']:
                try:
                    fwd_array[end_loc] += 1
                except IndexError:        
                    fwd_array[end_loc%genome_length] += 1
            elif split_line[1] in ['16']:
                try:
                    rev_array[start_loc] += 1
                except IndexError:
                    rev_array[start_loc%genome_length] += 1
    #########################################################################
    ###Write the data
    #########################################################################
    with open(wiggle_out_f, 'w') as f, \
            open(wiggle_out_r, 'w') as r:
        f.write('variableStep chrom=U00096.3\n')
        r.write('variableStep chrom=U00096.3\n')
        for i, (fv, rv) in enumerate(zip(fwd_array, rev_array)):
            if fv:
                f.write('{}\t{}\n'.format(i, fv))
            if rv:
                r.write('{}\t{}\n'.format(i, rv))
    #########################################################################
    ###Print the error lines to standard out
    #########################################################################
    print('Total errors: {}'.format(len(errors)))
    for error in errors[:100]:
        print(error)
