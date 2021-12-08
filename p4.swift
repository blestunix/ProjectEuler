/*
 * Aim:  Largest palindrome product
 *
 * Author: Saud Kadiri
 *
 * Dated: Wednesday, December 8, 2021
 *
 * Details:
 *    A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
 *    Find the largest palindrome made from the product of two 3-digit numbers.
 *
 * Approach used:
 * palindrome-product = first * second
 *            = (10ⁿ - x) * (10ⁿ - y)           (where x, y > 0); n = no. of digits
 *            = 10²ⁿ - 10ⁿx - 10ⁿy + xy
 *            = 10²ⁿ - 10ⁿ(x + y) + xy
 *            = 10ⁿ * (10ⁿ - (x + y)) + xy
 *            = 10ⁿ * left + right               (let left = 10ⁿ - (x + y) and; 
 *                                                    right = xy)
 *  Now, we've
 *      right = xy
 *      let z = x + y
 *      ∴ right = x(z - x)
 *      ∴ right = zx - x²
 *      ∴ x² - zx + right = 0
 *
 *      a = 1
 *      b = -z
 *      c = right
 *
 *  References:
 *    https://medium.com/@d_dchris/largest-palindrome-product-problem-brilliant-approach-using-mathematics-python3-leetcode-479-b3f2dd91b1aa
 */
struct PalindromeProduct {
    let noOfDigits: Int

    private func isInt(_ num: Double) -> Bool {
        return num.truncatingRemainder(dividingBy: 1) == 0
    }
    private func power(_ num: Int, raisedTo: Int) -> Int {
        guard raisedTo != 0 else { return 0 }
        guard raisedTo != 1 else { return num }
        var ans = num
        for _ in 2...raisedTo {
            ans *= num
        }
        return ans
    }
    
    func getLargest() -> Int {
        let n = noOfDigits
        if n == 1 { 
            return 9 
        }
        guard n < 9 else {
            print("Too large to compute")
            return -1
        }
        let max = power(10, raisedTo: n)   // store the value of 10ⁿ 
        for z in 2..<max {  // Since both x, y > 1 and z = x + y; which implies that z has a minimum value of 2
            let left = max - z  // Start from the biggest
            let right = Int(String(String(left).reversed()))!
            let discriminant = power(z, raisedTo: 2) - 4 * right // b² - 4ac
            
            if discriminant < 0 { // no root
                continue
            } else { // there exists at least one real solution
                let roots = (first: 0.5 * (Double(z) + Double(discriminant).squareRoot()),
                            second: 0.5 * (Double(z) - Double(discriminant).squareRoot()))
                if isInt(roots.first) || isInt(roots.second) {
                    return (max * left + right)
                }
            }
        }
        return 0
    }
}

let plaindrome = PalindromeProduct(noOfDigits: 3)
print(plaindrome.getLargest()) // 906609
