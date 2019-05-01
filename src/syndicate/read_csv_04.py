import csv

with open('test01.csv', 'r') as raw:
    cooked = csv.reader(raw)
    for record in cooked:
        print(record)
