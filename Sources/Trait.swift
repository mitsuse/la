public protocol Trait {}

public enum Untyped: Trait {}

public enum Row: RowTrait {}

public enum Column: ColumnTrait {}

public enum Square: SquareTrait {}

public enum OneByOne: OneByOneTrait {}

public protocol RowTrait: Trait {}

public protocol ColumnTrait: Trait {}

public protocol SquareTrait: Trait {}

public typealias OneByOneTrait = SquareTrait & RowTrait & ColumnTrait
