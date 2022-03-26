//
//  ParseSearchGroup.swift
//  VKAppSwiftUI
//
//  Created by Art on 26.03.2022.
//

import Foundation

final class ParseSearchGroup: AsyncOperation {
    private let decoder = JSONDecoder()
    private let handler: (Result<[GroupModel], Error>) -> Void
    
    init(handler: @escaping (Result<[GroupModel], Error>) -> Void) {
        self.handler = handler
    }
    
    override func main() {
        guard let getGroup = dependencies.first as? RequestSearchGroups,
              let data = getGroup.getData() else {
            if let group = dependencies.first as? RequestSearchGroups,
               let error = group.getError() {
                handler(.failure(error))
            }
            return
        }
        
        do {
            let groups = try decoder.decode(GroupResponse.self, from: data)
            handler(.success(groups.response.items))
        } catch {
            handler(.failure(error))
        }
    }
}
