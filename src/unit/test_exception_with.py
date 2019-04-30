import pytest
from tf_idf import count_words

def test_text_not_empty():
    with pytest.raises(ValueError):
        count_words('')
