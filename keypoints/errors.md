-   Most modern programming languages (including Python) use [exceptions][exception] for error handling.
    Information about the error is stored in an object, which is also called an exception.
-   The different types of errors/exceptions are organized in a hierarchy.
-   Use `try`/`except` blocks to [catch][catch_exception] and handle errors.
-   [Raise][raise_exception] and catch errors following the "throw low, catch high" philosophy.
-   Write useful error messages and store them in a common dictionary to ensure consistency.
-   Use `logging` instead of `print` to report program activity.
-   Separate logging messages into `DEBUG`, `INFO`, `WARNING`, `ERROR`, and `CRITICAL` levels.
-   Use `logging.basicConfig` to define basic logging parameters.
