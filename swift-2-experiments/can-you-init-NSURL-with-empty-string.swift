// Conclusion: You can and its `absoluteString` is empty. WHY! WHY NSURL! WHY DO YOU DO THAT!
import Foundation

let URL = NSURL(string: "")

assert(URL != nil)
