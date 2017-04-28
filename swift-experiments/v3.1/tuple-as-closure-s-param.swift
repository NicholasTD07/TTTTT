// you do not need extra unpacking to use tuple in closure

typealias T = (name: String, age: Int)

let _: (T) -> Void = { (name, age) in

}
