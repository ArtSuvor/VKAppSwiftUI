//
//  DataOperations.swift
//  VKAppSwiftUI
//
//  Created by Art on 25.03.2022.
//

import Foundation
import RealmSwift

final class UserOperation {
    private let operationQueue = OperationQueue()
    private let mainQueue = OperationQueue.main
    private let database: DatabaseService
    
    init(database: DatabaseService) {
        self.database = database
    }
    
// MARK: GetFriends
    func getFriends(handler: @escaping (Result<Results<RealmFriend>, Error>) -> Void) {
        let getUser = RequestUser()
        let parseUser = ParseUser {[weak self] result in
            guard let self = self else { return }
            switch result {
                case let .success(data):
                    self.mainQueue.addOperation {
                        do {
                            let realmFriend = data.map { RealmFriend($0)}
                            _ = try self.database.save(realmFriend)
                            
                            let friends = try self.database.get(RealmFriend.self).sorted(byKeyPath: "firstName")
                            handler(.success(friends))
                        } catch let error {
                            handler(.failure(error))
                        }
                    }
                case let .failure(error):
                    self.mainQueue.addOperation {
                        handler(.failure(error))
                    }
            }
        }
        let operations = [getUser, parseUser]
        parseUser.addDependency(getUser)
        operationQueue.addOperations(operations, waitUntilFinished: false)
    }
    
// MARK: GetUserImage
    func getUserImages(userId: Int, handler: @escaping (Result<[RealmFriendImage], Error>) -> Void) {
        let getImage = RequestUserImage(userId: userId)
        let parseImage = ParseUserImage { [weak self] result in
            guard let self = self else { return }
            switch result {
                case let .success(images):
                    self.mainQueue.addOperation {
                        do {
                            let realmImage = images.compactMap { RealmFriendImage($0)}
                            _ = try self.database.save(realmImage)
                            
                            let images = try self.database.get(RealmFriendImage.self).filter("ownerId == %@", userId)
                            handler(.success(Array(images)))
                        } catch {
                            handler(.failure(error))
                        }
                    }
                case let .failure(error):
                    self.mainQueue.addOperation {
                        handler(.failure(error))
                    }
            }
        }
        let operations = [getImage, parseImage]
        parseImage.addDependency(getImage)
        operationQueue.addOperations(operations, waitUntilFinished: false)
    }
}
