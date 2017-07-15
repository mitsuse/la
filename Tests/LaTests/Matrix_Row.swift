import XCTest

@testable import La

final class MatrixRowTests: XCTestCase, Tests {
    func testCreate() {
        let a = Matrix<Row, Int>.create(n: 4, [0, 1, 2, 3])
        let b = Matrix<Row, Int>.create(n: 3, [0, 1, 2, 3])
        let c = Matrix<Row, Int>.create(n: 5, [0, 1, 2, 3])
        XCTAssertTrue(a.isDefined)
        XCTAssertFalse(b.isDefined)
        XCTAssertFalse(c.isDefined)
    }

    static let allTests: [(String, (MatrixRowTests) -> () -> ())] = [
        ("testCreate", testCreate),
    ]
}
