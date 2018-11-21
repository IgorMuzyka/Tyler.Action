
#if os(iOS) || os(tvOS) || os(macOS)
import Foundation

private struct AssociatedKey {

    static var key = "targetActionContainer"
}

public protocol ActionAware: class {
    associatedtype ActionAwareHostType: AnyObject

    var actionContainer: Container<ActionAwareHostType> { get }
}

extension ActionAware {

    public var actionContainer: Container<Self> {
        if let value = objc_getAssociatedObject(self, &AssociatedKey.key) as? Container<Self> {
            return value
        }

        let value = Container(host: self)
        objc_setAssociatedObject(self, &AssociatedKey.key, value, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return value
    }
}

extension NativeView: ActionAware {}

#endif
