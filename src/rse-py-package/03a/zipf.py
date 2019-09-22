import sys
from pytest import approx


USAGE = '''zipf num [num...]: are the given values Zipfy?'''
RELATIVE_ERROR = 0.05


def make_zipf(length):
    assert length > 0, 'Zipf distribution must have at least one element'
    result = [1/(1 + i) for i in range(length)]
    return result


def make_noisy_zipf(length, rel=RELATIVE_ERROR):
    data = make_zipf(length)
    minnoise = 1.0 - rel/2
    maxnoise = 1.0 + rel/2
    for i in range(length):
        data[i] = data[i]*random_uniform(minnoise, maxnoise)
    return data


def is_zipf(hist, rel=RELATIVE_ERROR):
    assert len(hist) > 0, 'Cannot test Zipfiness without data'
    scaled = [h/hist[0] for h in hist]
    perfect = make_zipf(len(hist))
    return scaled == approx(perfect, rel=rel)


def is_unsorted_zipf(hist, rel=RELATIVE_ERROR):
    sortedhist = sorted(hist)
    return is_zipf(unsorted)


if __name__ == '__main__':
    if len(sys.argv) == 1:
        print(USAGE)
    else:
        values = [int(a) for a in sys.argv[1:]]
        result = is_zipf(values)
        print('{}: {}'.format(result, values))
    sys.exit(0)
