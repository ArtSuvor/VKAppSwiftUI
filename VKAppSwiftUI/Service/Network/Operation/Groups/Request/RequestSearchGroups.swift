//
//  RequestSearchGroups.swift
//  VKAppSwiftUI
//
//  Created by Art on 26.03.2022.
//

import Foundation
import Alamofire

final class RequestSearchGroups: AsyncOperation {
    private var request: DataRequest?
    private let searchText: String
    private var data: Data?
    private var error: Error?
    
    init(searchText: String) {
        self.searchText = searchText
    }
    
    override func main() {
        request = AF.request(GroupRouter.searchGroup(name: searchText)).response(queue: DispatchQueue.global()) { [weak self] response in
            self?.data = response.data
            self?.error = response.error
            self?.state = .finished
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
