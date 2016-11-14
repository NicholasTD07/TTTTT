// Conclusion: static lazy var is possible
// HowTo?
// 1. have a static var `static var t`
// 2. initialize it with a closure as the following
/**
```swift
    static var t: Float = {
        print("t is created")
        return 1.0
    }()
```
*/
struct T {
    init() {
        print("T is created")
    }
    // error: 'lazy' may not be used on an already-lazy global
    /* static lazy var t: Float = { */
    static var t: Float = {
        print("t is created")
        return 1.0
    }()
}

_ = T()
_ = T.t
