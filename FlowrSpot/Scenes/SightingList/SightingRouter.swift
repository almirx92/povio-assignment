//
//  SightingListRouter.swift
//  FlowrSpot
//
//  Created by AlmirGaric on 7. 10. 2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import Foundation

protocol SightingRoutingLogic: AnyObject {
    func openDetails(sightingId: Int)
}

final class SightingRouter: SightingRoutingLogic {
    var viewController: SightingListViewController?
    
    func openDetails(sightingId: Int) {
        let vc = SightingDetailsViewController(sightingId: sightingId)
        vc.hidesBottomBarWhenPushed = true
        viewController?.navigationController?.pushViewController(vc, animated: true)
    }
}

