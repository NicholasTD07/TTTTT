// Conclusion: Different aliases to the same type is the same type.

typealias T1 = () -> ()
typealias T2 = () -> ()
typealias T3 = () -> ()

func t(t1: T1) {  }

let t1: T1 = {}
let t2: T2 = {}
let t3: T3 = {}

[t1, t2, t3].forEach { t($0) }
