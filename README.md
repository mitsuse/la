# La

[![License][badge-license]][license]
[![Release][release-badge]][release]
[![CI][badge-ci]][ci]

A library for linear algebra with type-safety written in Swift.


## Motivations

- Type-safety: Detect undefined operations in compile time.
- Performance: Use highly-optimized implementations for the backend.


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
