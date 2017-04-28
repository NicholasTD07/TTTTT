struct Cat {
    var mood: String

    func feed() {
        // no op
    }
}

typealias Action = () -> Void

struct Description {
    typealias Context = Description

    func before(_ closure: Action) {
    }

    func context(_ description: String, closure: (Context) -> Void) {

    }

    func it(_ description: String, closure: Action) {

    }
}

func describe(_ description: String, closure: (Description) -> Void) {

}


func expect<T>(_ value: T) -> Expectation<T> {
    return Expectation(actual: value)
}

struct Expectation<T> {
    let actual: T
}

func == <T>(rhs: Expectation<T>, lhs: Any) where T: Equatable {
    func failed(_ message: String) {
        /* XCTFail */
    }

    guard let expected = lhs as? T else {
        failed("")

        return
    }

    if rhs.actual != expected {
        failed("")
    }
}

describe("cat") { description in
    var cat: Cat!

    description.before {
        cat = Cat(mood: "meh")
    }

    description.context("when being feed") { context in

        context.before {
            cat.feed()
        }

        context.it("feels happy") {
            expect(cat.mood) == "happy"
        }
    }
}
