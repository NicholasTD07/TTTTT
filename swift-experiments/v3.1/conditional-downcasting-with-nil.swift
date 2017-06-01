class T {}
class TT: T {}

let ts: [T] = []

let t = ts.first as? TT
let tt = (nil as T?) as? TT
