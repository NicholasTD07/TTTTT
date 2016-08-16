// Conclusion: SHIT... Type is magic keyword.... AND there's no complier warning

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
