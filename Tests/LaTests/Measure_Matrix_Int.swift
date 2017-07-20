import XCTest

@testable import La

final class MeasureMatrixIntTests: XCTestCase, Tests {
    typealias Real = Int

    func testMeasureSubcript() {
        let a = Matrix<_1000, _1000, Real>.fill(Real(0.1))
        measure { _ = a[10, 2] }
    }

    func testMeasureEquality() {
        let a = Matrix<_1000, _1000, Real>.fill(Real(0.1))
        let b = Matrix<_1000, _1000, Real>.fill(Real(0.1))
        measure { _ = a == b }
    }

    func testMeasureAddition() {
        let a = Matrix<_1000, _1000, Real>.fill(Real(0.1))
        measure { _ = (a + a).entries }
    }

    func testMeasureSubtraction() {
        let a = Matrix<_1000, _1000, Real>.fill(Real(0.1))
        let b = Matrix<_1000, _1000, Real>.fill(Real(0.3))
        measure { _ = (a - b).entries }
    }

    func testMeasureScalarMultiplication() {
        let scalar: Real = 2
        let a = Matrix<_1000, _1000, Real>.fill(Real(0.1))
        measure { _ = (scalar * a).entries }
    }

    func testMeasureMultiplication() {
        let a = Matrix<_1000, _1000, Real>.fill(Real(0.1))
        measure { _ = (a * a).entries }
    }

    func testMeasureTranspose() {
        let a = Matrix<_1000, _1000, Real>.fill(Real(0.1))
        measure { _ = a.t.entries }
    }

    static let allTests: [(String, (MeasureMatrixIntTests) -> () -> ())] = [
        ("testMeasureSubcript", testMeasureSubcript),
        ("testMeasureEquality", testMeasureEquality),
        ("testMeasureAddition", testMeasureAddition),
        ("testMeasureSubtraction", testMeasureSubtraction),
        ("testMeasureScalarMultiplication", testMeasureScalarMultiplication),
        ("testMeasureMultiplication", testMeasureMultiplication),
        ("testMeasureTranspose", testMeasureTranspose),
    ]
}
