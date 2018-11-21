
#if os(iOS) || os(tvOS) || os(macOS)

public final class ActionHandlersStore {

    private var handlers = [String: (Any) -> Void]()

    public init() {}

	@discardableResult
    public func add<GenericAction: Action>(_ handler: @escaping (GenericAction) -> Void) -> ActionHandlersStore {
        let key = GenericAction.typeName
        handlers[key] = { input in
            guard let input = input as? GenericAction else {
                fatalError("input type does not match expected input type: \(GenericAction.self)")
            }
            return handler(input)
        }
        return self
    }

    internal func access(key: String) -> ((Any) -> Void)? {
        return handlers[key]
    }
}

#endif

#if os(iOS) || os(tvOS) || os(macOS)

extension ActionHandlersStore {

    public static var `default`: ActionHandlersStore {
        return ActionHandlersStore()
    }

    public static func subDefault(_ configuration: (ActionHandlersStore) -> Void) -> ActionHandlersStore {
        let store: ActionHandlersStore = .default
        configuration(store)
        return store
    }
}

#endif
