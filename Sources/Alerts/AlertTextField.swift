#if canImport(Foundation) && canImport(UIKit)
import Foundation
import UIKit

@dynamicMemberLookup
public final class AlertTextField {
    
    private let textField: UITextField
    
    init(textField: UITextField) {
        self.textField = textField
    }
    
    public subscript<Value>(dynamicMember keyPath: ReferenceWritableKeyPath<UITextField, Value>) -> (Value) {
        get { textField[keyPath: keyPath] }
        set { textField[keyPath: keyPath] = newValue }
    }
    
    public subscript<Value>(dynamicMember keyPath: KeyPath<UITextField, Value>) -> (Value) {
        textField[keyPath: keyPath]
    }
}
#endif

