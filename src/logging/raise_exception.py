for number in [1, 0, -1]:
    try:
        if number < 0:
            raise ValueError('negative values not supported: {}'.format(number))
        print(number)
    except ValueError as error:
        print('exception: {}'.format(error))
