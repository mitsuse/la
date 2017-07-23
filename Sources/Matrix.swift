import Accelerate

public struct Matrix<M: Size, N: Size, Real> {
    let object: la_object_t

    public var m: UInt { return M.self.value }
    public var n: UInt { return N.self.value }

    init(_ object: la_object_t) {
        self.object = object
    }
}
