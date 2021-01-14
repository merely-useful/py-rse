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
