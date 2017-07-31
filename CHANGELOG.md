## Unreleased

- Simplify Dockerfile. Remove needless packages to build and test.


## 0.6.1

- Fix the podspec.


## 0.6.0

- Move implementations of `Field` to [la-accelerate][github-la-accelerate].

[github-la-accelerate]: https://github.com/mitsuse/la-accelerate


## 0.5.0

- Rename `init` to `create`. It will conflict to other initializers in the future.
- Support `Double` and `Float` as `Field` parameter.
- Use BLAS directly instead of `la_object_t`.
    - This is the first step for Linux support.
    - Lazy operations feature is removed temporarily. The feature is provided by `la_object_t`.


## 0.4.0

- Rename `entities` to `entries`.
- Rename size type `One` to `_1`.
- Add typealias for row vector and column vector.
- Add an extension for type of N x N matrix to create `identity` matrix.


## 0.3.2

- Fix scalar-multiplication for Double.


## 0.3.1

- Just remove needless types.


## 0.3.0

- Replace the internal with Accelerate's BLAS.
- Support subtraction.
- Support any types of real number.


## 0.2.0

- Support transpose.
    - The performance has not been optimized yet.


## 0.1.1

- Fix: The initializer of `Matrix` becomes public.


## 0.1.0

- Support some operations:
    - additive inverse.
    - scala multiplication.
    - matrix multiplication.
