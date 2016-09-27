/*
 Conclusion: When extending generics, you have to use a protocol as constraints
*/

// v1 naive

/*
 error: constrained extension must be declared on the unspecialized generic type 'Optional' with constraints specified by a 'where' clause
*/
// extension Optional<String> { }

extension Optional { } // 👍

/*
 error: same-type requirement makes generic parameter 'Wrapped' non-generic
*/
// extension Optional where Wrapped == String { } 

protocol T { }
extension Optional where Wrapped: T { } // 👍
