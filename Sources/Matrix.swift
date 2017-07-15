public protocol Matrix: Addition, Equatable {
    associatedtype Field: La.Field

    var shape: Shape { get }

    subscript(_ i: Int, _ j: Int) -> Field { get }
}
