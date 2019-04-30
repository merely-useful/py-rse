numbers = [-5, 0, 5]
for i in [0, 1, 2, 3]:
    try:
        denom = numbers[i]
        result = 1/denom
        print('1/{} == {}'.format(denom, result))
    except IndexError as error:
        print('index {} out of range'.format(i))
    except ZeroDivisionError as error:
        print('{} has no reciprocal: {}'.format(denom, error))
