// Experimental

protocol TTT {
    func ttt()
}

extension TTT {
    func ttt() { }
}

enum T {

    struct TA { }
    struct TB { }
    struct TC { }
    case A(_: TA)
    case B(_: TB)
    case C(_: TC)
}

// DOES NOT WORK!
// extension T where Self == .A {
// }

let _ = T.A

// error: 'A' is not a member type of 'T'
// extension T.A {

// }

extension T.TA: TTT { }
extension T.TB: TTT { }
extension T.TC: TTT { }

extension T {
    func t() {
        switch self {
        case let .A(a):
            a.ttt()
        case let .B(b):
            b.ttt()
        case let .C(c):
            c.ttt()
        }
    }
}
