// Conclusion: You can have static let/var defined in extensions
struct T {}

extension T {
    static let t = ""
    static var tt = ""
}

T.tt = "t"
