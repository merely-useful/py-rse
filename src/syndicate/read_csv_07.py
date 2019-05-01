with open('test-01.csv', 'r') as reader:
    data = reader.read()
    lines = data.strip().split('\n')
    print(lines)
