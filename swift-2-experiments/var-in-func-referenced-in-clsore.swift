// Conclusion: You can modify a var in a func with a closure. WOW
typealias T = (cancelBlock: () -> (), runBlock: () -> ())

func t() -> T {
    var isCancelled = false

    return (
        cancelBlock: { isCancelled = true },
        runBlock: {
            guard !isCancelled else {
                print("Cancelled...")
                return
            }

            print("Done!")
        }
    )
}


func justRun() {
    let (_, runBlock) = t()

    runBlock()
}

func cancelledRun() {
    let (cancelBlock, runBlock) = t()

    cancelBlock()
    runBlock()
}

justRun()
cancelledRun()
