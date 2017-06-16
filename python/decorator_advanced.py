def add(key, value_func):
    def wrapper(func):
        def nested(arg, kwarg):
            y = func(arg, kwarg=kwarg)
            y[key] = value_func(y)
            return y
        return nested
    return wrapper

def body(result):
    return result["arg"] + 100

@add("body", body)
def f(arg, kwarg=None):
    return {
        "arg": arg,
        "kwarg": kwarg
    }


if __name__ == '__main__':
    print(f(1, kwarg=True))
