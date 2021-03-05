
##' @title
##' Load Numbers
##'
##' @description
##' Import pre-computed data table
##'
##' @param n_digit \code{[numeric]} A number specifying type of table to be imported
##' @importFrom fst read_fst
##' @return A data frame object
##' @export
load_numbers <- function(n_digit) {

    if (n_digit < 3 || n_digit > 7) {
        stop("`n_digit` supported only integer values in range of [3,7]", call. = FALSE)
    }

    if (n_digit == 3) {
        all_nums <- fst::read_fst(system.file("extdata", "three_digits.fst", package = "luckynumbers"))
    }

    if (n_digit == 4) {
        all_nums <- fst::read_fst(system.file("extdata", "four_digits.fst", package = "luckynumbers"))
    }

    if (n_digit == 5) {
        all_nums <- fst::read_fst(system.file("extdata", "five_digits.fst", package = "luckynumbers"))
    }

    if (n_digit == 6) {
        all_nums <- fst::read_fst(system.file("extdata", "six_digits.fst", package = "luckynumbers"))
    }

    if (n_digit == 7) {
        all_nums <- fst::read_fst(system.file("extdata", "seven_digits.fst", package = "luckynumbers"))
    }

    all_nums
}


##' @title
##' Lucky Number Generator
##'
##' @description
##' Generate numbers based upon pre-defined patterns
##'
##' @param n_digit \code{[numeric]} A number specifying type of table to be imported
##' @param ... \code{[expression]} Expression specifying condition to filter numbers
##' @import data.table
##' @return A data table object
##' @export
lucky_number_generator <- function(n_digit, ...) {
    nums <- load_numbers(n_digit)
    nums <- as.data.table(nums)
    out <- nums[...]
    out[, c("x0")]
}
