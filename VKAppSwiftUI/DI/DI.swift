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
                   friendViewModel: createFriendsViewModel())
    }
    
//MARK: - Private
    private func createFriendsViewModel() -> FriendViewModel {
        FriendViewModel()
    }
}
