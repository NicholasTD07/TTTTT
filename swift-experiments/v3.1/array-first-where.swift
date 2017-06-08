let xs = [1, 2, 3]

print(xs.first(where: { $0 == 1 })!)
print(xs.first { $0 == 4 } as Any)

class T {}

let t = T()
let ts = [t, T(), T(), T()]

print(ts.filter { $0 === t }.first!)
print(ts.first { $0 === t }!)

let ys = [
    (1, 2),
    (1, 2),
    (1, 2),
    (1, 2),
    (1, 2),
]

// error: cannot call value of non-function type '(Int, Int)?'
// ys.first { true }
// error: cannot call value of non-function type '(Int, Int)?'
// ys.first(where: { true } )
// print(ys.first { _,_ in true }!) // swift 3.1
print(ys.first(where: { _ in true })!) // swift 3.1 & 4
