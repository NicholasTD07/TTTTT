task_description = """
http://www.codewars.com/kata/build-a-pile-of-cubes/train/python

Your task is to construct a building which will be a pile of n cubes. The cube
at the bottom will have a volume of n^3, the cube above will have volume of
(n-1)^3 and so on until the top which will have a volume of 1^3.

You are given the total volume m of the building. Being given m can you find
the number n of cubes you will have to build?

The parameter of the function findNb (find_nb, find-nb, findNb) will be an
integer m and you have to return the integer n such as n^3 + (n-1)^3 + ... +
1^3 = m if such a n exists or -1 if there is no such n.

Examples:

findNb(1071225) --> 45
findNb(91716553919377) --> -1
"""

analysis = """
This is actually a math exercise...

Until the number gets insanely big...


n   n^3    cubic sum
1    1        1       =  1^2    = (1)^2
2    8        9       =  3^2    = (1+2)^2
3    27       36      =  6^2    = (1+2+3)^2
4    64       100     =  10^2   = (1+2+3+4)^2
5    125      225     =  15^2   = (1+2+3+4+5)^2

n^3 + (n-1)^3 + (n-2)^3 + ... + 2^3 + 1^3
  = (n + n - 1 + n -2 + ... + 2 + 1)^2
  = ((n + 1) * n / 2)^2 = cubic_sum

->

(n + 1) * n / 2 = sqrt(cubic_sum)
    (n + 1) * n = 2 * sqrt(cubic_sum)
        n^2 + n = 2 * sqrt(cubic_sum)

-> n^2 < n^2 + n < 2 * n^2
-> n^2 < 2 * sqrt(cubic_sum) <  2 * n^2
-> n^2 / 2 < sqrt(cubic_sum) < n^2

---> sqrt(sqrt(cubic_sum)) < n < sqrt(2 * sqrt(cubic_sum))
"""

import decimal

def find_nb(m):
    root = decimal.Decimal(m).sqrt()
    low = round(root.sqrt())
    high = round((2 * root).sqrt())

    x = high
    y = cubic_sum(x)

    # print(m)
    # print(x)
    # print(y)

    while y > m and x > low:
        x -=1
        y = cubic_sum(x)
        # print(x)
        # print(y)

    if y == m:
        return x
    else:
        return -1


def cubic_sum(x):
    x = decimal.Decimal(x)
    return (((x ** 2 + x) / 2) ** 2)

if __name__ == '__main__':
    x = 45001
    # y = cubic_sum(x)
    y = 1025292944081385001 # fails at big numbers...
    x_ = find_nb(y)
    print(x)
    print(cubic_sum(x))
    print(y)
    print(x_)
    print(x_ == x)
