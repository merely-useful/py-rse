import sys
from util import create_logger

logger = create_logger('count_words', 'ERROR', 'log.csv')

count = 0
for line in sys.stdin:
    count += 1
    message = 'counter {} for {}'.format(count, line.strip())
    logger.debug(message)
    logger.warn(message)
    logger.error(message)
print(count)
