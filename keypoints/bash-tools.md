-   `cat` displays the contents of its inputs.
-   `head` displays the first few lines of its input.
-   `tail` displays the last few lines of its input.
-   `sort` sorts its inputs.
-   Use the up-arrow key to scroll up through previous commands to edit and repeat them.
-   Use \gref{`history`}{command_history} to display recent commands and `!number` to repeat a command by number.
-   Every process in Unix has an input channel called \gref{standard input}{stdin}
    and an output channel called \gref{standard output}{stdin}.
-   `>` redirects a command's output to a file, overwriting any existing content.
-   `>>` appends a command's output to a file.
-   `<` operator redirects input to a command
-   A \gref{pipe}{pipe_shell} `|` sends the output of the command on the left to the input of the command on the right.
-   A `for` loop repeats commands once for every thing in a list.
-   Every `for` loop  must have a variable to refer to the thing it is currently operating on
    and a \gref{body}{loop_body} containing commands to execute.
-   Use `$name` or `${name}` to get the value of a variable.
