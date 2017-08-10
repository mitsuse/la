public protocol Field: Arithmetic {
    static var zero: Self { get }

    static func matrix_identity<M, N>() -> Matrix<M, N, Self>
    static func matrix_additiveInvese<M, N>(of: Matrix<M, N, Self>) -> Matrix<M, N, Self>
    static func matrix_add<M, N>(_: Matrix<M, N, Self>, _: Matrix<M, N, Self>) -> Matrix<M, N, Self>
    static func matrix_subtract<M, N>(_: Matrix<M, N, Self>, _: Matrix<M, N, Self>) -> Matrix<M, N, Self>
    static func matrix_scalar<M, N>(_: Matrix<M, N, Self>, _: Self) -> Matrix<M, N, Self>
    static func matrix_multiply<M, N, P>(_: Matrix<M, N, Self>, _: Matrix<N, P, Self>) -> Matrix<M, P, Self>
    static func matrix_transpose<M, N>(_: Matrix<M, N, Self>) -> Matrix<N, M, Self>
}
