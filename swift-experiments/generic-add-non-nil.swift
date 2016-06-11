// import Foundation

protocol Appendable {
    associatedtype Element
    mutating func append(_: Element)
}

extension Array: Appendable { }

extension String: Appendable {
    typealias Element = UnicodeScalar
}

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

// TESTS

// Array([1,2,3])
// String("123")

let array = [1,2,3]

let a1 = array <|> 1
let a2 = a1 <|> nil
let a3 = a2 <|> 2

assert(array == [1,2,3])
assert(a1 == [1,2,3,1])
assert(a2 == [1,2,3,1])
assert(a3 == [1,2,3,1,2])

let string = "456"

let s1 = string <|> "4"
let s2 = s1 <|> nil
let s3 = s2 <|> "5"

assert(string == "456")
assert(s1 == "4564")
assert(s2 == "4564")
assert(s3 == "45645")

// reduce
let s4 = ["4", nil, "5"].reduce(string, combine: <|>)
assert(s4 == "45645")

// Sample Application

let strings2: [String?] = [nil, "\n", "world"]

let expected1 = "hello\nworld"
let expected2 = "\nworld"

// WONT WORK
// let hello = "hello"
// let strings1: [String?] = [nil, "\n", "world"]
// let actual1 = strings1.reduce(hello, combine: <|>)
// assert(actual1 == expected1)

// HOW DID THIS WORK?????!!!!!!!
// Because it's [Character?]    String        (String, Character?) -> String
let s5 = [nil, "4", "5"].reduce(string, combine: <|>)
// The array is type [String?]
// The string is type String
// The <|> type is <T where T: Appendable>(rhs: T, lhs: T.Element?) -> T
// reduce
// @warn_unused_result func reduce<T>(_ initial: T, @noescape combine combine: (T, Self.Generator.Element) throws -> T) rethrows -> T

print(s5.dynamicType) // String

// let s5_ = [nil, "4", "5"].reduce("456", combine: <|>) // NOPE, swift does NOT like this

assert(s5 == "45645")

// STILL WONT WORK
// error: type of expression is ambiguous without more context
let helloString = "hello"
// let s6 = [nil, "\n", "world"].reduce(helloString, combine: <|>)
// assert(s6 == expected1)


print(string.dynamicType.self) // String
print(helloString.dynamicType.self) // String

// let expectedX = "world"
