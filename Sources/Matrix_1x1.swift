extension Matrix where M == _1, N == _1, Real == Double {
    public var scalar: Real { return self[0, 0] }
}

extension Matrix where M == _1, N == _1, Real == Float {
    public var scalar: Real { return self[0, 0] }
}
