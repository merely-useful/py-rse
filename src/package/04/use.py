import zipf

generated = zipf.generate.make_zipf(5)
print('generated distribution: {}'.format(generated))
generated[-1] *= 2
print('passes test with default tolerance: {}'.format(zipf.is_zipf(generated)))
print('passes test with tolerance of 1.0: {}'.format(zipf.is_zipf(generated, rel=1.0)))
