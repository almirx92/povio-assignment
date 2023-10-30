//
//  SightMessageView.swift
//  FlowrSpot
//
//  Created by AlmirGaric on 9. 10. 2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import UIKit

class SightMessageView: UIView {
    //MARK: - Datasource
    var data : SightingsAPI.Sighting?
    
    //MARK: - Attributes
    private lazy var commentIcon = UIImageView()
    private var commentCounter  = UILabel()
    private lazy var commentLabel = UILabel()
    
    private lazy var favoritesIcon = UIImageView()
    private var favoritesCounter = UILabel()
    private lazy var favoritesLabel = UILabel()
    
    //MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Initialize and configure your view here
        setupView()
        addSubViews()
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // Initialize and configure your view here if it's being created from a storyboard or xib
        setupView()
    }
    //MARK: - Configure
    func configure(_ sighting : SightingsAPI.Sighting) {
        commentCounter.text = "\(data?.commentsCount ?? 0)"
        favoritesCounter.text = "\(data?.likesCount ?? 0)"
    }
    
    //MARK: - Add Subviews
    private func addSubViews(){
        addSubview(commentIcon)
        addSubview(commentCounter)
        addSubview(commentLabel)
        
        addSubview(favoritesIcon)
        addSubview(favoritesCounter)
        addSubview(favoritesLabel)
    }
    //MARK: - Setup views
    private func setupView(){
        // Configure your view here
        backgroundColor = UIColor.white
        
        //Comment UI elements
        commentIcon.image = UIImage(named: "icon-comment")?.withRenderingMode(.alwaysTemplate)
        commentIcon.tintColor = .sightingIconColor
        
        commentCounter.font = .custom(type: .regular, size: 12)
        commentCounter.textColor = .flowrGray
        commentLabel.text = "Comments"
        commentLabel.font = .custom(type: .regular, size: 12)
        commentLabel.textColor = .flowrGray
        
        //Favorites UI elements
        favoritesIcon.image = UIImage(named: "icon-favorite")?.withRenderingMode(.alwaysTemplate)
        favoritesIcon.tintColor = .sightingIconColor
        
        favoritesCounter.font = .custom(type: .regular, size: 12)
        favoritesCounter.textColor = .flowrGray
        favoritesLabel.text = "Favorites"
        favoritesLabel.font = .custom(type: .regular, size: 12)
        favoritesLabel.textColor = .flowrGray
    }
    
    //MARK: - Layout
    private func layout(){
        
        commentIcon.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
            make.width.equalTo(16)
            make.height.equalTo(15)
        }
        commentCounter.snp.makeConstraints { make in
            make.leading.equalTo(commentIcon.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
        }
        commentLabel.snp.makeConstraints { make in
            make.leading.equalTo(commentCounter.snp.trailing).offset(8)
            make.centerY.equalToSuperview()
        }
        favoritesIcon.snp.makeConstraints { make in
            make.leading.equalTo(commentLabel.snp.trailing).offset(48)
            make.centerY.equalToSuperview()
            make.width.equalTo(18)
            make.height.equalTo(15)
        }
        favoritesCounter.snp.makeConstraints { make in
            make.leading.equalTo(favoritesIcon.snp.trailing).offset(10)
            make.centerY.equalToSuperview()
        }
        favoritesLabel.snp.makeConstraints { make in
            make.leading.equalTo(favoritesCounter.snp.trailing).offset(8)
            make.centerY.equalToSuperview()
        }
    }
}
