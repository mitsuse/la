extension Matrix where M == One, N == One {
    public var scalar: Float { return self[0, 0] }
}
