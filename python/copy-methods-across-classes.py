class T:
    def t(self):
        print("T is the best!")

    @staticmethod
    def tt():
        print("T is the best!")

class TT:
    # TypeError: unbound method t() must be called with T instance as first argument (got TT instance instead)
    # t = lambda self: T.t(self)

    tt = lambda self: T.tt()

tt = TT()

# tt.t()
tt.tt()
