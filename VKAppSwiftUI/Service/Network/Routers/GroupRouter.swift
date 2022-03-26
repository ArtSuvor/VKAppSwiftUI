//
//  GroupRouter.swift
//  VKAppSwiftUI
//
//  Created by Art on 26.03.2022.
//

import Foundation
import Alamofire

enum GroupRouter: URLRequestConvertible {
    case getGroup
    case searchGroup(name: String)
    
    private var token: String {
        UserDefaultManager.shared.userToken ?? ""
    }
    
    private var url: URL {
        return URL(string: "https://api.vk.com/method")!
    }
    
    private var method: HTTPMethod {
        switch self {
        case .getGroup: return .get
        case .searchGroup: return .get
        }
    }
    
    private var path: String {
        switch self {
        case .getGroup: return "/groups.get"
        case .searchGroup: return "/groups.search"
        }
    }
    
    private var parameters: Parameters {
        switch self {
        case .getGroup: return [
            "extended": "1",
            "fields": "name,members_count,photo_50",
            "v": "5.131",
            "access_token": token]
        case .searchGroup(let name): return [
            "q": name,
            "fields": "photo_50,members_count",
            "v": "5.131",
            "access_token": token]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = url.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = method
        
        return try URLEncoding.default.encode(request, with: parameters)
    }
}
