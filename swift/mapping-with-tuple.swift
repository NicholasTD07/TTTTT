typealias Pet = (name: String, age: Int, owner: String?)

let pets: [Pet] = [
    (name: "T", age: 1, owner: "Nick"),
    (name: "x", age: 1, owner: nil),
    (name: "T", age: 1, owner: "Nick"),
    (name: "xx", age: 1, owner: nil),
]

let petsWithOwners: [Pet] = pets
    .filter { $0.owner != nil }

print(pets)
// [("T", 1, Optional("Nick")), ("x", 1, nil), ("T", 1, Optional("Nick")), ("xx", 1, nil)]
print(petsWithOwners)
// [("T", 1, Optional("Nick")), ("T", 1, Optional("Nick"))]
