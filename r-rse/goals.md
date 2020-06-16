# RSE Goals

The intermediate course starts with a few (simple)
pre-prepared scripts/programs for processing/analysing data.
(Perhaps the scripts written in the novice course?)
It works through the process of combining those scripts into a workflow for personal use,
before testing, organising, packaging and publishing the workflow
(or key programs within it) for wider use.

To be more specific, the course is structured as follows:

1. Learn some fundamentals: unix shell, version control
2. Combine the scripts into a workflow: configuring software, automating analyses
3. Test the workflow: testing, continuous integration
4. Get properly organised: project structure, project management
5. Release the software to the wider world: packaging, publishing

There is a long list of topics that we haven't included at the bottom of the page.
We could consider including some of them as bonus/elective lessons.

It is assumed that students have completed the novice course.


## The Unix Shell

**Lead author:** Damien Irving  
**Source materials:**
[Software Carpentry](http://swcarpentry.github.io/shell-novice/),
[shell.Rmd](https://merely-useful.github.io/still-magic/en/shell.html)

> Topic outline:
> -   How do I navigate my filesystem?
>     -   moving about (cd, ls)
>     -   files and directories (ls, cp, mkdir, mv, rm)
>     -   paths (., .., absolute, relative, special) 
> -   How do I examine and/or edit a text file?
>     -   difference between text and binary files
>     -   running a text editor
>     -   operating on text (cat, wc, head, tail, etc)
>     -   wildcards
>     -   finding things (find, grep, locate)
> -   How do I combine multiple commands?
>     -   pipes and filters
>     -   redirection to/from files
>     -   loops
> -   Variables
>     -   define a variable
>     -   use a variable
>     -   what's with all the quotes?
> -   Shell scripts
>     -   read/write/execute file permissions
>     -   `#!` lines
>     -   using command-line arguments in scripts
>     -   job control (&, control-c)
> -   Shortcuts
>     -   tab completion
>     -   previous commands (up arrow, control-r)
>     -   history
> -   Getting help
>     -   --help, man
> -   Customising your shell experience
>     -   .bashrc
> -   Bonus material: non-standard commands you might find useful (tree, htop, autojump, fd, etc)


## Version control

**Lead author:** Damien Irving  
**Source materials:**
[Software Carpentry](http://swcarpentry.github.io/git-novice/),
[branches.Rmd](https://merely-useful.github.io/still-magic/en/branches.html)

> Topic outline:
> -   Version control at the command line
>     -   Checking progress: git status, diff, log
>     -   Commit cycle: git add, commit, push, pull
> -   How do I do multiple things at once?
>     -   branches
>     -   branch naming
>     -   branch management conventions (like feature branches)
> -   How do I suggest changes to other people's code?
>     -   forking repositories
>     -   creating pull requests
>     -   reviewing pull requests


## Automating analyses

TODO: Maybe cover drake instead of Make? Not sure how many R projects use Make, but I haven't seen many.

**Lead author:** Luke Johnston  
**Source materials:**
[Software Carpentry](http://swcarpentry.github.io/make-novice/),
[automate.Rmd](https://merely-useful.github.io/still-magic/en/automate.html)

> Topic outline:
> -   How do I write a simple Makefile? 
> -   How can I abbreviate the rules in my Makefiles? 
> -   How can I write a Makefile to update things when my scripts have changed rather than my input files?
> -   How can I define rules to operate on similar files? 
>     -   Pattern rules
> -   How can I eliminate redundancy in my Makefiles?
>     -   Variables
>     -   Functions
> -   How should I document a Makefile?
> -   What other tools can I use?
>     -   drake for R


## Testing

**Lead author:** Jonathan Dursi  
**Source materials:**
[Katy Huff](http://katyhuff.github.io/python-testing/),
[unit.Rmd](https://merely-useful.github.io/still-magic/en/unit.html),
[verify.Rmd](https://merely-useful.github.io/still-magic/en/verify.html)

> Topic outline:
> -   Why should I test my code?
> -   How do I implement tests/checks at specific points within my code?
>     -   assertions (brief, this is covered in novice course)
>     -   exceptions
> -   How can I write and manage tests for my software?
>     -   unit tests
>     -   test runners
> -   What tests should I write for my software?
>     -   edge cases
>     -   fails when it should
>     -   bugs become tests
> -   How can I tell what I have and haven't tested?
>     -   coverage
> -   What *isn't* included?
>     -   legal liabilities
    
    
## Continuous integration

**Lead author:** Luke Johnston  
**Source materials:** [r-rse-ci.Rmd](https://merely-useful.github.io/still-magic/en/integrate.html)

> Topic outline:
> -   How can I run commands automatically every time a repository is updated?
>     -   continuous integration
>     -   Travis


## Project structure

**Lead author:** Charlotte Wickham  
**Source materials:** [project.Rmd](https://merely-useful.github.io/still-magic/en/project.html)


## Project management

**Lead author:** Kate Hertweck  
**Source materials:**
[inclusive.Rmd](https://merely-useful.github.io/still-magic/en/teamwork.html), 
[backlog.Rmd](https://merely-useful.github.io/still-magic/en/backlog.html),
[teamwork.Rmd](https://merely-useful.github.io/still-magic/en/teamwork.html) 

> Topic outline:
> -   How can **we** keep track of who's doing what and what's still to be done?
>     -   issue tracking
>     -   issue tagging as lightweight workflow
> -   How can **we** figure out what to build next?
>     -   planning vs. agile
>     -   3x3 prioritization
> -   How can **we** make decisions?
>     -   how to run a meeting
>     -   project governance
>     -   strategies for handling difficult project members


## Packaging

**Lead author:** Greg Wilson (R)
**Source materials:** [package.Rmd](https://merely-useful.github.io/still-magic/en/package.html)

> Topic outline:
> -   How do I write a package that can be shared on CRAN?
> -   How do version numbers work?
> -   How can I put documentation for my package on the web? 


## Publishing

**Lead author:** Damien Irving  
**Source materials:** [publish.Rmd](https://merely-useful.github.io/still-magic/en/publish.html) 
