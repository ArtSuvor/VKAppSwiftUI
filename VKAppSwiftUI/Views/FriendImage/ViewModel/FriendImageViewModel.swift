//
//  FriendImageViewModel.swift
//  VKAppSwiftUI
//
//  Created by Art on 25.03.2022.
//

import Foundation

final class FriendImageViewModel: ObservableObject {
    
    @Published private(set) var images: [FriendImageModel] = []
    @Published var isErrorShow: Bool = false
    
    private(set) var errorMessaga: String?
    private var operation = UserOperation()
    
    func getImages(userId: Int) {
        operation.getUserImages(userId: userId) {[weak self] result in
            switch result {
                case let .success(images):
                    self?.images = images
                case let .failure(error):
                    self?.isErrorShow = true
                    self?.errorMessaga = error.localizedDescription
            }
        }
    }
}
