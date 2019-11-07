def add_two(x, y):
    val = x + y
    return val
    
def test_add_two_small_integers_2():
    assert add_two(1, 2) == 3
    
def test_add_integer_and_float():
    left = 1
    right = 2.0
    result = add_two(left, right)
    assert result == 3
    assert type(result) == int
