class T { }
typealias TT = (selected: T, at: Double) // pretend Double is NSTimeInterval (well, it is)

// error: non-nominal type 'TT' (aka '(selected: T, at: Double)') cannot be extended
// extension TT { }
