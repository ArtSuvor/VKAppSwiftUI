//
//  FriendModel.swift
//  VKAppSwiftUI
//
//  Created by Art on 08.03.2022.
//

import Foundation

struct FriendResponse: Codable {
    let response: Results
    
    struct Results: Codable {
        let items: [FriendModel]
    }
}

struct FriendModel: Identifiable, Codable {
    let id: Int
    let firstName: String
    let lastName: String
    let online: Int
    let image: String?
    
    var isOnline: Bool {
        online == 1 ? true : false
    }
   
    enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case image = "photo_50"
        case online
    }
}
