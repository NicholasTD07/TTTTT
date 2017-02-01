import Darwin

struct State {
    let steps: Int
    let carPositions: [Int]
}

func race(with state: State) {
    guard state.steps >= 0 else { return }

    display(state)
    race(with: runOneStepOfTheRace(with: state))
}

func display(_ state: State) {
    let carPositions = state.carPositions
        .map { String(repeating: "-", count: $0) }
        .reduce("") { $0 + $1 + "\n" }

    print(carPositions)
}

func runOneStepOfTheRace(with state: State) -> State {
    return State(
        steps: state.steps - 1,
        carPositions: state.carPositions.map { arc4random_uniform(2) == 0 ? $0 + 1 : $0 }
    )
}

race(with: State(
        steps: 5,
        carPositions: .init(repeating: 1, count: 5)
    )
)
