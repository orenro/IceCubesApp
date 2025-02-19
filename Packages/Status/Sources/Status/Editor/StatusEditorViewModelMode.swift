import Models
import SwiftUI
import UIKit

public extension StatusEditorViewModel {
  enum Mode {
    case replyTo(status: Status)
    case new(visibility: Models.Visibility)
    case edit(status: Status)
    case quote(status: Status)
    case mention(account: Account, visibility: Models.Visibility)
    case shareExtension(items: [NSItemProvider])

    var isInShareExtension: Bool {
      switch self {
      case .shareExtension:
        return true
      default:
        return false
      }
    }

    var isEditing: Bool {
      switch self {
      case .edit:
        return true
      default:
        return false
      }
    }

    var replyToStatus: Status? {
      switch self {
      case let .replyTo(status):
        return status
      default:
        return nil
      }
    }
    
    var title: LocalizedStringKey {
      switch self {
      case .new, .mention, .shareExtension:
        return "status.editor.mode.new"
      case .edit:
        return "status.editor.mode.edit"
      case let .replyTo(status):
        return "status.editor.mode.reply-\(status.reblog?.account.displayNameWithoutEmojis ?? status.account.displayNameWithoutEmojis)"
      case let .quote(status):
        return "status.editor.mode.quote-\(status.reblog?.account.displayNameWithoutEmojis ?? status.account.displayNameWithoutEmojis)"
      }
    }
  }
}
