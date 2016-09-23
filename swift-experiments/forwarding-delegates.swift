// protocol T { }

// protocol TT {
//     var t: T { get }
// }

// struct CT: T { }

// struct CTT {
//     var t: T = CT()
// }

protocol T {
    func canShowSomething() -> Bool
}

protocol ForwardingT: T {
    var delegate: T { get }
}

struct ConcreteT: T {
    func canShowSomething() -> Bool {
        return true
    }
}

struct SomethingDontCare: ForwardingT {
    var delegate: T = ConcreteT()
}

extension ForwardingT {
    func canShowSomething() -> Bool {
        return self.delegate.canShowSomething()
    }
}

print(SomethingDontCare().canShowSomething())
