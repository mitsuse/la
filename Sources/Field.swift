// What is `Field`?
// Is `Field` can be equatable?
public protocol Field: Arithmetic {
    static var zero: Self { get } // Does `zero` exist in any field?
}

public protocol Real: Field {
}

public protocol Complex: Field {
}
