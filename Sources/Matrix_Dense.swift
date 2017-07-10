struct DenseMatrix<Field: La.Field>: MatrixConvertible {
    public let shape: Shape
    public let entities: [Field]

    fileprivate init(shape: Shape, entities: [Field]) {
        assert(entities.count == shape.n * shape.m, "The number of entities should be equal to `N * M`.")
        self.shape = shape
        self.entities = entities
    }

    subscript(_ i: Int, _ j: Int) -> Field {
        return entities[i * shape.n + j]
    }

    func row(_ i: Int) -> AnyHorizontalArray<Field> {
        return notImplemented()
    }

    func column(_ j: Int) -> AnyVerticalArray<Field> {
        return notImplemented()
    }
}

extension Matrix {
    public static func dense(n: Int, m: Int, entities: [Field]) -> Matrix<Field> {
        return Matrix(DenseMatrix(shape: Shape(n: n, m: m), entities: entities))
    }
}
