-   Testing can only ever show that software has flaws, not that it is correct.
-   The purpose of testing is to convince people (including yourself) that software is correct enough
    and to make tolerances on 'enough' explicit.
-   A testing suite finds and runs tests written in a prescribed fashion and reports their results.
-   Tests can usefully exercise particular pieces of functionality (unit tests)
    or larger pieces of the code base demonstrating interactions between units (integration tests)
-   A unit test can pass (work as expected),
    fail (meaning the software under test is flawed),
    or produce an error (meaning the test itself is flawed).
-   Data science is normally concerned with approximate correctness of solutions.
-   Stochastic statistical variation and deterministic floating point approximations both make answers approximately correct.
-   Check that parametric or non-parametric statistics of data
    do not differ from saved values by more than a specified tolerance.
-   Infer constraints on data and then check that subsequent data sets obey these constraints.
-   Test the data structures used in plotting rather than the plots themselves.