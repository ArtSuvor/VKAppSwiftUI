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
    private let database: DatabaseService
    
    init(database: DatabaseService) {
        self.database = database
    }
    
// MARK: GetFriends
    func getFriends(handler: @escaping (Error?) -> Void) {
        let getUser = RequestUser()
        let parseUser = ParseUser {[weak self] result in
            switch result {
                case let .success(data):
                    self?.mainQueue.addOperation {
                        do {
                            let realmFriend = data.map { RealmFriend($0)}
                            _ = try self?.database.save(realmFriend)
                        } catch let error {
                            handler(error)
                        }
                    }
                case let .failure(error):
                    self?.mainQueue.addOperation {
                        handler(error)
                    }
            }
        }
        let operations = [getUser, parseUser]
        parseUser.addDependency(getUser)
        operationQueue.addOperations(operations, waitUntilFinished: false)
    }
    
// MARK: GetUserImage
    func getUserImages(userId: Int, handler: @escaping (Error?) -> Void) {
        let getImage = RequestUserImage(userId: userId)
        let parseImage = ParseUserImage { [weak self] result in
            switch result {
                case let .success(images):
                    self?.mainQueue.addOperation {
                        do {
                            let realmImage = images.compactMap { RealmFriendImage($0)}
                            _ = try self?.database.save(realmImage)
                        } catch {
                            handler(error)
                        }
                    }
                case let .failure(error):
                    self?.mainQueue.addOperation {
                        handler(error)
                    }
            }
        }
        let operations = [getImage, parseImage]
        parseImage.addDependency(getImage)
        operationQueue.addOperations(operations, waitUntilFinished: false)
    }
}
