enum Either<Left, Right> {
    case left(Left)
    case right(Right)
}

extension Either {
    var typeString: String {
        switch self {
        case .left:
            return "left"
        case .right:
            return " right"
        }
    }
}

// error: argument type 'String' does not conform to expected type 'Any' (aka 'protocol<>')
// print(Either.left().typeString)

print(Either<Int, Int>.left(0).typeString)
