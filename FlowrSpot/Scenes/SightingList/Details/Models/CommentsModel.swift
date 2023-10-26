//
//  CommentsModel.swift
//  FlowrSpot
//
//  Created by AlmirGaric on 26. 10. 2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//



import Foundation

struct CommentCellViewModel {
    var name: String
    var comment: String
}

// MARK: - CommentsResponse
struct CommentsResponse: Codable {
    let comments: [Comment]
    let meta: Meta
}

// MARK: - Comment
struct Comment: Codable {
    let id, userID: Int
    let userFullName: String
    let sightingID: Int
    let content: String

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "user_id"
        case userFullName = "user_full_name"
        case sightingID = "sighting_id"
        case content
    }
}

// MARK: - Meta
struct Meta: Codable {
    let currentPage, prevPage, nextPage, totalPages: Int?

    enum CodingKeys: String, CodingKey {
        case currentPage = "current_page"
        case prevPage = "prev_page"
        case nextPage = "next_page"
        case totalPages = "total_pages"
    }
}
