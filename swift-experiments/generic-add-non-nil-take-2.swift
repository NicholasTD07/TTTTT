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
    func +(lhs: Self, rhs: Self) -> Self
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
func <|> <T where T: Appendable>(lhs: T, rhs: T.Element?) -> T {
    if let value = rhs {
        var lhs = lhs
        lhs.append(value)
        return lhs
    } else {
        return lhs
    }
}

@warn_unused_result
func <|> <T where T: SelfAddable>(lhs: T, rhs: T?) -> T {
    if let value = rhs {
        return lhs + value
    } else {
        return lhs
    }
}

infix operator <*> { associativity left precedence 140 }
@warn_unused_result
func <*> <T where T: SelfAddable>(lhs: T?, rhs:T?) -> T? {
    switch (lhs, rhs) {
    case (.None, _): return nil
    case (.Some(let lhs), .None): return lhs
    case (.Some(let lhs), .Some(let rhs)): return lhs + rhs
    }
}

let nilString: String? = nil
// let combinedStrings = "abc" <|> nil <|> "def" // won't work. compiler doesn't know `nil` is String? or String.Element?
let combinedStrings = "abc" <|> nilString <|> "def"
assert(combinedStrings == "abcdef")

@warn_unused_result
func <|> <T where T: SelfAddable>(lhs: T?, rhs: T) -> T {
    if let value = lhs {
        return value + rhs
    } else {
        return rhs
    }
}

let combinedStringsStartingWithNil = nilString <*> "\n" <|> "hello"
assert(combinedStringsStartingWithNil == "hello")
