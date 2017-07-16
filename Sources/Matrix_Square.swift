extension Matrix where Trait == Square {
    public static func create(order: Int, _ entities: [Field]) -> Result<Matrix<Square, Field>> {
        return initialize(shape: Shape(n: order, m: order), entities: entities)
    }

    public static func zeros(order: Int) -> Result<Matrix<Square, Field>> {
        return create(order: order, Array(repeating: Field.zero, count: order * order))
    }
}

extension Matrix where Trait.Relation == Equal {
    public var order: Int { return shape.n }
}
