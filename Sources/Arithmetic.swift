public typealias Arithmetic = Signed & Addition & Subtraction & Multiplication

public protocol Signed {
    static prefix func - (_ a: Self) -> Self
}

public protocol Addition {
    static func + (_ a: Self, _ b: Self) -> Self
}

public protocol Subtraction {
    static func - (_ a: Self, _ b: Self) -> Self
}

public protocol Multiplication {
    static func * (_ a: Self, _ b: Self) -> Self
}
