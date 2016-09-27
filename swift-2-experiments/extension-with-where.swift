// Conclusion: where clause for extension can only be used on generic types

protocol P { }
struct S { }

// error: type 'Self' constrained to non-protocol type 'S'
// extension P where Self: S { }

// error: trailing 'where' clause for extension of non-generic type 'S'
// extension S where Self: P { }

protocol T { }

extension P where Self: T { }

class TT { }

// error: trailing 'where' clause for extension of non-generic type 'TT'
// extension TT where Self: T { }
