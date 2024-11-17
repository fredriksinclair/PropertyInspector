import SwiftUI

struct InspectionListView: View {
    @Binding var property: Property
    @State private var showAddInspectionView = false

    var body: some View {
        List {
            ForEach($property.inspections) { $inspection in
                NavigationLink(destination: EditInspectionView(inspection: $inspection, property: $property)) {
                    VStack(alignment: .leading) {
                        Text("Date: \(inspection.date, style: .date)")
                        Text("Inspector: \(inspection.inspectorName)")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            .onDelete(perform: deleteInspection)
        }
        .navigationTitle("Inspections")
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showAddInspectionView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }
        .sheet(isPresented: $showAddInspectionView) {
            AddInspectionView(property: $property) {
                showAddInspectionView = false
            }
        }
    }

    private func deleteInspection(at offsets: IndexSet) {
        property.inspections.remove(atOffsets: offsets)
    }
}
