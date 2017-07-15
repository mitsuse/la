public struct Matrix<Trait: La.Trait, Field: La.Field>: Equatable, Subscriptable2, Signed, PartialAddition {
    public let shape: Shape
    public let entities: [Field]

    fileprivate init(shape: Shape, entities: [Field]) {
        self.shape = shape
        self.entities = entities
    }

    static func initialize(shape: Shape, entities: [Field]) -> Result<Matrix<Trait, Field>> {
        return
            entities.count == shape.n * shape.m && shape.n > 0 && shape.m > 0
                ? .defined(Matrix(shape: shape, entities: entities))
                : .undefined
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

public func + <Trait: La.Trait, Field: La.Field>(_ a: Matrix<Trait, Field>, _ b: Matrix<Trait, Field>) -> Result<Matrix<Trait, Field>> {
    return
        a.shape == b.shape
            ? .defined(Matrix(shape: a.shape, entities: zip(a.entities, b.entities).map { $0 + $1 }))
            : .undefined
}

public func * <Trait: La.Trait, Field: La.Field>(_ a: Field, _ b: Matrix<Trait, Field>) -> Matrix<Trait, Field> {
    return Matrix(shape: b.shape, entities: b.entities.map { a * $0 })
}

public func * <Trait: La.Trait, Field: La.Field>(_ b: Matrix<Trait, Field>, _ a: Field) -> Matrix<Trait, Field> {
    return a * b
}

public func * <Trait: La.Trait, Field: La.Field>(_ a: Field, _ b: Result<Matrix<Trait, Field>>) -> Result<Matrix<Trait, Field>> {
    switch b {
    case let .defined(b): return .defined(a * b)
    case .undefined: return .undefined
    }
}

public func * <Trait: La.Trait, Field: La.Field>(_ b: Result<Matrix<Trait, Field>>, _ a: Field) -> Result<Matrix<Trait, Field>> {
    switch b {
    case let .defined(b): return .defined(a * b)
    case .undefined: return .undefined
    }
}
