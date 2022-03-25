//
//  FriendImage.swift
//  VKAppSwiftUI
//
//  Created by Art on 25.03.2022.
//

import Foundation

struct FriendImageResponse: Codable {
    let response: Results
    
    struct Results: Codable {
        let items: [FriendImageModel]
    }
}

struct FriendImageModel: Codable, Identifiable {
    let id: Int
    let image: [Sizes]
    let ownerId: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case image = "sizes"
        case ownerId = "owner_id"
    }
    
    struct Sizes: Codable {
        let url: String
        let width: Int
        let height: Int
    }
}
