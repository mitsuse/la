public protocol MatrixLike {
    associatedtype Field: La.Field

    var shape: Shape { get }

    subscript(_ i: Int, _ j: Int) -> Field { get }

    func row(_ i: Int) -> AnyHorizontalArray<Field>
    func column(_ j: Int) -> AnyVerticalArray<Field>
}

public struct Matrix<Field: La.Field>: MatrixLike, Arithmetic, Equatable {
    public let shape: Shape
    public let entities: [Field]

    fileprivate init(shape: Shape, entities: [Field]) {
        assert(entities.count == shape.n * shape.m, "The number of entities should be equal to `N * M`.")
        self.shape = shape
        self.entities = entities
    }

    public subscript(_ i: Int, _ j: Int) -> Field {
        return entities[i * shape.n + j]
    }

    public func row(_ i: Int) -> AnyHorizontalArray<Field> {
        return notImplemented()
    }

    public func column(_ j: Int) -> AnyVerticalArray<Field> {
        return notImplemented()
    }
}

extension Matrix {
    public static func create(n: Int, m: Int, _ entities: [Field]) -> Matrix<Field> {
        return Matrix(shape: Shape(n: n, m: m), entities: entities)
    }
}

public func == <Field: La.Field>(_ a: Matrix<Field>, _ b: Matrix<Field>) -> Bool {
    guard a.shape == b.shape else { return false }
    for m in 0..<a.shape.m {
        for n in 0..<a.shape.n {
            if a[m, n] != b[m, n] {
                return false
            }
        }
    }
    return true
}

public func + <Field: La.Field>(_ a: Matrix<Field>, _ b: Matrix<Field>) -> Matrix<Field> {
    return notImplemented()
}

public struct AnyHorizontalArray<Field: La.Field>: HorizontalArray {
    public subscript(_ i: Int) -> Field {
        return notImplemented()
    }
}

public protocol HorizontalArray {
    associatedtype Field: La.Field

    subscript(_ i: Int) -> Field { get }
}

public struct AnyVerticalArray<Field: La.Field>: VerticalArray {
    public subscript(_ j: Int) -> Field {
        return notImplemented()
    }
}

public protocol VerticalArray {
    associatedtype Field: La.Field

    subscript(_ j: Int) -> Field { get }
}
