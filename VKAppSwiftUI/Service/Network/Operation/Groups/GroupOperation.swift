//
//  GroupOperation.swift
//  VKAppSwiftUI
//
//  Created by Art on 26.03.2022.
//

import Foundation
import RealmSwift

final class GroupOperation {
    private let operationQueue = OperationQueue()
    private let mainQueue = OperationQueue.main
    private let database: DatabaseService
    
    init(database: DatabaseService) {
        self.database = database
    }
    
// MARK: GetGroups
    func getGroups(handler: @escaping (Result<Results<RealmGroup>, Error>) -> Void) {
        let requestGroups = RequestGroup()
        let parseGroups = ParseGroup { [weak self] result in
            guard let self = self else { return }
            switch result {
                case let .success(data):
                    self.mainQueue.addOperation {
                        do {
                            let realmGroups = data.map { RealmGroup($0) }
                            _ = try self.database.save(realmGroups)
                            
                            let groups = try self.database.get(RealmGroup.self).sorted(byKeyPath: "name")
                            handler(.success(groups))
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
        let operations = [requestGroups, parseGroups]
        parseGroups.addDependency(requestGroups)
        operationQueue.addOperations(operations, waitUntilFinished: false)
    }
}
