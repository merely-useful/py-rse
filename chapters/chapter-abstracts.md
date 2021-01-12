## 5. Building Command-Line Tools with Python

Writing command-line Python scripts allows us to run our programs from the Unix shell,
which facilitates both scalability and interoperability with data analysis pipelines.
The `argparse` Python module can be used to parse user input,
and provides other expected command line functionality
such as positional and optional arguments, and help messages.
Python scripts can take input from files or directly from standard input
and write to files or standard output.
When we write Python scripts we put the put `import` statements first,
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
is an error prone process that we should automate to minimize mistakes.
Build-managers such as `make`
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
As always it is important to document our code
and in Make we use specially-formatted comments to create self-documenting Makefiles.

## 10. Configuring Programs

For complex programs
it can improve usability and increase reproducibility
to be able to read configuration options from files
in addition to using command-line options.
We may want to use up to four layers of configuration:
a system-wide configuration file for general settings;
a user-specific configuration file for personal preferences;
a job-specific file with settings for a particular run;
and command-line options to change things that commonly change.
This is sometimes called overlay configuration
because each level overrides the ones above it.
Often,
a pre-existing standard such as the YAML or INI syntax
is used to write these configuration files.
Saving and sharing these configuration files
makes it easy for researchers programs with the same settings,
which reduces the risk for errors and increases reproducibility.

## 11. Testing Software

It is critical to test software to reassure people (including yourself)
that the software is correct enough
and to make tolerances on "enough" explicit.
There are several layers to testing software:
adding assertions to code so that it checks itself as it runs;
writing unit tests to check individual pieces of code;
writing integration tests to check that those pieces work together correctly;
writing regression tests to check if things that used to work no longer do.
Fortunately,
there are many excellent test frameworks to aid us with these tasks.
A test framework finds and runs tests written in a prescribed fashion
and reports their results.
In addition to test failures,
these reports often include the tests' coverage,
which is the fraction of lines of code that are checked.
To automate the execution of our tests
we can use Continuous Integration
which runs tests every time we make changes to the code,
so that we can immediately spot when something breaks.

## 12. Handling errors

People will misunderstand how to use our programs,
and we should therefore plan from the start to detect and handle errors.
Something that goes wrong while a program is running
is sometimes referred to as an exception from normal behavior.
Generally speaking,
we distinguish between two types of errors/exceptions.
Internal errors are mistakes in the program itself,
such as calling a function with None instead of a list.
External errors are usually caused by interactions
between the program and the outside world:
a user may mis-type a filename,
the network might be down,
and so on.

## 13. Tracking Provenance

Modern publishing involves much more than producing a PDF
and making it available on a preprint server.
It also entails providing the data underpinning the report
and the code used to do the analysis.
While some reports, datasets, software packages, and analysis scripts
can't be published without violating personal or commercial confidentiality,
every researcher's default should be to make all these as widely available as possible.
Publishing it under an open license is the first step.
Using DOIs facilitates identification of reports, datasets, and software releases.
Similarly,
using an ORCID ensures that your research profile it correctly linked with your work
and not mixed up with others of the same name.
Any published data should be FAIR:
findable, accessible, interoperable, and reusable.
While small datasets can be put under standard version control;
large ones should be stored on data sharing sites,
sometimes there are specific ones for you field or the technology used for data collection.
To facilitate for others to use your software, it is important that you
describe your software environment, analysis scripts, and data processing steps
in reproducible and easily inspectable ways.

## 14. Creating Packages with Python

While the core of programming languages are useful on their own,
much of a language's value is added by community-contributed packages
with domain-specific functionality.
The most popular way to build packages in Python,
is by using `setuptools`.
This involves creating a directory named `mypackage`
containing a `setup.py` script
and a subdirectory also called `mypackage`
containing the package's source files.
To track and communicate new functionality
that we add to the package
it is recommended to use semantic versioning.
Before distributing our packages
we want to ensure that they install in a fresh environment;
for this we can use virtual Python environments
instead having to worry about messing up our main Python installation.
To ensure that others can use our package as we intend,
it is instrumental that we write documentation in the package's README file
and host it in the source code repository,
or use documentation frameworks such as Sphinx and Read The Docs.
When we're ready to distribute our package to others,
we can upload it to the PyPI repository,
which makes it easy to install with `pip`.
It is important that we create a DOI for our package
and potentially also publish it in a citable software journal.
