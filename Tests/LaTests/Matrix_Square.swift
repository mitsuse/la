import XCTest

@testable import La

final class MatrixSquareTests: XCTestCase, Tests {
    func testCreate() {
        let a = Matrix<Square, Int>.create(order: 2, [
            0, 1,
            2, 3,
        ])
        let b = Matrix<Square, Int>.create(order: 1, [
            0, 1,
            2, 3,
        ])
        let c = Matrix<Square, Int>.create(order: 3, [
            0, 1,
            2, 3,
        ])
        XCTAssertTrue(a.isDefined)
        XCTAssertFalse(b.isDefined)
        XCTAssertFalse(c.isDefined)
    }

    static let allTests: [(String, (MatrixSquareTests) -> () -> ())] = [
        ("testCreate", testCreate),
    ]
}
