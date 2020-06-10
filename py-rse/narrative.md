This document outlines the changes that need to be made to the RSE Python book
in order to weave a common narrative through all the chapters.

## Narrative and code

The narrative involves looking at the distribution of word frequencies in classic English novels.
[Zipf’s Law](https://en.wikipedia.org/wiki/Zipf%27s_law) states that the second most common word
in a body of text appears half as often as the most common,
the third most common appears a third as often, and so on.
To test it, we are going to look at a bunch of ebooks that are freely available from
[Project Gutenberg](https://www.gutenberg.org/).

Three basic scripts are developed as we move through the chapters to achieve this task:

* `zipfs_law/bin/countwords.py`: for counting the words in a text (produces .csv output)
* `zipfs_law/bin/collate.py`: for collating the word count from more than one text
* `zipfs_law/bin/plotcounts.py`: for plotting the word count

## Chapter outline

### Chapter 1: Introduction

Some text needs to be added to this chapter to introduce the narrative.
In other words, it should say something along the lines of:

"We want to look at the distribution of word frequencies in classic English novels.
Zipf’s Law states that the second most common word in a body of text
appears half as often as the most common,
the third most common appears a third as often, and so on.
To test it, we are going to look at a bunch of ebooks
that are freely available from Project Gutenberg..."

### Chapter 2: Basics of the unix shell

All references to the `climate-data` directory need to be replaced
with reference to the `zipfs_law/data/` directory.

### Chapter 3: Going further with the unix shell

The narrative in this chapter currently revolves
around a little bash script called `years.sh`,
which extracts a list of years from a climate data file.
It needs to be replaced with the new bash script `zipfs_law/bin/book_summary.sh`,
which has been developed to extract the book title and author
by using the `head` and `tail` commands to select relevant lines
from an ebook text file.
(Some of the original ebook text files have been edited slightly
to ensure that this information is on exactly the same line in each file.)
Later on in the chapter,
the content on `grep` could be edited to show how the same
title and author information could be extracted using `grep`.

### Chapter 4: Command line programs

This chapter currently involves a generic script called `script_template.py`,
which can be configured using command line arguments.
Instead of developing the generic `script_template.py`,
this chapter needs to be updated so that it develops the
`zipfs_law/bin/countwords.py`, `zipfs_law/bin/collate.py` and
`zipfs_law/bin/plotcounts.py` scripts.

Instead of writing the final version of `plotcounts.py`,
in this lesson a sub-optimal word count vs 1/rank plot will be implemented
so that it can be improved upon in subsequent chapters:
see `plotcounts_rank.py` for details.
The rationale behind this approach to plotting the data is that mathematically,
Zipf's Law might be written as "word frequency is proportional to 1/rank."

### Chapter 5: Git at the command line

The narrative in this chapter currently involves Frances and her colleague Jean Jennings
writing a history of the ENIAC project.
This narrative needs to be changed so that `plotcounts.py` is updated to draw a log-log plot
(see `zipfs_law/bin/plotcounts_log.py`)
to instead of the inferior word count vs 1/rank approach from Chapter 4
(see `zipfs_law/bin/plotcounts_rank.py`).

The disadvantage of the 1/rank plot is that it tends to visually
over-emphasize the very frequent words.
It's therefore hard to see what's happening for words that appear less than 500 times.
The rationale for switching to a log-log plot is that Zipf's Law is an example of a power law.
In general, when two variables (x) and (y) are related through a power law [ y = ax^b ],
taking logarithms of both sides yields a linear relationship: [ \log(y) = \log(a) + b\log(x) ].
Hence, plotting the variables on a log-log scale should reveal this linear relationship.

### Chapter 6: Advanced Git

This chapter introduces the concept of branches.
In the current draft, a violin plot is created on one branch
and a beeswarm plot on the other.
The better looking plot is then merged into the master branch.

This narrative needs to be changed so that a new branch is created
to work on fitting a curve to the word count data instead.
Specifically, we need to estimate the power law exponent
so it can be added it as a line on our log-log plot.
This is done by adding relevant code
(i.e. the `get_power_law_params`, `nlog_likelihood` and `plot_fit` functions) to `plotcounts.py`,
starting from the version of the script
at the end of Chapter 5 (`zipfs_law/bin/plotcounts_log.py`).
The end result is `zipfs_law/bin/plotcounts_fit.py`.

At the end of this chapter we are finally in a position to verify Zipfs Law.
In the beginning we introduced the Law as:

*Zipf’s Law states that the second most common word in a body of text
appears half as often as the most common,
the third most common appears a third as often, and so on.*

The alpha value returned by `plotcounts.py` for Moby Dick is 1.1, for instance,
so the correct statement for that text would be,

*the most frequent word will occur approximately 2<sup>1.1</sup> = 2.14
times as often as the second most frequent word,
3<sup>1.1</sup> = 3.35 times as often as the third most frequent word, etc*

which is pretty close.

Here's the [issue](https://github.com/merely-useful/merely-useful.github.io/issues/288)
where we discuss theory behind the power law stuff in detail.

### Chapter 7: Automating analyses

This chapter can stay pretty much as is.
The introductory paragraphs about Zipf's Law can be removed
(because they should now appear in the introduction chapter)
and the workflows developed in the chapter need to be extended to also include
`plotcounts.py` (as it appears in `zipfs_law/bin/plotcounts_fit.py`).

### Chapter 8: Program configuration

This chapter introduces overlay configuration and applies it by
adding relevant functionality to `plotcounts.py`.
Specifically, the program will accept a YAML file to configure aspects of [`matplotlib.rcParams`](https://matplotlib.org/3.1.1/tutorials/introductory/customizing.html).

Note (from that hyperlink) that there is an rcParams configuration file
somewhere on your system, but by default everything is commented out.
You can find it by using:
```
>>> import matplotlib as mpl
>>> mpl.matplotlib_fname()
/Users/damienirving/anaconda/envs/merely/lib/python3.7/site-packages/matplotlib/mpl-data/matplotlibrc
```

To put this all in context, this chapter talks about the following levels of configuration:

1. A system-wide configuration file for general settings.
2. A user-specific configuration file for personal preferences. [e.g. `matplotlibrc`]
3. A job-specific file with settings for a specific run. [e.g. `zipfs_law/bin/plot_params.yml`]
4. Command-line options to change things that commonly change. [e.g. `argparse`]

At the end of this chapter the `plotcounts.py` script should look like
`zipfs_law/bin/plotcounts_config.py`.

### Chapter 9: Error handling

This chapter introduces error handling and applies it to one or more of
`countwords.py`, `collate.py` or `plotcounts.py`.
(I haven't yet figured out which of those scripts would be best to add error handling to...)

### Chapter 10: Working in teams

This chapter introduces many of the basic concepts/ideas required for working with other people.
Now that we have a narrative,
this chapter can be updated to apply those concepts/ideas to the Zipf's Law project.
In particular,
in this chapter we can create a code of conduct and license for the Zipf's Law project,
as well as create a couple of GitHub issues (with labels).
One of those issues should be a bug report.

### Chapter 11: Code style, review and refactor

It's not clear how much of this chapter will ultimately end up in the novice Python book,
but nonetheless code review will definitely be introduced here.

This chapter should review the `countwords.py`, `collate.py` and/or `plotcounts.py` scripts
using the code style, review and refactor principles introduced in the chapter.
One option here would be to remove the `--xlim` option from earlier versions of `plotcounts.py`
and add it in this chapter (i.e. as part of a review of that script).

### Chapter 12: Project structure

Now that we've written all our scripts for the Zipf's Law analysis,
this chapter should structure it all properly (i.e. with license files and README's etc).

### Chapter 13: Python packaging

In the current version of this chapter,
a few relevant functions relating to the Zipf's Law analysis
(but which haven't been introduced in earlier chapters) are added to a Python module.
That module is then packaged so it can be installed by others.

Instead of introducing new previously unseen Zipf's Law functions,
this chapter should package up all the code developed in the previous chapters
as a complete Zipf's Law package.

### Chapter 14: Correctness

This chapter introduces testing and needs to be updated to write tests for the Zipf's Law code.
For example, `countwords.py` could be tested using an input text file where the count
for each word is already known.

### Chapter 15: Continuous integration

This chapter needs to be updated so the tests developed in the previous chapter
are implemented using Travis CI.

### Chapter 16: Publishing

This lesson should consider (hypothetically) where the results,
data and code from the Zipf's Law analysis could be published.
