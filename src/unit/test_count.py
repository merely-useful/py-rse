from tf_idf import count_words

def test_single_word():
    assert count_words('word') == {'word' : 1}

def test_single_repeated_word():
   assert count_words('word word') == {'word' : 2}

def test_two_words():
   assert count_words('another word') == {'another' : 1, 'word' : 1}

def test_trailing_punctuation():
   assert count_words("anothers' word") == {'anothers' : 1, 'word' : 1}
