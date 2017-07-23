import Accelerate

extension Float: Field {
    public static let zero: Float = 0

    public static func matrix_create<M: Size, N: Size>(_ entries: [Float]) -> Matrix<M, N, Float>? {
        guard UInt(entries.count) == M.value * N.value && M.value > 0 && N.value > 0 else { return nil }
        return Matrix(
            la_matrix_from_float_buffer(
                entries,
                M.value,
                N.value,
                N.value,
                la_hint_t(LA_NO_HINT),
                la_attribute_t(LA_DEFAULT_ATTRIBUTES)
            )
        )
    }

    public static func matrix_identity<M: Size, N: Size>() -> Matrix<M, N, Float> {
        return Matrix(la_identity_matrix(N.value, la_scalar_type_t(LA_SCALAR_TYPE_FLOAT), la_attribute_t(LA_DEFAULT_ATTRIBUTES)))
    }

    public static func matrix_additiveInvese<M: Size, N: Size>(of a: Matrix<M, N, Float>) -> Matrix<M, N, Float> {
        return matrix_scalar(a, -1)
    }

    public static func matrix_add<M: Size, N: Size>(_ a: Matrix<M, N, Float>, _ b : Matrix<M, N, Float>) -> Matrix<M, N, Float> {
        return Matrix(la_sum(a.object, b.object))
    }

    public static func matrix_subtract<M: Size, N: Size>(_ a: Matrix<M, N, Float>, _ b: Matrix<M, N, Float>) -> Matrix<M, N, Float> {
        return Matrix(la_difference(a.object, b.object))
    }

    public static func matrix_scalar<M: Size, N: Size>(_ b: Matrix<M, N, Float>, _ a: Float) -> Matrix<M, N, Float> {
        return Matrix(la_scale_with_float(b.object, a))
    }

    public static func matrix_multiply<M: Size, N: Size, P: Size>(_ a: Matrix<M, N, Float>, _ b: Matrix<N, P, Float>) -> Matrix<M, P, Float> {
        return Matrix(la_matrix_product(a.object, b.object))
    }

    public static func matrix_transpose<M: Size, N: Size>(_ a: Matrix<M, N, Float>) -> Matrix< N, M, Float> {
        return Matrix(la_transpose(a.object))
    }

    public static func matrix_entries<M: Size, N: Size>(of a: Matrix<M, N, Float>) -> [Float] {
        var value = Array<Float>(repeating: 0, count: Int(M.value * N.value))
        la_matrix_to_float_buffer(&value, N.value, a.object)
        return value
    }
}
