## The Jupyter notebook

Although the Python interpreter is very powerful,
it is commonly bundled with other useful tools and interfaces
specifically designed for exploratory data analysis.
One such interface is the JupyterLab from the Jupyter project.

Jupyter originates from a project called IPython,
an effort to make Python development more interactive.
Since its inception,
the scope of the project expanded to include additional programming languages,
such as Julia, Python, and R,
so the name was changed to "Jupyter" as a reference to these core languages.
Today,
Jupyter supports many more languages,
but we will be using it only for Python code.
Specifically,
we will be using the JupyterLab IDE and work in Jupyter notebooks,
which allows us to easily take notes about our analysis
and view plots within the same document where we code.
This facilitates sharability and reproducibility of analyses,
and the notebook interface is easily accessible through any web browser
as well as exportable as a PDF or HTML page.

Open JupyterLab by running `juptyerlab` from the terminal,
by finding it in the `Anaconda navigator`,
or directly from the start menu if your operating system supports it.
This should output some text in the terminal and open new tab in your default browser.
The JupyterLab launcher page is shown on startup,
to create a new notebook,
click the big Python tile under the notebook section or go to `File --> New --> Notebook`.
If you click on the File Browser in the sidebar to the left (the topmost folder icon),
you will see that a new file has been created in the current directory.
The File Browser can be used to open existing notebooks and other file types.
The new notebook is named `Untitled.ipynb` by default.
Right-click the name in the notebook tab,
and change it to `getting-started.ipynb`.

The notebook is divided into cells.
Initially, there will be a single input cell.
 <!--com: TODO add screenshot? -->
You can type Python code directly into this cell,
just as we did before in the IPython terminal.
To run the code,
click the play button in the toolbar or press <kbd>Shift</kbd> + <kbd>Enter</kbd>.

```{python}
4 + 5
```

The output will appears just under the input cell.
By default,
the next existing cell is selected,
or a new empty one is created if there is no next cell.
You can press <kbd>Ctrl</kbd> + <kbd>Enter</kbd> to stay on the current cell after running code.

In an input cell,
you can split the code across several lines as needed.

```{python}
a = 4
a * 2
```

You might have noticed that there is a little counter on the left of each cell.
This counter keeps track of in which order the cells were executed,
so that you are aware if they cells have been run out of sequential order.
The counter symbol changes to an `*` when a computation is running,
to indicate that Python is busy and won't be able to execute new cells
until the current one finishes
(the delay is only noticeable for longer computations).

The notebook is saved automatically every two minutes,
and it can be saved manually by clicking the floppy disk symbol in the toolbar,
or by hitting <kbd>Ctrl</kbd> + <kbd>s</kbd>.
Both input and output cells are saved,
so any plots that you make will be present in the notebook next time you open it,
without needing to rerun the code cells.
 <!--com: TODO note about exploratoy and explantory notebook,  -->

You can change the input cell type from Python code to Markdown
by clicking on the little dropdown menu in the toolbar that reads "Code".
Markdown is a simple formatting system,
which allows you to document your analysis within the notebook.
It is a plain text format
that includes brief markup tags that indicates how text should be rendered,
e.g. `*` indicates italic and `**` indicates bold typeface.
If you have commented on online forums or used a chat application,
you might already be familiar with markdown.
Below is a short example of the syntax:

```markdown
# Heading level one

- A bullet point
- *Emphasis in italics*
- **Strong emphasis in bold**

This is a [link to learn more about markdown](https://guides.github.com/features/mastering-markdown/)
```

The combination of code, plots, and markdown is powerful.
With these three elements,
you can keep all your analysis code and interpretations in the same document,
instead of spread across different files.
Notebooks are excellent tools to build entire reports,
since they can contain formatting such as
a table of contents, links to sections and files, footnotes, images, and even videos.
Creating a report in a notebook makes it easier to reproduce the findings,
since the code for creating the figures is kept together with the figures in the notebook.
Notebooks can be exported to HTML, PDF, and many other formats,
which facilitates sharing your results with others,
and publishing online which we will learn more about in the publishing charter.
<!--com: TODO link to pub -->
Exporting can be done via `File --> Export Notebook As...`.
When you export to PDF for the first time,
you might be asked to download the Latex packages,
which are needed to create the PDF.

JupyterLab can run other applications than notebooks,
e.g. there is a Python console, a text editor, and a terminal emulator.
These can be opened via the launcher page or `File --> New`.
Application can be placed side by side through drag and drop,
and all currently running applications can be viewed
in the "Running" tab in the sidebar.
The next icon in the sidebar is the "Commands Palette" (the color palette icon),
which can be used to search among all available toolbar commands for the notebook,
e.g. you can search for "Run All" to find that command that runs all cells
(also available via `Run --> Run all cells` in the toolbar menu).
Conveniently,
the command palette also shows a command's keyboard shortcut.
The last tab (the wrench icon) is for advanced cell settings,
which is outside the scope of this material.

### How to get help

 <!--TODO Depending on where this section will be in the book, some of these concepts might not have been introduced (packages, lists). -->

Once you start out using Python,
you don't know what functions are available within each package.
If you're working with the `numpy` package in a Jupyter notebook,
you can type `numpy.`<kbd>Tab</kbd> (that is numpy + period + tab-key)
and a small menu will pop up showing all the available functions in the `numpy` module.
There are plenty of available functions,
so it can be helpful to filter the menu
by typing the initial letters of the function name.

 <!--TODO Add screenshots? -->
To get more info on the function you want to use,
you can type out the full name and then press <kbd>Shift + Tab</kbd>
to bring up a help dialogue.
For the `numpy.mean` function
you can see that the first argument `a` should be "array-like".
An array is essentially just a sequence of numbers,
such as a list `[]` or tuple `()`.
Instead of manually activating the pop up menu every time,
JupyterLab offers a tool called "Contextual Help",
which displays help information automatically as you type.
This very useful and it is a good habit to always have it open next to the Notebook.
More help is available via the "Help" menu,
which links to useful online resources
(for example `Help --> JupyterLab Reference`).
The unformatted docstring can be seen by prepending or appending a `?` to the function name, e.g. `numpy.mean?`.
Two `?` (`numpy.mean??`) will show the full source code for the function.

When you start getting familiar with typing function names,
you will notice that this is often faster than looking for functions in menus,
such as in spreadsheet program.
However,
sometimes you forget
and it is useful to get hints via the help systems described above.

