"""
https://www.codewars.com/kata/54bf1c2cd5b56cc47f0007a1/train/python

Count the number of Duplicates

Write a function that will return the count of distinct case-insensitive alphabetic characters and numeric digits that occur more than once in the input string. The input string can be assumed to contain only alphanumeric characters, including digits, uppercase and lowercase alphabets.

Example

"abcde" -> 0 # no characters repeats more than once
"aabbcde" -> 2 # 'a' and 'b'
"aabbcdeB" -> 2 # 'a' and 'b'
"indivisibility" -> 1 # 'i'
"Indivisibilities" -> 2 # 'i' and 's'
"aa11" -> 2 # 'a' and '1'
"""

import collections

def duplicate_count(text):
    # print(text)
    counter = collections.Counter(text.lower())
    return len(list(filter(lambda x: x[1] > 1, counter.items())))

if __name__ == '__main__':
    print(duplicate_count('aabbcde'))
