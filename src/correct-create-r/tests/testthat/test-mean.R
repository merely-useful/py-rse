context("Computing the mean")

test_that("the mean of an odd-length vector is correct", {
  expect_identical(mean(1:3), 2.0)
})

test_that("the mean of an even-length vector is correct", {
  expect_identical(mean(1:4), 2.0)
})
