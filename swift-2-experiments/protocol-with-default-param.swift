protocol TTT {
    func t(t1: String, t2: Int)
}

struct TTTTT: TTT {
    func t(t1: String, t2: Int = 0) {
    }
}

// In Swift you can use default param with protocol!
