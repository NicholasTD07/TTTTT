import re
import operator as op

def tokenize(expression):
    if expression == "":
        return []

    regex = re.compile("\s*(=>|[-+*\/\%=\(\)]|[A-Za-z_][A-Za-z0-9_]*|[0-9]*\.?[0-9]+)\s*")
    tokens = regex.findall(expression)
    return [s for s in tokens if not s.isspace()]

class Interpreter:
    def __init__(self):
        self.vars = {}
        self.functions = {
            '+': op.add,
            '-': op.sub,
            '*': op.mul,
            '/': op.truediv,
        }

    def input(self, expression):
        tokens = tokenize(expression)
        print(tokens)

if __name__ == '__main__':
    interpreter = Interpreter();
    y = interpreter.input("1 + 1")
    print(y)
