/**
print rule_sequence('0101', [zero, one, zero])
# => 1

print rule_sequence('0101', [zero, zero])
# => None
*/

typealias Rule = ([Int]?) -> [Int]?

func rule(numbers: [Int], with rules: [Rule]) -> [Int]? {
    return rules.reduce(numbers) { (numbers, rule) in rule(numbers) }
}

let equalsTo: (Int) -> Rule = { equalsTo in
    return {
        guard let numbers = $0 else { return nil }
        guard let first = numbers.first else { return nil }

        if first == equalsTo {
            return Array(numbers[1...(numbers.count - 1)])
        } else {
            return nil
        }
    }
}

let zero = equalsTo(0)
let one = equalsTo(1)

print("\(rule(numbers: [0,1,0,1], with: [zero, one, zero]))")
print("\(rule(numbers: [0,1,0,1], with: [zero, zero]))")
