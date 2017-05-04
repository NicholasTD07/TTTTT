struct Box<T> {
    let boxed: T
}

extension Box where T: Sequence {
    func contains(_ value: T) -> Bool {
        return true
        /* return boxed.contains(where: { $0 == value }) */
    }
}

extension Box where T: Sequence, T.Iterator.Element: Equatable {

}

extension Box where T: Sequence, T.Iterator.Element: Equatable {
    func contains(_ value: T.Iterator.Element) -> Bool {
        return boxed.contains(value)
    }
}

let array = [0]

let boxedArray = Box(boxed: array)

print(boxedArray.contains(0))

enum Action {
    case eat
    case sleep
}

let actions: [Action] = [.eat]
let boxedActions = Box(boxed: actions)

print(boxedActions.contains(.eat))
