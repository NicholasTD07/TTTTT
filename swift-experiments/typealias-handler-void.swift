typealias INT = Int

typealias TextUpdateHandler = (String) -> ()

let handler: TextUpdateHandler = { (string: String) in
    print(string.isEmpty)
}
