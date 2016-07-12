func change(inout x: Int, by delta: Int) {
    x += delta
}

var x = 10
print(x)

change(&x, by: -1)

print(x)
