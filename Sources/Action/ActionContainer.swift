
#if os(iOS) || os(tvOS) || os(macOS)
import Foundation

public class Container<Host: AnyObject>: NSObject {

    unowned let host: Host

    init(host: Host) {
        self.host = host
    }

    var target: Target?
}

#endif
