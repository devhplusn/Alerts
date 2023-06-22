#if canImport(Foundation) && canImport(UIKit)
import Foundation
import UIKit

public typealias AlertController = Controller<Alert>
public typealias ActionSheetController = Controller<ActionSheet>

public class Controller<Target> {
    
    private let controller: _AlertController
    
    init(controller: _AlertController!) {
        self.controller = controller
    }
    
    /// The title of the alert or action sheet.
    public var title: String? {
        controller.title
    }
    
    /// The message of the alert or action sheet.
    public var message: String? {
        controller.message
    }
    
    /// The style of the alert controller.
    public var preferredStyle: UIAlertController.Style {
        controller.preferredStyle
    }
    
    /// The attributed title of the alert or action sheet.
    public var attributedTitle: NSAttributedString? {
        controller.attributedTitle
    }
    
    /// The attributed message of the alert or action sheet.
    public var attributedMessage: NSAttributedString? {
        controller.attributedMessage
    }
    
    /// The view tintColor of the alert or action sheet.
    public var tintColor: UIColor? {
        controller.tintColor
    }
    
    /// The actions that the user can take in response to the alert.
    public var actions: [AlertAction] {
        controller.alertActions
    }
    
    /// The view tintColor of the alert.
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
    
    public func dismiss(animated: Bool = true, completion: (() -> Void)? = nil) {
        controller.dismiss(animated: animated, completion: completion)
    }
}

extension AlertController {
    
    public var textFields: [AlertTextField] {
        controller.textFields?.compactMap { AlertTextField(textField: $0) } ?? []
    }
}

#endif


