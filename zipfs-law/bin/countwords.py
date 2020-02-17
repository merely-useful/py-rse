"""Count the occurences of all words in a text and write them to a CSV-file."""
import sys
import re
import argparse
from collections import Counter
import mymodule

def count_words(reader):
    """Count the occurrence of each word in a string."""
    text = reader.read()
    findwords = re.compile(r"\w+", re.IGNORECASE)
    word_list = re.findall(findwords, text)
    word_counts = Counter(word_list)
    return word_counts

def main(args):
    """Run the command line program."""
    with args.infile as reader:
        word_counts = count_words(reader)
    mymodule.report_results(word_counts, top_n=args.n)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('infile', type=argparse.FileType('r'), nargs='?',
                        default='-', help='Input file name')
    parser.add_argument('-n', type=int, default=None,
                        help='Limit output to n most frequent words')
    args = parser.parse_args()
    main(args)
