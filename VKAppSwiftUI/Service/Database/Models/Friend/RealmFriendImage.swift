//
//  RealmFriendImage.swift
//  VKAppSwiftUI
//
//  Created by Art on 25.03.2022.
//

import Foundation
import RealmSwift

final class RealmFriendImage: Object, Identifiable {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var image: String?
    @Persisted var ownerId: Int
    
    convenience init(_ model: FriendImageModel) {
        self.init()
        self.id = model.id
        self.image = model.image.last?.url
        self.ownerId = model.ownerId
    }
}
