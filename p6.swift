/*
  * Aim:  Sum square difference
  *
  * Author: Saud Kadiri
  *
  * Dated: Wednesday, November 20, 2021
  * Reposted on: Friday, December 10, 2021
  *
  * Details:
  *     The sum of the squares of the first ten natural numbers is,
  *           1² + 2² + ... + 10² = 385
  *     The square of the sum of the first ten natural numbers is,
  *           (1 + 2 + ... + 10)² = 55² = 3025
  *     Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025 = 385
  *     Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
  *
  * Approach used:
  *                                                  n * (n + 1) * (2n + 1)     |                                     n * (n + 1)
  *     Sum of squares of first n natural numbers = -------------------------   | Sum of first n natural numbers = -------------------
  *                                                            6                |                                         2
  *
  *     So we can thus write two swift closures (no pun intended) to have these as formulas. 
  */

let sum_n = { (n: Int) -> (Int) in
    return n * (n + 1) / 2
}
let sum_n_square = { (n: Int) -> (Int) in
    return n * (n + 1) * (2*n + 1) / 6
}

let x = sum_n(100)            // store the sum of first n natural numbers
let y = sum_n_square(100)     // store the sum of squares of first n natural numbers
print(x * x - y)              // x * x is equivalent to (sum of first n natural numbers)²
// 25164150
