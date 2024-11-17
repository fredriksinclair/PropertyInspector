import SwiftUI

struct AddInspectionView: View {
    @Binding var property: Property
    var onSave: (() -> Void)?

    @State private var date = Date()
    @State private var inspectorName = ""
    @State private var generalNotes = ""
    @State private var photos: [UIImage] = [] // Simple array of images
    @State private var showingPhotoPicker = false

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Inspection Details")) {
                    DatePicker("Date", selection: $date, displayedComponents: .date)
                    TextField("Inspector Name", text: $inspectorName)
                    TextField("General Notes", text: $generalNotes)
                }

                Section(header: Text("Photos")) {
                    if photos.isEmpty {
                        Text("No photos added yet.")
                            .foregroundColor(.gray)
                    } else {
                        PhotoGridView(images: photos, onTap: { _ in
                            // Photo tap action (optional)
                        })
                    }
                    Button("Add Photos") {
                        showingPhotoPicker = true
                    }
                }
            }
            .navigationTitle("Add Inspection")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        onSave?()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        saveInspection()
                    }
                    .disabled(inspectorName.isEmpty) // Save disabled if inspector name is empty
                }
            }
            .sheet(isPresented: $showingPhotoPicker) {
                PhotoPicker(images: $photos, onImagesPicked: { pickedImages in
                    photos.append(contentsOf: pickedImages)
                })
            }
        }
    }

    private func saveInspection() {
        let newInspection = Inspection(
            id: UUID(),
            date: date,
            inspectorName: inspectorName,
            generalNotes: generalNotes,
            photos: photos
        )
        property.inspections.append(newInspection)
        onSave?()
    }
}
