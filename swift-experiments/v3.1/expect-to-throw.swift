enum E: Error {
    case t
    case tt
}

enum EE: Error {
    case ttt
}

func t() throws { throw E.t } // throwing ET, lol
func tt() throws { throw E.tt } // throwing ET, lol
func ttt() throws { throw EE.ttt } // throwing ET, lol

func noT() {}

struct Expectation {
    let expression: () throws -> Void

    func toThrow<T: Equatable>(_ expected: T) -> String {
        func t(_ error: Error) -> String {
            guard let typedError = error as? T else {
                return "Some other type of error \(error) was thrown"
            }

            guard typedError == expected else {
                return "Some other error \(error) was thrown"
            }

            return "The error \(error) was thrown"
        }

        do {
            try expression()
            return "No error was thrown"
        } catch let error {
            return t(error)
        }
    }
}

func expect(_ closure: @autoclosure @escaping () throws -> Void) -> Expectation {
    return Expectation(expression: closure)
}

let result = expect( try ttt() ).toThrow(E.t)

print(result)
