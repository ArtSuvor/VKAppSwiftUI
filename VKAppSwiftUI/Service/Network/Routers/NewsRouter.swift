//
//  NewsRouter.swift
//  VKAppSwiftUI
//
//  Created by Art on 03.04.2022.
//

import Foundation
import Alamofire

enum NewsRouter: URLRequestConvertible {
    case getNews
    case getNewsNextForm(nextForm: String)
    case getComments(ownerId: Int, postId: Int)
    
    private var token: String {
        UserDefaultManager.shared.userToken ?? ""
    }
    
    private var url: URL {
        URL(string: "https://api.vk.com/method")!
    }
    
    private var meethod: HTTPMethod {
        switch self {
        case .getNews: return .get
        case .getNewsNextForm: return .get
        case .getComments: return .get
        }
    }
    
    private var path: String {
        switch self {
        case .getNews: return "/newsfeed.get"
        case .getNewsNextForm: return "/newsfeed.get"
        case .getComments: return "/wall.getComments"
        }
    }
    
    private var parameters: Parameters {
        switch self {
        case .getNews: return [
            "filters": "post,photo",
            "count": "20",
            "v": "5.131",
            "access_token": token]
        case .getNewsNextForm(let nextForm): return [
            "filters": "post,photo",
            "start_from": "\(nextForm)",
            "count": "20",
            "v": "5.131",
            "access_token": token]
        case .getComments(let ownerId, let postId): return [
            "owner_id": "\(ownerId)",
            "post_id": "\(postId)",
            "count": "50",
            "extended": "1",
            "sort": "desc",
            "v": "5.131",
            "access_token": token]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = url.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.method = meethod
        
        return try URLEncoding.default.encode(request, with: parameters)
    }
}
