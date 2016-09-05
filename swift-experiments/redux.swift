protocol StateType { }
protocol SubscriberType { }
protocol ActionType { }

struct ExampleReducers {
    struct Counter {
        typealias State = Int
        struct Increase: ActionType { }
        struct Decrease: ActionType { }

        func counter(state: State = 0, action: ActionType) -> State {
            switch action {
            case _ as Increase:
                return state + 1
            case _ as Decrease:
                return state - 1
            default:
                return state
            }
        }
    }
}

protocol Store {
    var state: StateType { get }
    func subscribe(subsciber: SubscriberType)
    func dispatch(action: ActionType)
}

