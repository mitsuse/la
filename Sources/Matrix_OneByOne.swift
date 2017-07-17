extension Matrix where M == One, N == One {
    public var scalar: Field { return self[0, 0] }
}
