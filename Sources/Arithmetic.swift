public protocol Arithmetic: Addition {
}

public protocol Addition {
    static func + (_ a: Self, _ b: Self) -> Self
}
