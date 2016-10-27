// Conclusion: if you want to have a Protocol C have members that are also protocols
//             YOU CAN!
//             You will need a func like the processC func
protocol A {

}

protocol B {

}

protocol C {
    associatedtype A
    associatedtype B
    var a: A { get }
    var b: B { get }
}

func processC<T: C>(c: T) where T.A: A, T.B: B {
    // WAT! THIS WORKS!
}
