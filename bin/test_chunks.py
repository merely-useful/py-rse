from chunks import bad_chunk

def wrap_bad(chunk):
    return bad_chunk(('testfile', 0, chunk))

def test_naked_chunk():
    assert not wrap_bad('```')

def test_r_label():
    assert not wrap_bad('```{r label}')

def test_r_label_param():
    assert not wrap_bad('```{r label, param=value}')

def test_r_label_multi_param():
    assert not wrap_bad('```{r label-2, param=value, param=value}')

def test_r_param_only():
    assert wrap_bad('```{r param=value}')

def test_py_label():
    assert not wrap_bad('```{python label}')

def test_py_label_param():
    assert not wrap_bad('```{python label, param=value}')

def test_py_param_only():
    assert wrap_bad('```{python param=value}')

def test_unknown_lang():
    assert wrap_bad('```{unknown label}')
