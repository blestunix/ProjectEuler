/*
  * Aim:  Sum square difference
  *
  * Author: Saud Kadiri
  *
  * Dated: Saturday, December 11, 2021
  *
  * Details:
  *   By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
  *
  *   What is the 10 001st prime number?
  *
  * Approach used:
  *   Sieve of Eratosthenes:
  *       To find all the prime numbers less than or equal to a given integer n by Eratosthenes' method:
  *         1. Create a list of consecutive integers from 2 through n: (2, 3, 4, ..., n).
  *         2. Initially, let p equal 2, the smallest prime number.
  *         3. Enumerate the multiples of p by counting in increments of p from 2p to n, and mark them in the list
  *            (these will be 2p, 3p, 4p, ...; the p itself should not be marked).
  *         4. Find the smallest number in the list greater than p that is not marked. If there was no such number, stop.
  *            Otherwise, let p now equal this new number (which is the next prime), and repeat from step 3.
  *         5. When the algorithm terminates, the numbers remaining not marked in the list are all the primes below n.
  *
  * References:
  *   1. https://www.khanacademy.org/computing/computer-science/cryptography/comp-number-theory/v/sieve-of-eratosthenes-prime-adventure-part-4
  *   2. https://en.wikipedia.org/wiki/Prime_number_theorem
  */

import Foundation

struct Prime {
    func sieveOfEratosthenes(_ n: Int) -> Int {
        // nth prime is always less than n * [ln(n) + ln(ln(n))]
        let upper = Int(Double(n) * (log(Double(n)) + log(log((Double(n))))))

        // all values true array
        var prime: [Bool] = Array(repeating: true, count: upper)

        // eliminate composites
        var p = 2 // 2 being the first prime number
        while (p * p < upper) {
            if (prime[p] == true) {
                for i in stride(from: p * p, to: upper, by: p) {
                    prime[i] = false
                }
            }
            p += 1
        }
        // append the integers(indices) that happen to be prime
        var primes: [Int] = []
        p = 2
        while p < upper {
            if prime[p] == true {
                primes.append(p)
            }
            p += 1
        }
        return primes[n - 1]
    }
}

let prime = Prime()
print(prime.sieveOfEratosthenes(10001))
// 104743
