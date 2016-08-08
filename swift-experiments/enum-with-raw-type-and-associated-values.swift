enum T: String {
    case x = "x"
}

// error: enum with raw type cannot have cases with arguments
enum TT: String {
    case x(t: Int) = "x"
}
