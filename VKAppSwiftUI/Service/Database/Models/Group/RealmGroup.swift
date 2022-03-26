//
//  RealmGroup.swift
//  VKAppSwiftUI
//
//  Created by Art on 26.03.2022.
//

import Foundation
import RealmSwift

final class RealmGroup: Object {
    @Persisted(primaryKey: true) var id: Int
    @Persisted var name: String
    @Persisted var image: String?
    @Persisted var subscribers: Int?
    
    convenience init(_ model: GroupModel) {
        self.init()
        self.id = model.id
        self.name = model.name
        self.image = model.image
        self.subscribers = model.subscribers
    }
}
