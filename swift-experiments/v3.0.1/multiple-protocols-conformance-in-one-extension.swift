// Conclusion: You can have one extension conforms to multiple protocols
protocol T {
    func t() -> String
}

protocol Experimental { }

struct TTT { }

extension TTT: Experimental, T {
    func t() -> String { return "" }
}
