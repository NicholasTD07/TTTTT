import Foundation

let someNestedArray = [1,2,3, [1,2,3], [1,[2], [3]]]
// print(someNestedArray.flatten())

let doubleNestedArray = [[1], [2], [3]]
print(doubleNestedArray.dynamicType) // Array<Array<Int>>
print(doubleNestedArray.flatten()) // FlattenBidirectionalCollection<Array<Array<Int>>>(_base: [[1], [2], [3]])
print(doubleNestedArray.flatten() + []) // [1, 2, 3]
let type = (doubleNestedArray.flatten() + []).dynamicType
print(type) // Array<Int>
