let a = ["a", "b", "c"]
let b = [1, 2, 3]

var c: [[(String, Int)]] = [[], [], []]

for index in 0...8 {
    let column = index % 3
    let row = index / 3
    // print(row, column)
    c[row].append((a[column], b[row]))
}

for row in c {
    print(row)
}
