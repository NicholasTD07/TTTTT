func f(x: Int, y: Int) -> (x: Int, y: Int) {
    return (x: x, y: y)
}

let p1 = f(x:y:)(1, 2)
print(p1)
