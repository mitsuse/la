import XCTest

@testable import La

final class MeasureMatrixFloatTests: XCTestCase, Tests {
    typealias Real = Float

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
        measure { _ = (a + a).entities }
    }

    func testMeasureSubtraction() {
        let a = Matrix<_1000, _1000, Real>.fill(Real(0.1))
        let b = Matrix<_1000, _1000, Real>.fill(Real(0.3))
        measure { _ = (a - b).entities }
    }

    func testMeasureScalarMultiplication() {
        let a = Matrix<_1000, _1000, Real>.fill(Real(0.1))
        measure { _ = (0.1 * a).entities }
    }

    func testMeasureMultiplication() {
        let a = Matrix<_1000, _1000, Real>.fill(Real(0.1))
        measure { _ = (a * a).entities }
    }

    func testMeasureTranspose() {
        let a = Matrix<_1000, _1000, Real>.fill(Real(0.1))
        measure { _ = a.t.entities }
    }

    static let allTests: [(String, (MeasureMatrixFloatTests) -> () -> ())] = [
        ("testMeasureSubcript", testMeasureSubcript),
        ("testMeasureEquality", testMeasureEquality),
        ("testMeasureAddition", testMeasureAddition),
        ("testMeasureSubtraction", testMeasureSubtraction),
        ("testMeasureScalarMultiplication", testMeasureScalarMultiplication),
        ("testMeasureMultiplication", testMeasureMultiplication),
        ("testMeasureTranspose", testMeasureTranspose),
    ]
}
