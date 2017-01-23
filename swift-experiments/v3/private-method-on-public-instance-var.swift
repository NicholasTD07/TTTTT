// Q: Can we call private methods on a public static var?
// A: Nope

struct T {
    static var shared = T()

    init() { }

    private func t() {
        print("Hello World!")
    }
}

T.shared.t()
