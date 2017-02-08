// Nested optional is nasty
// Check out the last line
let t: [String: Int?] = [
    "1":0, "2": nil
]

print(t["1"])
print(type(of: t["1"]))
print(t["2"])
print(type(of: t["2"]))

print(t["2"] != nil)
