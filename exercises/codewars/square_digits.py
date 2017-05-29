"""
https://www.codewars.com/kata/546e2562b03326a88e000020/train/python

Welcome. In this kata, you are asked to square every digit of a number.

For example, if we run 9119 through the function, 811181 will come out.

Note: The function accepts an integer and returns an integer
"""

def square_digits(num):
    x = str(num)
    xs = list(x)
    ys = [ str(int(x) ** 2) for x in xs ]

    y = ''.join(ys)

    return int(y)

if __name__ == '__main__':
    y = square_digits(9119)
    print(y)
    print(y == 811181)
