//: Playground - noun: a place where people can play

import UIKit

let topEdge: UIRectEdge = .Top

print(topEdge)

topEdge.contains(.Top)

let verticalEdges: UIRectEdge = [.Top, .Bottom]

// verticalEdges.forEach
// NOPE. It's OptionSetType rather than Array.

topEdge == .Top // true
verticalEdges == .Top // false
verticalEdges.contains(.Top) // true
