import XCTest

@testable import La

class DenseMatrixTests: XCTestCase {
    func testSubscript() {
        let a = Matrix.dense(n: 3, m: 2, entities: [
            0, 1,
            2, 3,
            4, 5,
        ])
        XCTAssertEqual(a[0, 1], 1)
    }

    static let allTests: [(String, (DenseMatrixTests) -> () -> ())] = [
        ("testSubscript", testSubscript),
    ]
}
