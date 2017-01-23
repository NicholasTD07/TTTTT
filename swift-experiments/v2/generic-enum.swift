// Conclusion: You can write your own generic enum easily since Swift 2.2 (IIRC)

enum MyOptional<T> {
    case some(_: T)
    case none
}

let optionalT = MyOptional.some(7)
print(optionalT) // some(7)
let noneString = MyOptional<String>.none
print(noneString) // none
