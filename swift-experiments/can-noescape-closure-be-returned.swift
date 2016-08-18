// conclusion: You cannot. @noescape can only be used on func params

/* func t() -> @noescape (Int) -> String {
    return { String($0) }
}
*/
