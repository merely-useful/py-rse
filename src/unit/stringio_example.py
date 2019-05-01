from io import StringIO

writer = StringIO()
for word in 'first second third'.split():
    writer.write('{}\n'.format(word))
print(writer.getvalue())

DATA = '''first
second
third'''

for line in StringIO(DATA):
    print(len(line))
