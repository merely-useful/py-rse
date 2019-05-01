with open('test01.csv', 'r') as reader:
    for line in reader:
        fields = line.strip().split(',')
        print(fields)
