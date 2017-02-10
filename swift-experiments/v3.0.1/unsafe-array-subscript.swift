// You can find out whether an index is valid by Array.indices.contains(index)
let a: [Int] = [
    1,
    2,
    3,
]

print(a.indices.contains(1))
print(a.indices.contains(2))
print(a.indices.contains(3))
print(a.indices.contains(4))
