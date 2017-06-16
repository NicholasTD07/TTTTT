def t():
    return print("T")

def tt(t):
    return print(t)

def decorator(f):
    def wrapper():
        return f()
    return wrapper

@decorator
def t_():
    return t()

def decorator_with_params(p1, p2):
    def wrapper(f):
        def nested():
            return f(p1, p2)
        return nested
    return wrapper

@decorator_with_params(1, 2)
def f(p1, p2):
    return print(p1, p2)

if __name__ == '__main__':
    t()
    tt("TT")

    t_()
    f()
