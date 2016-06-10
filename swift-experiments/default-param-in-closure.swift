func t(t: String = "T") {  }

// NO default param in closure
let tt = { (i: Int, returnsShortAnyString: Bool = false) -> Void in
// swift-experiments/default-param-in-closure.swift;3;49; error; default argument is only permitted for a non-curried function parameter
// let tt = { (i; Int, returnsShortAnyString; Bool = false) -> Void in
//                                                 ^~~~~~~}

}
