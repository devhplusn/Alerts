#if canImport(UIKit)
import UIKit

class _AlertController: UIAlertController {
    
    typealias TextFieldTextDidChangeHandler = (_ controller: AlertController, _ index: Int) -> Void
    typealias TextDidChangeHandler = (_ alert: AlertController, _ text: AlertTextField) -> Void
    
    private var textChangeHandlers: [UITextField: TextDidChangeHandler] = [:]
    private var textFieldDidChangeHandler: TextFieldTextDidChangeHandler?
    
    var attributedTitle: NSAttributedString? {
        get { self.value(forKey: AlertKeyValue.attributedTitle.key) as? NSAttributedString }
        set { self.setValue(newValue, forKey: AlertKeyValue.attributedTitle.key) }
    }
    
    var attributedMessage: NSAttributedString? {
        get { self.value(forKey: AlertKeyValue.attributedMessage.key) as? NSAttributedString }
        set { self.setValue(newValue, forKey: AlertKeyValue.attributedMessage.key) }
    }
    
    var tintColor: UIColor? {
        get { self.view.tintColor }
        set { self.view.tintColor = newValue }
    }
    
    var contentView: AlertContentViewable? {
        get { self.value(forKey: AlertKeyValue.contentViewController.key) as? AlertContentViewable }
        set { self.setValue(newValue, forKey: AlertKeyValue.contentViewController.key) }
    }
    
    var alertActions: [AlertAction] {
        self.actions.compactMap { AlertAction(action: $0) }
    }
    
    var alertTextFields: [AlertTextField] {
        self.textFields?.compactMap { AlertTextField(textField: $0) } ?? []
    }
    
    func addAction<T>(title: String?, style: UIAlertAction.Style, isEnabled: Bool, titleColor: UIColor?, image: UIImage?, handler: ((Controller<T>) -> Void)?) {
        
        let action = UIAlertAction(title: title, style: style) { [weak self] action in
            handler?(Controller(controller: self))
        }
        
        action.isEnabled = isEnabled
        action.setValue(titleColor, forKey: AlertKeyValue.titleTextColor.key)
        action.setValue(image, forKey: AlertKeyValue.image.key)
        self.addAction(action)
    }
    
    func addTextField(configuration: ((_ textField: UITextField) -> Void)? = nil, textDidChange: ((_ controller: AlertController, _ textField: AlertTextField) -> Void)? = nil) {
        self.addTextField { textField in
            configuration?(textField)
            self.textChangeHandlers[textField] = textDidChange
            textField.addTarget(self, action: #selector(self.textFieldDidChange), for: .editingChanged)
        }
    }
    
    func textFieldDidChangeHandler(handler: ((_ controller: AlertController, _ index: Int) -> Void)?) {
        self.textFieldDidChangeHandler = handler
    }
    
    @objc private func textFieldDidChange(_ sender: UITextField) {
        if let index = self.textFields?.firstIndex(of: sender) {
            textFieldDidChangeHandler?(Controller(controller: self), index)
        }
        guard let handler = self.textChangeHandlers[sender] else { return }
        handler(Controller(controller: self), AlertTextField(textField: sender))
    }
}
#endif


