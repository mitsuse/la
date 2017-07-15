import XCTest

@testable import LaTests

XCTMain([
    testCase(MatrixTests.allTests),
    testCase(ResultTests.allTests),
])
