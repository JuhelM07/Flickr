//
//  DetailPhotoView.swift
//  Flickr
//
//  Created by Mohammad Miah on 17/10/2023.
//

import SwiftUI

struct DetailPhotoView: View {
    @State var photo: Photo
    @State private var showingSheet = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Button {
                showingSheet.toggle()
            } label: {
                HStack(spacing: 2) {
                    Image(systemName: "person.circle")
                    Text(photo.ownerName)
                        .font(.system(size: 15))
                }
            }
            .sheet(isPresented: $showingSheet) {
                UserPhotosView(userID: photo.owner)
            }
            
            HStack {
                Text(photo.id)
                    .font(.system(size: 9))
                Spacer()
                
                Text("Date taken: \(photo.dateTaken)")
                    .font(.system(size: 9))
            }
            .padding(2)
            AsyncImage(url: URL(string: photo.imgURL)) { image in
                image
                    .resizable()
                
            } placeholder: {
                Text("Loading...")
            }
            .frame(maxWidth: .infinity)
            .frame(height: 300)
            .background(Color.gray)
            
            HStack(spacing: 0) {
                Spacer()
                Image(systemName: "eye")
                Text(photo.views)
                    .font(.system(size: 13))
            }
            
            
            Text(photo.description._content)
        }
        .navigationTitle(photo.title)
        .padding(4)
    }
}


//struct DetailPhotoView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailPhotoView(photo: photo)
//    }
//}
