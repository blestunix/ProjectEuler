/*
 * Aim:  Longest Collatz sequence
 *
 * Author: Saud Kadiri
 *
 * Dated: Tuesday, December 28, 2021 and Wednesday, December 29, 2021
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

struct Collatz {
    var d: [Int: Int] = [1: 1]

    func rule(_ n: Int) -> Int {
        n % 2 == 0 ? n / 2 : 3 * n + 1
    }

    @discardableResult
    mutating func collatz(_ n: Int) -> Int {
        d[n] = d[n] ?? 1 + collatz(rule(n))
        return d[n]!
    }

    mutating func solve(upper_bound: Int) {
        for i in 1..<upper_bound {
            collatz(i)
        }
        let result = d.max { $0.1 < $1.1}!
        print("\(result.0) has the longest chain (of size: \(result.1))")
    }
}

var collatz = Collatz()
collatz.solve(upper_bound: 1_000_000)
// 837799 has the longest chain (of size: 525)
