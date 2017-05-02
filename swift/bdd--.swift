
// root: array of tests
// tests: array of Context or TestCase/Example
/*
[
    [
        // outer most context, context inner +1, context inner +2, context inner +3, ..., test case
    ], // ...
]
*/

enum Either<L, R> {
    case left(L)
    case right(R)

}

struct Context {
}

typealias Case = () -> Void
typealias Test = Either<Context, Case>
var root = [[Test]]()

func appendToLastGroup(_ test: Test) {
    root[root.count - 1].append(test)
}

extension Context {
    func context(_ closure: (Context) -> Void) {
        let context = Context()

        appendToLastGroup(.left(context))

        closure(context)
    }

    func it(_ closure: @escaping () -> Void) {
        appendToLastGroup(.right(closure))
    }
}

func describe(_ closure: (Context) -> Void ) {
    let context = Context()

    let tests = [Test.left(context)]

    root.append(tests)

    closure(context)
}

describe {
    $0.context {
        $0.it {

        }
    }
}

/* describe { */
/*     $0.context { */
/*         $0.it { */

/*         } */
/*     } */
/* } */
print(root)

debugPrint(root.last!.last!)
