public protocol Subscriptable2 {
    associatedtype Element
    associatedtype Index1
    associatedtype Index2

    subscript(_: Index1, _: Index2) -> Element { get }
}
