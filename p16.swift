/*
 * Aim:  Power digit sum(https://projecteuler.net/problem=16)
 *
 * Author: Saud Kadiri
 *
 * Dated: Friday, December 31, 2021 
 *
 * Details:
 *      2¹⁵ = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
 *    What is the sum of the digits of the number 2¹⁰⁰⁰?
 * Approach:
 *    The sum of digits of an interger `n` is given by: 1 + ⌊㏒₁₀(n)⌋
 *    Thud number of digits in 2¹⁰⁰⁰ = 1 + ⌊㏒₁₀(2¹⁰⁰⁰)⌋
 *    Using log we can find the number of digits in 2¹⁰⁰⁰ as: 1 + ⌊1000 * ㏒₁₀(2)⌋ = 302
 *    We can thus allocate an array to handle this sort of multiplication of 302 digts!
 */

import Foundation

func digit_count(n: Int, raisedTo: Int = 1) -> Int {
    1 + Int(floor(Double(raisedTo) * log10(Double(n))))
}
