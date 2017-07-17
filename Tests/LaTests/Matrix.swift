import XCTest

@testable import La

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
        XCTAssertEqual(a + z, a)
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
        XCTAssertEqual(a * b, c)
        XCTAssertEqual(a * b, b * a)
    }

    func testMultiplication() {
        let a = Matrix<Three, Three, Int>([
            1, 1, 2,
            1, 2, 3,
            1, 4, 9,
        ])!
        let b = Matrix<Three, Two, Int>([
            0, 1,
            1, -1,
            2, 0,
        ])!
        let c = Matrix<Three, Two, Int>([
            5, 0,
            8, -1,
            22, -3,
        ])!
        XCTAssertEqual(a * b, c)
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
        ("testMultiplication", testMultiplication),
    ]
}
