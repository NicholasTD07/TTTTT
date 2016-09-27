// Conclusion: In a if-else-if clause, only the block after the first truthy argument is executed.

let A = true
let B = true

if A {
    print("A")
} else if B {
    print("B")
} else {
    print("C")
}
