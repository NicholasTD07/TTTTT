let xs = [1, 2, 3, 4]
let xs_ = xs.dropFirst()

zip(xs, xs_).forEach { print($0) }
