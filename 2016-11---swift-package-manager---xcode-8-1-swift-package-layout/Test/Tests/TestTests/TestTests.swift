import XCTest
@testable import Test

class TestTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(Test().text, "Hello, World!")
    }


    static var allTests : [(String, (TestTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
