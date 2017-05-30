/*
https://www.codewars.com/kata/5227129b316b56d50d0003b7/train/swift


You have to write an algorithm that flatten an arrays structure to 2 levels. It means that each array under the second level will be merge to its parent. Only two levels are kept.

Empty arrays are ignored.

var array = [1, [2, 3], [4, 5, [6, 7, 8], 9, 10, [11, [12, [13, 14], 15], 16], 17], 18];
flattenTwoLevels(array); // should return [1,[2,3],[4,5,6,7,8,9,10,11,12,13,14,15,16,17], 18]

flattenTwoLevels([1,[2, 3, [], [4, [], 5]]]) // should return [1,[2,3,4,5]]
*/

private func flatten(_ xs: [Any]) -> [Any] {
  var ys: [Any] = []
  for x in xs {
    if let x = x as? Array<Any> {
      ys += flatten(x)
    } else {
      ys += [x]
    }
  }
  return ys
}

print(flatten([1, 2, 3]))
print(flatten([1, 2, 3, [4, 5]]))
print(flatten([1, 2, 3, [4, [5]]]))
