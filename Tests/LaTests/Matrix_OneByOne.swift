import XCTest

@testable import La

final class MatrixOneByOneTests: XCTestCase, Tests {
    func testScalar() {
        let x = 10
        let m = Matrix<One, One, Int>([x])!
        XCTAssertEqual(m.scalar, x)
    }

    static let allTests: [(String, (MatrixOneByOneTests) -> () -> ())] = [
        ("testScalar", testScalar),
    ]
}
