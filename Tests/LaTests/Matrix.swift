import XCTest

@testable import La

class MatrixTests: XCTestCase {
    func testSubscript() {
        let a = Matrix.create(n: 3, m: 2, [
            0, 1,
            2, 3,
            4, 5,
        ])
        XCTAssertEqual(a[0, 1], 1)
    }

    func testEquality() {
        let a = Matrix.create(n: 3, m: 2, [
            0, 1,
            2, 3,
            4, 5,
        ])
        let b = Matrix.create(n: 3, m: 2, [
            0, 1,
            2, 3,
            4, 5,
        ])
        let c = Matrix.create(n: 4, m: 3, [
            0, 1, 9,
            2, 3, 9,
            4, 5, 9,
            7, 7, 8,
        ])
        XCTAssertEqual(a, b)
        XCTAssertEqual(b, a)
        XCTAssertNotEqual(a, c)
        XCTAssertNotEqual(c, b)
    }

    func testAddition() {
        let a = Matrix.create(n: 3, m: 2, [
            0, -1,
            2, -3,
            4, -5,
        ])
        let b = Matrix.create(n: 3, m: 2, [
            0, 1,
            2, 3,
            4, 5,
        ])
        let c = Matrix.create(n: 3, m: 2, [
            0, 0,
            4, 0,
            8, 0,
        ])
        XCTAssertEqual(a + b, c)
        XCTAssertEqual(b + a, c)
    }

    func testZeroAddition() {
        let a = Matrix.create(n: 3, m: 2, [
            0, -1,
            2, -3,
            4, -5,
        ])
        let z = Matrix<Int>.zeros(n: 3, m: 2)
        XCTAssertEqual(a + z, a)
    }

    func testAdditiveInverse() {
        let a = Matrix.create(n: 3, m: 2, [
            0, -1,
            2, -3,
            4, -5,
        ])
        let inverse = -a
        XCTAssertEqual(a + inverse, Matrix<Int>.zeros(n: a.shape.n, m: a.shape.m))
    }

    func testAssociativity() {
        let a = Matrix.create(n: 3, m: 2, [
            0, -1,
            2, -3,
            4, -5,
        ])
        let b = Matrix.create(n: 3, m: 2, [
            0, 1,
            2, 3,
            4, 5,
        ])
        let c = Matrix.create(n: 3, m: 2, [
            1, 2,
            3, 4,
            5, 6,
        ])
        XCTAssertEqual((a + b) + c, a + (b + c))
    }

    func testScalarMultiplication() {
        let a = 2
        let b = Matrix.create(n: 2, m: 2, [
            6, 4,
            4, 14,
        ])
        let c = Matrix.create(n: 2, m: 2, [
            12, 8,
            8, 28,
        ])
        XCTAssertEqual(a * b, c)
        XCTAssertEqual(a * b, b * a)
    }

    static let allTests: [(String, (MatrixTests) -> () -> ())] = [
        ("testSubscript", testSubscript),
        ("testEquality", testEquality),
        ("testAddition", testAddition),
        ("testZeroAddition", testZeroAddition),
        ("testAdditiveInverse", testAdditiveInverse),
        ("testAssociativity", testAssociativity),
        ("testScalarMultiplication", testScalarMultiplication),
    ]
}
