import XCTest

@testable import La

final class MatrixOneByOneTests: XCTestCase, Tests {
    func testScalar() {
        let x: Float = 10
        let m = Matrix<One, One>([x])!
        XCTAssertEqual(m.scalar, x)
    }

    static let allTests: [(String, (MatrixOneByOneTests) -> () -> ())] = [
        ("testScalar", testScalar),
    ]
}
