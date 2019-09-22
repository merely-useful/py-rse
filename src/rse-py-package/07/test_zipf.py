import zipfpy.generate
import zipfpy.check

def test_default_tolerance(length=5):
    generated = zipfpy.generate.make_zipf(length)
    assert zipfpy.check.is_zipf(generated)

def test_large_tolerance(length=5, relerror=1.0):
    generated = zipfpy.generate.make_zipf(length)
    assert zipfpy.check.is_zipf(generated, rel=relerror)

def test_robustness_tolerance_one(length=5):
    generated = zipfpy.generate.make_zipf(length)
    generated[-1] *= 2
    assert zipfpy.check.is_zipf(generated, rel=1.0)
