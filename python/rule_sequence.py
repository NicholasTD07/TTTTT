"""
https://maryrosecook.com/blog/post/a-practical-introduction-to-functional-programming

zero() takes a string, s. If the first character is '0', it returns the rest of the string. If it is not, it returns None, the default return value of Python functions. one() does the same, but for a first character of '1'.

Imagine a function called rule_sequence(). It takes a string and a list of rule functions of the form of zero() and one(). It calls the first rule on the string. Unless None is returned, it takes the return value and calls the second rule on it. Unless None is returned, it takes the return value and calls the third rule on it. And so forth. If any rule returns None, rule_sequence() stops and returns None. Otherwise, it returns the return value of the final rule.

This is some sample input and output:

```
print rule_sequence('0101', [zero, one, zero])
# => 1

print rule_sequence('0101', [zero, zero])
# => None
```
"""

import functools

def rule_sequence(sequence, rules):
    """
    sequence is a string with 0 and 1 in it.
    rules is a list of function zeros and ones.

    acc -> string
    next -> next function/rule

    """

    def the_func(acc, _next):
        return _next(acc)

    return functools.reduce(the_func, rules, sequence)


def zero(s):
    if s[0] == "0":
        return s[1:]

def one(s):
    if s[0] == "1":
        return s[1:]

print(rule_sequence('0101', [zero, one, zero])) # => 1
print(rule_sequence('0101', [zero, zero])) # => None
print(rule_sequence('0101', [])) # => '0101'
