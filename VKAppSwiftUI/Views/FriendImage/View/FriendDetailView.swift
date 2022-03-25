//
//  FriendDetailView.swift
//  VKAppSwiftUI
//
//  Created by Art on 22.03.2022.
//

import SwiftUI
import Kingfisher

struct FriendDetailView: View {
    private let layout = GridItem(.adaptive(minimum: screen.width / 2.5))
    @ObservedObject var viewModel: FriendImageViewModel
    var friend: FriendModel
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: [layout]) {
                ForEach(viewModel.images) { item in
                    NavigationLink {
                        EmptyView()
                    } label: {
                        createImageView(image: item.image)
                            .aspectRatio(contentMode: .fit)
                            .foregroundColor(.black)
                            .cornerRadius(10)
                    }
                }
            }
        }
        .padding(.horizontal, 10)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Photos")
        .onAppear {
            viewModel.getImages(userId: friend.id)
        }
    }
    
    private func createImageView(image: String?) -> some View {
        ZStack {
            if let image = image,
               let url = URL(string: image) {
                KFImage(url)
                    .resizable()
                    .cancelOnDisappear(true)
            } else {
                Image(systemName: "person")
                    .resizable()
            }
        }
    }
}
