//
//  SightingDetailsTableViewCell.swift
//  FlowrSpot
//
//  Created by AlmirGaric on 26. 10. 2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

final class SightingDetailsTableViewCell: UITableViewCell {
    
    // MARK: - Subviews
    private lazy var sightImage = UIImageView()
    private lazy var sightMessageView = SightMessageView()
    private lazy var sightCommentView = SightCommentView()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [sightImage, sightMessageView, sightCommentView])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubviews()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Configure
    func configure(_ sighting: SightingDetails.Sighting) {
        if let url = URL(string: ("https:" + (sighting.picture ?? ""))) {
            sightImage.setImage(with: url)
        } else {
            sightImage.setImage(with: URL(string: "https://usercontent.one/wp/www.vocaleurope.eu/wp-content/uploads/no-image.jpg?media=1642546813"))
        }
        
        let vm = SightingsAPI.Sighting(
            id: sighting.id,
            name: sighting.name,
            description: sighting.description,
            picture: sighting.picture,
            likesCount: sighting.likesCount,
            commentsCount: sighting.commentsCount,
            createdAt: sighting.createdAt,
            latitude: sighting.latitude,
            longitude: sighting.longitude,
            user: SightingsAPI.User(id: sighting.user?.id, fullName: sighting.user?.fullName),
            flower: SightingsAPI.Flower(id: sighting.flower?.id, name: sighting.flower?.name, latinName: sighting.flower?.latinName, profilePicture: sighting.flower?.profilePicture)
        )
        sightMessageView.configure(vm)
        
        sightCommentView.borderView.isHidden = true
        sightCommentView.configure(vm)
    }
    
    
    // MARK: - Layout
    private func addSubviews() {
        contentView.addSubview(stackView)
    }
    
    private func layout() {
        sightImage.snp.makeConstraints {
            $0.height.equalTo(290)
        }
        
        sightCommentView.snp.makeConstraints {
            $0.height.equalTo(80)
        }
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
