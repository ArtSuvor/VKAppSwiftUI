//
//  ParseUserImage.swift
//  VKAppSwiftUI
//
//  Created by Art on 25.03.2022.
//

import Foundation

final class ParseUserImage: AsyncOperation {
    private let decoder = JSONDecoder()
    private let handler: (Result<[FriendImageModel], Error>) -> Void
    
    init(handler: @escaping (Result<[FriendImageModel], Error>) -> Void) {
        self.handler = handler
    }
    
    override func main() {
        guard let getImage = dependencies.first as? RequestUserImage,
              let data = getImage.getData() else {
            if let getImage = dependencies.first as? RequestUserImage,
               let error = getImage.getError() {
                handler(.failure(error))
            }
            return
        }
        
        do {
            let images = try decoder.decode(FriendImageResponse.self, from: data)
            handler(.success(images.response.items))
        } catch {
            handler(.failure(error))
        }
    }
}
