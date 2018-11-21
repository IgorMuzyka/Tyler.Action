
public protocol Action: Codable {

    var typeName: String { get }
    static var typeName: String { get }
}

extension Action {

    public var typeName: String {
        return Self.typeName
    }

    public static var typeName: String {
        return String(reflecting: type(of: Self.self))
    }
}
