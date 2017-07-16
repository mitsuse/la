extension Matrix where Trait == Row {
    public static func create(n: Int, _ entities: [Field]) -> Result<Matrix<Row, Field>> {
        return initialize(shape: Shape(n: n, m: 1), entities: entities)
    }

    public static func zeros(n: Int) -> Result<Matrix<Row, Field>> {
        return create(n: n, Array(repeating: Field.zero, count: n))
    }
}

extension Matrix where Trait.M == Single {
}
