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
        .Package(url: "https://github.com/mitsuse/la", majorVersion: 0, minor: 3),
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


## License

The content of this repository are licensed under the MIT License unless otherwise noted.
Please read [LICENSE][license] for the detail.


[badge-license]: https://img.shields.io/badge/license-MIT-yellowgreen.svg?style=flat-square
[license]: LICENSE
[release-badge]: https://img.shields.io/github/tag/mitsuse/la.svg?style=flat-square
[release]: https://github.com/mitsuse/la/releases
