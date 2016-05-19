let a = ["a", "b", "c"]
let b = [1, 2, 3]

var c: [[(String, Int)]] = [[], [], []]

(0...8).forEach { index in
    let column = index % 3
    let row = index / 3
    // print(row, column)
    c[row].append((a[column], b[row]))
}

c.forEach { print($0) }
