public protocol Trait {
    associatedtype M
    associatedtype N
    associatedtype Relation
}

public enum Single {}
public enum Equal {}
public enum Unknown {}

public enum Untyped: Trait {
    public typealias M = Unknown
    public typealias N = Unknown
    public typealias Relation = Unknown
}

public enum Row: Trait {
    public typealias M = Single
    public typealias N = Unknown
    public typealias Relation = Unknown
}

public enum Column: Trait {
    public typealias M = Unknown
    public typealias N = Single
    public typealias Relation = Unknown
}

public enum Square: Trait {
    public typealias M = Unknown
    public typealias N = Unknown
    public typealias Relation = Equal
}

public enum OneByOne: Trait {
    public typealias M = Single
    public typealias N = Single
    public typealias Relation = Equal
}
