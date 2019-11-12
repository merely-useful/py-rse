import argparse
import yaml

DEFAULT_CONFIG = {
    'source': 'DEFAULT',
    'logfile': '/tmp/log.txt',
    'quiet': False,
    'overwrite': False,
    'fonts': ['Verdana', 'Serif']
}

def main(args):
    '''Run the program.'''

    if args.configfile:
        with open(args.configfile, 'r') as reader:
            config = yaml.load(reader)
            config['source'] = args.configfile
    else:
        config = DEFAULT_CONFIG

    if args.infile:
        config['infile'] = args.infile

    if args.outfile:
        config['outfile'] = args.outfile

    print('Configuration:', config)


if __name__ == '__main__':

    description = 'Print options to the screen.'
    parser = argparse.ArgumentParser(description=description)

    parser.add_argument('--configfile', type=str, help='Configuration file name')
    parser.add_argument('--infile', type=str, help='Input file name')
    parser.add_argument('--outfile', type=str, help='Output file name')

    args = parser.parse_args()
    main(args)
