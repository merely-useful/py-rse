with open('test-01.csv', 'r') as reader:
    data = reader.read()
    lines = data.split('\n')
    print(lines)
