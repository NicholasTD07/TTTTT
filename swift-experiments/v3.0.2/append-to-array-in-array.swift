var nestedArray = [[Int]]()

var last = [0]

nestedArray.append(last)

print(nestedArray) // [[0]]

last.append(1)

print(nestedArray) // [[0]]

nestedArray[nestedArray.count - 1].append(1)

print(nestedArray) // [[0, 1]]
