//
//  SightingDetailsInteractor.swift
//  FlowrSpot
//
//  Created by AlmirGaric on 26. 10. 2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import Foundation

protocol SightingDetailsBusinessLogic: AnyObject {
    func fetchSighting(sightingId: Int)
    func fetchComments(sightingId: Int, page: Int)
}

final class SightingDetailsInteractor: SightingDetailsBusinessLogic {
    var presenter: SightingDetailsPresentationLogic?
    private let apiClient = SightingDetailsAPI()
    
    func fetchSighting(sightingId: Int) {
        apiClient
            .fetchSighting(sightingId: sightingId)
            .observe { [weak self] in
                self?.presenter?.presentSightingResult($0)
            }
    }
    
    func fetchComments(sightingId: Int, page: Int) {
        apiClient
            .fetchComments(sightingId: sightingId, page: page)
            .observe { [weak self] in
                self?.presenter?.presentCommentsResult($0)
            }
    }
}

