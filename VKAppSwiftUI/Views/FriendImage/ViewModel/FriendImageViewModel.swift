//
//  FriendImageViewModel.swift
//  VKAppSwiftUI
//
//  Created by Art on 25.03.2022.
//

import Foundation
import RealmSwift

final class FriendImageViewModel: ObservableObject {
    
// MARK: Properties
    @Published private(set) var images: [RealmFriendImage] = []
    @Published var isErrorShow: Bool = false
    private(set) var errorMessaga: String?
    
    private let database: DatabaseService
    private let operation: UserOperation
    
// MARK: Init
    init(database: DatabaseService, operation: UserOperation) {
        self.database = database
        self.operation = operation
    }
    
// MARK: Methods
    func getImages(userId: Int) {
        images = checkCacheFriendImage(userId: userId)
        operation.getUserImages(userId: userId) {[weak self] error in
            if let error = error {
                self?.isErrorShow = true
                self?.errorMessaga = error.localizedDescription
            }
        }
    }
    
// MARK: Private methods
    private func checkCacheFriendImage(userId: Int) -> [RealmFriendImage] {
        do {
            return Array( try database.get(RealmFriendImage.self).filter("ownerId == %@", userId))
        } catch {
            self.errorMessaga = error.localizedDescription
            self.isErrorShow = true
            return []
        }
    }
}
