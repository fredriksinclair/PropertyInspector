import SwiftUI

struct PropertyDetailView: View {
    @Binding var property: Property
    @State private var showingInspections = false // Control navigation to inspections

    var body: some View {
        Form {
            Section(header: Text("Property Details")) {
                Text("Name: \(property.name)")
                Text("Address: \(property.address)")
            }

            Section(header: Text("Actions")) {
                Button("View Inspections") {
                    showingInspections = true
                }
            }
        }
        .navigationTitle("Property Details")
        .sheet(isPresented: $showingInspections) {
            NavigationView {
                InspectionListView(property: $property)
            }
        }
    }
}
