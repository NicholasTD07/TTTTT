import re

sample = """
func t() {}

func t123xyz() {}

func t() {
}

func t() -> T {}

func t(t1: T1) {}
func t(t1: T1) -> R {}
func t(t1: T1, t2: T2) -> R {}
func t(t1: T1, t2: T2, t3 t3: T3) -> R {}

func t(t1: T1,
       t2: T2,
       t3 t3: T3) -> R {}

func t(t1: T1,
       t2: T2,
       t3 t3: T3
      ) -> R {}

struct T {
    func tt()
}
"""


pattern = r"""
    func # 
    \s+ # space between func and name
    (
    \w+ # func name
    .*
    )
    {
"""

print re.findall(pattern, sample, re.X)
