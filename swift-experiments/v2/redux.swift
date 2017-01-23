typealias SubscriberType = (StoreType) -> ()

protocol ActionType { }

protocol StoreType {
    associatedtype StateType
    var state: StateType? { get }
    func subscribe(subscriber: SubscriberType)
    func dispatch(action: ActionType)
}

struct InitialAction: ActionType { }

struct ExampleReducers {
    struct Counter {
        typealias State = Int
        typealias Reducer = (state: State?, action: ActionType) -> State

        struct Increase: ActionType { }
        struct Decrease: ActionType { }

        static func reduceFunc(state: State? = nil, action: ActionType) -> State {
            let state = state ?? 0

            switch action {
            case _ as Increase:
                return state + 1
            case _ as Decrease:
                return state - 1
            default:
                return state
            }
        }

        class Store: StoreType {
            typealias StateType = Int
            var subscribers = [SubscriberType]()
            var state: StateType?
            private let reducer: Reducer

            init(reducer: Reducer) {
                self.reducer = reducer

                dispatch(InitialAction())
            }

            func dispatch(action: ActionType) {
                self.state = self.reducer(state: state, action: action)
                subscribers.forEach {
                    $0(self)
                }
            }

            func subscribe(subscriber: SubscriberType) {
                subscribers.append(subscriber)
            }
        }
    }
}

let store = ExampleReducers.Counter.Store(
   reducer: ExampleReducers.Counter.reduceFunc
)

// initial state is 0
assert(store.state == 0)

// dispatch unknown actions does not affect the state
store.dispatch(InitialAction())
assert(store.state == 0)

// dispatch Increase will increase the state
store.dispatch(ExampleReducers.Counter.Increase())
assert(store.state == 1)

// dispatch Decrease will increase the state
store.dispatch(ExampleReducers.Counter.Decrease())
assert(store.state == 0)
