import XCTest

@testable import La

final class MatrixDoubleTests: XCTestCase, Tests {
    func testCreate() {
        let a = Matrix<_3, _2, Double>.create([
            0, 1,
            2, 3,
            4, 5,
            ])
        let b = Matrix<_3, _2, Double>.create([
            0, 1,
            2, 3,
            ])
        let c = Matrix<_3, _2, Double>.create([
            0,
            2,
            4,
            ])
        let d = Matrix<_2, _2, Double>.create([
            0, 1,
            2, 3,
            4, 5,
            ])
        let e = Matrix<_3, _1, Double>.create([
            0, 1,
            2, 3,
            4, 5,
            ])
        let f = Matrix<_0, _1, Double>.create([])
        let g = Matrix<_1, _0, Double>.create([])
        XCTAssertNotNil(a)
        XCTAssertNil(b)
        XCTAssertNil(c)
        XCTAssertNil(d)
        XCTAssertNil(e)
        XCTAssertNil(f)
        XCTAssertNil(g)
    }

    func testEntities() {
        let entries: [Double] = [
            0, 1,
            2, 3,
            4, 5,
            ]
        let a = Matrix<_3, _2, Double>.create(entries)!
        XCTAssertEqual(a.entries, entries)
    }

    func testSubscript() {
        let a = Matrix<_3, _2, Double>.create([
            0, 1,
            2, 3,
            4, 5,
            ])!
        XCTAssertEqual(a[0, 1], 1)
    }

    func testEquality() {
        let a = Matrix<_3, _2, Double>.create([
            0, 1,
            2, 3,
            4, 5,
            ])!
        let b = Matrix<_3, _2, Double>.create([
            0, 1,
            2, 3,
            4, 5,
            ])!
        XCTAssertEqual(a, b)
        XCTAssertEqual(b, a)
    }

    func testAddition() {
        let a = Matrix<_3, _2, Double>.create([
            0, -1,
            2, -3,
            4, -5,
            ])!
        let b = Matrix<_3, _2, Double>.create([
            0, 1,
            2, 3,
            4, 5,
            ])!
        let c = Matrix<_3, _2, Double>.create([
            0, 0,
            4, 0,
            8, 0,
            ])!
        XCTAssertEqual(a + b, c)
        XCTAssertEqual(b + a, c)
    }

    func testSubstraction() {
        let a = Matrix<_3, _2, Double>.create([
            0, -1,
            2, -3,
            4, -5,
            ])!
        let b = Matrix<_3, _2, Double>.create([
            -0, -1,
            -2, -3,
            -4, -5,
            ])!
        let c = Matrix<_3, _2, Double>.create([
            0, 0,
            4, 0,
            8, 0,
            ])!
        XCTAssertEqual(a - b, c)
    }

    func testZeroAddition() {
        let a = Matrix<_3, _2, Double>.create([
            0, -1,
            2, -3,
            4, -5,
            ])!
        let z = Matrix<_3, _2, Double>.zeros()
        XCTAssertEqual(a + z, a)
    }

    func testAdditiveInverse() {
        let a = Matrix<_3, _2, Double>.create([
            0, -1,
            2, -3,
            4, -5,
            ])!
        let inverse = -a
        XCTAssertEqual(a + inverse, Matrix<_3, _2, Double>.zeros())
    }

    func testAssociativity() {
        let a = Matrix<_3, _2, Double>.create([
            0, -1,
            2, -3,
            4, -5,
            ])!
        let b = Matrix<_3, _2, Double>.create([
            0, 1,
            2, 3,
            4, 5,
            ])!
        let c = Matrix<_3, _2, Double>.create([
            1, 2,
            3, 4,
            5, 6,
            ])!
        let left = (a + b) + c
        let right = a + (b + c)
        XCTAssertEqual(left, right)
    }

    func testScalarMultiplication() {
        let a1: Double = 2
        let b1 = Matrix<_2, _2, Double>.create([
            6, 4,
            4, 14,
            ])!
        let c1 = Matrix<_2, _2, Double>.create([
            12, 8,
            8, 28,
            ])!
        XCTAssertEqual(a1 * b1, c1)
        XCTAssertEqual(a1 * b1, b1 * a1)
    }

    func testMultiplication() {
        let a = Matrix<_3, _3, Double>.create([
            1, 1, 2,
            1, 2, 3,
            1, 4, 9,
            ])!
        let b = Matrix<_3, _2, Double>.create([
            0, 1,
            1, -1,
            2, 0,
            ])!
        let c = Matrix<_3, _2, Double>.create([
            5, 0,
            8, -1,
            22, -3,
            ])!
        XCTAssertEqual(a * b, c)
    }

    func testIdentity() {
        let a = Matrix<_3, _2, Double>.create([
            0, 1,
            1, -1,
            2, 0,
            ])!
        let i = Matrix<_2, _2, Double>.identity()
        XCTAssertEqual(a * i, a)
    }

    func testTranspose() {
        let a = Matrix<_3, _2, Double>.create([
            0, 1,
            2, 3,
            4, 5,
            ])!
        let b = Matrix<_2, _3, Double>.create([
            0, 2, 4,
            1, 3, 5,
            ])!
        XCTAssertEqual(a.t, b)
    }

    static let allTests: [(String, (MatrixDoubleTests) -> () -> ())] = [
        ("testCreate", testCreate),
        ("testEntities", testEntities),
        ("testSubscript", testSubscript),
        ("testEquality", testEquality),
        ("testAddition", testAddition),
        ("testSubctraction", testSubstraction),
        ("testZeroAddition", testZeroAddition),
        ("testAdditiveInverse", testAdditiveInverse),
        ("testAssociativity", testAssociativity),
        ("testScalarMultiplication", testScalarMultiplication),
        ("testMultiplication", testMultiplication),
        ("testIdentity", testIdentity),
        ("testTranspose", testTranspose),
        ]
}
