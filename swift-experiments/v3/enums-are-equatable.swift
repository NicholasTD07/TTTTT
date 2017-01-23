// Conclusion: enum without associated values are Equatable by default
enum T {
    case t1
    case t2
}

print(T.t1 == T.t2)

enum TT {
    case stringT(value: String)
    case intT(value: Int)
}
// error: binary operator '==' cannot be applied to two 'TT' operands
// print(TT.stringT(value: "") == TT.intT(value: 0))
