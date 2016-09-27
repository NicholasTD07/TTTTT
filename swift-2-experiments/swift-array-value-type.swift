import Foundation

var d = ["T": ["a", "b"]]

var array = d["T"]!
print(array)
print(array.dynamicType) // Array<String>

print(d) // ["T": ["a", "b"]]

array.append("c")

print(d) // ["T": ["a", "b"]]

d["T"] = array

print(d) // ["T": ["a", "b", "c"]]
