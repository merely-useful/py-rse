import csv

with open('test01.csv', 'r') as raw:
    lines = raw.readlines()
cooked = csv.reader(lines)
for record in cooked:
    print(record)
