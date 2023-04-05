import Foundation

struct Constants {
    static let BaseURL = "https://jsonplaceholder.typicode.com/"
    static let albumsURL = "albums"
    static let photosAlbumURL: ((Int) -> String) = { albumId in
        return "photos?albumId=\(albumId)"
    }
}
