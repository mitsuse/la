public struct Matrix<M: Size, N: Size, Field: La.Field>: Equatable, Signed, Addition {
    public let entities: [Field]

    public var m: Int { return M.self.value }
    public var n: Int { return N.self.value }

    init?(_ entities: [Field]) {
        guard entities.count == M.value * N.value && M.value > 0 && N.value > 0 else { return nil }
        self.entities = entities
    }

    public subscript(_ i: Int, _ j: Int) -> Field {
        return entities[i * n + j]
    }
}

extension Matrix {
    public static func zeros() -> Matrix<M, N, Field> {
        return Matrix(Array(repeating: Field.zero, count: M.value * N.value))!
    }
}

public prefix func - <M: Size, N: Size, Field: La.Field>(_ a: Matrix<M, N, Field>) -> Matrix<M, N, Field> {
    return Matrix(a.entities.map { -$0 })!
}

public func == <M: Size, N: Size, Field: La.Field>(_ a: Matrix<M, N, Field>, _ b: Matrix<M, N, Field>) -> Bool {
    return a.entities == b.entities
}

public func + <M: Size, N: Size, Field: La.Field>(_ a: Matrix<M, N, Field>, _ b: Matrix<M, N, Field>) -> Matrix<M, N, Field> {
    return Matrix(zip(a.entities, b.entities).map { $0 + $1 })!
}

public func * <M: Size, N: Size, Field: La.Field>(_ a: Field, _ b: Matrix<M, N, Field>) -> Matrix<M, N, Field> {
    return Matrix(b.entities.map { a * $0 })!
}

public func * <M: Size, N: Size, Field: La.Field>(_ b: Matrix<M, N, Field>, _ a: Field) -> Matrix<M, N, Field> {
    return a * b
}
