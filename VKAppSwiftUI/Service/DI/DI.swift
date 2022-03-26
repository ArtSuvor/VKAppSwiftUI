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
                   groupViewModel: createGroupsViewModel(),
                   friendImageViewModel: createFriendImageViewModel())
    }
    
    func createAuthView() -> VKLoginWebView {
        VKLoginWebView()
    }
    
//MARK: - Private
    private func createFriendImageViewModel() -> FriendImageViewModel {
        FriendImageViewModel(database: createDatabase(), operation: createUserOperation())
    }
    
    private func createFriendsViewModel() -> FriendViewModel {
        FriendViewModel(database: createDatabase(), operation: createUserOperation())
    }
    
    private func createGroupsViewModel() -> GroupViewModel {
        GroupViewModel()
    }
    
    private func createDatabase() -> DatabaseService {
        DatabaseServiceImpl()
    }
    
    private func createUserOperation() -> UserOperation {
        UserOperation(database: createDatabase())
    }
}
