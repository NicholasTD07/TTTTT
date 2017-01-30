class T {
    let t: String

    init(t: String) {
        self.t = t
    }
}

class TT: T {
    let tt: String

    init(t: String, tt: String) {
        self.tt = tt

        super.init(t: t)
    }
}
