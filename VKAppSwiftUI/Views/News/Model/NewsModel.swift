//
//  NewsModel.swift
//  VKAppSwiftUI
//
//  Created by Art on 03.04.2022.
//

import Foundation

// MARK: Response
struct NewsResponse: Codable {
    let response: ResponseResult
    
    struct ResponseResult: Codable {
        let items: [NewsModel]
        let nextFrom: String
        
        enum CodingKeys: String, CodingKey {
            case items
            case nextFrom = "next_from"
        }
    }
}

// MARK: News
struct NewsModel: Codable, Identifiable {
    let namePublic: Int
    let datePublic: Date
    let textNews: String?
    let attachments: [AttachmentsNews]?
    let postID: Int?
    
    let likeCount: LikeCount?
    let commentCount: CommentCount?
    let repostCount: RepostCount?
    let viewsCount: ViewsCount?
    
    var id: Int {
        postID ?? 0
    }
    
    enum CodingKeys: String, CodingKey {
        case namePublic = "source_id"
        case datePublic = "date"
        case textNews = "text"
        case attachments
        case postID = "post_id"
        
        case likeCount = "likes"
        case commentCount = "comments"
        case repostCount = "reposts"
        case viewsCount = "views"
    }
    
    struct LikeCount: Codable {
        let count: Int
    }
    
    struct CommentCount: Codable {
        let count: Int
    }
    
    struct RepostCount: Codable {
        let count: Int
    }
    
    struct ViewsCount: Codable {
        let count: Int
    }
}

// MARK: Attachments
struct AttachmentsNews: Codable {
    let photo: ImageNews?
    
    struct ImageNews: Codable {
        let sizes: [ImageSize]
        
        struct ImageSize: Codable {
            let url: String
            let width: Int
            let height: Int
        }
    }
}

