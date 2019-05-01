import csv

def save_records(left, right, records):
    '''Save a list of [year, temp] pairs as CSV.'''
    filename = left + '-' + right + '.csv'
    with open(filename, 'w') as raw:
        writer = csv.writer(raw)
        writer.writerows(records)

save_records('AUS', 'BRA', [[1, 2], [3, 4]])
