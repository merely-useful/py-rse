import argparse


def main(args):
    '''Run the program.'''

    print('Input file:', args.infile)
    print('Output file:', args.outfile)


if __name__ == '__main__':

    description = 'Print options to the screen.'
    parser = argparse.ArgumentParser(description=description)

    parser.add_argument('infile', type=str, help='Input file name')
    parser.add_argument('outfile', type=str, help='Output file name')

    args = parser.parse_args()
    main(args)
