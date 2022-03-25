//
//  FriendViewModel.swift
//  VKAppSwiftUI
//
//  Created by Art on 08.03.2022.
//

import Foundation

final class FriendViewModel {
    private var friends: [FriendModel] = []
    
    init() {
        createFriends()
    }
    
//MARK: - Methods
    func getFriend(index: Int) -> FriendModel {
        friends[index]
    }
    
    func getFriends() -> [FriendModel] {
        friends
    }
    
//MARK: - Private Methods
    private func createFriends() {
        let friend = FriendModel(name: "afdgsdfg", isOnline: true, avatarImage: "plus", photos: ["pencil", "pencil.circle.fill", "trash", "trash.fill"])
        let friendTwo = FriendModel(name: "dsfrd", isOnline: false, avatarImage: "plus", photos: [""])
        let friendThree = FriendModel(name: "ggggggg", isOnline: true, avatarImage: "plus", photos: [""])
        
        friends.append(friend)
        friends.append(friendTwo)
        friends.append(friendThree)
    }
}
