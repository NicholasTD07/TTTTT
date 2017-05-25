struct Mock {
    func string(forKey key: String) -> String? {
        if key == "key" {
            return "tada"
        } else {
            return nil
        }
    }
}


struct Asset {
    let source: Mock

    enum TypedKey {
        typealias Key = String

        case string<String>(Key)
    }

    /* func value(for typedKey: TypedKey) -> */ 
}
func logError(_ error: String) {
    print(error)
}

let mock = Mock()

/* let string: String = asset.value(for: .string("key")).value */

