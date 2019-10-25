## The Jupyter notebook {#py-the-jupyter-notebook}

Although the Python interpreter is very powerful,
it is commonly bundled with other useful tools and interfaces
specifically designed for exploratory data analysis.
One such interface is JupyterLab from the Jupyter project.

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
This should output some text in the terminal and open a new tab in your default browser.
The JupyterLab launcher page is shown on startup.
To create a new notebook,
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

The output will appear just under the input cell.
By default,
the next existing cell is selected,
or a new empty one is created if there is no next cell.
You can press <kbd>Ctrl</kbd> + <kbd>Enter</kbd> to stay on the current cell after running code.

In an input cell,
you can write multiple lines of code that will all be executed when the cell is run.

```{python}
a = 4
a * 2
```

You might have noticed that there is a little counter on the left of each cell.
This counter keeps track of in which order the cells were executed,
so that you are aware if cells have been run out of sequential order.
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
Markdown is a simple formatting system
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

This is a [link to learn more about markdown](https://guides.github.com/features/mastering-markdown/).
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
which facilitates sharing your results with others
and publishing online, which we will learn more about in the publishing chapter.
<!--com: TODO link to pub -->
You can export the notebook to different file types via `File --> Export Notebook As...`.
When you export to PDF for the first time,
you might be asked to download the Latex packages,
which are needed to create the PDF.

JupyterLab can also run applications other than notebooks,
e.g. there is a Python console, a text editor, and a terminal emulator.
These can be opened via the launcher page or `File --> New`.
Applications can be placed side by side by dragging and dropping their windows,
and all currently running applications can be viewed
in the "Running" tab in the sidebar.
The next icon in the sidebar is the "Commands Palette" (the color palette icon),
which can be used to search among all available toolbar commands for the notebook,
e.g. you can search for "Run All" to find the command that runs all cells
(also available via `Run --> Run all cells` in the toolbar menu).
Conveniently,
the command palette also shows a command's keyboard shortcut.
The last tab (the wrench icon) is for advanced cell settings,
which is outside the scope of this material.

### How to get help {#py-how-to-get-help}

 <!--TODO Depending on where this section will be in the book, some of these concepts might not have been introduced (packages, lists). -->

Once you start out using Python,
When you start out using Python, 
it's hard to know what functions are available within each package.
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
(An "array-like" object is a sequence of numbers
such as a list `[]`, tuple `()`, or numpy array.)
Instead of manually activating the pop up menu every time,
JupyterLab offers a tool called "Contextual Help",
which displays help information automatically as you type.
When you're using unfamiliar packages and functions,
it is a good habit to leave the Contextual Help open next to the notebook.
You can achieve this by dragging opening the Contextual Help tab
and dragging it to either side of the notebook window.
The unformatted docstring can be seen by prepending or appending a `?` to the function name,
e.g. `numpy.mean?`.
Two `?` (`numpy.mean??`) will show the full source code for the function.
More help is available via the "Help" menu,
which links to useful online resources
(for example `Help --> JupyterLab Reference`).

When you start getting familiar with typing function names,
you will notice that typing is often faster than looking for functions in menus,
such as in a spreadsheet program.
However,
sometimes you forget
and it is useful to get hints via the help systems described above.

### Version control with notebooks {#py-version-control-with-notebooks}

Jupyter notebooks are stored as JSON files with a .ipynb extension.
These are specially-formatted text files
which are read and rendered by JupyterLab.
The JSON file format is efficiently read by machines and it is a common data exchange format.
However,
they are not always that easy to read for humans,
which can create problems when working with Jupyter notebooks under version control.
The Markdown format is easier for us to read
and facilitates reading version control diffs and making more granular commits.

Jupytext is a JupyterLab extension that can automatically save Jupyter notebooks in plain text formats,
such as Markdown.
The plain text notebook is two-way synced with the `.ipynb` file,
so that when either of the files change,
the other is updated to reflect this change.
Jupytext supports the R Markdown format,
which extends the Markdown syntax with some useful features for notebooks,
and which is used to generate reproducible reports from R Notebooks
via the R Studio IDE.
By using the R Markdown format for our notebooks,
we take advantage of a well-established format for reproducible analysis.
If needed, we also have access to the publishing options
available via the R Studio IDE
(R Markdown builds upon Pandoc,
which is the most extensive Mardown specification,
with support for more advanced scholarly features
such as inline citations and cross-references).

To install Jupytext, open a terminal and type the following
(if you installed JupyterLab in another conda environment than the base,
make sure to first switch to that environment).

```bash
conda install -c conda-forge jupytext
```

Restart JupyterLab and click OK when asked to rebuild the application,
this makes the Jupytext extension part of JupyterLab.
The Jupytext commands are all available from the command palette.
Create a new notebook and click on the command palette icon in the sidebar.
Type "pair" and you will see all the Jupytext commands.
Click on "Pair Notebook with R Markdown",
 <!--TODO Screenshot from doc? -->
this is the only Jupytext command we need to use.
That's it!
After the next file save, your `.ipynb` notebook is now linked to a `.Rmd` file with the same name.
Open up the File Browser from the sidebar
and you can see that the new file has been created in the same directory.
The pairing needs to be done once for each notebook,
or can be set up to occur for [all notebooks automatically][jupytext-global-config].

[jupytext-global-config]: https://jupytext.readthedocs.io/en/latest/using-server.html#global-configuration

Since Jupytext can open `.Rmd` files as notebooks,
you only need to commit the `.Rmd` file to version control, and you only need the `.Rmd` file to regenerate the notebook file.
`.Rmd` files open as text when double clicked in the JupyterLab file browser.
To open them as notebooks,
right click the filename and select "Open with".
A `.ipynb` file will be created if it doesn't already exist.
Since `.Rmd` files do not store the notebooks' output cells,
the code will need to be run again to recreate the output.
Running the entire notebook is good practice since it ensures reproducibility,
and it is important to do this before sharing it with a collaborator.
Otherwise,
you might have run some of the cells out of order,
or are working with a variable from a cell that you have since deleted,
so that once your collaborator tries to run the file in sequential order,
they would (in the best case scenario) get an error 
and (in the worst case scenario) they might get a different output without noticing.
Collaborating with `.Rmd` files makes it easier for collaborators to see and make changes,
but it is also important to remember that in order to run the notebook locally,
all collaborators need to have Jupytext installed.

