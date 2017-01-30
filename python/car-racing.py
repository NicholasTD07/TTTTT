"""
https://maryrosecook.com/blog/post/a-practical-introduction-to-functional-programming

The program below runs a race between three cars. At each time step, each car may move forwards or it may stall. At each time step, the program prints out the paths of the cars so far. After five time steps, the race is over.

Expected Output looks like:
```
-
-
-

-
--
--

--
--
---

---
--
---

----
---
----

----
----
-----
```
"""

# My version

import collections
import random

State = collections.namedtuple('State', ['steps', 'car_positions'])

def race(state):
    """
    draw state
    run step of race
    next race
    """
    if state.steps > 0:
        draw(state)
        race(run_step_of_race(state))

def draw(state):
    def draw_car(position):
        return '-' * position

    print('')
    print('\n'.join(map(draw_car, state.car_positions)))

def run_step_of_race(state):
    def random_advance(car_position):
        if random.random() > 0.5:
            return car_position + 1
        else:
            return car_position

    return State(
        steps= state.steps - 1,
        car_positions= map(random_advance, state.car_positions)
    )

race(
    State(
        steps=5,
        car_positions= [1, 1, 1]
    )
)
