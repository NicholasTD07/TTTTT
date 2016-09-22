protocol ActionType { }

struct InitialAction: ActionType { }

class Store<State> {
    var state: State
    typealias Reducer = (State?, ActionType) -> State
    final let reducer: Reducer

    init(with reducer: @escaping Reducer) {
        self.state = reducer(nil, InitialAction())
        self.reducer = reducer
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

/*
### Why the returned reducer takes Any as ActionType?

ActionType is defined as protcol ActionType { }, it's very similar to the Any type

Six scenarios:
- `action` is of type `SpecificActionType`,
    - if state is `nil`, the reducer will return `initialState`.
    - if state is not `nil`, the reducer will reduce its result.
- `action` is of type `ActionType`,
    - if state is `nil`, the reducer will return `initialState`.
    - if state is not `nil`, the reducer will return the current state.
- `action` is of some other types
    - if state is `nil`, the reducer will return `initialState`.
    - if state is not `nil`, the reducer will return the current state.

As you can see, what the reducer returns is the same if `action` is of type `ActionType` or `Any`.
However, if you want to combine reducers together, all reducers need to have a common type.

Q: What if we use ActionType, will Swift's compiler find a type which suits the purpose?
    i.e. what's the type of the array: [
        (State, ActionTypeOne) -> State,
        (State, ActionTypeTwo) -> State,
        (State, ActionTypeThree) -> State,
    ]

### Why do we need to pass in initial state?
Because we need to do the typecasting and if the typecasting fail we need to return a non-optional state,
while this (returned) reducer takes optional state. Thus we need the initialState.
*/

func Reducer<State, SpecificActionType>(
        initialState: State,
        reducer: @escaping (State, SpecificActionType) -> State
    ) -> (State?, Any) -> State {
    return { (state: State?, action: Any) -> State in
        guard let state = state else { return initialState }
        guard let action = action as? SpecificActionType else { return state }

        return reducer(state, action)
    }
}

// ==== combineReducers ====

func combineReducers<State>(initialState: State, reducers: [(State?, Any) -> State]) -> (State?, ActionType) -> State {
    return { (state: State?, action: ActionType) -> State in
        // FIXME: How can I remove that `??`?
        return reducers.reduce(state ?? initialState) { state, reducer in
            let reducer = Reducer(initialState: initialState, reducer: reducer)
            return reducer(state, action)
        }
    }
}

// ==== Example Usage ====

enum CounterActions: ActionType {
    case Increase
    case Decrease
}

let counterReducer = Reducer(initialState: 0) { (state: Int, action: CounterActions) -> Int in
    switch action {
    case .Increase:
        return state + 1
    case .Decrease:
        return state - 1
    }
}

let counterStore = Store<Int>.init(with: counterReducer)
// ==== Test Suite ====

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
