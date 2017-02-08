/** Conclusion:
    You can compare nested optional with nil.
    But you have to be aware that `.some(.none) != nil` is true.
*/

let t: Int?? = 1
let tt: Int?? = nil

assert(t != nil)
assert(tt == nil)


let ttt: Int??????? = 1
assert(ttt != nil)

let tttt: Int?? = .some(.none)
assert(tttt != nil)
