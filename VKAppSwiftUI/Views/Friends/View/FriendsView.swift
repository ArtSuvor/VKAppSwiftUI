//
//  FriendView.swift
//  VKAppSwiftUI
//
//  Created by Art on 07.03.2022.
//

import SwiftUI

struct FriendsView: View {
    @ObservedObject var viewModel: FriendViewModel
    private let friendImageViewModel: FriendImageViewModel
    
    init(viewModel: FriendViewModel,
         friendImageViewModel: FriendImageViewModel) {
        self.viewModel = viewModel
        self.friendImageViewModel = friendImageViewModel
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                List(viewModel.searchFriends.isEmpty
                     ? viewModel.friends
                     : viewModel.searchFriends) { item in
                    NavigationLink {
                        LazyView(FriendDetailView(viewModel: friendImageViewModel,
                                                  friend: item))
                    } label: {
                        FriensCell(friend: item)
                    }
                    .listRowInsets(EdgeInsets())
                    .padding(3)
                    .listRowSeparator(.hidden)
                    .listRowBackground(Color.clear)
                }
                .listStyle(.inset)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationTitle("Friends")
            .searchable(text: $viewModel.searchText)
        }
        .onAppear {
            viewModel.getFriends()
        }
        .alert("Error", isPresented: $viewModel.isErrorShow) {
            EmptyView()
        } message: {
            Text(viewModel.errorMessage ?? "")
        }

    }
}
