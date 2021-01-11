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
By the end of the chapter a learner,
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
Not every file’s history, needs to be tracked,
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
This chapter, presents a branch-per-feature workflow to develop new features while leaving the master branch in working order.
By the end of the chapter a learner will be able to use the workflow in individual projects by,
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
This chapter therefore looks at how to create a culture of collaboration
that will help people who want to contribute to a project,
and introduce a few ways to manage projects and teams as they develop.
In particular the chapter suggests ways to
welcome and nurture community members proactively,
including by creating an explicit Code of Conduct, 
and including a license in your project so that it's clear who can do what with the material.
GitHub issues are presented as a way to manage workflow.
The chapter concludes with strategies to make project meetings fair and productive, and 
how to manage conflict between participants.
