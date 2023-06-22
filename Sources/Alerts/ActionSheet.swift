#if canImport(Foundation) && canImport(UIKit)
import Foundation
import UIKit

public final class ActionSheet {
    
    private let controller = _AlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    
    private var _popover = ActionSheetPopover()
    
    /// The title of the alert.
    public var title: String? {
        controller.title
    }
    
    /// The message of the alert.
    public var message: String? {
        controller.message
    }
    
    /// The attributed title of the alert.
    public var attributedTitle: NSAttributedString? {
        controller.attributedTitle
    }
    
    /// The attributed message of the alert.
    public var attributedMessage: NSAttributedString? {
        controller.attributedMessage
    }
    
    /// The tintColor of the alert.
    public var tintColor: UIColor? {
        controller.tintColor
    }
    
    /// The actions that the user can take in response to the alert.
    public var actions: [AlertAction] {
        controller.alertActions
    }
    
    /// The contentView of the alert.
    public var contentView: AlertContentViewable? {
        controller.contentView
    }
    
    /// The preferred action for the user to take from an alert.
    public var preferredAction: UIAlertAction? {
        controller.preferredAction
    }
    
    /// Indicates the severity of the alert.
    @available(iOS 16.0, *)
    public var severity: UIAlertControllerSeverity {
        controller.severity
    }
    
    /// The popover that in alerts
    public var popover: ActionSheetPopover {
        _popover
    }
    
    public init(title: String? = nil, message: String? = nil, tintColor: UIColor? = nil) {
        self.title(title)
        self.message(message)
        self.tintColor(tintColor)
    }
    
    public init(title: String, attributedMessage: NSAttributedString? = nil, tintColor: UIColor? = nil) {
        self.title(title)
        self.message(attributedMessage)
        self.tintColor(tintColor)
    }
    
    public init(attributedTitle: NSAttributedString, message: String? = nil, tintColor: UIColor? = nil) {
        self.title(attributedTitle)
        self.message(message)
        self.tintColor(tintColor)
    }
    
    public init(attributedTitle: NSAttributedString, attributedMessage: NSAttributedString, tintColor: UIColor? = nil) {
        self.title(attributedTitle)
        self.message(attributedMessage)
        self.tintColor(tintColor)
    }
    
    public init(attributedTitle: NSAttributedString? = nil, attributedMessage: NSAttributedString, tintColor: UIColor? = nil) {
        self.title(attributedTitle)
        self.message(attributedMessage)
        self.tintColor(tintColor)
    }
}

// MARK: - Setter

extension ActionSheet {
    
    @discardableResult
    public func title(_ value: String?) -> Self {
        self.controller.attributedTitle = nil
        self.controller.title = value
        return self
    }
    
    @discardableResult
    public func title(_ value: NSAttributedString?) -> Self {
        self.controller.title = nil
        self.controller.attributedTitle = value
        return self
    }
    
    @discardableResult
    public func message(_ value: String?) -> Self {
        self.controller.attributedMessage = nil
        self.controller.message = value
        return self
    }
    
    @discardableResult
    public func message(_ value: NSAttributedString?) -> Self {
        self.controller.message = nil
        self.controller.attributedMessage = value
        return self
    }
    
    @discardableResult
    public func tintColor(_ value: UIColor?) -> Self {
        self.controller.tintColor = value
        return self
    }
    
    @discardableResult
    public func preferredAction(_ value: UIAlertAction?) -> Self {
        self.controller.preferredAction = value
        return self
    }
    
    @available(iOS 16.0, *)
    @discardableResult
    public func severity(_ value: UIAlertControllerSeverity) -> Self {
        self.controller.severity = value
        return self
    }
    
    @discardableResult
    public func addAction(_ title: String,
                          style: UIAlertAction.Style = .default,
                          isEnabled: Bool = true,
                          titleColor: UIColor? = nil,
                          image: UIImage? = nil,
                          handler: ((_ controller: ActionSheetController) -> Void)? = nil) -> Self {
        
        self.controller.addAction(title: title, style: style, isEnabled: isEnabled, titleColor: titleColor, image: image, handler: handler)
        return self
    }
    
    @discardableResult
    public func contentView(_ value: AlertContentViewable) -> Self {
        self.controller.contentView = value
        
        if let contentHeight = value.contentHeight {
            value.preferredContentSize = CGSize(width: UIScreen.main.bounds.width, height: contentHeight)
        }
        return self
    }
    
    @discardableResult
    public func popover(layoutMargins: UIEdgeInsets?) -> Self {
        self._popover.layoutMargins = layoutMargins
        return self
    }
    
    @discardableResult
    public func popover(backgroundColor: UIColor?) -> Self {
        self._popover.backgroundColor = backgroundColor
        return self
    }
    
    @discardableResult
    public func popover(canOverlapSourceViewRect: Bool?) -> Self {
        self._popover.canOverlapSourceViewRect = canOverlapSourceViewRect
        return self
    }
    
    @discardableResult
    public func popover(passthroughViews: [UIView]?) -> Self {
        self._popover.passthroughViews = passthroughViews
        return self
    }
    
    @discardableResult
    public func popover(delegate: UIPopoverPresentationControllerDelegate?) -> Self {
        self._popover.delegate = delegate
        return self
    }
    
    @discardableResult
    public func popover(sourceView: UIView?) -> Self {
        self._popover.sourceView = sourceView
        return self
    }
    
    @discardableResult
    public func popover(sourceRect: CGRect?) -> Self {
        self._popover.sourceRect = sourceRect
        return self
    }
    
    @discardableResult
    public func popover(barButtonItem: UIBarButtonItem?) -> Self {
        self._popover.barButtonItem = barButtonItem
        return self
    }
    
    @discardableResult
    public func popover(permittedArrowDirections: UIPopoverArrowDirection?) -> Self {
        self._popover.permittedArrowDirections = permittedArrowDirections
        return self
    }
}

extension ActionSheet {
    
    public func present(at view: UIViewController?, animated: Bool = true, completion: ((_ controller: ActionSheetController) -> Void)? = nil) {
        
        if UIDevice.current.userInterfaceIdiom == .pad, let popoverController = controller.popoverPresentationController, let presenting = view?.view {
            
            if let popoverLayoutMargins = popover.layoutMargins {
                popoverController.popoverLayoutMargins = popoverLayoutMargins
            }
            
            if let backgroundColor = popover.backgroundColor {
                popoverController.backgroundColor = backgroundColor
            }
            
            if let canOverlapSourceViewRect = popover.canOverlapSourceViewRect {
                popoverController.canOverlapSourceViewRect = canOverlapSourceViewRect
            }
            
            if let passthroughViews = popover.passthroughViews {
                popoverController.passthroughViews = passthroughViews
            }
            
            if let delegate = popover.delegate {
                popoverController.delegate = delegate
            }
            
            if let barButtonItem = popover.barButtonItem {
                popoverController.barButtonItem = barButtonItem
            }
            
            if let sourceView = popover.sourceView {
                popoverController.sourceView = sourceView
            } else {
                popoverController.sourceView = presenting
            }
            
            if let sourceRect = popover.sourceRect {
                popoverController.sourceRect = sourceRect
            } else {
                popoverController.sourceRect = CGRect(x: presenting.center.x, y: presenting.bounds.maxY, width: 0, height: 0)
            }
            
            if let permittedArrowDirections = popover.permittedArrowDirections {
                popoverController.permittedArrowDirections = permittedArrowDirections
            } else {
                popoverController.permittedArrowDirections = []
            }
        }
        
        view?.present(controller, animated: animated) {
            completion?(ActionSheetController(controller: self.controller))
        }
    }
    
    public func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        controller.dismiss(animated: animated, completion: completion)
    }
}
#endif
