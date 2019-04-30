import logging

MESSAGE_FORMAT = '%(asctime)s,%(name)s,%(levelname)s,%(message)s'
DATE_FORMAT = '%Y-%m-%dT%H:%M:%S'

def create_logger(name, level, filename):

    # Create logger.
    logger = logging.getLogger(name)
    logger.setLevel(level)

    # Send messages to standard output.
    handler = logging.FileHandler(filename)

    # Define format.
    formatter = logging.Formatter(MESSAGE_FORMAT, DATE_FORMAT)

    # Stitch everything together.
    handler.setFormatter(formatter)
    logger.addHandler(handler)

    return logger
