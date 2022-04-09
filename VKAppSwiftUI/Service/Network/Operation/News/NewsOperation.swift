//
//  NewsOperations.swift
//  VKAppSwiftUI
//
//  Created by Art on 03.04.2022.
//

import Foundation

final class NewsOperation {
    private let operationQueue = OperationQueue()
    private let mainQueue = OperationQueue.main
    
    func getNews(handler: @escaping (Result<NewsResponse.ResponseResult, Error>) -> Void) {
        let getNews = RequestNews()
        let parseNews = ParseNews {[weak self] result in
            self?.mainQueue.addOperation {
                handler(result)
            }
        }
        let operations = [getNews, parseNews]
        parseNews.addDependency(getNews)
        operationQueue.addOperations(operations, waitUntilFinished: false)
    }
}
