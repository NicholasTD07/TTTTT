// error: lazy properties may not have observers
struct T {
    lazy var t: String = { "t" }() {
        didSet {
            print(self.t)
        }
    }
}
