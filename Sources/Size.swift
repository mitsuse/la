public protocol Size {
    static var value: Int { get }
}

public enum One: Size {
    public static let value: Int = 1
}
