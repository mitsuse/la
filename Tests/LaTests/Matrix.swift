import XCTest

@testable import La

private enum Zero: Size { static let value: Int = 0 }
private enum Two: Size { static let value: Int = 2 }
private enum Three: Size { static let value: Int = 3 }

final class MatrixTests: XCTestCase, Tests {
    func testCreate() {
        let a = Matrix<Three, Two, Int>([
            0, 1,
            2, 3,
            4, 5,
        ])
        let b = Matrix<Three, Two, Int>([
            0, 1,
            2, 3,
        ])
        let c = Matrix<Three, Two, Int>([
            0,
            2,
            4,
        ])
        let d = Matrix<Two, Two, Int>([
            0, 1,
            2, 3,
            4, 5,
        ])
        let e = Matrix<Three, One, Int>([
            0, 1,
            2, 3,
            4, 5,
        ])
        let f = Matrix<Zero, One, Int>([])
        let g = Matrix<One, Zero, Int>([])
        XCTAssertNotNil(a)
        XCTAssertNil(b)
        XCTAssertNil(c)
        XCTAssertNil(d)
        XCTAssertNil(e)
        XCTAssertNil(f)
        XCTAssertNil(g)
    }

    func testSubscript() {
        let a = Matrix<Three, Two, Int>([
            0, 1,
            2, 3,
            4, 5,
        ])!
        XCTAssertEqual(a[0, 1], 1)
    }

    func testEquality() {
        let a = Matrix<Three, Two, Int>([
            0, 1,
            2, 3,
            4, 5,
        ])!
        let b = Matrix<Three, Two, Int>([
            0, 1,
            2, 3,
            4, 5,
        ])!
        XCTAssertEqual(a, b)
        XCTAssertEqual(b, a)
    }

    func testAddition() {
        let a = Matrix<Three, Two, Int>([
            0, -1,
            2, -3,
            4, -5,
        ])!
        let b = Matrix<Three, Two, Int>([
            0, 1,
            2, 3,
            4, 5,
        ])!
        let c = Matrix<Three, Two, Int>([
            0, 0,
            4, 0,
            8, 0,
        ])!
        XCTAssertEqual(a + b, c)
        XCTAssertEqual(b + a, c)
    }

    func testZeroAddition() {
        let a = Matrix<Three, Two, Int>([
            0, -1,
            2, -3,
            4, -5,
        ])!
        let z = Matrix<Three, Two, Int>.zeros()
        XCTAssertTrue(a + z == a)
    }

    func testAdditiveInverse() {
        let a = Matrix<Three, Two, Int>([
            0, -1,
            2, -3,
            4, -5,
        ])!
        let inverse = -a
        XCTAssertEqual(a + inverse, Matrix<Three, Two, Int>.zeros())
    }

    func testAssociativity() {
        let a = Matrix<Three, Two, Int>([
            0, -1,
            2, -3,
            4, -5,
        ])!
        let b = Matrix<Three, Two, Int>([
            0, 1,
            2, 3,
            4, 5,
        ])!
        let c = Matrix<Three, Two, Int>([
            1, 2,
            3, 4,
            5, 6,
        ])!
        XCTAssertEqual((a + b) + c, a + (b + c))
    }

    func testScalarMultiplication() {
        let a = 2
        let b = Matrix<Two, Two, Int>([
            6, 4,
            4, 14,
        ])!
        let c = Matrix<Two, Two, Int>([
            12, 8,
            8, 28,
        ])!
        XCTAssertTrue(a * b == c)
        XCTAssertTrue(a * b == b * a)
    }

    static let allTests: [(String, (MatrixTests) -> () -> ())] = [
        ("testCreate", testCreate),
        ("testSubscript", testSubscript),
        ("testEquality", testEquality),
        ("testAddition", testAddition),
        ("testZeroAddition", testZeroAddition),
        ("testAdditiveInverse", testAdditiveInverse),
        ("testAssociativity", testAssociativity),
        ("testScalarMultiplication", testScalarMultiplication),
    ]
}
