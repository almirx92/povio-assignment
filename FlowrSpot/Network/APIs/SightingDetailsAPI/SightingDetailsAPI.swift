//
//  SightingDetailsAPI.swift
//  FlowrSpot
//
//  Created by AlmirGaric on 26. 10. 2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import Foundation

class SightingDetailsAPI {
  private let client: AlamofireNetworkClient
  
  init(client: AlamofireNetworkClient = .default) {
    self.client = client
  }
  
    func fetchSighting(sightingId: Int) -> Promise<SightingDetails.Response> {
        client
            .request(method: .get, endpoint: Endpoints.sighting(sightingId: sightingId))
            .validate()
            .decode(SightingDetails.Response.self, decoder: .default)
    }
    
    func fetchComments(sightingId: Int, page: Int) -> Promise<CommentsResponse> {
        client
            .request(method: .get, endpoint: Endpoints.comments(sightingId: sightingId, page: page))
            .validate()
            .decode(CommentsResponse.self, decoder: .default)
    }
}

extension SightingDetailsAPI {
    enum Endpoints: EndpointEncodable {
        case sighting(sightingId: Int)
        case comments(sightingId: Int, page: Int)
        
        var path: Path {
            switch self {
            case let .sighting(sightingId):
                return "sightings/\(sightingId)"
            case let .comments(sightingId, page):
                return "sightings/\(sightingId)/comments?page=\(page)"
            }
        }
    }
}

