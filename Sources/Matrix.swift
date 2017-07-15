public struct Matrix<Trait: La.Trait, Field: La.Field>: Equatable, Addition {
    public let shape: Shape
    public let entities: [Field]

    init(shape: Shape, entities: [Field]) {
        assert(entities.count == shape.n * shape.m, "The number of entities should be equal to `N * M`.")
        self.shape = shape
        self.entities = entities
    }

    public subscript(_ i: Int, _ j: Int) -> Field {
        return entities[i * shape.n + j]
    }
}

public prefix func - <Trait: La.Trait, Field: La.Field>(_ a: Matrix<Trait, Field>) -> Matrix<Trait, Field> {
    return Matrix(shape: a.shape, entities: a.entities.map { -$0 })
}

public func == <Trait: La.Trait, Field: La.Field>(_ a: Matrix<Trait, Field>, _ b: Matrix<Trait, Field>) -> Bool {
    return a.shape == b.shape && a.entities == b.entities
}

public func + <Trait: La.Trait, Field: La.Field>(_ a: Matrix<Trait, Field>, _ b: Matrix<Trait, Field>) -> Matrix<Trait, Field> {
    assert(a.shape == b.shape, "Two matrices should have the same shape.")
    return Matrix(shape: a.shape, entities: zip(a.entities, b.entities).map { $0 + $1 })
}

public func * <Trait: La.Trait, Field: La.Field>(_ a: Field, _ b: Matrix<Trait, Field>) -> Matrix<Trait, Field> {
    return Matrix(shape: b.shape, entities: b.entities.map { a * $0 })
}

public func * <Trait: La.Trait, Field: La.Field>(_ b: Matrix<Trait, Field>, _ a: Field) -> Matrix<Trait, Field> {
    return a * b
}
