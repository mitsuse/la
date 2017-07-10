import XCTest

@testable import La

class MatrixTests: XCTestCase {
    func testSubscript() {
        let a = Matrix.create(n: 3, m: 2, [
            0, 1,
            2, 3,
            4, 5,
        ])
        XCTAssertEqual(a[0, 1], 1)
    }

    func testEquality() {
        let a = Matrix.create(n: 3, m: 2, [
            0, 1,
            2, 3,
            4, 5,
        ])
        let b = Matrix.create(n: 3, m: 2, [
            0, 1,
            2, 3,
            4, 5,
        ])
        let c = Matrix.create(n: 4, m: 3, [
            0, 1, 9,
            2, 3, 9,
            4, 5, 9,
            7, 7, 8,
        ])
        XCTAssertEqual(a, b)
        XCTAssertEqual(b, a)
        XCTAssertNotEqual(a, c)
        XCTAssertNotEqual(c, b)
    }

    static let allTests: [(String, (MatrixTests) -> () -> ())] = [
        ("testSubscript", testSubscript),
        ("testEquality", testEquality),
    ]
}
