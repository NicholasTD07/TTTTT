enum Either {
    case left
    case right
}

let t: Either? = .left

switch t {
case .Some(.left):
    print("left")
case .Some(.right):
    print("right")
case .None:
    print("nothing")
}
