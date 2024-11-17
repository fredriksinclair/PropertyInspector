import SwiftUI

struct EditInspectionView: View {
    @Binding var inspectorNote: String

    var body: some View {
        Form {
            Section(header: Text("Notes")) {
                TextField("Edit Note", text: Binding(
                    get: { inspectorNote },
                    set: { inspectorNote = $0 ?? "" } // Replace nil with empty string
                ))
            }
        }
        .navigationTitle("Edit Inspection")
    }
}
