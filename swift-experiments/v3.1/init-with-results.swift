enum Result<Value> {
    case value(Value)
    case error(String)

    func flatMap<T>(_ f: (Value) -> T) -> Result<T> {
        switch self {
        case let .value(value):
            return Result<T>.value(f(value))
        case let .error(error):
            return Result<T>.error(error)
        }
    }
}

struct User {
    let id: Int
    let name: String

    static func createOne(_ idResult: Result<Int>) -> (_ nameResult: Result<String>) -> Result<Result<User>> {
        return { nameResult in
            idResult.flatMap { id in
                nameResult.flatMap { name in
                    return User(id: id, name: name)
                }
            }
        }
    }

    static func createTwo(_ idResult: Result<Int>) -> (_ nameResult: Result<String>) -> Result<User> {
        return { nameResult in
            switch idResult {
            case let .value(id):
                switch nameResult {
                case let .value(name):
                    return .value(User(id: id, name: name))
                case let .error(error):
                    return Result<User>.error(error)
                }
            case let .error(error):
                return Result<User>.error(error)
            }
        }
    }
}

let userOne = User.createOne(.value(1))(.value("nick"))
print(userOne)
let userTwo = User.createTwo(.value(1))(.value("nick"))
print(userTwo)

// userThree = User.create <*> Result.value(1) <^> Result.value("nick")
/*
From thoughtbot/Runes
// Optional+Functor:
public func <^> <T, U>(f: T -> U, x: T?) -> U?

// Optional+Applicative:
public func <*> <T, U>(f: (T -> U)?, x: T?) -> U?
*/
