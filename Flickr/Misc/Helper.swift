//
//  Helper.swift
//  Flickr
//
//  Created by Mohammad Miah on 17/10/2023.
//

import Foundation

class Helper {
    static func getPhotoArray(viewModel: ViewModel) -> [Photo] {
        guard let photoInfo = viewModel.photoInfos else { return [] }
        return photoInfo.photosInfo.photos
    }
    
    static func convertTagStringIntoArray(tags: String) -> [String] {
        let tagArray = tags.components(separatedBy: " ")
        let formattedTagArray = tagArray.map { "#\($0)" }
        return formattedTagArray
    }
}
