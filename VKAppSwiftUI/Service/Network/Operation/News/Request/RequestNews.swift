//
//  RequestNews.swift
//  VKAppSwiftUI
//
//  Created by Art on 03.04.2022.
//

import Foundation
import Alamofire

final class RequestNews: AsyncOperation {
    private var request: DataRequest?
    private var data: Data?
    private var error: Error?
    
    override func main() {
        request = AF.request(NewsRouter.getNews).response(queue: DispatchQueue.global()) {[weak self] response in
            guard let self = self else { return }
            
            self.data = response.data
            self.error = response.error
            self.state = .finished
        }
    }
    
    override func cancel() {
        request?.cancel()
        super.cancel()
    }
    
    func getData() -> Data? {
        data
    }
    
    func getError() -> Error? {
        error
    }
}
