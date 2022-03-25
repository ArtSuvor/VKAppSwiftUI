//
//  FriendView.swift
//  VKAppSwiftUI
//
//  Created by Art on 07.03.2022.
//

import SwiftUI

struct FriendsView: View {
    @ObservedObject var viewModel: FriendViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                List(viewModel.friends) { item in
                    NavigationLink {
                        LazyView(FriendDetailView(viewModel: FriendImageViewModel(),
                                                  friend: item))
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
        .alert("Error", isPresented: $viewModel.isErrorShow) {
            EmptyView()
        } message: {
            Text(viewModel.errorMessage ?? "")
        }

    }
}

struct FriendView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView(viewModel: FriendViewModel())
    }
}
