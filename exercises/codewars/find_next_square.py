description = """
https://www.codewars.com/kata/56269eb78ad2e4ced1000013/train/python

You might know some pretty large perfect squares. But what about the NEXT one?

Complete the findNextSquare method that finds the next integral perfect square after the one passed as a parameter. Recall that an integral perfect square is an integer n such that sqrt(n) is also an integer.

If the parameter is itself not a perfect square, than -1 should be returned. You may assume the parameter is positive.

Examples:

findNextSquare(121) --> returns 144
findNextSquare(625) --> returns 676
findNextSquare(114) --> returns -1 since 114 is not a perfect
"""

import decimal

def find_next_square(sq):
    # Return the next square if sq is a square, -1 otherwise
    x = decimal.Decimal(sq)
    root = x.sqrt()

    if root != root.to_integral():
        return -1

    return (root + 1) ** 2


if __name__ == '__main__':
    y = find_next_square(121)
    print(y)
