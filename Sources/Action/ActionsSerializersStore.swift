
import Foundation

#if os(iOS) || os(tvOS) || os(macOS)

public final class ActionsSerializersStore {

    public typealias Serializer = (Data) throws -> Action
    private var serializers = [String: Serializer]()
    private var decoder: JSONDecoder

    public init(decoder: JSONDecoder) {
        self.decoder = decoder
    }

    @discardableResult
    public func register<GenericAction: Action>(_ action: GenericAction.Type) -> ActionsSerializersStore {
        let key = String(reflecting: GenericAction.self)

        serializers[key] = { [unowned self] data throws -> GenericAction in
            return try self.decoder.decode(GenericAction.self, from: data)
        }
        return self
    }

    public func access(key: String) -> Serializer? {
        return serializers[key]
    }
}

#endif

#if os(iOS) || os(tvOS) || os(macOS)

extension ActionsSerializersStore {

    public static var `default`: ActionsSerializersStore {
        return ActionsSerializersStore(decoder: JSONDecoder())
    }

    public static func subDefault(_ configuration: (ActionsSerializersStore) -> Void) -> ActionsSerializersStore {
        let store: ActionsSerializersStore = .default
        configuration(store)
        return store
    }
}

#endif
