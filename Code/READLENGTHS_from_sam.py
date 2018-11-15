import glob
from collections import Counter
import pandas as pd

df = pd.DataFrame()
for sam_file in glob.glob('../Data/SAM_files/*.sam')[:]:
    all_lens = []
    with open(sam_file, 'r') as infile:
        for line in infile:
            if line[0] == '@': #Ignore these lines. They are headers
                continue
            split_line = line.split('\t')
            seq = split_line[9] #In the sam file position 10 (index 9) should contain the mapped sequence
            seq_length = len(seq)
            if split_line[1] in ['0', '16']:
                all_lens.append(seq_length)
    counter_dict = Counter(all_lens)
    for key, val in counter_dict.items():
        df.set_value(key, sam_file.split('/')[-1], val)
df.to_csv('testy_df.tsv', sep='\t')    
