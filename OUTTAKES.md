# Stylometry Project

The second project is a simple form of [computational stylometry](glossary.html#computational-stylometry).
Different writers have different styles;
can a computer detect those differences,
and if so,
can it determine who the likely author of a text actually was?
Computational stylometry has been used to explore
which parts of Shakespeare's plays might have been written by other people,
which presidential tweets were composed by other people,
and who wrote incriminating emails in several high-profile legal cases.

The authors of our books are listed below.
Three of them were purportedly written by Jane Austen;
we will see if the similarity measures we develop show that.

| Author                      | Book                            |
| ----------------------------| ------------------------------- |
| Jane Austen                 | emma.txt                        |
| Jane Austen                 | pride_and_prejudice.txt         |
| Jane Austen                 | sense_and_sensibility.txt       |
| Charlotte Brontë            | jane_eyre.txt                   |
| Agatha Christie             | mysterious_affair_at_styles.txt |
| Frederick Douglass          | life_of_frederick_douglass.txt  |
| Arthur Conan Doyle          | sherlock_holmes.txt             |
| Alexandre Dumas             | count_of_monte_cristo.txt       |
| Herman Melville             | moby_dick.txt                   |
| Lucy Maud Montgomery        | anne_of_green_gables.txt        |
| Thomas Paine                | common_sense.txt                |
| Mary Wollstonecraft Shelley | frankenstein.txt                |
| Robert Louis Stevenson      | treasure_island.txt             |
| Bram Stoker                 | dracula.txt                     |
| H. G. Wells                 | time_machine.txt                |
| Edith Wharton               | ethan_frome.txt                 |

========================================

# Editor Recommendations

However, because of this trait, it may 
not be powerful enough or flexible enough for the work you need to do
after this workshop. On Unix systems (such as Linux and Mac OS X),
many programmers use [Emacs](http://www.gnu.org/software/emacs/) or
[Vim](http://www.vim.org/) (both of which require more time to learn),
or a graphical editor such as
[Sublime Text](https://www.sublimetext.com/). On Windows, a popular editor is
[Notepad++](http://notepad-plus-plus.org/). Windows also has a built-in
editor called `notepad` and macOS has `TextEdit` which both can be run from
the command line (`start notepad <file_name>` and `open -e <file_name>`,
respectively).

No matter what editor we use,
we need to know where it searches for and saves files.
If we start it from the shell,
it will (probably) use your current working directory as its default location.
If you use
your computer's start menu, it may want to save files in your desktop or
documents directory instead. You can change this by navigating to
another directory the first time you "Save As..."

========================================


https://drivendata.github.io/cookiecutter-data-science/

> "Well organized code tends to be self-documenting in that the organization itself provides context for your code without much overhead."

```
├── LICENSE
├── Makefile           <- Makefile with commands like `make data` or `make train`
├── README.md          <- The top-level README for developers using this project.
├── data
│   ├── external       <- Data from third party sources.
│   ├── interim        <- Intermediate data that has been transformed.
│   ├── processed      <- The final, canonical data sets for modeling.
│   └── raw            <- The original, immutable data dump.
│
├── docs               <- A default Sphinx project; see sphinx-doc.org for details
│
├── models             <- Trained and serialized models, model predictions, or model summaries
│
├── notebooks          <- Jupyter notebooks. Naming convention is a number (for ordering),
│                         the creator's initials, and a short `-` delimited description, e.g.
│                         `1.0-jqp-initial-data-exploration`.
│
├── references         <- Data dictionaries, manuals, and all other explanatory materials.
│
├── reports            <- Generated analysis as HTML, PDF, LaTeX, etc.
│   └── figures        <- Generated graphics and figures to be used in reporting
│
├── requirements.txt   <- The requirements file for reproducing the analysis environment, e.g.
│                         generated with `pip freeze > requirements.txt`
│
├── setup.py           <- Make this project pip installable with `pip install -e`
├── src                <- Source code for use in this project.
│   ├── __init__.py    <- Makes src a Python module
│   │
│   ├── data           <- Scripts to download or generate data
│   │   └── make_dataset.py
│   │
│   ├── features       <- Scripts to turn raw data into features for modeling
│   │   └── build_features.py
│   │
│   ├── models         <- Scripts to train models and then use trained models to make
│   │   │                 predictions
│   │   ├── predict_model.py
│   │   └── train_model.py
│   │
│   └── visualization  <- Scripts to create exploratory and results oriented visualizations
│       └── visualize.py
│
└── tox.ini            <- tox file with settings for running tox; see tox.testrun.org
```
