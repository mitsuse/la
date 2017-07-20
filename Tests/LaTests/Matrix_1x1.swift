import XCTest

@testable import La

final class Matrix1x1Tests: XCTestCase, Tests {
    func testScalar() {
        let x: Float = 10
        let m = Matrix<_1, _1, Float>([x])!
        XCTAssertEqual(m.scalar, x)
    }

    static let allTests: [(String, (Matrix1x1Tests) -> () -> ())] = [
        ("testScalar", testScalar),
    ]
}
