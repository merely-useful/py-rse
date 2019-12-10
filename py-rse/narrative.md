This document considers what changes would need to be made to the current draft of the RSE book (19 Nov 2019) 
in order to weave a common narrative through all the chapters.

## Proposed narrative

The proposed narrative involves looking at the distribution of word frequencies in classic English novels. 
[Zipf’s Law](https://en.wikipedia.org/wiki/Zipf%27s_law) states that the second most common word
in a body of text appears half as often as the most common,
the third most common appears a third as often, and so on.
To test it, we are going to look at a bunch of ebooks that are freely available from
[Project Gutenberg](https://www.gutenberg.org/).

It was decided at the meeting on 26 November 2019 that there will be separate RSE books for Python and R. 
Both will use the Zipf's Law narrative and Project Gutenberg data files.
The remainder of this document will consider the Python book only,
as that's the one we will be completing first.

## Current state of relevant Python code

At the moment, the Zipf's Law narrative is used in the automation chapter.
The beginning of that chapter says the following:

> Our goals are:
>
> - Analyze one input file to see how well it conforms to Zipf’s Law
> - Analyze multiple input files to see how well they conform in aggregate
> - Plot individual and aggregate word frequency distributions and their expected values
>
> Our starting point is:
>
> - The books are text files in the `zipfs-law/data/` directory
> - `zipfs-law/bin/countwords.py` reads a text file and creates a CSV file with two columns: a word and  how many times the word occurs
> - `zipfs-law/bin/collate.py` takes one or more of these two-column CSV files as input and sums the counts for all occurrences of each word
> - `zipfs-law/bin/plotcounts.py` creates a plot that shows word rankings on the X axis and word counts on the Y axis
> - `zipfs-law/bin/testfit.py` compares actual distributions against theory and give a fitting score

The automation chapter then goes on to use `countwords.py` and `collate.py` in a workflow,
but `plotcounts.py` and `testfit.py` aren't used and currently don't exist
(as far as I'm aware).

In the text that follows,
I've altered the order of the chapters
because I think a different order will work better with the new narrative.

## New chapter outline

### Chapter 1: Introduction

Some text will need to be added to this chapter to introduce the narrative.
In other words, it will say something along the lines of: 

"We want to look at the distribution of word frequencies in classic English novels.
Zipf’s Law states that the second most common word in a body of text appears half as often as the most common,
the third most common appears a third as often, and so on.
To test it, we are going to look at a bunch of ebooks that are freely available from Project Gutenberg..."

### Chapter 2: Basics of the unix shell

All references to the `climate-data` directory will need to be replaced
with reference to the `zipfs-law/data/` directory.

### Chapter 3: Going further with the unix shell

The narrative in this chapter currently revolves around a little bash script called `years.sh`,
which extracts a list of years from a climate data file.
It will need to be replaced with a bash script
that extracts basic information from the ebook text files in `zipfs-law/data/`.

To be more specific, a new bash script `book_summary.sh` could extract the
book title, author and release date using the `head` command to select the relevant lines
from an ebook text file. 
(Some of the original text files will need to be edited very slightly
to ensure that this information is on exactly the same line in each file.)
Later on in the chapter,
the content on `grep` could then show how it could have been used to locate the same
information in the files 
(i.e. so the information wouldn't need to be on exactly the same line in each file.)

### Chapter 4: Command line programs

This chapter currently involves a generic script called `script_template.py`,
which can be configured using command line arguments or a configuration file.
Instead of developing the generic `script_template.py`,
this chapter could develop `countwords.py` instead.
(The current version of `countwords.py` will need to be updated to use argparse
and other libraries/concepts introduced in that chapter.)

### Chapter 5: Git at the command line

The narrative in this chapter currently involves Frances and her colleague Jean Jennings
writing a history of the ENIAC project.
Instead, in this chapter the `collate.py` script could be written from scratch,
tracking changes with Git along the way.

### Chapter 6: Advanced Git

This chapter introduces the concept of branches.
In the current draft, a violin plot is created on one branch
and a beeswarm plot on the other.
The better looking plot is then merged into the master branch.
This example could be tweaked so that two slightly different versions of 
`plotcounts.py` are developed instead
(i.e. two different ways of plotting the word count data).

### Chapter 9: Working in teams

This chapter introduces many of the basic concepts/ideas required for working with other people.
Now that we have a narrative,
this chapter can be updated to apply those concepts/ideas to the Zipf's Law project.
In particular,
in this chapter we can create a code of conduct and license for the Zipf's Law project,
as well as create a couple of GitHub issues (with labels).
One of those issues should be a bug report.

### Chapter 7: Code style, review and refactor

It's not clear how much of this chapter will ultimately end up in the novice Python book,
but nonetheless code review will definitely be introduced here.
The chapter text could be edited such that a draft version of `testfit.py`
(with deliberate flaws written in)
is presented and then reviewed/improved.

### Chapter 8: Automating analyses 

This chapter can stay pretty much as is.
The introductory paragraphs about Zipf's Law can be removed 
(because they should now appear in the introduction chapter)
and the workflows developed in the chapter could be extended to also include
`plotcounts.py` and `testfit.py`.

### Chapter 10: Project structure

Now that we've written all our scripts for the Zipf's Law analysis,
this chapter should structure it all properly (i.e. with license files and README's etc).

### Chapter 14: Correctness

This chapter introduces testing and could be updated to write tests for the Zipf's Law code.
For example, `countwords.py` could be tested using an input text file where the count
for each word is already known.

## Chapter 11: Continuous Integration

This chapter will use Travis CI to implement the tests developed in the previous chapter.

### Chapter 13: Python packaging

In the current version of this chapter,
a few relevant functions relating to the Zipf's Law analysis 
(but which haven't been introduced in earlier chapters) are added to a Python module.
That module is then packaged so it can be installed by others.

Instead of introducing new previously unseen Zipf's Law functions,
this chapter should package up all the code developed in the previous chapters
as a complete Zipf's Law package.

### Chapter 15: Publishing

This lesson could consider (hypothetically) where the results, data and code from the Zipf's Law
analysis could be published.

## Next steps

Once people are comfortable with the proposed changes,
we should have a go at writing the final Zipf's Law package
(i.e. including the four scripts, makefiles for automation, tests, etc)
so we know what we're aiming for when editing the individual chapters.
 
