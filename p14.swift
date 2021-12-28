/*
 * Aim:  Longest Collatz sequence
 *
 * Author: Saud Kadiri
 *
 * Dated: Tuesday, December 28, 2021
 *
 * Details:
 *   The following iterative sequence is defined for the set of positive integers:
 *        n → n/2 (n is even)
 *        n → 3n + 1 (n is odd)
 *    Using the rule above and starting with 13, we generate the following sequence:
 *              13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
 *    It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms.
 *    Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.
 *    Which starting number, under one million, produces the longest chain?
 *    NOTE: Once the chain starts the terms are allowed to go above one million.
 */

func rule(_ n: Int) -> Int {
  n % 2 == 0 ? n / 2 : 3 * n + 1
}

var largest = -1
for i in 1..<1_000_000 {
  var n = i
  var count = 1
  while n != 1 {
    n = rule(n)
    count += 1
  }
  largest = max(largest, count)
}

print(largest)
// 525
