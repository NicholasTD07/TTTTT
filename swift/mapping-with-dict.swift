let d: [String: Int?] = [
    "1": 1,
    "2": nil
]

let md = d.map { $0.key }

print(md)
