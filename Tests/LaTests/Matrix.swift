import XCTest

@testable import La

class MatrixTests: XCTestCase {
    func testEquality() {
        let a = Matrix.dense(n: 3, m: 2, entities: [
            0, 1,
            2, 3,
            4, 5,
        ])
        let b = Matrix.dense(n: 3, m: 2, entities: [
            0, 1,
            2, 3,
            4, 5,
        ])
        let c = Matrix.dense(n: 4, m: 3, entities: [
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
        ("testEquality", testEquality),
    ]
}
