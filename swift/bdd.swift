struct Cat {
    var mood: String

    func feed() {
        // no op
    }
}

/**
_
  cat
    when being feed
      feels happy
*/

struct Example {
    let description: String
}

struct ExampleGroup {
    let description: String
    var examples = [Example]()

    init(description: String) {
        self.description = description
    }
}

struct World {
    static let shared = World()

    var groups = [ExampleGroup]()
    var group: ExampleGroup?

    mutating func run(_ closure: () -> Void, with group: ExampleGroup) {
        self.group = group
        closure()
    }
}

var world = World.shared

func describe(_ description: String, closure: () -> Void) {
    let group = ExampleGroup(description: description)

    world.groups.append(group)
    world.run(closure, with: group)
}

func context(_ description: String, closure: () -> Void) { }
func it(_ description: String, _ closure: () -> Void) { }

func before(_ closure: () -> Void) {  }

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

describe("cat") {
    var cat: Cat!

    before { // before(:suite)
        cat = Cat(mood: "meh")
    }

    context("when being fed") {
        // before(:all) {  }
        before { // before(:each)
            cat.feed()
        }

        it("feels happy") {
            expect(cat.mood) == "happy"
        }
    }
}

