## New book: Research Software Engineering with Python

*Damien Irving, Kate Hertweck, Luke Johnston, Joel Ostblom, Charlotte Wickham, Greg Wilson*

A big part of the Carpentries success is the two-day workshop format,
but that hasn't stopped countless instructors over the years speculating
about the great things we could teach if only we had more time.
With an entire semester, for instance,
you could take researchers through the entire lifecycle of a data analysis project,
from the initial setup and code development
through to a fully automated data processing pipeline and published software package.
A small group of us decided to act on that speculation a few years ago,
and set about writing *Research Software Engineering with Python*.
It effectively represents our attempt at lesson materials for a Software Carpentry workshop
that runs for the duration of a university semester course. 

The book follows Amira and Sami as they work together to write a software package to address a real research question.
The data analysis task relates to a fascinating result in the field of quantitative linguistics.
Zipf’s Law states that the second most common word in a large body of text appears half as often as the most common,
the third most common appears a third as often, and so on.
To test whether Zipf’s Law holds for a collection of classic novels that are freely available from Project Gutenberg,
Amira and Sami write a software package that counts and analyses the word frequency distribution in any arbitrary body of text.

In the process of writing and publishing this Python package to verify Zipf’s Law, the book covers how to do the following:

- Organise small and medium-sized data science projects.
- Use the Unix shell to efficiently manage your data and code.
- Write Python programs that can be used on the command line.
- Use Git and GitHub to track and share your work.
- Work productively in a small team where everyone is welcome.
- Use Make to automate complex workflows.
- Enable users to configure your software without modifying it directly.
- Test your software and know which parts have not yet been tested.
- Find, handle, and fix errors in your code.
- Publish your code and research in open and reproducible ways.
- Create Python packages that can be installed in standard ways.

The book is available for
[purchase now](https://www.routledge.com/Research-Software-Engineering-with-Python-Building-software-that-makes/Irving-Hertweck-Johnston-Ostblom-Wickham-Wilson/p/book/9780367698324)
(all proceeds go to The Carpentries)
and the content and associated code is licensed under a CC-BY 4.0 and MIT License,
so there’s also a freely available [web version](https://merely-useful.tech/py-rse/).
A corresponding book for R users is also currently under development
(see the live development version [here](https://merely-useful.tech/r-rse/)).

Much of the content in the early chapters of the book borrows from existing Software Carpentry lessons (e.g. unix shell, version control),
but the later chapters cover a number of topics that either aren't included in the current offerings of Carpentries lessons at all
or that are currently only at the Incubator stage of development
(e.g. elements of the program configuration, error handing, provenance tracking and python packaging chapters).
The book might therefore be a useful reference for people developing new lessons. 

Comments and suggestions are more than welcome at the book’s [GitHub repository](https://github.com/merely-useful/py-rse) –
we’d be particularly keen to hear from anyone (before, during or after)
who uses it as a textbook for a university semester course or an extended Carpentries-style workshop. 
