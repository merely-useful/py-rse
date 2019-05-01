for denom in [-5, 0, 5]:
    try:
        result = 1/denom
        print('1/{} == {}'.format(denom, result))
    except Exception as error:
        print('{} has no reciprocal: {}'.format(denom, error))
