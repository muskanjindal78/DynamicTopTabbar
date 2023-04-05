import SwiftUI
import Combine

struct TabbarItem: View {
    var tabbarItemName: String
    @Binding var currentTab: Int
    var tab: Int
    let namespace: Namespace.ID
    
    var body: some View {
        Button {
            self.currentTab = tab
        } label: {
            VStack {
                Text(tabbarItemName)
                    .foregroundColor(.white)
                if currentTab == tab {
                    Color.pink
                        .frame(height: 2)
                        .matchedGeometryEffect(id: "underline", in: namespace, properties: .frame)
                } else {
                    Color.clear
                        .frame(height: 2)
                }
            }
            .animation(.spring(), value: currentTab)
        }
        .buttonStyle(.plain)
    }
}
