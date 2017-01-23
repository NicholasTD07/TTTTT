protocol P { }

struct T<V: P> {
    let t: V
}

func t<PPP: P>(t: T<PPP>) -> String {
    return ""
}

func tt<PPP>(t: T<PPP>) -> String {
    return ""
}

/** Not valid
func ttt(t: T<V: P>) -> String {
    return ""
}
*/

/** Not valid
func ttt(t: T) -> String {
    return ""
}
*/
