import XCTest

@testable import LaTests

XCTMain([
    testCase(MatrixColumnTests.allTests),
    testCase(MatrixOneByOneTests.allTests),
    testCase(MatrixRowTests.allTests),
    testCase(MatrixSquareTests.allTests),
    testCase(MatrixTests.allTests),
    testCase(ResultTests.allTests),
])
