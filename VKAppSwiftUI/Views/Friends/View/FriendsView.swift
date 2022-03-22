//
//  FriendView.swift
//  VKAppSwiftUI
//
//  Created by Art on 07.03.2022.
//

import SwiftUI

struct FriendsView: View {
    let viewModel: FriendViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                List(viewModel.getFriends()) { item in
                    NavigationLink {
                        LazyView(FriendDetailView(photos: item.photos))
                    } label: {
                        FriensCell(friend: item)
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                }
                .listStyle(.inset)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Friends")
        }
    }
}

struct FriendView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView(viewModel: FriendViewModel())
    }
}
