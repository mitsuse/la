public protocol Real: Arithmetic, Equatable {
    static var zero: Self { get }

    var float: Float { get }
    var double: Double { get }

    init(_: Float)
    init(_: Double)
}
