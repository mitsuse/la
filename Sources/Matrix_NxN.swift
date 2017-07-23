import Accelerate

extension Matrix where M == N, Real == Double {
    public static func identity() -> Matrix<M, N, Real> {
        return Matrix(la_identity_matrix(N.value, la_scalar_type_t(LA_SCALAR_TYPE_DOUBLE), la_attribute_t(LA_DEFAULT_ATTRIBUTES)))
    }
}

extension Matrix where M == N, Real == Float {
    public static func identity() -> Matrix<M, N, Real> {
        return Matrix(la_identity_matrix(N.value, la_scalar_type_t(LA_SCALAR_TYPE_FLOAT), la_attribute_t(LA_DEFAULT_ATTRIBUTES)))
    }
}

extension Matrix where M == N {
    public var order: UInt { return n }
}
