// Conclusion: When using `switch` with a value, you can do case let where!
let i = 0

switch i {
case let positive where positive > 0:
    print("Greater than 0")
case let negative where negative < 0:
    print("Smaller than 0")
case let zero where zero == 0:
    print("0")
default:
    fatalError()
}
