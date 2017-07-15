public struct UntypedMatrix<Field: La.Field>: Matrix {
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

extension UntypedMatrix {
    public static func create(n: Int, m: Int, _ entities: [Field]) -> UntypedMatrix<Field> {
        return UntypedMatrix(shape: Shape(n: n, m: m), entities: entities)
    }

    public static func zeros(n: Int, m: Int) -> UntypedMatrix<Field> {
        return UntypedMatrix(shape: Shape(n: n, m: m), entities: Array(repeating: Field.zero, count: n * m))
    }
}

public prefix func - <Field: La.Field>(_ a: UntypedMatrix<Field>) -> UntypedMatrix<Field> {
    return UntypedMatrix(shape: a.shape, entities: a.entities.map { -$0 })
}

public func == <Field: La.Field>(_ a: UntypedMatrix<Field>, _ b: UntypedMatrix<Field>) -> Bool {
    return a.shape == b.shape && a.entities == b.entities
}

public func + <Field: La.Field>(_ a: UntypedMatrix<Field>, _ b: UntypedMatrix<Field>) -> UntypedMatrix<Field> {
    assert(a.shape == b.shape, "Two matrices should have the same shape.")
    return UntypedMatrix(shape: a.shape, entities: zip(a.entities, b.entities).map { $0 + $1 })
}

public func * <Field: La.Field>(_ a: Field, _ b: UntypedMatrix<Field>) -> UntypedMatrix<Field> {
    return UntypedMatrix(shape: b.shape, entities: b.entities.map { a * $0 })
}

public func * <Field: La.Field>(_ b: UntypedMatrix<Field>, _ a: Field) -> UntypedMatrix<Field> {
    return a * b
}
