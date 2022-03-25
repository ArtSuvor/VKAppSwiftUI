//
//  FriendViewModel.swift
//  VKAppSwiftUI
//
//  Created by Art on 08.03.2022.
//

import Foundation
import RealmSwift

final class FriendViewModel: ObservableObject {
    
// MARK: Properties
    @Published private(set) var friends: [FriendModel] = []
    @Published var isErrorShow: Bool = false
    private(set) var errorMessage: String?
    
    private let database: DatabaseService
    private let operation: UserOperation
    
// MARK: Init
    init(database: DatabaseService, operation: UserOperation) {
        self.database = database
        self.operation = operation
    }
    
//MARK: - Methods
    func getFriends() {
        friends = checkCacheFriends()
        operation.getFriends {[weak self] error in
            if let error = error {
                self?.errorMessage = error.localizedDescription
                self?.isErrorShow = true
            }
        }
    }
    
// MARK: Private methods
    private func checkCacheFriends() -> [FriendModel] {
        var friends = [FriendModel]()
        do {
            let realmFriends = try database.get(RealmFriend.self)
            friends = createFriendsModel(model: realmFriends)
        } catch {
            self.isErrorShow = true
            self.errorMessage = error.localizedDescription
        }
        return friends
    }
    
    private func createFriendsModel(model: Results<RealmFriend>) -> [FriendModel] {
        model.map { item in
            FriendModel(id: item.id,
                        firstName: item.firstName,
                        lastName: item.lastName,
                        online: item.online,
                        image: item.image)
        }
    }
}
