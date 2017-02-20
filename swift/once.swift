func once<Value>(f: @escaping ()-> Value) -> () -> Value {
    var result: Value?

    let onceFunc = { () -> Value in
        if let result = result {
            return result
        } else {
            result = f()
            return result!
        }
    }

    return onceFunc
}

var x = 1

let addOnce: () -> Void = once { x+=1 }
addOnce()
print(x)
addOnce()
print(x)
addOnce()
print(x)
