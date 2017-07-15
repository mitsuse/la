import XCTest

@testable import La

final class MatrixTests: XCTestCase, Tests {
    func testCreate() {
        let a = Matrix<Untyped, Int>.create(n: 3, m: 2, [
            0, 1,
            2, 3,
            4, 5,
        ])
        let b = Matrix<Untyped, Int>.create(n: 3, m: 2, [
            0, 1,
            2, 3,
        ])
        let c = Matrix<Untyped, Int>.create(n: 3, m: 2, [
            0,
            2,
            4,
        ])
        let d = Matrix<Untyped, Int>.create(n: 2, m: 2, [
            0, 1,
            2, 3,
            4, 5,
        ])
        let e = Matrix<Untyped, Int>.create(n: 3, m: 1, [
            0, 1,
            2, 3,
            4, 5,
        ])
        let f = Matrix<Untyped, Int>.create(n: 0, m: 1, [])
        let g = Matrix<Untyped, Int>.create(n: 1, m: 0, [])
        XCTAssertTrue(a.isDefined)
        XCTAssertFalse(b.isDefined)
        XCTAssertFalse(c.isDefined)
        XCTAssertFalse(d.isDefined)
        XCTAssertFalse(e.isDefined)
        XCTAssertFalse(f.isDefined)
        XCTAssertFalse(g.isDefined)
    }

    func testSubscript() {
        let a = Matrix<Untyped, Int>.create(n: 3, m: 2, [
            0, 1,
            2, 3,
            4, 5,
        ])
        let x = Result.defined(1)
        XCTAssertTrue(a[0, 1] == x)
    }

    func testEquality() {
        let a = Matrix<Untyped, Int>.create(n: 3, m: 2, [
            0, 1,
            2, 3,
            4, 5,
        ])
        let b = Matrix<Untyped, Int>.create(n: 3, m: 2, [
            0, 1,
            2, 3,
            4, 5,
        ])
        let c = Matrix<Untyped, Int>.create(n: 4, m: 3, [
            0, 1, 9,
            2, 3, 9,
            4, 5, 9,
            7, 7, 8,
        ])
        XCTAssertTrue(a == b)
        XCTAssertTrue(b == a)
        XCTAssertFalse(a == c)
        XCTAssertFalse(c == b)
    }

    func testAddition() {
        let a = Matrix<Untyped, Int>.create(n: 3, m: 2, [
            0, -1,
            2, -3,
            4, -5,
        ])
        let b = Matrix<Untyped, Int>.create(n: 3, m: 2, [
            0, 1,
            2, 3,
            4, 5,
        ])
        let c = Matrix<Untyped, Int>.create(n: 3, m: 2, [
            0, 0,
            4, 0,
            8, 0,
        ])
        XCTAssertTrue(a + b == c)
        XCTAssertTrue(b + a == c)
        XCTAssertTrue(c.isDefined)
    }

    func testZeroAddition() {
        let a = Matrix<Untyped, Int>.create(n: 3, m: 2, [
            0, -1,
            2, -3,
            4, -5,
        ])
        let z = Matrix<Untyped, Int>.zeros(n: 3, m: 2)
        XCTAssertTrue(a + z == a)
        XCTAssertTrue(z.isDefined)
    }

    func testAdditiveInverse() {
        let a = Matrix<Untyped, Int>.create(n: 3, m: 2, [
            0, -1,
            2, -3,
            4, -5,
        ])
        let inverse = -a
        XCTAssertTrue(a + inverse == Matrix<Untyped, Int>.zeros(n: 3, m: 2))
        XCTAssertTrue(a.isDefined)
    }

    func testAssociativity() {
        let a = Matrix<Untyped, Int>.create(n: 3, m: 2, [
            0, -1,
            2, -3,
            4, -5,
        ])
        let b = Matrix<Untyped, Int>.create(n: 3, m: 2, [
            0, 1,
            2, 3,
            4, 5,
        ])
        let c = Matrix<Untyped, Int>.create(n: 3, m: 2, [
            1, 2,
            3, 4,
            5, 6,
        ])
        let left = (a + b) + c
        let right = a + (b + c)
        XCTAssertTrue(left == right)
    }

    func testScalarMultiplication() {
        let a = 2
        let b = Matrix<Untyped, Int>.create(n: 2, m: 2, [
            6, 4,
            4, 14,
        ])
        let c = Matrix<Untyped, Int>.create(n: 2, m: 2, [
            12, 8,
            8, 28,
        ])
        let d: Result<Matrix<Untyped, Int>> = .undefined
        XCTAssertTrue(a * b == c)
        XCTAssertTrue(a * b == b * a)
        XCTAssertTrue(a * d == d)
        XCTAssertTrue(d * a == d)
        XCTAssertTrue(b.isDefined)
        XCTAssertTrue(c.isDefined)
        XCTAssertFalse(d.isDefined)
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
