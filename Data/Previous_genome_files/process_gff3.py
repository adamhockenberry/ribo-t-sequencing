with open('./blahh.gff3', 'w') as outfile:
    with open('Escherichia_coli_str_k_12_substr_mg1655.ASM584v2.37.gff3', 'r') as infile:
        for i,j in enumerate(infile.readlines()):
            if len(j.split('\t')) < 3:
                continue
            if j.split('\t')[2] == 'CDS':
                outfile.write(j.replace('Chromosome\t', 'U00096_3\t'))
