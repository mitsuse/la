import Accelerate

extension Matrix where Real == Double {
    public static func create(_ entries: [Real]) -> Matrix<M, N, Real>? {
        guard UInt(entries.count) == M.value * N.value && M.value > 0 && N.value > 0 else { return nil }
        return Matrix(
            la_matrix_from_double_buffer(
                entries,
                M.value,
                N.value,
                N.value,
                la_hint_t(LA_NO_HINT),
                la_attribute_t(LA_DEFAULT_ATTRIBUTES)
            )
        )
    }

    public static func zeros() -> Matrix<M, N, Real> {
        return fill(0)
    }

    public static func fill(_ entity: Real) -> Matrix<M, N, Real> {
        return Matrix.create(Array(repeating: entity, count: Int(M.value * N.value)))!
    }
}

extension Matrix where Real == Double {
    public var entries: [Real] {
        var value = Array<Double>(repeating: 0, count: Int(M.value * N.value))
        la_matrix_to_double_buffer(&value, N.value, object)
        return value
    }

    public var t: Matrix<N, M, Real> {
        return Matrix<N, M, Real>(la_transpose(object))
    }

    public subscript(_ i: UInt, _ j: UInt) -> Real {
        return entries[Int(i * n + j)]
    }
}

public prefix func - <M: Size, N: Size>(_ a: Matrix<M, N, Double>) -> Matrix<M, N, Double> {
    return a * -1
}

public func == <M: Size, N: Size>(_ a: Matrix<M, N, Double>, _ b: Matrix<M, N, Double>) -> Bool {
    return a.entries == b.entries
}

public func + <M: Size, N: Size>(_ a: Matrix<M, N, Double>, _ b: Matrix<M, N, Double>) -> Matrix<M, N, Double> {
    return Matrix(la_sum(a.object, b.object))
}

public func - <M: Size, N: Size>(_ a: Matrix<M, N, Double>, _ b: Matrix<M, N, Double>) -> Matrix<M, N, Double> {
    return Matrix(la_difference(a.object, b.object))
}

public func * <M: Size, N: Size>(_ a: Double, _ b: Matrix<M, N, Double>) -> Matrix<M, N, Double> {
    return b * a
}

public func * <M: Size, N: Size>(_ b: Matrix<M, N, Double>, _ a: Double) -> Matrix<M, N, Double> {
    return Matrix(la_scale_with_double(b.object, a))
}

public func * <M: Size, N: Size, P: Size>(_ a: Matrix<M, N, Double>, _ b: Matrix<N, P, Double>) -> Matrix<M, P, Double> {
    return Matrix(la_matrix_product(a.object, b.object))
}
