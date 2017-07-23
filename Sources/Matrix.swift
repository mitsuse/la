import Accelerate

public struct Matrix<M: Size, N: Size, Real: La.Real>: Equatable, Signed, Addition, Subtraction {
    fileprivate let object: la_object_t

    public var m: UInt { return M.self.value }
    public var n: UInt { return N.self.value }

    init(_ object: la_object_t) {
        self.object = object
    }
}

extension Matrix {
    public static func create(_ entries: [Real]) -> Matrix<M, N, Real>? {
        guard UInt(entries.count) == M.value * N.value && M.value > 0 && N.value > 0 else { return nil }
        let object: la_object_t
        switch Real.self {
        case is Double.Type:
            object = la_matrix_from_double_buffer(
                entries as! [Double],
                M.value,
                N.value,
                N.value,
                la_hint_t(LA_NO_HINT),
                la_attribute_t(LA_DEFAULT_ATTRIBUTES)
            )
        case is Float.Type:
            object = la_matrix_from_float_buffer(
                entries as! [Float],
                M.value,
                N.value,
                N.value,
                la_hint_t(LA_NO_HINT),
                la_attribute_t(LA_DEFAULT_ATTRIBUTES)
            )
        default:
            object = la_matrix_from_float_buffer(
                entries.map { $0.float },
                M.value,
                N.value,
                N.value,
                la_hint_t(LA_NO_HINT),
                la_attribute_t(LA_DEFAULT_ATTRIBUTES)
            )
        }
        return Matrix(object)
    }

    public static func zeros() -> Matrix<M, N, Real> {
        return fill(Real.zero)
    }

    public static func fill(_ entity: Real) -> Matrix<M, N, Real> {
        return Matrix.create(Array(repeating: entity, count: Int(M.value * N.value)))!
    }
}

extension Matrix {
    public var entries: [Real] {
        switch Real.self {
        case is Double.Type:
            var value = Array<Double>(repeating: 0, count: Int(M.value * N.value))
            la_matrix_to_double_buffer(&value, N.value, object)
            return value as! [Real]
        case is Float.Type:
            var value = Array<Float>(repeating: 0, count: Int(M.value * N.value))
            la_matrix_to_float_buffer(&value, N.value, object)
            return value as! [Real]
        default:
            var value = Array<Float>(repeating: 0, count: Int(M.value * N.value))
            la_matrix_to_float_buffer(&value, N.value, object)
            return value.map { Real($0) }
        }
    }

    public var t: Matrix<N, M, Real> {
        return Matrix<N, M, Real>(la_transpose(object))
    }

    public subscript(_ i: UInt, _ j: UInt) -> Real {
        return entries[Int(i * n + j)]
    }
}

public prefix func - <M: Size, N: Size, Real: La.Real>(_ a: Matrix<M, N, Real>) -> Matrix<M, N, Real> {
    return a * Real(Float(-1))
}

public func == <M: Size, N: Size, Real: La.Real>(_ a: Matrix<M, N, Real>, _ b: Matrix<M, N, Real>) -> Bool {
    return a.entries == b.entries
}

public func + <M: Size, N: Size, Real: La.Real>(_ a: Matrix<M, N, Real>, _ b: Matrix<M, N, Real>) -> Matrix<M, N, Real> {
    return Matrix<M, N, Real>(la_sum(a.object, b.object))
}

public func - <M: Size, N: Size, Real: La.Real>(_ a: Matrix<M, N, Real>, _ b: Matrix<M, N, Real>) -> Matrix<M, N, Real> {
    return Matrix<M, N, Real>(la_difference(a.object, b.object))
}

public func * <M: Size, N: Size, Real: La.Real>(_ a: Real, _ b: Matrix<M, N, Real>) -> Matrix<M, N, Real> {
    return b * a
}

public func * <M: Size, N: Size, Real: La.Real>(_ b: Matrix<M, N, Real>, _ a: Real) -> Matrix<M, N, Real> {
    let object: la_object_t
    switch Real.self {
    case is Double.Type: object = la_scale_with_double(b.object, a as! Double)
    case is Float.Type: object = la_scale_with_float(b.object, a as! Float)
    default: object = la_scale_with_float(b.object, a.float)
    }
    return Matrix<M, N, Real>(object)
}

public func * <M: Size, N: Size, P: Size, Real: La.Real>(_ a: Matrix<M, N, Real>, _ b: Matrix<N, P, Real>) -> Matrix<M, P, Real> {
    return Matrix<M, P, Real>(la_matrix_product(a.object, b.object))
}
