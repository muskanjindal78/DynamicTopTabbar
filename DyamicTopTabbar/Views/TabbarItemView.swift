import SwiftUI

struct TabbarItemView: View {
    var albumId: Int
    @ObservedObject var tabbarDataViewModel = TabbarDataViewModel()
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                if let photoAlbumList = tabbarDataViewModel.photoAlbumList {
                    let rowCount = (Double(photoAlbumList.count) / Double(3)).rounded(.up)
                    ForEach(0..<Int(rowCount), id: \.self) { row in
                        VStack {
                            HStack() {
                                ForEach(0..<3, id: \.self) { column in
                                    let index = row * 3 + column
                                    if index < photoAlbumList.count {
                                        ImageWIthTitleId(photoItem: photoAlbumList[index])
                                    } else {
                                        Spacer()
                                    }
                                }
                            }
                            .frame(width: UIScreen.main.bounds.width)
                        }
                    }
                }
            }
        }
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            tabbarDataViewModel.getPhotosList(albumId)
        }
    }
}
