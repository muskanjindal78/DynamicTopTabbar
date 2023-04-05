import SwiftUI

struct MainTabbarView: View {
    @SwiftUI.State var currentTab: Int = 0
    let albumList: [AlbumsModel]
    
    var body: some View {
        VStack(spacing: 0) {
            TabbarView(currentTab: $currentTab, tabbarOptions: Array(zip(getAlbumId(), getAlbumTitles())))
            TabView(selection: $currentTab) {
                ForEach(albumList, id: \.id, content: { albumModel in
                    TabbarItemView(albumId: albumModel.id)
                })
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            .edgesIgnoringSafeArea(.all)
            
        }
    }
    
    func getAlbumTitles() -> [String] {
        var titleList: [String] = []
        for index in 0..<albumList.count {
            if let title = albumList[index].title, let userId = albumList[index].userId {
                titleList.append("\(title) \(userId)")
            }
        }
        return titleList
    }
    func getAlbumId() -> [Int] {
        var idList: [Int] = []
        for index in 0..<albumList.count {
            idList.append(albumList[index].id)
        }
        return idList
    }
}
