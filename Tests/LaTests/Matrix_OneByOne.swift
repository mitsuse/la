import XCTest

@testable import La

final class MatrixOneByOneTests: XCTestCase, Tests {
    func testCreate() {
        let a = Matrix<OneByOne, Int>.create(2)
        XCTAssertTrue(a.isDefined)
    }

    static let allTests: [(String, (MatrixOneByOneTests) -> () -> ())] = [
        ("testCreate", testCreate),
    ]
}
