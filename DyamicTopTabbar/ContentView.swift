import SwiftUI

struct ContentView: View {
    @ObservedObject var tabbarViewModel = TabbarViewModel()
    var body: some View {
        VStack {
            if let albumList = tabbarViewModel.albumList {
                MainTabbarView(albumList: albumList)
            } else {
                Text("Data is not available! Try again Later")
                    .foregroundColor(.red)
            }
        }
        .onAppear {
            tabbarViewModel.getTabbarList()
        }
    }
}
