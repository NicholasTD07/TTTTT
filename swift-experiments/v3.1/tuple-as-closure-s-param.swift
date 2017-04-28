// you do not need extra unpacking to use tuple in closure

typealias Person = (name: String, age: Int)

let t1: (Person) -> Void = { (name, age) in
    print(name)
    print(age)
}

let t2: (Person) -> Void = { t in
    print(t.name)
    print(t.age)
}

let nick: Person = (name: "nick", age: 27)

t1(nick)
t2(nick)

let t3: (_ name: String, _ age: Int) -> Void = { t in
// error: value of tuple type '(String, Int)' has no member 'name'
//     print(t.name)
// error: value of tuple type '(String, Int)' has no member 'age'
//     print(t.age)
}
