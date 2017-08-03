# La

[![License][badge-license]][license]
[![Release][release-badge]][release]
[![CI][badge-ci]][ci]

A library for linear algebra with type-safety written in Swift.


## Motivations

- Type-safety: Detect undefined operations in compile time.
- Performance: Use highly-optimized implementations for the backend.


## Examples

La rejects undefined operations in compile-time:

```swift
import La
import LaAccelerate

enum _2: Size { static let value: Int32 = 2 }
enum _3: Size { static let value: Int32 = 3 }

let a = Matrix<_2, _3, Double>([
    0, 1, 2,
    3, 4, 5,
])!

let b = Matrix<_2, _3, Double>([
    0, 1, 2,
    3, 4, 5,
])!

let c = Matrix<_3, _2, Double>([
    0, 1,
    2, 3,
    4, 5,
])!

_ = a + b // OK.
_ = a + c // This casuese a compile-tim error because the size of `a` is not same as the one of `c`.
```

You can decide sizes in run-time with lazy-evaluation based on input such as environment variables or files:

```swift
import Foundation

import La

enum N: Size {
    // Constants defined with `statc let` are lazily-evaluated in Swift.
    static let value: Int32 = Int(ProcessInfo.processInfo.environment["MATRIX_SIZE_M"])!
}

// `N.value` is decided here in run-time.
_ = Matrix<_1, N, Double>.zeros() // 1 x N zero matrix
```


## Installation

### Swift Pacakge Manager

Add `La` and `LaAccelerate` into dependencies:

```swift
// Package.swift
import PackageDescription

let package = Package(
    name: "YourPackage",
    dependencies: [
        .Package(url: "https://github.com/mitsuse/la", majorVersion: 0, minor: 6),
        .Package(url: "https://github.com/mitsuse/la-accelerate", majorVersion: 0, minor: 6),
    ]
)
```


### CocoaPods

Add the following lines into your `Podfile`:

```ruby
source 'https://github.com/mitsuse/pods-la.git'

Pod 'La', '~> 0.6.1'
Pod 'LaAccelerate', '~> 0.6.1'
```


## Matrix Operations

La doesn't provide the implementation of matrix operations.
This package just provides a matrix type and the interface of operations.

You need to import one of implementations for matrix operations:

- [la-accelerate][github-la-accelerate]: Accelerate (Apple's BLAS)
- [la-openblas (under development)][github-la-openblas]: OpenBLAS


[github-la-accelerate]: https://github.com/mitsuse/la-accelerate
[github-la-openblas]: https://github.com/mitsuse/la-openblas


## License

The content of this repository are licensed under the MIT License unless otherwise noted.
Please read [LICENSE][license] for the detail.


[badge-license]: https://img.shields.io/badge/license-MIT-yellowgreen.svg?style=flat-square
[license]: LICENSE
[release-badge]: https://img.shields.io/github/tag/mitsuse/la.svg?style=flat-square
[badge-ci]: https://img.shields.io/travis/mitsuse/la/master.svg?style=flat-square
[ci]: https://travis-ci.org/mitsuse/la
[release]: https://github.com/mitsuse/la/releases
