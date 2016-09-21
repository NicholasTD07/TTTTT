protocol ActionType { }

struct InitialAction: ActionType { }

class Store<State> {
    var state: State!
    typealias Reducer = (State?, ActionType) -> State
    final let reducer: Reducer

    init(with reducer: @escaping Reducer) {
        self.reducer = reducer

        dispatch(InitialAction())
    }

    typealias Subscriber = (Store) -> ()
    final var subscribers = [Subscriber]()

    final func dispatch(_ action: ActionType) {
        self.state = reducer(state, action)
        subscribers.forEach {
            $0(self)
        }
    }

    final func subscribe(with subscriber: @escaping Subscriber) {
        subscribers.append(subscriber)
        subscriber(self)
    }
}


enum CounterActions: ActionType {
    case Increase
    case Decrease
}

let counterStore = Store<Int>.init { (state: Int?, action: ActionType) -> Int in
    let state = state ?? 0

    guard let counterAction = action as? CounterActions else {
        return state
    }

    switch counterAction {
    case .Increase:
        return state + 1
    case .Decrease:
        return state - 1
    }
}

// initial state is 0
assert(counterStore.state == 0)

// dispatch unknown actions does not affect the state
counterStore.dispatch(InitialAction())
assert(counterStore.state == 0)

// dispatch Increase will increase the state
counterStore.dispatch(CounterActions.Increase)
assert(counterStore.state == 1)

// dispatch Decrease will increase the state
counterStore.dispatch(CounterActions.Decrease)
assert(counterStore.state == 0)

var counter: Int = -1000
counterStore.subscribe { (store: Store<Int>) in
    counter = store.state
}
assert(counter == counterStore.state)

// when state is updated, subscirbers will get notified of the new state
counterStore.dispatch(CounterActions.Increase)
assert(counter == counterStore.state)
