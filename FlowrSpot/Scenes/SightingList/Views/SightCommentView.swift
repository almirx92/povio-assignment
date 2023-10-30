//
//  SightCommentView.swift
//  FlowrSpot
//
//  Created by AlmirGaric on 9. 10. 2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import UIKit

class SightCommentView: UIView {
    //MARK: - Datasource
    var data : SightingsAPI.Sighting?
    
    //MARK: - Atributes
    private lazy var profileImageView = InitialsAvatarView()
    private lazy var flowerTitle = UILabel()
    private lazy var authorTitle = UILabel()
    private lazy var descriptionText = UILabel()
    lazy var borderView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Initialize and configure your view here
        setupView()
        addSubViews()
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    //MARK: - Configure
    func configure(_ sighting : SightingsAPI.Sighting) {
        if let fullName = sighting.user?.fullName {
            authorTitle.text = "by " + fullName
            profileImageView.setProfileName(fullName)
        } else {
            profileImageView.setProfileName("N N")
            authorTitle.text = "by Uknown"
        }
        
        flowerTitle.text = sighting.flower?.name ?? "-"
        descriptionText.text = sighting.description
    }
    // MARK: - Add sub views
    private func addSubViews(){
        addSubview(profileImageView)
        addSubview(flowerTitle)
        addSubview(authorTitle)
        addSubview(descriptionText)
        addSubview(borderView)
    }
    // MARK: - Setup views
    private func setupView() {
        // Configure your view here
        backgroundColor = UIColor.white
        
        //Profile Image
        profileImageView.layer.cornerRadius = 20//profileImageView.frame.size.width / 2.0
        profileImageView.clipsToBounds = true // This ensures that the image stays within the rounded bounds
        
        //Flower Title
        flowerTitle.font = .custom(type: .regular, size: 15)
        flowerTitle.textColor = .black
        
        //Author Title
        authorTitle.font = .custom(type: .italic, size: 12)
        authorTitle.textColor = .flowrGray
        
        //Border View
        borderView.backgroundColor = .separatorColor
        
        descriptionText.font = .custom(type: .regular, size: 13)
        descriptionText.textColor = .flowrGray
        descriptionText.numberOfLines = 0
        descriptionText.lineBreakMode = .byWordWrapping
    }
    
    //MARK: - Layout
    private func layout(){
        profileImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.top.equalToSuperview().offset(20)
            make.width.equalTo(40)
            make.height.equalTo(40)
        }
        
        flowerTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalTo(profileImageView.snp.trailing).offset(20)
        }
        
        authorTitle.snp.makeConstraints { make in
            make.top.equalTo(flowerTitle.snp.bottom).offset(5)
            make.leading.equalTo(profileImageView.snp.trailing).offset(20)
            make.trailing.equalToSuperview()
        }
        
        descriptionText.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(20)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        
        borderView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.top.equalTo(descriptionText.snp.bottom).offset(20)
            make.height.equalTo(1)
        }
        
        self.snp.makeConstraints {
            $0.top.equalTo(profileImageView.snp.top)
            $0.bottom.equalTo(descriptionText.snp.bottom)
        }
    }
}

