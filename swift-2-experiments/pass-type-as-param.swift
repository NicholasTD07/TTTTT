/*
 Conclusion: (have a look at v3)
    * You can use types as params
    * You need to use generics
    * When you want to refer to a type, use `T` rather than `t`
    * You cannot pass a type `T` around, e.g. `take(type: Int)`
        * You have to use `T.self` to refer to the type
        * You have to use `T.Type` to refer to the type for a param
*/
import Foundation

func v1() {
    func t<T>(t: T.Type) { }

    t(String.self)
}

func v2() {
    func isX<U,T>(x:U?, t:T.Type) -> Bool {
        if let _ = x as? T {
            return true
        }
        return false
    }

    print(isX(Int(1), t: Int.self))
}

func v3() {
    func isX<U,T>(x:U?, t:T.Type) -> Bool {
        return x is T
    }

    print(isX(Int(1), t: Int.self))
}

// func v4() {
//     func isX<U,T>(x:U?, t:T) -> Bool {
//         return x is t
//     }
//
//     print(isX(Int(1), t: Int))
// }

v1()
v2()
v3()
