from Bio import SeqIO

genome = list(SeqIO.parse('../Data/Genome_files/U00096.3.gb', 'genbank'))
assert len(genome) == 1
genome = genome[0]
seq_dict = {}
for feature in genome.features:
    if feature.type == 'CDS':
        name = feature.qualifiers['locus_tag'][0] + '_' + feature.qualifiers['gene'][0]
        if name in seq_dict.keys():
            name = name + 'X'
        if 'pseudo' in feature.qualifiers:
            continue
        sequence = feature.extract(genome)
        sequence = str(sequence.seq)
        if len(sequence) <= 3:
            print('Found a short sequence: {}'.format(name))
            continue
        if sequence in list(seq_dict.values()):
            print('Identical sequence found: {}'.format(name))
            continue
        seq_dict[name] = sequence


with open('../Data/Genome_files/U00096.3.transcripts.fasta', 'w') as outfile:
    for name, sequence in seq_dict.items():
        outfile.write('>{}\n{}\n'.format(name, sequence))
