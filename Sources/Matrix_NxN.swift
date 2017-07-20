import Accelerate

extension Matrix where M == N {
    public static func identity() -> Matrix<M, N, Real> {
        let scalarType: la_scalar_type_t
        switch Real.self {
        case is Double.Type: scalarType = la_scalar_type_t(LA_SCALAR_TYPE_DOUBLE)
        default: scalarType = la_scalar_type_t(LA_SCALAR_TYPE_FLOAT)
        }
        return Matrix(la_identity_matrix(N.value, scalarType, la_attribute_t(LA_DEFAULT_ATTRIBUTES)))
    }
}

extension Matrix where M == N {
    public var order: UInt { return n }
}
