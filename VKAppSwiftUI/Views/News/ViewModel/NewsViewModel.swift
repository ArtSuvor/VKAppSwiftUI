//
//  NewsViewModel.swift
//  VKAppSwiftUI
//
//  Created by Art on 03.04.2022.
//

import Foundation

final class NewsViewModel: ObservableObject {
    
// MARK: Properties
    @Published private(set) var news: [NewsModel] = []
    @Published var isErrorShow: Bool = false
    private var errorMessage: String?
    private let operation: NewsOperation
    
    init(operation: NewsOperation) {
        self.operation = operation
    }
    
    func getNews() {
        operation.getNews {[weak self] result in
            guard let self = self else { return }
            
            switch result {
                case let .success(news):
                    self.news = news.items
                case let .failure(error):
                    self.showError(error: error)
            }
        }
    }
    
    private func showError(error: Error) {
        errorMessage = error.localizedDescription
        isErrorShow = true
    }
}
