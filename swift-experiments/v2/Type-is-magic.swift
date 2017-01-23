// Conclusion: SHIT... Type is magic keyword.... AND there's no complier warning
// FIXED in Swift 3

class T {
    enum Type {
        case v1
        case v2
        case v3
    }
}

let a: T.Type = T.self


// error: type 'T.Type' has no member 'v1'
// let type = T.Type.v1
