//
//  UserRouter.swift
//  VKAppSwiftUI
//
//  Created by Art on 25.03.2022.
//

import Foundation
import Alamofire

enum UserRouter: URLRequestConvertible {
    case getUser
    case getPhotoUser(userId: Int)
    
    private var token: String {
        UserDefaultManager.shared.userToken ?? ""
    }
    
    private var url: URL {
        return URL(string: "https://api.vk.com/method")!
    }
    
    private var method: HTTPMethod {
        switch self {
        case .getUser: return .get
        case .getPhotoUser: return .get
        }
    }
    
    private var path: String {
        switch self {
        case .getUser: return "/friends.get"
        case .getPhotoUser: return "/photos.get"
        }
    }
    
    private var parameters: Parameters {
        switch self {
        case .getUser: return [
            "fields": "photo_50,online",
            "v": "5.131",
            "access_token": token]
        case .getPhotoUser(let userId): return [
            "user_id": "\(userId)",
            "album_id": "profile",
            "extended": "1",
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
