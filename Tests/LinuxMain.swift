import XCTest

@testable import LaTests

XCTMain([
    testCase(MatrixOneByOneTests.allTests),
    testCase(MatrixTests.allTests),
])
