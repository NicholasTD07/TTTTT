protocol T {
    var rawValue: String { get }
}
enum TTT: String {
    case T = "T"
}

extension TTT: T {  }
