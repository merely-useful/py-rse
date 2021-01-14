## 2. The Basics of the Unix Shell

This chapter introduces a command line interface, 
the "command shell", 
or just "shell" for short,
that interacts with the computer's operating system.
The first shell commands covered will let the learner explore their folders and files, 
and introduce several conventions that most Unix tools follow. 
The chapter starts by explaining 
how to navigate the filesystem 
and the difference between absolute paths
and relative paths.
Then the chapter introduces shell commands to
create files and directories, 
move files and directories, 
and delete files and directories.
Wildcards are covered as a way to specify
a set of files.
The chapter concludes with
how to display the manual page for a given shell command.

## 3. Building Tools with the Unix Shell

The shell's greatest strength is that
it can be used to combine programs to create pipelines
that can handle large volumes of data.
This chapter shows how to do that,
and how to repeat commands to process as many files as needed automatically.
One approach to combine programs 
is to redirect the output from a shell command to a file,
instead of printing it,
then use the output file as the input file to another
shell command.
An alternative way to combine programs is the pipe,
a way to link the output of one command to the input of
another without intermediate files.
A loop is a way to repeat a set of commands for each item in a list.
By the end of the chapter a learner
will know how to redirect output,
combine commands using the pipe, and 
repeat commands using a for loop.

## 4. Going Further with the Unix Shell

The previous chapters explained how to use the command line
as an alternative to doing things in a graphical user interface,
and how to combine commands in new ways using pipes and redirection.
This chapter extends those ideas to show
how to create new tools by saving commands in files
and how to use a more powerful version of wildcards
to extract data from files.
For reuse, shell commands can be saved in files known as shell scripts.
Shell scripts can be run from the command line like any other program.
By the end of the chapter a learner will be able to
create shell scripts, 
run shell scripts,
write shell scripts that take command line arguments,
and add comments to shell scripts.
The example scripts in this chapter also introduce 
two shell commands for filtering: 
`grep` to find lines inside files, and
`find` to find files themselves.

## 5. Building Command-Line Tools with Python

Writing command-line Python scripts makes it possible to run programs from the Unix shell,
which facilitates both scalability and interoperability with data analysis pipelines.
The `argparse` Python module can be used to parse user input,
and provides other expected command line functionality
such as positional and optional arguments, and help messages.
Python scripts can take input from files or directly from standard input
and write to fies or the standard output.
When writing Python scripts `import` statements are put first first,
and use a special variable called `__name__`
to check whether the script is run as the main program
or called from another program.
Instead of having one long script for all code,
it is recommended to modularize code into different files 
according to functionality
and to document the behavior of each module and function carefully
in their respective docstring.

## 6. Using Git at the Command Line

A version control system tracks changes to files
and helps people share those changes with each other.
The most widely used version control system today is Git.
This chapter describes how to perform fundamental operations using Git's original command-line interface interface.
Version control works by storing a master copy of the code in a repository.
Instead of editing the code directory, 
a working copy of the code is checked out, 
edited, 
then committed back to the repository. 
A local repository is located the user's own computer.
A remote repository is hosted on another computer or server, like GitHub. 
By referring to specific Git commits, 
previous versions of files can be viewed,
or restored.
Not every file’s history needs to be tracked,
so some files should be ignored. 
By the end of the chapter a learner will be able to
initialize a local Git repository,
edit files and commit changes,
connect to a remote repository on GitHub,
explore the history of files, and
specify some files to be ignored by Git.

## 7. Going Further with Git

Two of Git's advanced features let us to do much more than just track our work.
Branches let us work on multiple things simultaneously in a single repository;
pull requests submit work for review,
to get feedback,
and to make updates.
Used together,
they allow a write-review-revise cycle
familiar to anyone who has ever written a journal paper
in hours rather than weeks.
This chapter presents a branch-per-feature workflow to develop new features while leaving the master branch in working order.
By the end of the chapter a learner will be able to use the workflow in individual projects by
creating new branches, 
switching between branches,
merging from another branch into the current branch,
and handling merge conflicts.
A learner will also be able to use the workflow in collaborative project by
forking someone else's repository,
and creating pull requests to submit changes.

## 8. Working in Teams

Projects can run for years with poorly-written code,
but none will survive for long if people are confused,
pulling in different directions,
or hostile to each other.
This chapter looks at how to create a culture of collaboration
that will help people who want to contribute to a project,
and introduce a few ways to manage projects and teams as they develop.
In particular, the chapter suggests ways to
welcome and nurture community members proactively,
including by creating an explicit Code of Conduct, 
and including a license in your project so that it's clear who can do what with the material.
GitHub issues are presented as a way to manage workflow.
The chapter concludes with strategies to make project meetings fair and productive, and 
how to manage conflict between participants.

## 9. Automating Analyses with Make

Keeping track of programs that process multiple data files
is an error prone process that should be automated to minimize mistakes.
Build-managers such as Make
can keep track of file dependencies in the analysis pipelines
and run our programs automatically to update files that are out of date.
A build rule has targets, prerequisites, and a recipe.
A target can be a file or a phony target that triggers an action.
When a target is out of date with respect to its prerequisites,
Make executes the recipe associated with its rule.
Make defines a few convenience variables
such as `$@` (target),
`$^` (all prerequisites),
and `$<` (first prerequisite).
Makefiles can also use wildcard matching of file names
and functions such as `$(patsubst ...)` for increased flexibility.
As always it is important to document the code
and Make uses specially-formatted comments
to create self-documenting Makefiles.

## 10. Configuring Programs

For complex programs,
usability and reproducibility can be improved
by reading configuration options from files
in addition to using command-line options.
Up to four layers of configuration may be used:
a system-wide configuration file for general settings;
a user-specific configuration file for personal preferences;
a job-specific file with settings for a particular run;
and command-line options to change things that commonly change.
This is sometimes called overlay configuration
because each level overrides the ones above it.
Often,
a pre-existing standard such as the YAML or INI syntax
is used to write configuration files.
Saving and sharing these configuration files
makes it easy for researchers to run programs with the same settings,
which reduces the risk of errors and increases reproducibility.

## 11. Testing Software

It is critical to test software to reassure people
that the software is correct enough
and to make tolerances on "enough" explicit.
There are several layers to testing software:
adding assertions to code so that it checks itself as it runs;
writing unit tests to check individual pieces of code;
writing integration tests to check that those pieces work together correctly;
and writing regression tests to check if things that used to work no longer do.
Fortunately,
there are many excellent test frameworks to aid with these tasks.
A test framework finds and runs tests written in a prescribed fashion
and reports their results.
In addition to test failures,
these reports often include the tests' coverage,
which is the fraction of lines of code that are checked.
Continuous Integration can be used to automate test execution
as it runs tests every time a change is made to the code,
so that breaking changes are noticed immediately.

## 12. Handling errors

People will misunderstand how to use programs,
so software authors should plan from the start to detect and handle errors.
Something that goes wrong while a program is running
is referred to as an exception from normal behavior.
When an exception is raised it can be caught and handled 
via `try`/`except` blocks.
Python organizes its standard exceptions in a hierarchy
so that programs can catch and handle them selectively.
Generally speaking,
there is distinction between two types of errors/exceptions.
Internal errors are mistakes in the program itself,
such as calling a function with `None` instead of a list.
External errors are usually caused by interactions
between the program and the outside world:
a user may mis-type a filename,
the network might be down,
and so on.
Error messages should be written
so that they are informative to users of the program,
and point to what can be done to fix the issue at hands.
To report on program activity such as errors
a proper logging framework should be used rather than `print` statements.
This facilitates separating logging messages into various levels
according to their severity.

## 13. Tracking Provenance

Modern publishing involves much more than producing a PDF
and making it available on a preprint server.
It also entails providing the data underpinning the report
and the code used to do the analysis.
While some reports, datasets, software packages, and analysis scripts
can't be published without violating personal or commercial confidentiality,
every researcher's default should be to make all these as widely available as possible.
Publishing under an open license is the first step.
Using DOIs facilitates identification of reports, datasets, and software releases.
Similarly,
using an ORCID ensures that researchers are correctly linked with their work
and not mixed up with others of the same name.
Any published data should be FAIR:
findable, accessible, interoperable, and reusable.
While small datasets can be put under standard version control,
medium-sized ones should be stored on data sharing sites like Figshare or Dryad,
Big datasets probably need the attention of a professional archivist.
or the technology used for data collection.
In terms of providing the code associated with a report
it is important to describe the required software environment,
analysis scripts, and data processing steps
in reproducible and easily inspectable ways.

## 14. Creating Packages with Python

While the libraries that come with a programming language
are useful on their own,
much of a language's value is added by community-contributed packages
with domain-specific functionality.
The most popular way to build packages in Python
is by using `setuptools`.
This involves creating a directory named `mypackage`
containing a `setup.py` script
and a subdirectory also called `mypackage`
containing the package's source files.
To track and communicate new functionality
that is added to the package
it is recommended to use semantic versioning.
Before distributing packages
a test install should be performed in a fresh environment;
virtual Python environments can be used for this purpose
to avoid messing up the main Python installation.
To ensure that packages can be used as intended,
it is customary to write documentation in the package's README file
and host it in the source code repository,
or use documentation frameworks such as Sphinx and Read The Docs.
When the package is ready for distribution,
it can be uploaded to the PyPI repository,
which makes it easy to install with `pip`.
It is important to create a DOI for each package
and potentially also publish it in a citable software journal.
