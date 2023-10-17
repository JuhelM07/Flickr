//
//  UserPhotosView.swift
//  Flickr
//
//  Created by Mohammad Miah on 17/10/2023.
//

import SwiftUI

struct UserPhotosView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel = ViewModel()
    var userID = String()
    var body: some View {
        List {
            ForEach(Helper.getPhotoArray(viewModel: viewModel), id: \.self) { photo in
                AsyncImage(url: URL(string: photo.imgURL)) { image in
                    image
                        .resizable()
                    
                } placeholder: {
                    Text("Loading...")
                }
                .frame(maxWidth: .infinity)
                .frame(height: 200)
                .background(Color.gray)
                
                ScrollView(.horizontal) {
                    LazyHStack {
                        ForEach(Helper.convertTagStringIntoArray(tags: photo.tags), id: \.self) { tag in
                            Text(tag)
                                .font(.system(size: 13))
                                .background(.white)
                                .cornerRadius(8)
                        }
                        
                    }
                    .padding(4)
                }
                .padding(3)
            }
            
            
        }
        .onAppear {
            viewModel.getPhotosOf(userID: userID)
        }
    }
}

struct UserPhotosView_Previews: PreviewProvider {
    static var previews: some View {
        UserPhotosView()
    }
}
