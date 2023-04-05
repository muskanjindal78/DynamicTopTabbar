import SwiftUI

struct TabbarView: View {
    @Binding var currentTab: Int
    @Namespace var namespace
    let tabbarOptions: [(Int, String)]
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 50)
            HStack {
                Text("Assignment")
                    .foregroundColor(Color.white)
                    .padding(.bottom, 15)
                    .padding(.leading, 15)
                Spacer()
            }
            ScrollViewReader { scrollView in
                ScrollView(.horizontal, showsIndicators: false) {
                    Spacer()
                    LazyHStack(spacing: 10) {
                        ForEach(tabbarOptions, id: \.0, content: { id, title in
                            TabbarItem(tabbarItemName: title, currentTab: $currentTab, tab: id, namespace: namespace.self)
                                .id(id)
                        })
                    }
                    .onChange(of: currentTab) { _ in
                        withAnimation {
                            scrollView.scrollTo(currentTab)
                        }
                    }
                }
                .frame(height: 43)
            }
        }
        .background(Color.indigo)
        .edgesIgnoringSafeArea(.all)
    }
}
