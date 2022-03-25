//
//  DataOperations.swift
//  VKAppSwiftUI
//
//  Created by Art on 25.03.2022.
//

import Foundation

final class UserOperation {
    private let operationQueue = OperationQueue()
    private let mainQueue = OperationQueue.main
    
// MARK: GetFriends
    func getFriends(handler: @escaping (Result<[FriendModel], Error>) -> Void) {
        let getUser = RequestUser()
        let parseUser = ParseUser {[weak self] result in
            switch result {
                case let .success(data):
                    self?.mainQueue.addOperation {
                        handler(.success(data))
                    }
                case let .failure(error):
                    self?.mainQueue.addOperation {
                        handler(.failure(error))
                    }
            }
        }
        let operations = [getUser, parseUser]
        parseUser.addDependency(getUser)
        operationQueue.addOperations(operations, waitUntilFinished: false)
    }
    
// MARK: GetUserImage
    func getUserImages(userId: Int, handler: @escaping (Result<[FriendImageModel], Error>) -> Void) {
        let getImage = RequestUserImage(userId: userId)
        let parseImage = ParseUserImage { [weak self] result in
            switch result {
                case let .success(images):
                    self?.mainQueue.addOperation {
                        handler(.success(images))
                    }
                case let .failure(error):
                    self?.mainQueue.addOperation {
                        handler(.failure(error))
                    }
            }
        }
        let operations = [getImage, parseImage]
        parseImage.addDependency(getImage)
        operationQueue.addOperations(operations, waitUntilFinished: false)
    }
}
