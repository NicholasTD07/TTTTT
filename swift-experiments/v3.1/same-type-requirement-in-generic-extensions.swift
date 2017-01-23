/** New in Swift 3.1
    You can add same type requirement in an extension for generic types
*/

struct TTTTT<Value> {
    var t: Value
}

extension TTTTT where Value == Bool {
    mutating func update(_ value: Bool) {
        t = value
    }
}
