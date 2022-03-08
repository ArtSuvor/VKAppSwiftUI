//
//  FriendView.swift
//  VKAppSwiftUI
//
//  Created by Art on 07.03.2022.
//

import SwiftUI

struct FriendView: View {
    let viewModel: FriendViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(0..<viewModel.getCountFriends(), id: \.description) { item in
                        FriensCell(friend: viewModel.getFriend(index: item))
                            .listRowInsets(EdgeInsets())
                            .padding(5)
                    }
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
        FriendView(viewModel: FriendViewModel())
    }
}
