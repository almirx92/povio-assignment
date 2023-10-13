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
        commentIcon.image = UIImage(systemName: "message.circle.fill")
        commentCounter.text = "34"
        commentCounter.textColor = UIColor.gray
        commentLabel.text = "Comments"
        commentLabel.textColor = UIColor.gray
        
        //Favorites UI elements
        favoritesIcon.image = UIImage(systemName: "heart.fill")
        favoritesCounter.text = "10"
        favoritesCounter.textColor = UIColor.gray
        favoritesLabel.text = "Favorites"
        favoritesLabel.textColor = UIColor.gray
    }
    
    //MARK: - Layout
    private func layout(){

        commentIcon.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(30)
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
            make.height.width.equalTo(30)
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
