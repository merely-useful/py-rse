import sys
import csv

data = {}
for row in csv.reader(sys.stdin):
    data[(row[0], row[1])] = int(row[2])
    
assert data[('text_to_words.py', 'num_lines')] <= data['word_count.py', 'num_words')]
assert data[('text_to_words.py', 'num_words')] == data['word_count.py', 'num_words')]
assert data[('word_count.py', 'num_words')] >= data['word_count.py', 'num_distinct')]
