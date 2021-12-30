/*
 * Aim:  Lattice paths(https://projecteuler.net/problem=15)
 *
 * Author: Saud Kadiri
 *
 * Dated: Thursday, December 30, 2021
 *
 * Details:
 *   Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.
 *   How many such routes are there through a 20×20 grid?
 *
 * Approach:
 *    To find the result we simply need to efficiently method compute individual binomial coefficients (using the formula):
 *                n + 1 - i
 *        Π = ------------------  (for i = 1 through k)
 *                    i
 */

let k = 20      //  given height and width of the grid
let n = 2 * k   //  steps needed to reach the final destination (evenly increment in both the direcitons of grid)
var paths = 1   //  ⁿCₖ

// Calculate ⁿCₖ using multiplicative formula(because calculation using factiorial formula is expensive)
for i in 1 ... k {
    paths *= (n - (i - 1))
    paths /= i
}

print(paths)
// 137846528820
