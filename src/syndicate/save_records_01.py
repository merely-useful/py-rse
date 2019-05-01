import csv

def save_records(filename, records):
    '''Save a list of [year, temp] pairs as CSV.'''
    with open(filename, 'w') as raw:
        writer = csv.writer(raw)
        writer.writerows(records)

save_records('temp.csv', [[1, 2], [3, 4]])
