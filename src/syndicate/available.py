def what_is_available(index_file, country, after):
    '''What data files include a country and have been published since 'after'?'''
    with open(index_file, 'r') as raw:
        reader = csv.reader(raw)
        filenames = []
        for record in reader:
            if (after <= record[0]) and (country in (record[1], record[2])):
                filenames.append(record[3])
    return filenames

print what_is_available('data/index.csv', 'BRA', '2014-05-27')
