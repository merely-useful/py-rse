from collections import Counter

import pytest
import numpy as np

import plotcounts
import countwords
import collate


def test_alpha():
    """Test the calculation of the alpha parameter.

    The test word counts satisfy the relationship,
      r = cf**(-1/alpha), where
      r is the rank,
      f the word count, and
      c is a constant of proportionality.

    To generate test word counts for an expected alpha value of
      1.0, a maximum word frequency of 600 is used
      (i.e. c = 600 and r ranges from 1 to 600)
    """
    max_freq = 600
    word_counts = np.floor(max_freq / np.arange(1, max_freq + 1))
    actual_alpha = plotcounts.get_power_law_params(word_counts)
    expected_alpha = pytest.approx(1.0, abs=0.01)
    assert actual_alpha == expected_alpha


def test_word_count():
    """Test the counting of words.

    The example poem is Risk, by Anais Nin.
    """
    risk_poem_counts = {'the': 3, 'risk': 2, 'to': 2, 'and': 1,
                        'then': 1, 'day': 1, 'came': 1,
                        'when': 1, 'remain': 1, 'tight': 1,
                        'in': 1, 'a': 1, 'bud': 1, 'was': 1,
                        'more': 1, 'painful': 1, 'than': 1,
                        'it': 1, 'took': 1, 'blossom': 1}
    expected_result = Counter(risk_poem_counts)
    with open('test_data/risk.txt', 'r') as reader:
        actual_result = countwords.count_words(reader)
    assert actual_result == expected_result


def test_integration():
    """Test the full word count to alpha parameter workflow."""
    with open('test_data/random_words.txt', 'r') as reader:
        word_counts_dict = countwords.count_words(reader)
    counts_array = np.array(list(word_counts_dict.values()))
    actual_alpha = plotcounts.get_power_law_params(counts_array)
    expected_alpha = pytest.approx(1.0, abs=0.01)
    assert actual_alpha == expected_alpha


def test_regression():
    """Regression test for Dracula."""
    with open('data/dracula.txt', 'r') as reader:
        word_counts_dict = countwords.count_words(reader)
    counts_array = np.array(list(word_counts_dict.values()))
    actual_alpha = plotcounts.get_power_law_params(counts_array)
    expected_alpha = pytest.approx(1.087, abs=0.001)
    assert actual_alpha == expected_alpha


def test_not_csv_error():
    """Error handling test for csv check"""
    file_name = 'data/dracula.txt'
    word_counts = Counter()
    with pytest.raises(OSError):
        collate.process_file(file_name, word_counts)


def test_missing_file_error():
    """Error handling test for missing file"""
    file_name = 'fake_file.csv'
    word_counts = Counter()
    with pytest.raises(FileNotFoundError):
        collate.process_file(file_name, word_counts)
