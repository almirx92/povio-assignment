//
//  SightingsAPI+Endpoints.swift
//  FlowrSpot
//
//  Created by AlmirGaric on 12. 10. 2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import Foundation


extension SightingsAPI {
  enum Endpoints: EndpointEncodable {
    case list
    
    var path: Path {
      switch self {
      case .list:
        return "sightings"
      }
    }
  }
}
