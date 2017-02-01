// Conclusion: You can have a protocol defining mutating func
//             only if the protocol does not inherit from `class`
protocol T {
    mutating func t()
}

// error: 'mutating' isn't valid on methods in classes or class-bound protocols
/**
protocol TT: class {
    mutating func tt()
}
*/
