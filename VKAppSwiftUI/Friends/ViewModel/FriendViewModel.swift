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
    
    func getCountFriends() -> Int {
        friends.count
    }
    
//MARK: - Private Methods
    private func createFriends() {
        let friend = FriendModel(name: "afdgsdfg", isOnline: true, image: "plus")
        let friendTwo = FriendModel(name: "dsfrd", isOnline: false, image: "plus")
        let friendThree = FriendModel(name: "ggggggg", isOnline: true, image: "plus")
        
        friends.append(friend)
        friends.append(friendTwo)
        friends.append(friendThree)
    }
}
