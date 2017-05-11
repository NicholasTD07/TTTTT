func split<T>(_ xs: [T], into chunks: Int) -> [[T]] {
    let chunkSize = xs.count / chunks
    return stride(from: 0, to: xs.count, by: chunkSize).map {
        Array(xs[$0..<Swift.min($0 + chunkSize, xs.count)])
    }
}

func distribute<T, U>(_ xs: [T], into ys: [U]) -> [Either<T, U>] {
    let chunks = split(ys, into: xs.count)
    print(chunks)

    return zip(xs, chunks).reduce([]) { (acc: [Either<T, U>], zipped: (T, [U])) -> [Either<T,U>] in
        let (x, ys) = zipped
        let x_ = Either<T, U>.left(x)
        let ys_ = ys.map { Either<T, U>.right($0) }

        return acc + ys_ + [x_]
    }.flatMap { $0 }
}

let xs = [1,2,3,4,5]
let ys = ["a", "b", "c", "d", "e"]
let zs: [Either<Int, String>] = distribute(xs, into: ys)

/*
let expected: [Either<Int, String>] = [
    .right("a"),
    .left(1),
    .right("b"),
    .left(2),
    .right("c"),
    .left(3),
    .right("d"),
    .left(4),
    .right("e"),
]

assert(zs == expected)
enum Either<Left, Right> {
    case left(Left)
    case right(Right)

}

func == <T,U>(lhs: Either<T, U>, rhs: Either<T, U>) -> Bool
    where T: Equatable, U: Equatable
{
    switch (lhs, rhs) {
    case let (.left(l), .left(r)): return l == r
    case let (.right(l), .right(r)): return l == r
    default: return false
    }
}

extension Either where Left == Int, Right == String {
    static func == (lhs: Either, rhs: Either) -> Bool {
        return true
    }
}

extension Array where Element: Equatable {
    static func == (lhs: [Element], rhs: [Element]) -> Bool {
        return true
    }
}

*/
