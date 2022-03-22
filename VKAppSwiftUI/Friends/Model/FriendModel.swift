//
//  FriendModel.swift
//  VKAppSwiftUI
//
//  Created by Art on 08.03.2022.
//

import Foundation

struct FriendModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let isOnline: Bool
    let avatarImage: String
    let photos: [String]
}
