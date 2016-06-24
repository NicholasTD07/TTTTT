import Foundation

// NOTHING WORKS 😞

// extension NSAttributedString: StringLiteralConvertible {
//     init(stringLiteral string: String) {
//         self = NSAttributedString(string: string)
//     }
// }

// let attributedString: NSAttributedString = "aaaaaa"

// ERROR

// swift-experiments/string-nsattributedstring.swift:4:5: error: designated initializer cannot be declared in an extension of 'NSAttributedString'; did you mean this to be a convenience initializer?
//     init(stringLiteral string: String) {
//     ^
//     convenience
// swift-experiments/string-nsattributedstring.swift:3:1: error: type 'NSAttributedString' does not conform to protocol 'ExtendedGraphemeClusterLiteralConvertible'
// extension NSAttributedString: StringLiteralConvertible {
// ^
// Swift.ExtendedGraphemeClusterLiteralConvertible:4:20: note: protocol requires nested type 'ExtendedGraphemeClusterLiteralType'
//     associatedtype ExtendedGraphemeClusterLiteralType : _BuiltinExtendedGraphemeClusterLiteralConvertible
//                    ^
// swift-experiments/string-nsattributedstring.swift:3:1: error: type 'NSAttributedString' does not conform to protocol 'UnicodeScalarLiteralConvertible'
// extension NSAttributedString: StringLiteralConvertible {
// ^
// Swift.UnicodeScalarLiteralConvertible:4:20: note: protocol requires nested type 'UnicodeScalarLiteralType'
//     associatedtype UnicodeScalarLiteralType : _BuiltinUnicodeScalarLiteralConvertible
//                    ^
// swift-experiments/string-nsattributedstring.swift:5:14: error: cannot assign to value: 'self' is immutable
//         self = NSAttributedString(string: string)
//         ~~~~ ^

// shell returned 1
