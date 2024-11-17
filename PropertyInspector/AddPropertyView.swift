import SwiftUI

struct AddPropertyView: View {
    @Binding var properties: [Property] // Shared property list
    @Environment(\.dismiss) var dismiss // To close the sheet

    @State private var name = ""
    @State private var address = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Property Details")) {
                    TextField("Name", text: $name)
                    TextField("Address", text: $address)
                }
            }
            .navigationTitle("Add Property")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveProperty()
                    }
                    .disabled(name.isEmpty || address.isEmpty)
                }
            }
        }
    }

    private func saveProperty() {
        let newProperty = Property(id: UUID(), name: name, address: address, inspections: [])
        properties.append(newProperty)
        dismiss()
    }
}
