
import TypePreservingCodingAdapter

public protocol Action: Codable {

    static var alias: Alias { get }
}

extension Action {

    internal var alias: Alias {
        return Self.alias
    }
}
