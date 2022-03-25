//
//  RealmFriend.swift
//  VKAppSwiftUI
//
//  Created by Art on 25.03.2022.
//

import Foundation
import RealmSwift

final class RealmFriend: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var firstName: String
    @Persisted var lastName: String
    @Persisted var image: String?
    @Persisted var online: Int
    
    convenience init(_ model: FriendModel) {
        self.init()
        self.id = model.id
        self.firstName = model.firstName
        self.lastName = model.lastName
        self.image = model.image
        self.online = online
    }
}
