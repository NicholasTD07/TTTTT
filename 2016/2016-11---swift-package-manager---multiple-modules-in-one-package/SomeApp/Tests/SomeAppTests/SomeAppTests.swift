import XCTest
@testable import SomeApp

class SomeAppTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(SomeApp().text, "Hello, World!")
    }


    static var allTests : [(String, (SomeAppTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
