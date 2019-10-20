-   Testing can only ever show that software has flaws, not that it is correct.
-   The real purpose is to convince people (including yourself) that software is correct enough
    and to make tolerances on 'enough' explicit.
-   A testing suite finds and runs tests written in a prescribed fashion and reports their results.
-   A unit test can pass (work as expected),
    fail (meaning the software under test is flawed),
    or produce an error (meaning the test itself is flawed).
-   Every unit test should be independent of each other so results are comprehensible, contained, and reliable.
-   Tests should be built to test that the software fails when and as it is supposed.
-   Tests can usefully exercise particular pieces of functionality (unit tests)
    or larger pieces of the code base demonstrating interactions between units (integration tests)
-   Tests should verify software (make sure it does what it's supposed to)
    and also validate it (make sure it produces the right answers).
-   Data science is normally concerned with approximate correctness of solutions.
-   Stochastic statistical variation and deterministic floating point approximations both make answers approximately correct.
-   Check that parametric or non-parametric statistics of data
    do not differ from saved values by more than a specified tolerance.
-   Infer constraints on data and then check that subsequent data sets obey these constraints.
-   Test the data structures used in plotting rather than the plots themselves.
