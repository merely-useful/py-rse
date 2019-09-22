#!/usr/bin/env python
import sys
import zipfpy.check

USAGE = '''zipf num [num...]: are the given values Zipfy?'''

if __name__ == '__main__':
    if len(sys.argv) == 1:
        print(USAGE)
    else:
        values = [int(a) for a in sys.argv[1:]]
        result = zipfpy.check.is_zipf(values)
        print('{}: {}'.format(result, values))
    sys.exit(0)
