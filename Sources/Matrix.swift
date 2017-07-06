public protocol Matrix: Equatable {
    associatedtype Field: La.Field

    var shape: Shape { get }

    subscript(_ i: Int, _ j: Int) -> Field { get }

    func row(_ i: Int) -> AnyHorizontalArray<Field>
    func column(_ j: Int) -> AnyVerticalArray<Field>
}

public func == <A: Matrix, B: Matrix>(_ a: A, _ b: B) -> Bool where A.Field == B.Field {
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
