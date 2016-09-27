protocol Addable {
    associatedtype Left
    associatedtype Right
    func + (lhs: Left, rhs: Right) -> Self
}

extension String: Addable {
    typealias Left = String
    typealias Right = String
}

// let c: Character = "c"
// let s: String = "string-"

// s + c
// c + s

// extension String: Addable {
//     typealias Left = Character
//     typealias Right = String
// }
