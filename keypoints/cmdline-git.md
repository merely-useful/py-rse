- TODO: Point about when/why to use Git at the command line.

- Use git config with the `--global` option to configure a user name,
  email address, editor, and other preferences once per machine.

- `git init` initializes a repository.
- Git stores all of its repository data in the `.git` directory.

- `git status` shows the status of a repository.
- Files can be stored in a project’s working directory (which users see),
  the staging area (where the next commit is being built up)
  and the local repository (where commits are permanently recorded).
- `git add` puts files in the staging area.
- `git commit` saves the staged content as a new commit in the local repository.
- Write a commit message that accurately describes your changes.

- `git diff` displays differences between commits.
- `git checkout` recovers old versions of files.

- `git branch` creates a new branch where new features can be developed while leaving the master branch untouched.

- The `.gitignore` file tells Git what files to ignore.

- A local Git repository can be connected to one or more remote repositories.
- Use the HTTPS protocol to connect to remote repositories until you have learned how to set up SSH.
- `git push` copies changes from a local repository to a remote repository.
- `git pull` copies changes from a remote repository to a local repository.

- `git clone` copies a remote repository to create a local repository with a remote called origin automatically set up.

- Conflicts occur when two or more people change the same lines of the same file.
- The version control system does not allow people to overwrite each other’s changes blindly,
  but highlights conflicts so that they can be resolved.
  
- Pull requests suggest changes to repos where you don’t have write privileges.
