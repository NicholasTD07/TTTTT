enum Either<Left, Right> {
    case left(Left)
    case right(Right)
}

typealias T = Either<Int, String>

extension Array where Element == T {
    mutating func append(_ value: Int) {
        self.append(T.left(value))
    }
}

// errored...
/*

extension Array where Element: Either {

}

*/
