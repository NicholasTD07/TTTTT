// Conclusion: enums have String as its raw type has exact literal value
enum _T: String {
    case T
    case TT
    case TTT

    static var allValues = [ T, TT, TTT ]
}

_T.allValues.forEach { print($0) }
/*
 T
 TT
 TTT
*/
