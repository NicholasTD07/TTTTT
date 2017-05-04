struct Expression<T> {
    let expression: () -> T
}

let expression = Expression(expression: { 0 })

func expect<T>(_ expression: @autoclosure @escaping () -> T) -> Expression<T> {
    return Expression(expression: expression)
}
