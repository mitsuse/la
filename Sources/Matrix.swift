public protocol MatrixLike {
    associatedtype Field: La.Field

    var shape: Shape { get }

    subscript(_ i: Int, _ j: Int) -> Field { get }
}

public struct Matrix<Field: La.Field>: MatrixLike, Addition, Equatable {
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
}

extension Matrix {
    public static func create(n: Int, m: Int, _ entities: [Field]) -> Matrix<Field> {
        return Matrix(shape: Shape(n: n, m: m), entities: entities)
    }

    public static func zeros(n: Int, m: Int) -> Matrix<Field> {
        return Matrix(shape: Shape(n: n, m: m), entities: Array(repeating: Field.zero, count: n * m))
    }
}

public prefix func - <Field: La.Field>(_ a: Matrix<Field>) -> Matrix<Field> {
    return Matrix(shape: a.shape, entities: a.entities.map { -$0 })
}

public func == <Field: La.Field>(_ a: Matrix<Field>, _ b: Matrix<Field>) -> Bool {
    return a.shape == b.shape && a.entities == b.entities
}

public func + <Field: La.Field>(_ a: Matrix<Field>, _ b: Matrix<Field>) -> Matrix<Field> {
    assert(a.shape == b.shape, "Two matrices should have the same shape.")
    return Matrix(shape: a.shape, entities: zip(a.entities, b.entities).map { $0 + $1 })
}

public func * <Field: La.Field>(_ a: Field, _ b: Matrix<Field>) -> Matrix<Field> {
    return Matrix(shape: b.shape, entities: b.entities.map { a * $0 })
}

public func * <Field: La.Field>(_ b: Matrix<Field>, _ a: Field) -> Matrix<Field> {
    return a * b
}
