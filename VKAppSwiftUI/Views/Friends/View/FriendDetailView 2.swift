//
//  FriendDetailView.swift
//  VKAppSwiftUI
//
//  Created by Art on 22.03.2022.
//

import SwiftUI

struct FriendDetailView: View {
    private let layout = GridItem(.adaptive(minimum: screen.width / 2.5))
    let photos: [String]
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: [layout]) {
                ForEach(photos, id: \.self) { item in
                    NavigationLink {
                        EmptyView()
                    } label: {
                        Image(systemName: item)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .foregroundColor(.black)
                    }
                }
            }
        }
        .padding(.horizontal, 10)
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Photos")
    }
}

struct FriendDetailView_Previews: PreviewProvider {
    static var previews: some View {
        FriendDetailView(photos: ["plus", "square.and.arrow.up"])
    }
}


//ScrollView(.vertical, showsIndicators: false) {
//    LazyVGrid(columns: [layout]) {
//        ForEach(CatalogViewModel.shared.recommendProducts, id: \.id) { item in
//            NavigationLink {
//                let viewModel = ProductDetailViewModel(product: item)
//                ProductDetailView(viewModel: viewModel)
//            } label: {
//                ProductCell(product: item)
//            }
//        }
//    }
//    .padding(5)
//}
