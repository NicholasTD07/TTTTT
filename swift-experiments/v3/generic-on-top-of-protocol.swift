/**
    I am not sure how to describe this...
*/
protocol TTT {
    var name: String { get }
}

struct EnglishMorning: TTT {
    let name = "English Morning"
}

enum Result<Value> {
    case success(Value)
    case failure

    var value: Value? {
        switch self {
        case let .success(value):
            return value
        case .failure:
            return nil
        }
    }
}

let aLotOfTea: [TTT] = [EnglishMorning()]
let resultOfALogOfTea = Result.success(aLotOfTea)

resultOfALogOfTea.value!.forEach { print($0.name) }
