import SwiftUI

struct ContentView: View {
    @ObservedObject var tabbarViewModel = TabbarViewModel()
    var body: some View {
        VStack {
            if let albumList = tabbarViewModel.albumList {
                MainTabbarView(albumList: albumList)
            }
        }
        .onAppear {
            tabbarViewModel.getTabbarList()
        }
    }
}
