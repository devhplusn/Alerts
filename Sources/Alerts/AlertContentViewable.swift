#if canImport(UIKit)
import UIKit

@objc public protocol ContentViewable {
    @objc optional var contentHeight: CGFloat { get }
}

public protocol AlertContentViewable: UIViewController, ContentViewable { }

#endif
