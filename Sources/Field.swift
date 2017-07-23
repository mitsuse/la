public protocol Field: Arithmetic {
    static var zero: Self { get }

    static func matrix_create<M: Size, N: Size>(_: [Self]) -> Matrix<M, N, Self>?
    static func matrix_identity<M: Size, N: Size>() -> Matrix<M, N, Self>
    static func matrix_additiveInvese<M: Size, N: Size>(of: Matrix<M, N, Self>) -> Matrix<M, N, Self>
    static func matrix_add<M: Size, N: Size>(_: Matrix<M, N, Self>, _: Matrix<M, N, Self>) -> Matrix<M, N, Self>
    static func matrix_subtract<M: Size, N: Size>(_: Matrix<M, N, Self>, _: Matrix<M, N, Self>) -> Matrix<M, N, Self>
    static func matrix_scalar<M: Size, N: Size>(_: Matrix<M, N, Self>, _: Self) -> Matrix<M, N, Self>
    static func matrix_multiply<M: Size, N: Size, P: Size>(_: Matrix<M, N, Self>, _: Matrix<N, P, Self>) -> Matrix<M, P, Self>
    static func matrix_transpose<M: Size, N: Size>(_: Matrix<M, N, Self>) -> Matrix<N, M, Self>
    static func matrix_entries<M: Size, N: Size>(of: Matrix<M, N, Self>) -> [Self]
}
