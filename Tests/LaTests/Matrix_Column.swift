import XCTest

@testable import La

final class MatrixColumnTests: XCTestCase, Tests {
    func testCreate() {
        let a = Matrix<Column, Int>.create(m: 4, [0, 1, 2, 3])
        let b = Matrix<Column, Int>.create(m: 3, [0, 1, 2, 3])
        let c = Matrix<Column, Int>.create(m: 5, [0, 1, 2, 3])
        XCTAssertTrue(a.isDefined)
        XCTAssertFalse(b.isDefined)
        XCTAssertFalse(c.isDefined)
    }

    static let allTests: [(String, (MatrixColumnTests) -> () -> ())] = [
        ("testCreate", testCreate),
    ]
}
