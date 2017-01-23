// How to use iterator?
// array.`makeIterator()` then `next`
// it will return all the elements in the array while wrapping them in Optional
// first element, second element, third element...
// last element, nil

let array = Array(1...5)

var iterator = array.makeIterator()

print(iterator.next()) // Optional(1)
print(iterator.next()) // Optional(2)
print(iterator.next()) // Optional(3)
print(iterator.next()) // Optional(4)
print(iterator.next()) // Optional(5)
print(iterator.next()) // nil
