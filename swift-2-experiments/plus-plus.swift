/*
  Conclusions:
    * Swift 2.2 has `++foo` & `bar++`
    * `++foo` increases the value before its statement is excuted
        * e.g. `return ++foo` will return `foo + 1`
    * `foo++` increases the value after its statement is excuted
        * e.g. `return foo++` will return `foo` but after `return` `foo` is increased by 1
*/
class T {
    var t: Int

    init(t: Int) {
        self.t = t
    }

    func plusOneAfterwards() -> Int {
        return self.t++
    }

    func plusOneBeforehand() -> Int {
        return ++self.t
    }
}

let t = T(t: 0)

print(t.plusOneAfterwards())    // -> 0
print(t.t)                      // -> 1
print(t.plusOneBeforehand())    // -> 2
print(t.t)                      // -> 2
