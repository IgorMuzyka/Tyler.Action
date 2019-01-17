
#if os(iOS) || os(tvOS) || os(macOS)

public enum ActionatorError: Error {

    case hadlerForActionNotFound(Action)
}

public enum Actionator {

    public static func actionate(view: NativeView, with action: Action, store: ActionHandlersStore) throws {
        guard let handler = store.access(by: action.alias) else {
            throw ActionatorError.hadlerForActionNotFound(action)
        }

        view.apply(target: Target {
            handler(action)
        })
    }
}

#endif
