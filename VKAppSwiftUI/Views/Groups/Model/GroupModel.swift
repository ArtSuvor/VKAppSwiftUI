//
//  GroupModel.swift
//  VKAppSwiftUI
//
//  Created by Art on 08.03.2022.
//

import Foundation

struct GroupModel: Identifiable {
    let id: String = UUID().uuidString
    let name: String
    let subscribers: Int
    let image: String
}
