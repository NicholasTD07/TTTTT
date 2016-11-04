// Conclusion: enums are implicitly Hashable
// However:
//          Today at work I ran into a weird build error:
//          "protocol witness table for SomeEnum: Swift.Hashable in App, referenced from: (a list of files)"
//          Symbol(s) not found for architecture x86_64
// Fix: Add Hashable to SomeEnum even tho it's redundant
protocol Mappable: Hashable {
    static var map: [Self: String] { get }
}
extension Mappable {
    var string: String? {
        return Self.map[self]
    }
}

enum T {
    case t1
    case t2
}

extension T: Mappable {
    static var map: [T: String] {
        return [
            .t1: "t1",
            .t2: "t2",
        ]
    }
}

func takeHashable<T: Hashable>(_ t: T) { }

takeHashable(T.t1)
print("ran")
