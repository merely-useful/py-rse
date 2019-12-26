This document outlines the changes that need to be made to the RSE Python book  
in order to weave a common narrative through all the chapters.

## Narrative

The narrative involves looking at the distribution of word frequencies in classic English novels. 
[Zipf’s Law](https://en.wikipedia.org/wiki/Zipf%27s_law) states that the second most common word
in a body of text appears half as often as the most common,
the third most common appears a third as often, and so on.
To test it, we are going to look at a bunch of ebooks that are freely available from
[Project Gutenberg](https://www.gutenberg.org/).

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
with reference to the `zipfs-law/data/` directory.

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
this chapter should develop `zipfs_law/bin/countwords.py` instead.

### Chapter 5: Git at the command line

The narrative in this chapter currently involves Frances and her colleague Jean Jennings
writing a history of the ENIAC project.
Instead, in this chapter the `zipfs_law/bin/collate.py` script should be written from scratch,
tracking changes with Git along the way.

### Chapter 6: Advanced Git

This chapter introduces the concept of branches.
In the current draft, a violin plot is created on one branch
and a beeswarm plot on the other.
The better looking plot is then merged into the master branch.
This example needs to be changed so that two slightly different versions of 
`zipfs_law/bin/plotcounts.py` are developed instead.
The two different ways of plotting the word count data that can be explored are:

1. Word frequency versus 1/rank.

```
df = pd.read_csv(input_csv, header=None, names=('word', 'word frequency'))
df['rank'] = df['word frequency'].rank(ascending=False)
df['1/rank'] = 1 / df['rank'] 
df.plot.scatter(x='word frequency', y='1/rank', figsize=[12, 6], grid=True)
```
Rationale: Mathematically, Zipfs Law might be written as:
word frequency is proportional to 1/rank.

Advantages: Simple to interpret (because no log axes).

Disadvantage: Tends to visually over-emphasize the very frequent words.
It's hard to see what is happening for words that appear less than 500 times.

2. A log-log plot showing word frequency versus rank.

```
df = pd.read_csv(input_csv, header=None, names=('word', 'word frequency'))
df['rank'] = df['word frequency'].rank(ascending=False)
df.plot.scatter(x='word frequency', y='rank', loglog=True, figsize=[12, 6], grid=True)
```

Rationale: Zipfs Law is an example of a power law.
In general, when two variables (x) and (y) are related through a power law [ y = ax^b ],
taking logarithms of both sides yields a linear relationship: [ \log(y) = \log(a) + b\log(x) ].
Hence, plotting the variables on a log-log scale should reveal this linear relationship.

This is the option we want to go with.

(This basic version of `plotcounts.py` developed in this chapter
should not accept configuration files or apply any error handling.
These additions to the script will happen in subsequent chapters.)

### Chapter 7: Automating analyses 

This chapter can stay pretty much as is.
The introductory paragraphs about Zipf's Law can be removed 
(because they should now appear in the introduction chapter)
and the workflows developed in the chapter need to be extended to also include
`plotcounts.py`.

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
2. A user-specific configuration file for personal preferences. [`matplotlibrc`]
3. A job-specific file with settings for a specific run. [`zipfs_law/bin/plot_params.yml`]
4. Command-line options to change things that commonly change. [`argparse`]

### Chapter 9: Error handling

This chapter introduces error handling and applies it to one or more of
`countwords.py`, `collate.py` or `plotwords.py`.

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

Consistent with [this comment](https://github.com/merely-useful/merely-useful.github.io/issues/288#issuecomment-568631571),
the one thing we are yet to do is estimate the power law exponent
so we can add it as a line on our log-log plot. 

Code for estimating the power law exponent and adding a corresponding line to the plot
could be added to `plotcounts.py` in this chapter with deliberate flaws written in,
and then reviewed/improved.

### Chapter 12: Project structure

Now that we've written all our scripts for the Zipf's Law analysis,
this chapter should structure it all properly (i.e. with license files and README's etc).

### Chapter 13: Correctness

This chapter introduces testing and needs to be updated to write tests for the Zipf's Law code.
For example, `countwords.py` could be tested using an input text file where the count
for each word is already known.

### Chapter 14: Continuous integration

This chapter needs to be updated so the tests developed in the previous chapter
are implemented using Travis CI.

### Chapter 15: Python packaging

In the current version of this chapter,
a few relevant functions relating to the Zipf's Law analysis 
(but which haven't been introduced in earlier chapters) are added to a Python module.
That module is then packaged so it can be installed by others.

Instead of introducing new previously unseen Zipf's Law functions,
this chapter should package up all the code developed in the previous chapters
as a complete Zipf's Law package.

### Chapter 16: Publishing

This lesson should consider (hypothetically) where the results,
data and code from the Zipf's Law analysis could be published.
 
