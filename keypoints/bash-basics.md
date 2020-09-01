-   A [shell][shell] is a program whose primary purpose is to read commands and run other programs.
-   The shell's main advantages are its high action-to-keystroke ratio,
    its support for automating repetitive tasks,
    and its capacity to access networked machines.
-   The [file system][filesystem] is responsible for managing information on the disk.
-   Information is stored in files, which are stored in directories (folders).
-   Directories can also store other directories, which forms a directory tree.
-   `pwd` prints the user's current working directory.
-   `/` on its own is the [root directory][root_directory] of the whole file system.
-   `ls` prints a listing of a specific file or directory.
-   A relative path specifies a location starting from the current location.
-   An absolute path specifies a location from the root of the file system.
-   `cd` changes the current working directory.
-   `..` means 'the directory above the current one'; `.` on its own means 'the current directory'.
-   `mkdir` creates a new directory.
-   `cp` copies a file.
-   `rm` removes (deletes) a file.
-   `mv` moves (renames) a file or directory.
-   `*` matches zero or more characters in a filename, so `*.txt` matches all files ending in `.txt`.
-   `?` matches any single character in a filename, so `?.txt` matches `a.txt` but not `any.txt`.
-   `wc` counts lines, words, and characters in its inputs.
-   `man` displays the manual page for a given command (and some commands have a `--help` option),
    but the [TLDR][tldr] website often has less cryptic help information.
-   `>` redirects a command's output to a file (overwriting any existing content).
-   `>>` appends a command's output to a file.
-   `<` operator redirects input to a command
-   `|` is a [pipe][pipe_shell]. The output of the command on the left of a pipe
    is used as the input to a command on the right.
-   The best way to use the shell is to use pipes to combine simple single-purpose programs (filters).
-   `cat` displays the contents of its inputs.
-   `head` displays the first 10 lines of its input.
-   `tail` displays the last 10 lines of its input.
-   `sort` sorts its inputs.
-   Every process in Unix has an input channel called [standard input][stdin]
    and an output channel called [standard output][stdin].
-   A `for` loop repeats commands once for every thing in a list.
-   Every `for` loop needs a variable to refer to the thing it is currently operating on.
-   Use `$name` to expand a variable (i.e., get its value). `${name}` can also be used.
-   Use the up-arrow key to scroll up through previous commands to edit and repeat them.
-   Use `history` to display recent commands, and `!number` to repeat a command by number.
