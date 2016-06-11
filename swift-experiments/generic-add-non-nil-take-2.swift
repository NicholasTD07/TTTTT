// String.append does NOT take String

// var s = "456"
// s.append("42343") // NOPE
// print(s)

protocol Appendable {
    associatedtype Element
    mutating func append(_: Element)
}

extension Array: Appendable { }

extension String: Appendable {
    typealias Element = UnicodeScalar
}
protocol SelfAddable {
    func +(rhs: Self, lhs: Self) -> Self
}

protocol HasElement {

}

let s1: String = "123"
let s2: String = "456"

print("s1 + s2 is \(s1 + s2)")

extension String: SelfAddable { }

// FIXME: Check associativity & precedence
infix operator <|> { associativity left precedence 140 }

@warn_unused_result
func <|> <T where T: Appendable>(rhs: T, lhs: T.Element?) -> T {
    if let value = lhs {
        var rhs = rhs
        rhs.append(value)
        return rhs
    } else {
        return rhs
    }
}

@warn_unused_result
func <|> <T where T: SelfAddable>(rhs: T, lhs: T?) -> T {
    if let value = lhs {
        return rhs + value
    } else {
        return rhs
    }
}

@warn_unused_result
func <*> <T where T SelfAddable>(rhs: T?, lhs:T?) -> T {
    switch (rhs, lhs):
        case .None(rhs)
}

let nilString: String? = nil
// let combinedStrings = "abc" <|> nil <|> "def" // won't work. compiler doesn't know `nil` is String? or String.Element?
let combinedStrings = "abc" <|> nilString <|> "def"
assert(combinedStrings == "abcdef")

