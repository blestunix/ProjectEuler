/*
  * Aim:  Special Pythagorean triplet
  *
  * Author: Saud Kadiri
  *
  * Dated: Monday, 13 December, 2021 and Tuesday, 14 December, 2021 
  *
  * Details:
  *   A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
  *     a² + b² = c²
  *   For example, 3² + 4² = 9 + 16 = 25 = 5².

  *   There exists exactly one Pythagorean triplet for which a + b + c = 1000.
  *   Find the product abc.
  * 
  *   Approach used:
  *     Euclid's formula (300 B.C) is a fundamental formula for generating Pythagorean triples given an arbitrary pair of integers m and n with m > n > 0. 
  *     The formula states that the integers:
  *         a = m² - n²
  *         b = 2mn
  *         c = m² + n²
  *     form a pythagorean triplet.
  *
  *     Given the sum of a, b, c we somehow need to find the corresponding values of a, b, c i.e. m, n values are needed (m < n)!
  *     Thus our problem is reduced to finding the values of m, n smartly!
  */

import Foundation

func special_pythagorean_triplet(target: Int) {    
    let x = target / 2
    let l = Int(floor(sqrt(Double(x / 2)))) // generator lower bound 
    let u = Int(ceil(sqrt(Double(x))))      // generator upper bound 
    let nums = l...u             // Array consisting of values from lower bound through upper bound  (m, n values a mapped to these!)

    for m in nums where x % m == 0 && 2 * m * m > x {
        let n = x / m - m

        let a = m * m - n * n
        let b = 2 * m * n
        let c = m * m + n * n

        if b > 0 {  // b can potentially become zero! So we don't accept such values
            print("\(a) * \(b) * \(c) = \(a * b * c)")
            return
        }
    }
    print("\(target) has no solution")
}

special_pythagorean_triplet(target: 1000)
// 375 * 200 * 425 = 31875000
