/*
 * Aim:  Number letter counts(https://projecteuler.net/problem=17)
 *
 * Author: Saud Kadiri
 *
 * Dated: Friday, January 21, 2022
 *
 * Details:
 *   If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
 *   If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
 *   NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen)
 *         contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
 *
 * Approach:
 *    Explained where necessart. Basicall y form a dictionary of 999 items where the key is a number and value is it's spelling count.
 */

// intial values
var num_spellings_count: [Int: Int] = [
  1: 3, 2: 3, 3: 5, 4: 4,  5: 4, 6: 3, 7: 5,  8: 5,  9: 4, 10: 3, 11: 6, 12: 6,
  13: 8, 14: 8, 15: 7, 16: 7, 17: 9, 18: 8, 19: 8, 20: 6, 30: 6, 40: 5, 50: 5,
  60: 5, 70: 7, 80: 6, 90: 6
]

for i in 21 ... 99 {
  let tens = i / 10 * 10
  let ones = i - tens
  num_spellings_count[i]  = (num_spellings_count[tens] ?? 0) + (num_spellings_count[ones] ?? 0)
}


for num in 100 ... 999 {
  let hundreds = num / 100              // Get the digit at hundred's place
  let tens_ones = num - hundreds * 100  // Get the digits at the tens and ones place
  
  if num % 100 == 0 { // for 100, 200, 300, i.r one hundred; where "hundred" is 7 words long string
    num_spellings_count[num] = (num_spellings_count[hundreds] ?? 0) + 7
  } else { // for non-hundred 101, 324, three hundred and four where "hundred and" is 10 words long (exclding spaces)
    num_spellings_count[num] = (num_spellings_count[hundreds] ?? 0) + 10 + (num_spellings_count[tens_ones] ?? 0)
  }
} 


var total = 0
for val in num_spellings_count {
  total += val.value
}
total += 11
// total is the sum of
// 1-99: 854
// 100-999:  20259
// thousand: 11

print(total)
// 21124
