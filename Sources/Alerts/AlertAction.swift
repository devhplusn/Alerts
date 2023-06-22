#if canImport(Foundation) && canImport(UIKit)
import Foundation
import UIKit

@dynamicMemberLookup
public class AlertAction {
    
    private let action: UIAlertAction
    
    public var titleColor: UIColor? {
        get { action.value(forKey: AlertKeyValue.titleTextColor.key) as? UIColor }
        set { action.setValue(newValue, forKey: AlertKeyValue.titleTextColor.key) }
    }
    
    public var image: UIImage? {
        action.value(forKey: AlertKeyValue.image.key) as? UIImage
    }
    
    init(action: UIAlertAction) {
        self.action = action
    }
    
    public subscript<Value>(dynamicMember keyPath: ReferenceWritableKeyPath<UIAlertAction, Value>) -> (Value) {
        get { action[keyPath: keyPath] }
        set { action[keyPath: keyPath] = newValue }
    }
    
    public subscript<Value>(dynamicMember keyPath: KeyPath<UIAlertAction, Value>) -> (Value) {
        action[keyPath: keyPath]
    }
}
#endif
