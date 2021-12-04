/*
  * Aim:  Multiples of 3 or 5
  *
  * Author: Saud Kadiri
  *
  * Dated: Tuesday, November 16, 2021 (originally)
  *        Saturday, December 04, 2021 (reposted on my new account)
  * 
  * Details:
  *   If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
  *   Find the sum of all the multiples of 3 or 5 below 1000.
  *
  * Approach used:
  *   1. We first define a closure which finds the sum of the multiples of any number between 1 to a specified range. (Line 29 of the code)
  *       Line 30 of the code does the following:
  *         a. for a number (say "num") it has it has "m / n" multiples from 1 to "m"
  *         b. e.g.1: number of multiples of 3 from 1 to 100 are 99 / 3 = 33  
  *         c. e.g.2: number of multiples of 5 from 1 to 1000 are 999 / 5 = 199
  *       Line 31 of the code does the following:
  *         Formula:                     | Example: from e.g. 1 above there are 33 multiples of 3 from 1 to 100
  *                 n * (n + 1)          |                   33 * (33 + 1)
  *           Sₙ = --------------- X num  |         S₃₃ = -------------------- X 3 = 16833
  *                     2                |                           2
  *
  *   2. We then use the closure to get the sum of multiples of 3 from 1 to 1000; sum of multiples of 5 from 1 to 1000
  *       and also sum of 15 from 1 to 1000 as it is the LCM and multiples of 15 will thus be repeated twice so we take out the sum once
  *         Thus (refer line 34 of the code):
  *             sum = (sum of multiples of 3 from 1 to 1000) + (sum of multiples of 5 from 1 to 1000) - (sum of multiples of 15 from 1 to 1000)
  */

// closure definition
var gauss = { (num: Int, upto: Int) -> (Int) in
  let n = (upto - 1) / num
  return (n * (n + 1) * num / 2)  
}

let sum = gauss(3, 1000) + gauss(5, 1000) - gauss(15, 1000)
print("\(sum)") // 233168
// Time complexity: 𝒪(1)
