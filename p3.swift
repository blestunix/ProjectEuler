/*
  * Aim:  Largest prime factor
  *
  * Author: Saud Kadiri
  *
  * Dated: Wednesday, November 17, 2021 and Thursday, November 18, 2021
  * Reposted: Tuesday, December 7, 2021
  * 
  * Details:
  *   The prime factors of 13195 are 5, 7, 13 and 29.
  *   What is the largest prime factor of the number 600851475143 ?
  *
  * Approach used:
  *     A popular approach is the Euler's factorization method (based on the Brahmagupta–Fibonacci identity)
  *        Brahmagupta–Fibonacci identity which says that every product of two sums of two squares is a sum of two squares in two different ways:
  *            (a²+b²)(c²+d²) = (ac+bd)² + (ad−bc)² = (ac−bd)² + (ad+bc)²
  *        But the disadvantage of Euler's factorization method is that it cannot be applied to
  *        factoring an integer with any prime factor of the form 4𝓀 + 3 occurring to an odd power in its prime factorization, as such a number
  *        can never be the sum of two squares.
  *
  *     Some other options are:
  *       - Sieve approach is time efficient (O(log n)) but has an upsetting space complexity!!
  *       - Pollard rho algotithm reaches a dead state if n is prime ... so another check increases the cost
  *       - Fermat for long numbers is inefficient
  *
  *     Prime Factorization by Trial Division is a viable option!
  *       - The maximum factor for any number n is always less than or equal to √n 
  *       - The Fundamental Theorem of Arithmetic states that every natural number is a product of primes
  *       - So iterate from 2(smallest prime) to √n 
  *
  * References:
  *   https://en.wikipedia.org/wiki/Euler%27s_factorization_method
  *   https://stackoverflow.com/questions/24166478/efficient-ways-of-finding-the-largest-prime-factor-of-a-number
  */

let n = 600_851_475_143   // given number
var temp_n = n            // constant to var...
var largestFact = 0       // to store the largest fact we get during the computation
var counter = 2           // smallest prime number
// for using sqrt() we need to import Foundation module (which I feel is an overhead) plus in Swift we'll need to do it in this way: Int(sqrt(Double(temp_n))
// So as a design idea... (remember counter will potentially become the largest prime factor!)
//          counter  <= √n 
//          counter² <=  n           .... squaring on both the sides we get
while (counter * counter <= temp_n) {
    if temp_n % counter != 0 { // this condition fails for any composite number (**refer line 27)
      counter += 1
    } else {
      // we found a factor which is a prime number... i.e. temp_n % counter == 0 is true
      temp_n /= counter       // counter is a divisor of n so now get a smaller n by dividing it
      largestFact = counter   // store the last counter 
    }
}
// temp_n is still a prime and if it's greater than the last counter it means that it was not considered in the loop so we look at it now
if (temp_n > largestFact) {
    largestFact = temp_n
}

print("\(largestFact)")
// 6857
