//
//  SightingListInteractor.swift
//  FlowrSpot
//
//  Created by AlmirGaric on 7. 10. 2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import Foundation

protocol SightingBusinessLogic {
    func fetchSightingsList()
}

class SightingsInteractor {
//  var presenter: SightingPresentationLogic?
  private let sightingsAPI: SightingsAPI
  
  init(sightingsAPI: SightingsAPI = .init()) {
    self.sightingsAPI = sightingsAPI
  }
}

// MARK: - Business Logic
extension SightingsInteractor: SightingBusinessLogic {
    func fetchSightingsList() {
        sightingsAPI.fetchSightingsList().observe { [weak self] in
         //   self?.presenter?.presentSigtingResult($0)
            print("Test--------------")
            print($0)
        }
    }
}
