extension Matrix where Trait == Column {
    public static func create(m: Int, _ entities: [Field]) -> Result<Matrix<Column, Field>> {
        return initialize(shape: Shape(n: 1, m: m), entities: entities)
    }

    public static func zeros(m: Int) -> Result<Matrix<Column, Field>> {
        return create(m: m, Array(repeating: Field.zero, count: m))
    }
}

extension Matrix where Trait: ColumnTrait {
}
