import Foundation

class TabbarViewModel: ObservableObject {
    @Published var albumList: [AlbumsModel]?
    
    func getTabbarList() {
        guard let url = URL(string: "\(Constants.BaseURL)\(Constants.albumsURL)") else {
            fatalError("Missing URL")
        }
        
        let urlRequest = URLRequest(url: url)
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }
            
            guard let response = response as? HTTPURLResponse else { return }
            
            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedJSON = try JSONDecoder().decode([AlbumsModel].self, from: data)
                        self.albumList = decodedJSON
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        dataTask.resume()
    }
}
