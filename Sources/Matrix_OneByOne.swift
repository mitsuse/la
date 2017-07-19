extension Matrix where M == One, N == One {
    public var scalar: Real { return self[0, 0] }
}
