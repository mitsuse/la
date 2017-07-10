public protocol MatrixConvertible {
    associatedtype Field: La.Field

    var shape: Shape { get }

    subscript(_ i: Int, _ j: Int) -> Field { get }

    func row(_ i: Int) -> AnyHorizontalArray<Field>
    func column(_ j: Int) -> AnyVerticalArray<Field>
}

public struct Matrix<Field: La.Field>: MatrixConvertible, Equatable {
    private let _shape: () -> Shape
    private let _subscript: (Int, Int) -> Field
    private let _row: (Int) -> AnyHorizontalArray<Field>
    private let _column: (Int) -> AnyVerticalArray<Field>

    public var shape: Shape { return _shape() }

    init<M: MatrixConvertible>(_ base: M) where M.Field == Field {
        self._shape = { base.shape }
        self._subscript = { (i, j) in base[i, j] }
        self._row = base.row
        self._column = base.column
    }

    public subscript(_ i: Int, _ j: Int) -> Field { return _subscript(i, j) }
    public func row(_ i: Int) -> AnyHorizontalArray<Field> { return _row(i) }
    public func column(_ j: Int) -> AnyVerticalArray<Field> { return column(j) }
}

public func == <Field: La.Field>(_ a: Matrix<Field>, _ b: Matrix<Field>) -> Bool {
    guard a.shape == b.shape else { return false }
    for m in 0..<a.shape.m {
        for n in 0..<a.shape.n {
            if a[m, n] != b[m, n] {
                return false
            }
        }
    }
    return true
}

public struct AnyHorizontalArray<Field: La.Field>: HorizontalArray {
    public subscript(_ i: Int) -> Field {
        return notImplemented()
    }
}

public protocol HorizontalArray {
    associatedtype Field: La.Field

    subscript(_ i: Int) -> Field { get }
}

public struct AnyVerticalArray<Field: La.Field>: VerticalArray {
    public subscript(_ j: Int) -> Field {
        return notImplemented()
    }
}

public protocol VerticalArray {
    associatedtype Field: La.Field

    subscript(_ j: Int) -> Field { get }
}
