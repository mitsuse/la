import XCTest

@testable import LaTests

XCTMain([
    testCase(Matrix1x1Tests.allTests),
    testCase(MatrixNxNTests.allTests),
    testCase(MatrixTests.allTests),
])
