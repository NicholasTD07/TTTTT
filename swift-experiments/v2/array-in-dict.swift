/*
 Conclusion: `Dictionary` and `Array` in Swift are value types
    * If you want to modify an array in a dict
        * you can do `dict[key]?.append(item)`
*/

func versionOne() {
    var dict = [Int: [Int]]()

    print(dict[0]) // nil

    dict[0] = [1]
    print(dict[0]) // Optional([1])

    var array = dict[0]
    array?.append(2)
    print(dict[0]) // Optional([1])

    dict[0] = array
    print(dict[0]) // Optional([1, 2])
}

// versionOne()

func versionTwo() {
    var dict = [Int: [Int]]()

    print(dict[0]) // nil

    dict[0] = [1]
    print(dict[0]) // Optional([1])

    dict[0]?.append(2)
    print(dict[0]) // Optional([1, 2])
}

versionTwo()
