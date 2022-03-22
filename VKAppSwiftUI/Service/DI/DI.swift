//
//  DI.swift
//  VKAppSwiftUI
//
//  Created by Art on 08.03.2022.
//

import SwiftUI

final class DI {
    func createTabBar() -> some View {
        TabBarView(selected: .news,
                   friendViewModel: createFriendsViewModel(),
                   groupViewModel: createGroupsViewModel())
    }
    
//MARK: - Private
    private func createFriendsViewModel() -> FriendViewModel {
        FriendViewModel()
    }
    
    private func createGroupsViewModel() -> GroupViewModel {
        GroupViewModel()
    }
}
