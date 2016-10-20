// Conclusion: You can have a tuple in an array and modify it
typealias T = (name: String, age: Int)

var ts = [T]()

ts.append((name: "Nick", age: 25)) // always 25

ts[0].age = 0

print(ts[0])
