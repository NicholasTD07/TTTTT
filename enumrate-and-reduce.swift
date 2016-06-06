import Foundation

let array = Array(1...10)
print(array) // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

array.enumerate().map { (index, element) in
    print(index)
    print(element)
} // WORKS

// array.enumerate().reduce([]) { (accu, indexAndElement) -> [Int] in
//     index, element = indexAndElement

//     print(index)
//     print(element)

//     print(accu)
// }
// ^^^ TYPE ERROR ^^^
