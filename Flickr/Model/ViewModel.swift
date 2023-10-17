//
//  ViewModel.swift
//  Flickr
//
//  Created by Mohammad Miah on 17/10/2023.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var photoInfos: PhotosInfo?
    
    func getPhotos(searchText: String) {
        let endpoint = "\(FlickerAPI.baseURLString)?method=\(Endpoint.getPhotoSearch.rawValue)&api_key=\(FlickerAPI.apiKey)&format=\(FlickerAPI.jsonFormat)&nojsoncallback=1&page=1&tags=\(searchText)&extras=url_l,owner_name,tags,description,date_taken,views,last_update&safe_search=\(FlickerAPI.safeSearchSafe)"
        
        guard let searchURL = URL(string: endpoint) else { return }
        
        let task = URLSession.shared.dataTask(with: searchURL) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let photoInfos = try JSONDecoder().decode(PhotosInfo.self, from: data)
                DispatchQueue.main.async {
                    self?.photoInfos = photoInfos
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
        
    }
    
    func getPhotosOf(userID: String) {
        let endpoint = "\(FlickerAPI.baseURLString)?method=\(Endpoint.getPhotosOf.rawValue)&api_key=\(FlickerAPI.apiKey)&user_id=\(userID)&format=\(FlickerAPI.jsonFormat)&nojsoncallback=1&page=1&extras=url_l,owner_name,tags,description,date_taken,views,last_update&safe_search=\(FlickerAPI.safeSearchSafe)"
        
        guard let searchURL = URL(string: endpoint) else { return }
        
        let task = URLSession.shared.dataTask(with: searchURL) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let photoInfos = try JSONDecoder().decode(PhotosInfo.self, from: data)
                DispatchQueue.main.async {
                    self?.photoInfos = photoInfos
                }
            } catch {
                print(error)
            }
        }
        
        task.resume()
    }
}
