
# add zero number before 
#' @title pad_zeros
#' @author Nguyen Ngoc Binh \email{nguyenngocbinhneu@@gmail.com}
#' @export pad_zeros
#' @param nbr number
#' @param n length of number
#' @return number with predefined length
#' @examples
#' pad_zeros(99, 10)

pad_zeros <- function(nbr, n) {
    
    nchar_nbr <- nchar(nbr)
    
    if (nchar_nbr < n) {
        out <- paste0(paste0(rep("0", times = n - nchar_nbr), collapse = ""), nbr)
        return(out)
    }
    
    nbr
}

# generate number
gen_nums <- function(n) {
    stopifnot(n >= 3)
    if (n == 3) {mi <- 1; ma <- 999}
    if (n == 4) {mi <- 1; ma <- 9999}
    if (n == 5) {mi <- 1; ma <- 99999}
    if (n == 6) {mi <- 1; ma <- 999999}
    if (n == 7) {mi <- 1; ma <- 9999999}
    if (n == 8) {mi <- 1; ma <- 99999999}
    if (n == 9) {mi <- 1; ma <- 999999999}
    if (n == 10) {mi <- 1; ma <- 9999999999}

    numbers <- as.character(mi:ma)
    numbers <- sapply(numbers, function(x) pad_zeros(x, n = n), USE.NAMES = FALSE)

    split_numbers <- strsplit(numbers, split = "")
    split_numbers <- lapply(split_numbers, as.numeric)
    split_numbers <- do.call(rbind, split_numbers)
    split_numbers <- as.data.frame(split_numbers)

    numbers <- cbind(numbers, split_numbers)
    numbers$numbers <- as.character(numbers$numbers)
    colnames(numbers) <- paste0("x", 0:n)
    numbers
}

## three_digits <- gen_nums(3)
## fst::write_fst(three_digits, path = "inst/extdata/three_digits.fst")

## four_digits <- gen_nums(4)
## fst::write_fst(four_digits, path = "inst/extdata/four_digits.fst")

## five_digits <- gen_nums(5)
## fst::write_fst(five_digits, path = "inst/extdata/five_digits.fst")

## six_digits <- gen_nums(6)
## fst::write_fst(six_digits, path = "inst/extdata/six_digits.fst")

## seven_digits <- gen_nums(7)
## fst::write_fst(seven_digits, path = "inst/extdata/seven_digits.fst")

## eight_digits <- gen_nums(8)
## fst::write_fst(eight_digits, path = "inst/extdata/eight_digits.fst")

## nine_digits <- gen_nums(9)
## fst::write_fst(nine_digits, path = "inst/extdata/nine_digits.fst")

## ten_digits <- gen_nums(10)
## fst::write_fst(ten_digits, path = "inst/extdata/ten_digits.fst")