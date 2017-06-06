protocol P {
    var x: Int { get }
}

enum E: Int {
    case x = 0
}

// extension E: P { }

struct S {
    var x = 0
}

extension S: P {}
