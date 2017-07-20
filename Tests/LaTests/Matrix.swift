import XCTest

@testable import La

final class MatrixTests: XCTestCase, Tests {
    func testCreate() {
        let a = Matrix<_3, _2, Float>([
            0, 1,
            2, 3,
            4, 5,
        ])
        let b = Matrix<_3, _2, Float>([
            0, 1,
            2, 3,
        ])
        let c = Matrix<_3, _2, Float>([
            0,
            2,
            4,
        ])
        let d = Matrix<_2, _2, Float>([
            0, 1,
            2, 3,
            4, 5,
        ])
        let e = Matrix<_3, _1, Float>([
            0, 1,
            2, 3,
            4, 5,
        ])
        let f = Matrix<_0, _1, Float>([])
        let g = Matrix<_1, _0, Float>([])
        XCTAssertNotNil(a)
        XCTAssertNil(b)
        XCTAssertNil(c)
        XCTAssertNil(d)
        XCTAssertNil(e)
        XCTAssertNil(f)
        XCTAssertNil(g)
    }

    func testEntities() {
        let entries: [Float] = [
            0, 1,
            2, 3,
            4, 5,
        ]
        let a = Matrix<_3, _2, Float>(entries)!
        XCTAssertEqual(a.entries, entries)
    }

    func testSubscript() {
        let a = Matrix<_3, _2, Float>([
            0, 1,
            2, 3,
            4, 5,
        ])!
        XCTAssertEqual(a[0, 1], 1)
    }

    func testEquality() {
        let a = Matrix<_3, _2, Float>([
            0, 1,
            2, 3,
            4, 5,
        ])!
        let b = Matrix<_3, _2, Float>([
            0, 1,
            2, 3,
            4, 5,
        ])!
        XCTAssertEqual(a, b)
        XCTAssertEqual(b, a)
    }

    func testAddition() {
        let a = Matrix<_3, _2, Float>([
            0, -1,
            2, -3,
            4, -5,
        ])!
        let b = Matrix<_3, _2, Float>([
            0, 1,
            2, 3,
            4, 5,
        ])!
        let c = Matrix<_3, _2, Float>([
            0, 0,
            4, 0,
            8, 0,
        ])!
        XCTAssertEqual(a + b, c)
        XCTAssertEqual(b + a, c)
    }

    func testSubstraction() {
        let a = Matrix<_3, _2, Float>([
            0, -1,
            2, -3,
            4, -5,
        ])!
        let b = Matrix<_3, _2, Float>([
            -0, -1,
            -2, -3,
            -4, -5,
        ])!
        let c = Matrix<_3, _2, Float>([
            0, 0,
            4, 0,
            8, 0,
        ])!
        XCTAssertEqual(a - b, c)
    }

    func test_0Addition() {
        let a = Matrix<_3, _2, Float>([
            0, -1,
            2, -3,
            4, -5,
        ])!
        let z = Matrix<_3, _2, Float>.zeros()
        XCTAssertEqual(a + z, a)
    }

    func testAdditiveInverse() {
        let a = Matrix<_3, _2, Float>([
            0, -1,
            2, -3,
            4, -5,
        ])!
        let inverse = -a
        XCTAssertEqual(a + inverse, Matrix<_3, _2, Float>.zeros())
    }

    func testAssociativity() {
        let a = Matrix<_3, _2, Float>([
            0, -1,
            2, -3,
            4, -5,
        ])!
        let b = Matrix<_3, _2, Float>([
            0, 1,
            2, 3,
            4, 5,
        ])!
        let c = Matrix<_3, _2, Float>([
            1, 2,
            3, 4,
            5, 6,
        ])!
        XCTAssertEqual((a + b) + c, a + (b + c))
    }

    func testScalarMultiplication() {
        let a1: Float = 2
        let a2: Double = 2
        let b1 = Matrix<_2, _2, Float>([
            6, 4,
            4, 14,
        ])!
        let b2 = Matrix<_2, _2, Double>([
            6, 4,
            4, 14,
        ])!
        let c1 = Matrix<_2, _2, Float>([
            12, 8,
            8, 28,
        ])!
        let c2 = Matrix<_2, _2, Double>([
            12, 8,
            8, 28,
        ])!
        XCTAssertEqual(a1 * b1, c1)
        XCTAssertEqual(a1 * b1, b1 * a1)
        XCTAssertEqual(a2 * b2, c2)
        XCTAssertEqual(a2 * b2, b2 * a2)
    }

    func testMultiplication() {
        let a = Matrix<_3, _3, Float>([
            1, 1, 2,
            1, 2, 3,
            1, 4, 9,
        ])!
        let b = Matrix<_3, _2, Float>([
            0, 1,
            1, -1,
            2, 0,
        ])!
        let c = Matrix<_3, _2, Float>([
            5, 0,
            8, -1,
            22, -3,
        ])!
        XCTAssertEqual(a * b, c)
    }

    func testTranspose() {
        let a = Matrix<_3, _2, Float>([
            0, 1,
            2, 3,
            4, 5,
        ])!
        let b = Matrix<_2, _3, Float>([
            0, 2, 4,
            1, 3, 5,
        ])
        XCTAssertEqual(a.t, b)
    }

    static let allTests: [(String, (MatrixTests) -> () -> ())] = [
        ("testCreate", testCreate),
        ("testEntities", testEntities),
        ("testSubscript", testSubscript),
        ("testEquality", testEquality),
        ("testAddition", testAddition),
        ("testSubctraction", testSubstraction),
        ("test_0Addition", test_0Addition),
        ("testAdditiveInverse", testAdditiveInverse),
        ("testAssociativity", testAssociativity),
        ("testScalarMultiplication", testScalarMultiplication),
        ("testMultiplication", testMultiplication),
        ("testTranspose", testTranspose),
    ]
}
