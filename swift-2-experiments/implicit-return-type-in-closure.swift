func t() -> (Int) -> String {
    // return { i in            // This works
    return { i -> String in     // This works too
        return "T"
    }
}

// let tt: Int -> String = { // error: contextual type for closure argument list expects 1 argument, which cannot be implicitly ignored
let tt: Int -> String = { _ in // This works
    return "T"
}

let ttt1 = { // This works
    return "T"
}
// let ttt2 = { i in
//     return "T"
// }
let ttt3 = { (i: Int) in // This works too
    return "T"
}
