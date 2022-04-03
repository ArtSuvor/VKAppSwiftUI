//
//  ParseNews.swift
//  VKAppSwiftUI
//
//  Created by Art on 03.04.2022.
//

import Foundation

final class ParseNews: AsyncOperation {
    private let decoder = JSONDecoder()
    private let handler: (Result<NewsResponse.ResponseResult, Error>) -> Void
    
    init(handler: @escaping (Result<NewsResponse.ResponseResult, Error>) -> Void) {
        self.handler = handler
    }
    
    override func main() {
        guard let news = dependencies.first as? RequestNews,
              let data = news.getData() else {
            if let news = dependencies.first as? RequestNews,
               let error = news.getError() {
                handler(.failure(error))
            }
            return
        }
        
        do {
            let news = try decoder.decode(NewsResponse.self, from: data)
            handler(.success(news.response))
        } catch {
            handler(.failure(error))
        }
    }
}
