//
//  GroupModel.swift
//  VKAppSwiftUI
//
//  Created by Art on 08.03.2022.
//

import Foundation

struct GroupResponse: Codable {
    let response: Results
    
    struct Results: Codable {
        let items: [GroupModel]
    }
}

struct GroupModel: Identifiable, Codable {
    let id: Int
    let name: String
    let subscribers: Int?
    let image: String?
    
    enum CodingKeys: String, CodingKey {
        case id, name
        case image = "photo_50"
        case subscribers = "members_count"
    }
}
