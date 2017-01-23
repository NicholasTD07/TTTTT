// Conclusion: `t: T? = T.t1` == .t1 and also .some(.t1)
enum T {
    case t1
    case t2
}

let t: T? = .t1

assert(t == .t1)
#if swift(>=3)
    assert(t == .some(.t1))
#else
    assert(t == .Some(.t1))
#endif
