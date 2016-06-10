let t = { (t: String) -> Int in
    return 0
}

let tt = { (t: Bool) -> (String) -> Int in
    return { (tt: String) in
        return 0
    }
}
