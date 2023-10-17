//
//  ContentViewRow.swift
//  Flickr
//
//  Created by Mohammad Miah on 17/10/2023.
//

import SwiftUI

struct ContentViewRow: View {
    @StateObject var viewModel = ViewModel()
    @State var searchText = String()
    @State private var showingSheet = false
    
    var body: some View {
        List {
            ForEach(Helper.getPhotoArray(viewModel: viewModel), id: \.self) { photo in
                NavigationLink {
                    DetailPhotoView(photo: photo)
                } label: {
                    VStack() {
                        HStack {
                            Text(photo.id)
                                .font(.system(size: 9))
                            Spacer()
                            
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
                            
                        }
                        .padding(2)
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
                    }
                    .padding(3)
                }
                
                
            }
        }
        
        .onAppear {
            viewModel.getPhotos(searchText: searchText)
        }
    }
}

struct ContentViewRow_Previews: PreviewProvider {
    static var previews: some View {
        ContentViewRow()
    }
}
