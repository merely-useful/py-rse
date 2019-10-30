-   A module is simply a file containing Python code; it is executed on `import`.
-   A package named `mypackage` is a directory named `mypackage` containing a module with a special name `__init__.py`,
    which may be empty.
-   Other modules within the directory are visible after the import.
-   A package can contain subpackages.
-   Use `virtualenv` to create a separate virtual environment for each project.
-   Use `pip` to create a distributable package containing your project's software, documentation, and data.
-   The default respository for Python packages is [PyPI][pypi]
-   You can test distributing your package to Pypi using [TestPyPI][testpypi], and when you're ready, publish it to [pypi](pypi)
