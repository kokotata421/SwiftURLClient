import XCTest
@testable import SwiftURLClient

final class SwiftURLClientTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(SwiftURLClient().text, "Hello, World!")
    }
}
