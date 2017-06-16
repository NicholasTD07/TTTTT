"""
https://www.hackerrank.com/contests/w33/challenges/pattern-count/problem

Sample Input 0

3
100001abc101
1001ab010abc01001
1001010001

Sample Output 0

2
2
3
"""

import collections
from functools import reduce

State = collections.namedtuple('State', ['state', 'count'])

def f(state, n):
    if n == '1':
        if state.state and state.state == '0':
            return State(state='1', count=state.count + 1)
        else:
            return State(state='1', count=state.count)
    elif n == '0':
        if state.state and state.state == '0' or state.state == '1':
            return State(state='0', count=state.count)
        else:
            return State(state=None, count=state.count)
    else:
        return State(state=None, count=state.count)

def patternCount(s):
    state = reduce(f, s, State(state=None, count=0))
    return state.count

if __name__ == '__main__':

    lines = """100001abc101
1001ab010abc01001
1001010001
""".splitlines()

    print(list(map(patternCount, lines)))
