extension Matrix where Trait == Untyped {
    public static func create(n: Int, m: Int, _ entities: [Field]) -> Matrix<Trait, Field> {
        return Matrix(shape: Shape(n: n, m: m), entities: entities)
    }

    public static func zeros(n: Int, m: Int) -> Matrix<Trait, Field> {
        return Matrix(shape: Shape(n: n, m: m), entities: Array(repeating: Field.zero, count: n * m))
    }
}
