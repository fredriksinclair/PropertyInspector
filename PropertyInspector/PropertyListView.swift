import SwiftUI

struct PropertyListView: View {
    @State private var properties: [Property] = [] // List of properties
    @State private var showingAddProperty = false // Controls Add Property sheet

    var body: some View {
        NavigationView {
            List {
                ForEach(properties.indices, id: \.self) { index in
                    NavigationLink(destination: PropertyDetailView(property: $properties[index])) {
                        VStack(alignment: .leading) {
                            Text(properties[index].name)
                                .font(.headline)
                            Text(properties[index].address)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                    }
                }
                .onDelete(perform: deleteProperty)
            }
            .navigationTitle("Properties")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingAddProperty = true
                    }) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .sheet(isPresented: $showingAddProperty) {
            AddPropertyView(properties: $properties)
        }
    }

    private func deleteProperty(at offsets: IndexSet) {
        properties.remove(atOffsets: offsets)
    }
}
