The ``zipf`` package tallies the occurrences of words in text files
and plots each word's rank versus its frequency
together with a line for the theoretical distribution for Zipf's Law.

Motivation
----------

Zipf’s Law is often stated as an observational pattern seen in the
relationship between the frequency and rank of words in a text:

`"…the most frequent word will occur approximately twice as often
as the second most frequent word,
three times as often as the third most
frequent word, etc."`  
— `wikipedia <https://en.wikipedia.org/wiki/Zipf%27s_law>`_

Many books are available to download in plain text format
from sites such as `Project Gutenberg <https://www.gutenberg.org/>`_,
so we created this package to qualitatively explore how well different books align
with the word frequencies predicted by Zipf's Law.

Installation
------------

``pip install zipf``

Usage
-----

After installing this package,
the following three commands will be available from the command line

- ``countwords`` for counting the occurrences of words in a text.
- ``collate`` for collating multiple word count files together.
- ``plotcounts`` for visualizing the word counts.

A typical usage scenario would include running the following from your terminal::

    countwords dracula.txt > dracula.csv
    countwords moby_dick.txt > moby_dick.csv
    collate dracula.csv moby_dick.csv > collated.csv
    plotcounts collated.csv --outfile zipf-drac-moby.jpg

Additional information on each function
can be found in their docstrings and appending the ``-h`` flag,
e.g. ``countwords -h``.

Contributors
------------

- Amira Khan <amira@zipf.org>
- Sami Virtanen <sami@zipf.org>
