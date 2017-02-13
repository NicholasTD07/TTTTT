let d1: [Int: Int] = [1:2]
let d2: [Int: Int] = [1:2]
let d3: [String: Int] = ["1":2]

print(d1 == d2)
// no `==` to be applied to [Int: Int] and [String: Int]
print(d2 == d3)
