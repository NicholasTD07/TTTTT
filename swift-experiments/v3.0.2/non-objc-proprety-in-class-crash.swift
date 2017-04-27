// no crash at all...

public enum TTT {
    case t
}

public struct TT {
    let t = TTT.t
}
public class T {
    let t = TTT.t
    let tt = TT()
}


let t = T()
