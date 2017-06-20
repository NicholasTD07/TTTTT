"""
Decorators need to be three levels deep, to

- take parameters
- wrap around functions that take parameters
- process the return value(s) of the functions,


def decorator(params_for_itsef):

    def wrapper_around(a_function):

        def wrapped_function(*args, **kwargs):
            return_value = a_function(*args, **kwargs):
            processed = process(return_value)

            return processed

        return wrapped_function

    return wrapper_around
"""

def add(key, value_func):
    def wrapper(func):
        def nested(*args, **kwargs):
            y = func(*args, **kwargs)
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
