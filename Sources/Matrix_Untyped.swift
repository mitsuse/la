extension Matrix where Trait == Untyped {
    public static func create(n: Int, m: Int, _ entities: [Field]) -> Result<Matrix<Untyped, Field>> {
        return Matrix.initialize(shape: Shape(n: n, m: m), entities: entities)
    }

    public static func zeros(n: Int, m: Int) -> Result<Matrix<Untyped, Field>> {
        return Matrix.initialize(shape: Shape(n: n, m: m), entities: Array(repeating: Field.zero, count: n * m))
    }
}
