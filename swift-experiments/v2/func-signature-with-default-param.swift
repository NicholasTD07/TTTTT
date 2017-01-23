func t(t:String) { }

typealias T = (String) -> ()

let _: T = t

func tt(t:String, b: Bool) { }

typealias TT = (String, Bool) -> ()

let _: TT = tt

// With default value. THE FUN STUFF 😈


func ttt(t:String, b: Bool = true) { }

typealias TTT = (String, Bool) -> ()

let _: TTT = ttt

func tttt(ttt: TTT) {
}

tttt(ttt)

// The above works! :supprised:


func tttt1(ttt: TTT) {
    ttt("String") // NOPE, `error: missing argument for parameter #2 in call`
}

tttt1(ttt)

// Conclusion: default param and function type does not work too well together
