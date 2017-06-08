let xs = [1, 2, 3]

print(xs.first(where: { $0 == 1 }))
print(xs.first(where: { $0 == 4 }))
print(xs.first { $0 == 4 })
