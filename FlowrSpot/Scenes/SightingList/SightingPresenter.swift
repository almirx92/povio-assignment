//
//  SightingListPresenter.swift
//  FlowrSpot
//
//  Created by AlmirGaric on 7. 10. 2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import Foundation

protocol SightingsPresentationLogic {
    func presentSightingResult(_ result: Result<SightingsAPI.SightingsResponse, Error>)
}

class SightingsPresenter {
  weak var viewController: SightingsDisplayLogic?
}

// MARK: - Presentation Logic
extension SightingsPresenter: SightingsPresentationLogic {
  func presentSightingResult(_ result: Result<SightingsAPI.SightingsResponse, Error>) {
    switch result {
    case .success(let sightings):
      viewController?.displaySightings(sightings)
    case .failure(let error):
      viewController?.displayError(title: "general_error".localized(),
                                   message: error.localizedDescription)
    }
  }
}
