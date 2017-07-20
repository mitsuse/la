import XCTest

@testable import La

final class MatrixNxNTests: XCTestCase, Tests {
    func testOrder() {
        let a = Matrix<_2, _2, Float>([
            0, 1,
            2, 3,
        ])!
        XCTAssertEqual(a.order, a.n)
        XCTAssertEqual(a.order, a.m)
    }

    func testIdentity() {
        let a = Matrix<_2, _2, Float>([
            2, 5,
            1, 3,
        ])!
        let x = Matrix<_2, _2, Float>([
             3, -5,
            -1,  2,
        ])!
        let i = Matrix<_2, _2, Float>.identity()
        XCTAssertEqual(a * x, i)
        XCTAssertEqual(x * a, i)
        XCTAssertEqual(a * i, a)
        XCTAssertEqual(i * a, a)
        XCTAssertEqual(a * i, a)
    }

    static let allTests: [(String, (MatrixNxNTests) -> () -> ())] = [
        ("testOrder", testOrder),
        ("testIdentity", testIdentity),
    ]
}
