import SwiftUI
import Foundation

struct Inspection: Identifiable {
    let id: UUID
    var date: Date
    var inspectorName: String
    var generalNotes: String
    var photos: [UIImage]
}
