import SwiftUI

struct PhotoGridView: View {
    let images: [UIImage]
    var onTap: (UIImage) -> Void

    private let columns = [GridItem(.adaptive(minimum: 100))]

    var body: some View {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(images.indices, id: \.self) { index in
                Image(uiImage: images[index])
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .clipped()
                    .onTapGesture {
                        onTap(images[index])
                    }
            }
        }
    }
}
