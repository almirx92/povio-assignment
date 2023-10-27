//
//  SightingListHeaderView.swift
//  FlowrSpot
//
//  Created by AlmirGaric on 26. 10. 2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import UIKit
import SnapKit

class SightingListHeaderView: UIView {
    //MARK: - Attributes
    private lazy var sightingListTitle = {
        let label = UILabel()
        label.text = "SightingList_title".localized()
        label.font = .custom(type: .regular, size: 24)
        label.textColor = UIColor(hex: 0x949EA0)
        return label
    }()
    private lazy var sightingListLabel = {
        let label = UILabel()
        label.text = "SightingList_subtitle".localized()
        label.font = .custom(type: .regular, size: 12)
        label.textColor = UIColor(hex: 0x949EA0)
        return label
    }()
    
    //MARK: - LifeCycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Initialize and configure your view here
        setupView()
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //MARK: - Setup View
    func setupView(){
        backgroundColor = UIColor( hex: 0xFFFFFF)
        addSubview(sightingListTitle)
        addSubview(sightingListLabel)
    }
    //MARK: - Layout
    func layout(){
        sightingListTitle.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        sightingListLabel.snp.makeConstraints { make  in
            make.centerX.equalToSuperview()
            make.topMargin.equalTo(sightingListTitle.snp.bottom).offset(13)
        }
    }
}
