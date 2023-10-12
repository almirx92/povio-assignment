//
//  SightingsAPI.swift
//  FlowrSpot
//
//  Created by AlmirGaric on 12. 10. 2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import Foundation

class SightingsAPI {
  private let client: AlamofireNetworkClient
  
  init(client: AlamofireNetworkClient = .default) {
    self.client = client
  }
  
    func fetchSightingsList() -> Promise<SightingsResponse>{
    client
      .request(method: .get, endpoint: Endpoints.list)
      .validate()
      .decode(SightingsResponse.self, decoder: .default)
  }
}
