extension Matrix where M == N {
    public static func identity() -> Matrix<M, N, Field> { return Field.matrix_identity() }
}

extension Matrix where M == N {
    public var order: UInt { return n }
}
