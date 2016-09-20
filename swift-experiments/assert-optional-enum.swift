// Conclusion: `t: T? = T.t1` == .t1 and also .Some(.t1)
enum T {
    case t1
    case t2
}

let t: T? = .t1

assert(t == .t1)
assert(t == .Some(.t1))
