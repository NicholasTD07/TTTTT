enum Result<T, U> {
    case Success(T)
    case Failure(U)
}

enum UserAction {
    case Tapped
    case Cancelled
    case JustFailed
}

// let result: Result<UserAction, UserAction> = .Failure(.Cancelled)
let result: Result<UserAction, UserAction> = .Failure(.JustFailed)

switch result {
case .Success(_):
    print("Good!")
case .Failure(.Cancelled): // warning: case will never be executed
    print("Cancelled")
case .Failure(_):
    print("OOOOOOPS")
/*
case .Failure(_):
    print("OOOOOOPS")
case .Failure(.Cancelled): // warning: case will never be executed
    print("Cancelled")
*/
}
