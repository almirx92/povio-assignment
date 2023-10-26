//
//  SightingsDetails.swift
//  FlowrSpot
//
//  Created by AlmirGaric on 26. 10. 2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import Foundation
enum SightingDetails {
    // MARK: - Response
    struct Response: Codable {
        let sighting: Sighting
    }

    // MARK: - Sighting
    struct Sighting: Codable {
        let id: Int?
        let name, description, picture: String?
        let likesCount, commentsCount: Int?
        let createdAt: String?
        let latitude, longitude: Double?
        let user: User?
        let flower: Flower?

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
        let id: Int?
        let name, latinName, profilePicture: String?

        enum CodingKeys: String, CodingKey {
            case id, name
            case latinName = "latin_name"
            case profilePicture = "profile_picture"
        }
    }

    // MARK: - User
    struct User: Codable {
        let id: Int?
        let fullName: String?

        enum CodingKeys: String, CodingKey {
            case id
            case fullName = "full_name"
        }
    }
    
    enum TableView {
        enum Section: Int, CaseIterable {
            case sighting
            case comments
        }
    }
}

