//
//  SightListTableViewCell.swift
//  FlowrSpot
//
//  Created by AlmirGaric on 9. 10. 2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import UIKit
import SnapKit

final class SightingTableViewCell: UITableViewCell {
    
    // MARK: - Subviews
    private lazy var sightImage = UIImageView()
    private lazy var titleLabel = UILabel()
    private lazy var sightImageView = SightImageView()
    private lazy var sightMessageView = SightMessageView()
    private lazy var sightCommentView = SightCommentView()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: - Configure
    func configure(_ sighting : SightingsAPI.Sighting) {
        sightImageView.configure(sighting)
        sightMessageView.configure(sighting)
        sightCommentView.configure(sighting)
    }
    
    
    // MARK: - Layout
    private func addSubviews() {
        contentView.addSubview(sightImageView)
        contentView.addSubview(sightMessageView)
        contentView.addSubview(sightCommentView)
    }
    
    private func layout() {
        sightImageView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(280)
        }
        
        sightCommentView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.top.equalTo(sightImageView.snp.bottom)
            make.height.equalTo(150)
        }
        
        sightMessageView.snp.makeConstraints { make in
            make.trailing.leading.bottom.equalToSuperview()
            make.top.equalTo(sightCommentView.snp.bottom)
        }
    }
}
