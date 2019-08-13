======
Zipfpy
======

This python package provides routines for generating lists of counts
that follow (exactly or approximately) a Zipf distribution, and for
testing whether a counts distribution does or doesn't follow such
a distribution.

Installation
------------

To install, clone this repository, change into the repository directory
and run the commands::

    pip install -r requirements.txt
    pip install .

Use
---

You can use the package after installation with `import zipfpy`, with functions
in the modules `check` and `generate`.

You can also use the command line tool `check_zipf.py` which tests to see if 
a provided list of countsfollows a Zipf distribution::

    $ check_zipf.py 100 50 33 25
    True: [100, 50, 33, 25]

Authors
-------

Terry Pratchett
