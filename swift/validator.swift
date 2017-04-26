enum TTT: String {
    case a
    case b
    case c
}

let d: [String: Any] = [
    "TTT": "a",
    "URL": "http://example.org/",
    "content": [
        "text": "some text",
        "imageURL": "http://example.org"
    ]
]

func keys<Key: Hashable, Value: Any>(of dictionary: [Key: Value]) -> [Key] {
    return dictionary.map { key, value in
        if type(of: value) == Dictionary {
            return keys(of: value)
        }
    }

    return []
}
