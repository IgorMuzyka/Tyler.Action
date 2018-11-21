
#if os(iOS) || os(tvOS) || os(macOS)

internal final class Target: NSObject {

    private let handler: () -> Void

    internal init(handler: @escaping () -> Void) {
        self.handler = handler
    }

    @objc func handle() {
        handler()
    }
}

extension NativeView {

	internal func add(target: Target) {
		actionContainer.target = target
	}
}

#endif

#if os(iOS) || os(tvOS)
import UIKit

extension UIView {

    @objc internal func apply(target: Target) {
        print("no way to apply target to uiview currently")
    }
}
#warning("implement for all other supported view types and maybe gesture recognizers")
extension UIButton {

    @objc internal override func apply(target: Target) {
		add(target: target)
		addTarget(target, action: #selector(target.handle), for: UIControl.Event.touchUpInside)
    }
}

#elseif os(macOS)
import AppKit

extension NSView {

    @objc internal func apply(target: Target) {
        print("no way to apply target to uiview currently")
    }

}

#endif
