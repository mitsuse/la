public struct Shape: Equatable {
    public let n: Int
    public let m: Int
}

public func == (_ a: Shape, _ b: Shape) -> Bool {
    return a.m == b.m && a.n == b.n
}
