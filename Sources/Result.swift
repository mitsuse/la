public enum Result<Value> {
    case defined(Value)
    case undefined
}

extension Result {
    public func map<T>(_ transform: (Value) throws -> T) rethrows -> Result<T> {
        switch self {
        case let .defined(value): return .defined(try transform(value))
        case .undefined: return .undefined
        }
    }
}

public prefix func - <Value: Signed> (_ a: Result<Value>) -> Result<Value> {
    return a.map { -$0 }
}

public func == <Value: Equatable> (_ a: Result<Value>, _ b: Result<Value>) -> Bool {
    switch (a, b) {
    case let (.defined(a), .defined(b)): return a == b
    case (.undefined, .undefined): return true
    case (.defined, .undefined), (.undefined, .defined): return false
    }
}

public func != <Value: Equatable> (_ a: Result<Value>, _ b: Result<Value>) -> Bool {
    return a != b
}

public func + <Value: Addition> (_ a: Result<Value>, _ b: Result<Value>) -> Result<Value> {
    switch (a, b) {
    case let (.defined(a), .defined(b)): return .defined(a + b)
    case (.undefined, .undefined), (.defined, .undefined), (.undefined, .defined): return .undefined
    }
}
