"""Combine multiple word count CSV-files into a single cumulative count."""
import csv
import argparse
from collections import Counter
import logging
import utilities


def update_counts(reader, word_counts):
    """Update word counts with data from another reader/file."""
    for word, count in csv.reader(reader):
        word_counts[word] += int(count)

def main(args):
    """Run the command line program."""
    log_level = logging.DEBUG if args.verbose else logging.WARNING
    logging.basicConfig(level=log_level, filename=args.logfile)
    word_counts = Counter()
    logging.info('Processing files...')
    for file_name in args.infiles:
        logging.debug(f'Reading in {file_name}...')
        if file_name[-4:] != '.csv':
            raise OSError('The filename must end in `.csv`')
        with open(file_name, 'r') as reader:
            logging.debug('Computing word counts...')
            update_counts(reader, word_counts)
    utilities.collection_to_csv(word_counts, num=args.num)

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('infiles', type=str, nargs='*', help='Input file names')
    parser.add_argument('-n', '--num', type=int, default=None,
                        help='Limit output to N most frequent words')
    parser.add_argument('-v', '--verbose', action="store_true", default=False,
                        help="Change logging threshold from WARNING to DEBUG")
    parser.add_argument('-l', '--logfile', type=str, default='collate.log',
                        help='Name of the log file')
    args = parser.parse_args()
    main(args)
