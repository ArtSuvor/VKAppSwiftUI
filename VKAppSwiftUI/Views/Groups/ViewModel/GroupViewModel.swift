//
//  GroupViewModel.swift
//  VKAppSwiftUI
//
//  Created by Art on 08.03.2022.
//

import SwiftUI
import RealmSwift

final class GroupViewModel: ObservableObject {
    
// MARK: Properties
    @Published private(set) var groups: [GroupModel] = []
    @Published var isErrorShow: Bool = false
    @Published var searchText: String = "" {
        didSet {
            if searchText == "" {
                getGroups()
            } else {
                searchGroups()
            }
        }
    }
    private(set) var errorMessage: String?
    
    private let database: DatabaseService
    private let operation: GroupOperation
    
// MARK: Init
    init(database: DatabaseService, operation: GroupOperation) {
        self.database = database
        self.operation = operation
    }
    
//MARK: - Methods
    func getGroups() {
        checkCacheGroups()
        operation.getGroups { [weak self] result in
            guard let self = self else { return }
            switch result {
                case let .success(groups):
                    self.groups = self.createGroupsModel(model: groups)
                case let .failure(error):
                    self.showError(error: error)
            }
        }
    }

//MARK: - Private Methods
    private func searchGroups() {
        operation.searchGroups(text: searchText) { result in
            switch result {
                case let .success(groups):
                    self.groups = groups
                case let .failure(error):
                    self.showError(error: error)
            }
        }
    }
    
    private func checkCacheGroups() {
        do {
            let realmGroups = try database.get(RealmGroup.self).sorted(byKeyPath: "name")
            groups = createGroupsModel(model: realmGroups)
        } catch {
            self.showError(error: error)
        }
    }
    
    private func createGroupsModel(model: Results<RealmGroup>) -> [GroupModel] {
        model.map { item in
            GroupModel(id: item.id,
                       name: item.name,
                       subscribers: item.subscribers,
                       image: item.image)
        }
    }
    
    private func showError(error: Error) {
        errorMessage = error.localizedDescription
        isErrorShow = true
    }
}
