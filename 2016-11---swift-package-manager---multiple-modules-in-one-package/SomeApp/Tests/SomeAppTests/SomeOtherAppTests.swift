import XCTest
@testable import SomeOtherApp

class SomeOtherAppTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(SomeOtherApp().text, "Hello, World!")
    }


    static var allTests : [(String, (SomeOtherAppTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
