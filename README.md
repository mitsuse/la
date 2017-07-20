# La

[![License][badge-license]][license]
[![Release][release-badge]][release]

A library for linear algebra with type-safety written in Swift.


## Motivations

- Type safety - Make it easy to check the shape of matrices and their operations in compile time.
- Efficiency - Wrap highly-optimized libraries for linear algebra like BLAS or Accelerate.


## Installation

Just add `La` to your dependencies.

For Swift Package Manager:

```swift
// Package.swift
let package = Package(
    name: "YourProject",
    dependencies: [
        .Package(url: "https://github.com/mitsuse/la", majorVersion: 0, minor: 3, patch: 2),
    ]
)
```

For CocoaPods:

```ruby
use_frameworks!

target 'YourProject' do
  pod 'La', :git => 'https://github.com/mitsuse/la.git', :tag => '0.3.2'
end
```


## Type checking

To check matrix operations and shape statically, La adopts a naive way that:
binding size value to static field of size type.

`Matrix` type requires `M` and `N` as type parameters.

```swift
public struct Matrix<M: Size, N: Size, Real: La.Real> {
    // ...
}
```

`M` and `N` conforms to `Size` protocol.

```swift
public protocol Size {
    static var value: UInt { get }
}
```

If you want 3 x 2 `Float` matrix, `Size` type can be implemented as follows:

```swift
import La

enum _3: Size { static let value: Uint = 3 }
enum _2: Size { static let value: Uint = 2 }

// Create an 3 x 2 zero matrix.
Matrix<_3, _2, Float>.zeros()

// Create an 3 x 2 matrix.
// The result type is `Optional<Matrix<_3, _2>>` because too long or too short array may be given.
Matrix<_3, _2, Float>([
    0, 1,
    2, 3,
    4, 5,
])
```


**NOTE: Static fields `value` of size types should not be modifiable.
Type safety on matrix operations can break by implementing a setter for `value`.**


## Bind size value to size type in runtime

Any `static let` properties are evaluated lazily in swift,
you can bind the result of calculation or the value given as input such as a command-line argument in runtime.

The following snippet is an example of lazy-evaluated size value for feature extraction.

```swift
import Foundation
import La

struct Feature {
    enum Dimension: Size {
        static let value = UInt(ProcessInfo.processInfo.environment["FEATURE_DIMENSION"]!)!
    }

    func of(_ instance: Instance) -> RowVector<Dimension, Float> {
        // Encode the given `instance` as feature vector.
    }
}
```


## License

The content of this repository are licensed under the MIT License unless otherwise noted.
Please read [LICENSE][license] for the detail.


[badge-license]: https://img.shields.io/badge/license-MIT-yellowgreen.svg?style=flat-square
[license]: LICENSE
[release-badge]: https://img.shields.io/github/tag/mitsuse/la.svg?style=flat-square
[release]: https://github.com/mitsuse/la/releases
