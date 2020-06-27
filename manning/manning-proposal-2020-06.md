**Book Title:** Building Research Software

**Name(s) of Author(s):**

-   Damien Irving
-   Kate Hertweck
-   Luke Johnston
-   Sara Mahallati
-   Joel Ostblom
-   Charlotte Wickham
-   Greg Wilson

**1. Tell us about yourself. **

**What are your qualifications for writing this book?**

We are all research software engineers, practicing data scientists, and/or professional educators in those fields.

**Do you have any unique characteristics or experiences that will make you stand out as the author?**

One of us co-founded Software Carpentry, a non-profit organization
that has taught programming and data analysis skills to over 50,000 people worldwide since 2010.

**2. Tell us about the book. **

**What is the technology or idea that you're writing about?**

This book covers the core skills researchers need
to develop robust software that others can use,
to share their work with others,
and to be productive as part of a research software team.
We assume readers have some basic programming knowledge, and build on that to cover:

-   using the Unix shell to manage work and make it repeatable
-   effective use of version control
-   building reusable software tools
-   automating workflows
-   configuring software
-   testing and error handling
-   creating productive, inclusive teams
-   publishing in a reproducible way

All of this material has been used and refined in workshops,
some of it by multiple instructors over many years.

**Why is it important now?**

Software is now as important to research as telescopes and test tubes,
but most researchers are never taught anything more than basic programming skills.
As a result,
they takes days or weeks to do what could be done in minutes or hours,
have no idea how reliable their software is,
and cannot share it with others.
Filling in these gaps will help researchers get more done in less time and with less pain.

**Tell us roughly how it works or what makes it different from its alternatives.**

-   Each set of tools and practices is covered in one chapter
    (except for the Unix shell and version control,
    which are each given two chapters to make exposition clearer).
-   A running example demonstrates how to transform a simple data analysis problem
    into a reproducible, reusable project.

**What type of book are you planning to write?**

-   The book is a tutorial suitable both for self-study and as a textbook in a one-semester course.
-   It could fit into either the "In Action" or "In Practice" series.
-   It includes exercises and solutions, all of which use real-world tools and examples.

**3. Please give us 5 or 6 representative tasks in the domain of your book.**

1.  Create a Unix shell script to re-run a series of data analysis steps on a new input file with a single command.
2.  Use branches, pull requests, and code review to add a feature to the Python programs invoked by that script.
3.  Create a Makefile that automatically regenerates results and plots whenever a new data file is added to the project.
4.  Add error handling and logging to the scripts so that they can be put into production.
5.  Use style-checking tools to ensure the Python code is well written, and then release it as an installable package.
6.  Adopt a license, a code of conduct, and efficient decision-making processes to ensure the project runs smoothly.
7.  Publish results with DOIs, ORCIDs, and other metadata in a fully-reproducible way.

**4. The minimally-qualified reader (MQR)**

At the beginning of the book, we introduce three personas who characterize our audience:

*Amira Khan*
completed a master's in library science five years ago
and has since worked for a small aid organization.
She did some statistics during her degree,
and has learned some R and Python by doing data science courses online,
but has no formal training in programming.
Amira would like to tidy up the scripts, data sets, and reports she has created
in order to share them with her colleagues.
These lessons will show her how to do this and what "done" looks like.

*Jun Hsu*
completed a 4-month data science bootcamp last year after doing a PhD in Geology
and now works for a company that does forensic audits.
He uses a variety of machine learning and visualization packages,
and would now like to turn some of his own work into an open source project.
This book will show him how such a project should be organized
and how to encourage people to contribute to it.

*Sami Virtanen*
became a competent programmer during a bachelor's degree in applied math
and was then hired by the university's research computing center.
The kinds of applications they are being asked to support
have shifted from fluid dynamics to data analysis;
this guide will teach them how to build and run data pipelines
so that they can pass those skills on to their users.

**5. Q&A**

*What are the three or four most commonly-asked questions about this technology?*

We wrote this book in part because the people who need it don't even know what questions to ask.
"How do I write a general rule in a Makefile?" presupposes that you know that Make exists.
Similarly,
people don't ask, "How should a small group run a meeting?"
because it doesn't occur to them that running meetings is an improvable skill.

*What are others interested in this topic asking in forums?*

All of our chapters are driven by questions we have answered (some of them many times)
in workshops or in discussions with colleagues.
Our answers for technical subjects frequently draw on Stack Overflow,
particularly for topics like continuous integration and packaging;
our answers for community management and project leadership draw on extensive experience in open source.

**6. Tell us about the competition and the ecosystem.**

*What other books are available on this topic?*

*The Turing Way* (https://the-turing-way.netlify.app/),
produced by the Turing Institute in the UK,
is the only up-to-date resource we know of with similar breadth.
Other books cover only one topic in more depth than our audience needs
(e.g., Ray & Ray's *Unix and Linux: Visual QuickStart Guide*),
are aimed at commercial software developers
(any number of books on testing, coding style, and dev ops),
or go into data science rather than telling readers
how to build software
(e.g., Zhang's upcoming *A Tour of Data Science*).

*How does the proposed book compare to them?*

1.  Our book has broader and deeper coverage, and includes exercises with solutions.

2.  Our focus on programming best practices (e.g. principles like writing modular, reusable, testable code).
    Others teach basic Python and R syntax and how to complete isolated tasks with particular libraries,
    but today, people can pick up that information from a Google search.
    Our content is the bigger picture you can't glean from online code snippets or Stack Overflow answers.

3.  We go through the process of building a data science workflow/package from scratch.
    Most other texts simply present information (like a reference book):
    we tackle a real data science problem from beginning to end,
    weaving in relevant information as we go.

4.  Our book is a ready-to-go university semester course.

*What resources would you currently recommend to someone wanting to learn this subject?*

-   The Software Carpentry and Data Carpentry lessons (for technical topics).
-   Fogel's *Open Source Software* (for project management).

*What are the most important web sites and companies associated with this topic?*

-   The Carpentries (http://carpentries.org)
-   The Turing Way (https://the-turing-way.netlify.app)

*Where do others interested in this topic gather online?*

-   The Carpentries have a very active online community (http://carpentries.org).
-   The UK's Society of Research Software Engineering (https://society-rse.org/).

**7. Book size and illustrations**

Please estimate:

-   The approximate number of published pages: 470.

-   The approximate number of diagrams and other graphics: 40.

-   The approximate number of code listings: 150.

**8. Contact information**

Formal Name (as it should appear on a book contract):

FIXME: PLEASE ADD YOURS

-   Dr. Damien B. Irving
-   Dr. Gregory V. Wilson

Name (as it would appear on a book cover):

FIXME: PLEASE ADD YOURS

-   Damien Irving
-   Greg Wilson

Mailing Address:

FIXME: PLEASE ADD YOURS

-   For Damien Irving: 124 Marlyn Road, South Hobart, Tasmania 7004, Australia
-   For Greg Wilson: 65 Highfield Road, Toronto, Ontario M4L 2T9, Canada

Preferred email:

FIXME: PLEASE ADD YOURS

-   For Damien Irving: irving.damien@gmail.com
-   For Greg Wilson: gvwilson@third-bit.com

Website/blogs/Twitter, etc:

FIXME: PLEASE ADD YOURS

-   For Damien Irving: https://damienirving.github.io/
-   For Greg Wilson: http://third-bit.com

**9. Schedule**

First draft complete.

**10. Table of Contents**

FIXME: fill in.
