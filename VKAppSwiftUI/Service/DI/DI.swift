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
                   friendImageViewModel: createFriendImageViewModel(),
                   newsViewModel: createNewsViewModel())
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
        GroupViewModel(database: createDatabase(), operation: createGroupOperation())
    }
    
    private func createDatabase() -> DatabaseService {
        DatabaseServiceImpl()
    }
    
    private func createUserOperation() -> UserOperation {
        UserOperation(database: createDatabase())
    }
    
    private func createGroupOperation() -> GroupOperation {
        GroupOperation(database: createDatabase())
    }
    
    private func createNewsViewModel() -> NewsViewModel {
        NewsViewModel(operation: createNewsOperation())
    }
    
    private func createNewsOperation() -> NewsOperation {
        NewsOperation()
    }
}
