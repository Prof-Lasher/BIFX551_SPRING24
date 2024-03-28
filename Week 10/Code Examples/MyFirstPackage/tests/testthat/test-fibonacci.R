test_that("fibonacci works", {
  expect_equal(fibonacci(5), c(0, 1, 1, 2, 3))
  expect_equal(fibonacci(5), c(0, 1, 1, 2, 3+1e-7))
  expect_warning(log(-1))
  expect_error(1 / "a", "non-numeric argument")
  expect_warning(log(-1), "NaNs produced")
})
