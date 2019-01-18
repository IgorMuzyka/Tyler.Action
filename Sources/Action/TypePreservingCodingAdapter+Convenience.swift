
import TypePreservingCodingAdapter

extension TypePreservingCodingAdapter {

    public func register<GenericAction: Action>(action: GenericAction.Type) -> TypePreservingCodingAdapter {
        register(type: GenericAction.self)
        register(alias: GenericAction.alias, for: GenericAction.self)
        return self
    }
}
