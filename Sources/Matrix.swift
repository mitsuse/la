import Accelerate

public struct Matrix<M: Size, N: Size>: Equatable, Signed, Addition, Subtraction {
    fileprivate let object: la_object_t

    public var m: UInt { return M.self.value }
    public var n: UInt { return N.self.value }

    public var entities: [Float] {
        var value = Array<Float>(repeating: 0, count: Int(M.value * N.value))
        la_matrix_to_float_buffer(&value, N.value, object)
        return value
    }

    init(_ object: la_object_t) {
        self.object = object
    }

    public subscript(_ i: UInt, _ j: UInt) -> Float {
        return entities[Int(i * n + j)]
    }
}

extension Matrix {
    public init?(_ entities: [Float]) {
        guard UInt(entities.count) == M.value * N.value && M.value > 0 && N.value > 0 else { return nil }
        self.init(
            la_matrix_from_float_buffer(
                entities,
                M.value,
                N.value,
                N.value,
                la_hint_t(LA_NO_HINT),
                la_attribute_t(LA_DEFAULT_ATTRIBUTES)
            )
        )
    }

    public var t: Matrix<N, M> {
        return Matrix<N, M>(la_transpose(object))
    }

    public static func zeros() -> Matrix<M, N> {
        return fill(0)
    }

    public static func fill(_ entity: Float) -> Matrix<M, N> {
        return Matrix(Array(repeating: entity, count: Int(M.value * N.value)))!
    }
}

public prefix func - <M: Size, N: Size>(_ a: Matrix<M, N>) -> Matrix<M, N> {
    return a * -1
}

public func == <M: Size, N: Size>(_ a: Matrix<M, N>, _ b: Matrix<M, N>) -> Bool {
    return a.entities == b.entities
}

public func + <M: Size, N: Size>(_ a: Matrix<M, N>, _ b: Matrix<M, N>) -> Matrix<M, N> {
    return Matrix<M, N>(la_sum(a.object, b.object))
}

public func - <M: Size, N: Size>(_ a: Matrix<M, N>, _ b: Matrix<M, N>) -> Matrix<M, N> {
    return a + (-b)
}

public func * <M: Size, N: Size>(_ a: Float, _ b: Matrix<M, N>) -> Matrix<M, N> {
    return b * a
}

public func * <M: Size, N: Size>(_ b: Matrix<M, N>, _ a: Float) -> Matrix<M, N> {
    return Matrix<M, N>(la_scale_with_float(b.object, a))
}

public func * <M: Size, N: Size, P: Size>(_ a: Matrix<M, N>, _ b: Matrix<N, P>) -> Matrix<M, P> {
    return Matrix<M, P>(la_matrix_product(a.object, b.object))
}
