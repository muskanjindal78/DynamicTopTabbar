import SwiftUI

struct ImageWIthTitleId: View {
    let photoItem: PhotosModel
    var body: some View {
        VStack {
            ImageView(withURL: photoItem.url ?? "")
            VStack {
                if let name = photoItem.title {
                    Text("\(name)")
                        .foregroundColor(Color.black)
                        .padding(.bottom, 5)
                }
                if let id = photoItem.id {
                    Text("\(id)")
                        .foregroundColor(Color.black)
                        .padding(.bottom, 10)
                }
                Spacer()
            }
        }
        .padding(.horizontal, 10)
    }
}
