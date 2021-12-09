/*
  * Aim:  Smallest multiple
  *
  * Author: Saud Kadiri
  *
  * Dated: Wednesday, Thursday, December 9, 2021
  *
  * Details:
  *     2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
  *     What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
  *
  * Approach used:
  *   Find the LCM of the array.
  */

struct SmallestMultiple {
    let from: Int
    let to: Int
    private func gcd(_ a: Int, _ b: Int) -> Int {
        return b == 0 ? a : gcd(b, a % b)
    }
    // finds the LCM of the array.
    func getSmallest() -> Int { 
        let divisors = from...to  // array
        var res = 1
        for divisor in divisors {
            res *= divisor / gcd(res, divisor)
        }
        return res
    }
}
let multiple = SmallestMultiple(from: 1, to: 20)
print(multiple.getSmallest())
//232792560
