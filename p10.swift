/*
  * Aim:  Summation of primes
  *
  * Author: Saud Kadiri
  *
  * Dated: Wednesday, December 15 2021
  *
  * Details:
  * The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
  * Find the sum of all the primes below two million.
  *
  * Approach used:
  *   Sieve of Sundaram:
  *       Start with a list of the integers from 1 to n. From this list, remove all numbers of the form i + j + 2ij where:
  *         • i, j ϵ ℕ, 1 ≤ i ≤ j
  *         • i + j + 2ij ≤ n
  *       The remaining numbers are doubled and incremented by one, giving a list of the odd prime numbers (i.e., all primes except 2) below 2n + 1.
  * 
  * References:
  *   1. https://en.wikipedia.org/wiki/Sieve_of_Sundaram
  *   2. https://www.youtube.com/watch?v=GOPPPsU-z0M
  */

func sieve_of_sundaram(below: Int) -> Int {
    let n = below - 1   // below is exclusive so include "below - 1"
    // The sieve of Sundaram is a simple deterministic algorithm for finding all the prime numbers up to a specified integer.
    let k = (n - 2) / 2
    var integers: [Bool] = Array(repeating: true, count: k + 1) // count from 1; i.e. we won't touch 0th position
    // mark all the numbers that are not to be included in the actual calculations
    for i in 1...k {    // natural numbers start from 1
        var j = i
        while i + j + 2 * i * j <= k {
            integers[i + j + 2 * i * j] = false
            j += 1
        }
    }
    // use the unmarked numbers in the list in the formula. Resultant are the prime numbers so we sum them.
    var sum = 0
    for i in 1...k {    // Again, 0 won's be consided for it's not a natural number
        if integers[i] == true {
            sum += 2 * i + 1
        }
    }
    return n < 2 ? sum : sum + 2
}

print(sieve_of_sundaram(below: 2_000_000))
// 142913828922
