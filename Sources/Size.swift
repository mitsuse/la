public protocol Size {
    static var value: UInt { get }
}

public enum One: Size {
    public static let value: UInt = 1
}
