#if canImport(Foundation) && canImport(UIKit)
import Foundation
import UIKit

public final class Alert {
    
    private let controller = _AlertController(title: nil, message: nil, preferredStyle: .alert)
    
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
    
    /// The textFields that added in alerts.
    public var textFields: [AlertTextField] {
        controller.textFields?.compactMap { AlertTextField(textField: $0) } ?? []
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

extension Alert {
    
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
                          handler: ((_ controller: AlertController) -> Void)? = nil) -> Self {
        
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
    public func addTextField(configuration: ((_ textField: UITextField) -> Void)? = nil,
                             textDidChange: ((_ controller: AlertController, _ textField: AlertTextField) -> Void)? = nil) -> Self {
        
        self.controller.addTextField(configuration: configuration, textDidChange: textDidChange)
        return self
    }
    
    @discardableResult
    public func addTextField(textDidChange: @escaping (_ controller: AlertController, _ textField: AlertTextField) -> Void) -> Self {
        self.controller.addTextField(configuration: nil, textDidChange: textDidChange)
        return self
    }
    
    @discardableResult
    public func textFieldDidChange(handler: @escaping(_ controller: AlertController, _ index: Int) -> Void) -> Self {
        self.controller.textFieldDidChangeHandler(handler: handler)
        return self
    }
}

extension Alert {
    
    public func present(at view: UIViewController?, animated: Bool = true, completion: ((_ controller: AlertController) -> Void)? = nil) {
        view?.present(controller, animated: animated) {
            completion?(AlertController(controller: self.controller))
        }
    }
    
    public func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        controller.dismiss(animated: animated, completion: completion)
    }
}

#endif
