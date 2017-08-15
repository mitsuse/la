public protocol Arithmetic: Equatable {
    static func + (_: Self, _: Self) -> Self
    static func - (_: Self, _: Self) -> Self
    static func * (_: Self, _: Self) -> Self
    static func / (_: Self, _: Self) -> Self
}
