#if canImport(Foundation)

import Foundation

enum AlertKeyValue {
    
    case image
    case titleTextColor
    case attributedTitle
    case attributedMessage
    case contentViewController
    
    var key: String {
        switch self {
        case .image:
            return "image"
        case .titleTextColor:
            return "titleTextColor"
        case .attributedTitle:
            return "attributedTitle"
        case .attributedMessage:
            return "attributedMessage"
        case .contentViewController:
            return "contentViewController"
        }
    }
}

#endif
