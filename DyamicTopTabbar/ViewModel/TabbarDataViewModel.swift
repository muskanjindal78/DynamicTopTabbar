import Foundation

class TabbarDataViewModel: ObservableObject {
    @Published var photoAlbumList: [PhotosModel]?
    
    func getPhotosList(_ albumId: Int) {
        guard let url = URL(string: "\(Constants.BaseURL)\(Constants.photosAlbumURL(albumId))") else {
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
                        let decodedJSON = try JSONDecoder().decode([PhotosModel].self, from: data)
                        self.photoAlbumList = decodedJSON
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }
        dataTask.resume()
    }
}
