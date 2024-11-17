import Foundation

struct Property: Identifiable {
    let id: UUID
    var name: String
    var address: String
    var inspections: [Inspection]
}
