import XCTest

@testable import La

final class ResultTests: XCTestCase, Tests {
    func testEquality() {
        let a: Result<Int> = .defined(1)
        let b: Result<Int> = .defined(1)
        let c: Result<Int> = .defined(2)
        let d: Result<Int> = .undefined
        XCTAssertTrue(a == b)
        XCTAssertTrue(b == a)
        XCTAssertFalse(a == d)
        XCTAssertFalse(d == c)
        XCTAssertTrue(d == d)
    }

    func testSigned() {
        let a: Result<Int> = .defined(1)
        let b: Result<Int> = .defined(-1)
        let c: Result<Int> = .undefined
        XCTAssertTrue(-a == b)
        XCTAssertTrue(-c == c)
    }

    func testAddition() {
        let a: Result<Int> = .defined(1)
        let b: Result<Int> = .defined(-1)
        let c: Result<Int> = .defined(0)
        let d: Result<Int> = .undefined
        XCTAssertTrue(a + b == c)
        XCTAssertTrue(b + a == c)
        XCTAssertTrue(a + d == d)
        XCTAssertTrue(d + a == d)
        XCTAssertTrue(d + d == d)
    }

    static let allTests: [(String, (ResultTests) -> () -> ())] = [
        ("testEquality", testEquality),
        ("testSigned", testSigned),
        ("testAddition", testAddition),
    ]
}
