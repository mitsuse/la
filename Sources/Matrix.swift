import Accelerate

public struct Matrix<M: Size, N: Size, Field: La.Field>: Equatable {
    let object: la_object_t

    public var m: UInt { return M.self.value }
    public var n: UInt { return N.self.value }

    init(_ object: la_object_t) {
        self.object = object
    }
}

extension Matrix {
    public static func create(_ entries: [Field]) -> Matrix<M, N, Field>? { return Field.matrix_create(entries) }
    public static func fill(_ entity: Field) -> Matrix<M, N, Field> { return Matrix.create(Array(repeating: entity, count: Int(M.value * N.value)))! }
    public static func zeros() -> Matrix<M, N, Field> { return fill(Field.zero) }
}

extension Matrix {
    public var entries: [Field] { return Field.matrix_entries(of: self) }
    public var t: Matrix<N, M, Field> { return Field.matrix_transpose(self) }
    public subscript(_ i: UInt, _ j: UInt) -> Field { return entries[Int(i * n + j)] }
}

public prefix func - <M: Size, N: Size, Field: La.Field>(_ a: Matrix<M, N, Field>) -> Matrix<M, N, Field> { return Field.matrix_additiveInvese(of: a) }
public func == <M: Size, N: Size, Field: La.Field>(_ a: Matrix<M, N, Field>, _ b: Matrix<M, N, Field>) -> Bool { return a.entries == b.entries }
public func + <M: Size, N: Size, Field: La.Field>(_ a: Matrix<M, N, Field>, _ b: Matrix<M, N, Field>) -> Matrix<M, N, Field> { return Field.matrix_add(a, b) }
public func - <M: Size, N: Size, Field: La.Field>(_ a: Matrix<M, N, Field>, _ b: Matrix<M, N, Field>) -> Matrix<M, N, Field> { return Field.matrix_subtract(a, b) }
public func * <M: Size, N: Size, Field: La.Field>(_ a: Field, _ b: Matrix<M, N, Field>) -> Matrix<M, N, Field> { return b * a }
public func * <M: Size, N: Size, Field: La.Field>(_ b: Matrix<M, N, Field>, _ a: Field) -> Matrix<M, N, Field> { return Field.matrix_scalar(b, a) }
public func * <M: Size, N: Size, P: Size, Field: La.Field>(_ a: Matrix<M, N, Field>, _ b: Matrix<N, P, Field>) -> Matrix<M, P, Field> { return Field.matrix_multiply(a, b) }
