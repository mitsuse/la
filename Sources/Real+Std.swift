extension Int: Real {
    public static var zero: Int { return 0 }

    public var float: Float { return Float(self) }
    public var double: Double { return Double(self) }
}

extension Int8: Real {
    public static var zero: Int8 { return 0 }

    public var float: Float { return Float(self) }
    public var double: Double { return Double(self) }
}

extension Int16: Real {
    public static var zero: Int16 { return 0 }

    public var float: Float { return Float(self) }
    public var double: Double { return Double(self) }
}

extension Int32: Real {
    public static var zero: Int32 { return 0 }

    public var float: Float { return Float(self) }
    public var double: Double { return Double(self) }
}

extension Int64: Real {
    public static var zero: Int64 { return 0 }

    public var float: Float { return Float(self) }
    public var double: Double { return Double(self) }
}

extension Float: Real {
    public static var zero: Float { return 0 }

    public var float: Float { return self }
    public var double: Double { return Double(self) }
}

extension Double: Real {
    public static var zero: Double { return 0 }

    public var float: Float { return Float(self) }
    public var double: Double { return self }
}
