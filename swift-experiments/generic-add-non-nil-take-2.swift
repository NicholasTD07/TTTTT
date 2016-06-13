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

let s1: String = "123"
let s2: String = "456"

print("s1 + s2 is \(s1 + s2)")

extension String: SelfAddable { }

// FIXME: Check associativity & precedence
infix operator <+> { associativity left precedence 140 }

@warn_unused_result
func <+> <T where T: Appendable>(lhs: T, rhs: T.Element?) -> T {
    if let value = rhs {
        var lhs = lhs
        lhs.append(value)
        return lhs
    } else {
        return lhs
    }
}

@warn_unused_result
func <+> <T where T: SelfAddable>(lhs: T, rhs: T?) -> T {
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
// let combinedStrings = "abc" <+> nil <+> "def" // won't work. compiler doesn't know `nil` is String? or String.Element?
let combinedStrings = "abc" <+> nilString <+> "def"
assert(combinedStrings == "abcdef")

@warn_unused_result
func <+> <T where T: SelfAddable>(lhs: T?, rhs: T) -> T {
    if let value = lhs {
        return value + rhs
    } else {
        return rhs
    }
}

let combinedStringsStartingWithNil = nilString <*> "\n" <+> "hello"
assert(combinedStringsStartingWithNil == "hello")
// Other SelfAddable types

extension Double: SelfAddable { }

let nilDouble: Double? = nil
let combinedDouble = 1.0 <+> nil <+> 2.0
assert(combinedDouble == 3.0)

let nonNilDoubleOne: Double = 1.0
// let nonNilDoubleTwo: Double? = 2.0
let nonNilDoubleTwo: Double = 2.0 // this won't work without the following func

@warn_unused_result
func <+> <T where T: SelfAddable>(lhs: T, rhs: T) -> T {
    return lhs + rhs
}

assert(nilDouble <+> 1.0 <+> 2.0 == 3.0) // this won't work without the func above
// Because 1.0 or 2.0 could be Optional<Double> in Swift's compiler's mind even if you put it into a let of type Double
// It can work without the func above but you have to define nonNilDoubleTwo as Double?

let combinedDoubleStartingNilPartOne = (nilDouble <+> nonNilDoubleOne)
print(combinedDoubleStartingNilPartOne.dynamicType) // Double
let combinedDoubleStartingNil =  combinedDoubleStartingNilPartOne <+> nonNilDoubleTwo
assert(combinedDoubleStartingNil == 3.0)


let combinedStringsStartingWithNilTwo = nilString <+> "\n" <+> "hello"
assert(combinedStringsStartingWithNilTwo == "\nhello")

// Two frameworks
// 1. ProtocolExtensions.swift
// 2. AddNonNilOnly
