protocol ActionType { }
struct InitialAction: ActionType { }

class Store<State> {
    typealias Action = ActionType
    typealias Reducer = (state: State?, action: Action) -> State
    typealias Subscriber = (store: Store) -> ()

    var state: State!
    var reducer: Reducer
    var subscribers = [Subscriber]()

    final func dispatch(action: Action) {
        self.state = reducer(state: state, action: action)
        subscribers.forEach {
            $0(store: self)
        }
    }

    final func subscribe(with subscriber: Subscriber) {
        subscribers.append(subscriber)
        subscriber(store: self)
    }

    init(with reducer: Reducer) {
        self.reducer = reducer

        dispatch(InitialAction())
    }
}

struct Increase: ActionType { }
struct Decrease: ActionType { }

let counterStore = Store<Int>.init { (state: Int?, action: ActionType) -> Int in
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

// initial state is 0
assert(counterStore.state == 0)

// dispatch unknown actions does not affect the state
counterStore.dispatch(InitialAction())
assert(counterStore.state == 0)

// dispatch Increase will increase the state
counterStore.dispatch(Increase())
assert(counterStore.state == 1)

// dispatch Decrease will increase the state
counterStore.dispatch(Decrease())
assert(counterStore.state == 0)

var counter: Int = -1000
counterStore.subscribe { (store: Store<Int>) in
    counter = store.state
}
assert(counter == counterStore.state)
