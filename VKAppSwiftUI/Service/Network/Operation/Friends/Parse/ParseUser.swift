//
//  ParseUser.swift
//  VKAppSwiftUI
//
//  Created by Art on 25.03.2022.
//

import Foundation

final class ParseUser: AsyncOperation {
    private let decoder = JSONDecoder()
    private let handler: (Result<[FriendModel], Error>) -> Void
    
    init(handler: @escaping (Result<[FriendModel], Error>) -> Void) {
        self.handler = handler
    }
    
    override func main() {
        guard let getUser = dependencies.first as? RequestUser,
              let data = getUser.getData() else {
            if let user = dependencies.first as? RequestUser,
               let error = user.getError() {
                handler(.failure(error))
            }
            return
        }
        
        do {
            let friends = try decoder.decode(FriendResponse.self, from: data)
            handler(.success(friends.response.items))
        } catch {
            handler(.failure(error))
        }
    }
}
