public struct DenseMatrix<Field: La.Field>: Matrix {
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

extension DenseMatrix {
    public init(n: Int, m: Int, entities: [Field]) {
        self.init(shape: Shape(n: n, m: m), entities: entities)
    }
}
