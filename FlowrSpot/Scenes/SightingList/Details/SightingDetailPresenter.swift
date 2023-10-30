//
//  SightingDetailPresenter.swift
//  FlowrSpot
//
//  Created by AlmirGaric on 26. 10. 2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import Foundation

protocol SightingDetailsPresentationLogic: AnyObject {
    func presentSightingResult(_ result: Result<SightingDetails.Response, Error>)
    func presentCommentsResult(_ result: Result<CommentsResponse, Error>)
}

final class SightingDetailsPresenter: SightingDetailsPresentationLogic {
    var viewController: SightingDetailsDisplayLogic?
    
    func presentSightingResult(_ result: Result<SightingDetails.Response, Error>) {
        switch result {
        case .success(let data):
            viewController?.displaySightingViewModel(sighting: data.sighting)
        case .failure(let err):
            print(err)
        }
    }
    
    func presentCommentsResult(_ result: Result<CommentsResponse, Error>) {
        switch result {
        case .success(let data):
            viewController?.displayCommentsViewModel(comments: mapCommentsViewModels(from: data))
        case .failure(let err):
            print(err)
        }
    }
    
    private func mapCommentsViewModels(from data: CommentsResponse) -> [CommentCellViewModel] {
        let comments = data.comments.compactMap {
            CommentCellViewModel(name: $0.userFullName, comment: $0.content)
        }
        
        return comments
    }
}
