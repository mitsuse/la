public enum UntypedTrait {}

public typealias UntypedMatrix<Field: La.Field> = Matrix<UntypedTrait, Field>

extension UntypedMatrix {
    public static func create(n: Int, m: Int, _ entities: [Field]) -> UntypedMatrix<Field> {
        return UntypedMatrix(shape: Shape(n: n, m: m), entities: entities)
    }

    public static func zeros(n: Int, m: Int) -> UntypedMatrix<Field> {
        return UntypedMatrix(shape: Shape(n: n, m: m), entities: Array(repeating: Field.zero, count: n * m))
    }
}
