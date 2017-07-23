extension Matrix where M == _1, N == _1 {
    public var scalar: Field { return self[0, 0] }
}
