//
//  FriendViewModel.swift
//  VKAppSwiftUI
//
//  Created by Art on 08.03.2022.
//

import Foundation

final class FriendViewModel: ObservableObject {
    @Published private(set) var friends: [FriendModel] = []
    @Published var isErrorShow: Bool = false
    private(set) var errorMessage: String?
    
    private var operation = UserOperation()
    
    init() {
        getFriends()
    }
    
//MARK: - Private Methods
    private func getFriends() {
        operation.getFriends {[weak self] result in
            switch result {
                case let .success(friends):
                    self?.friends = friends
                case let .failure(error):
                    self?.isErrorShow = true
                    self?.errorMessage = error.localizedDescription
            }
        }
    }
}
