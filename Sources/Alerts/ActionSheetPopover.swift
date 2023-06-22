#if canImport(UIKit)
import UIKit

public struct ActionSheetPopover {
    public var layoutMargins: UIEdgeInsets?
    public var backgroundColor: UIColor?
    public var canOverlapSourceViewRect: Bool?
    public var passthroughViews: [UIView]?
    public weak var delegate: UIPopoverPresentationControllerDelegate?
    public weak var sourceView: UIView?
    public var sourceRect: CGRect?
    public weak var barButtonItem: UIBarButtonItem?
    public var permittedArrowDirections: UIPopoverArrowDirection?
}
#endif
