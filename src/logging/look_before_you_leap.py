LOG_DIR = "/tmp/mylogdir"

def write_message(filename, message):
    if os.path.isdir(LOG_DIR):
        path = os.path.join(LOG_DIR, filename)
        with open(path, 'a') as writer:
            writer.write(message)
    else:
        print('No log directory {}'.format(LOG_DIR), file=sys.stderr)
