extension Matrix where Trait == OneByOne {
    public static var zero: Result<Matrix<OneByOne, Field>> {
        return create(Field.zero)
    }

    public static func create(_ entity: Field) -> Result<Matrix<OneByOne, Field>> {
        return Matrix.initialize(shape: Shape(n: 1, m: 1), entities: [entity])
    }
}

extension Matrix where Trait: OneByOneTrait {
}
