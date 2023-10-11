//
//  SightCommentView.swift
//  FlowrSpot
//
//  Created by AlmirGaric on 9. 10. 2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import UIKit

class SightCommentView: UIView {
    
    //MARK: - Atributes
    private lazy var profileImageView = UIImageView()
    private lazy var flowerTitle = UILabel()
    private lazy var authorTitle = UILabel()
    private lazy var descriptionText = UITextView()
    private lazy var borderView = UIView()
    
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
        guard let url = URL(string: "https://images.unsplash.com/photo-1604085572504-a392ddf0d86a") else { return }
        profileImageView.setImage(with: url)
        profileImageView.layer.cornerRadius = 20//profileImageView.frame.size.width / 2.0
        profileImageView.clipsToBounds = true // This ensures that the image stays within the rounded bounds
        
        //Flower Title
        flowerTitle.text = "Ballon Flowers"
        flowerTitle.font = UIFont.preferredFont(forTextStyle: .headline)
        flowerTitle.textColor = .black
        
        //Author Title
        authorTitle.text = "by Anthony Moore"
        authorTitle.font = UIFont.preferredFont(forTextStyle: .subheadline)
        authorTitle.textColor = .gray
        
        //Description Text
        descriptionText.text = "Platycodon grandiflorus (from Ancient Greek πλατύς \"wide\" and κώδων \"bell\") is a species of herbaceous flowering perennial plant of the …"
        
        //Border View
        borderView.backgroundColor = .gray
        
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
            make.top.equalToSuperview().offset(20)
            make.leading.equalTo(profileImageView.snp.trailing).offset(40)
            make.trailing.equalToSuperview()
        }
        authorTitle.snp.makeConstraints { make in
            make.top.equalTo(flowerTitle.snp.bottom).offset(8)
            make.leading.equalTo(profileImageView.snp.trailing).offset(40)
            make.trailing.equalToSuperview()
        }
        descriptionText.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(80)
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.height.equalTo(62)
            
        }
        borderView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(40)
            make.trailing.equalToSuperview().offset(-40)
            make.bottom.equalToSuperview()
            make.height.equalTo(1)
        }
        
    }
}

