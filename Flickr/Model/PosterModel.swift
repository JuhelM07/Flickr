//
//  PosterModel.swift
//  Flickr
//
//  Created by Mohammad Miah on 16/10/2023.
//

import Foundation

struct PhotosInfo: Codable {
    let photosInfo: Photos
    
    enum CodingKeys: String, CodingKey {
        case photosInfo = "photos"
    }
}

struct Photos: Codable {
    let photos: [Photo]
    let pages: Int
    
    enum CodingKeys: String, CodingKey {
        case photos = "photo"
        case pages = "pages"
    }
}

struct Photo: Codable, Identifiable, Hashable {
    let id: String
    let title: String
    let owner: String
    let secret: String
    let imgURL: String
    let ownerName: String
    let tags: String
    let description: PhotoDescription
    let dateTaken: String
    let views: String
    let lastUpdate: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case owner
        case secret
        case imgURL = "url_l"
        case ownerName = "ownername"
        case tags
        case description
        case dateTaken = "datetaken"
        case views
        case lastUpdate = "lastupdate"
    }
    
}

struct PhotoDescription: Codable, Hashable {
    let _content: String
}
