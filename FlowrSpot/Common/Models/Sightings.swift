//
//  Sightings.swift
//  FlowrSpot
//
//  Created by AlmirGaric on 11. 10. 2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import Foundation

enum Sightings{
    // MARK: - Response
    struct Response: Codable {
        var sightings: [Sighting]?
        var meta: Meta?
    }

    // MARK: - Meta
    struct Meta: Codable {
        var pagination: Pagination?
    }

    // MARK: - Pagination
    struct Pagination: Codable {
        var currentPage, prevPage, nextPage, totalPages: Int?

        enum CodingKeys: String, CodingKey {
            case currentPage = "current_page"
            case prevPage = "prev_page"
            case nextPage = "next_page"
            case totalPages = "total_pages"
        }
    }

    // MARK: - Sighting
    struct Sighting: Codable {
        var id: Int?
        var name, description, picture: String?
        var likesCount, commentsCount: Int?
        var createdAt: String?
        var latitude, longitude: Double?
        var user: User?
        var flower: Flower?

        enum CodingKeys: String, CodingKey {
            case id, name, description, picture
            case likesCount = "likes_count"
            case commentsCount = "comments_count"
            case createdAt = "created_at"
            case latitude, longitude, user, flower
        }
    }

    // MARK: - Flower
    struct Flower: Codable {
        var id: Int?
        var name, latinName, profilePicture: String?

        enum CodingKeys: String, CodingKey {
            case id, name
            case latinName = "latin_name"
            case profilePicture = "profile_picture"
        }
    }

    // MARK: - User
    struct User: Codable {
        var id: Int?
        var fullName: String?

        enum CodingKeys: String, CodingKey {
            case id
            case fullName = "full_name"
        }
    }
}
