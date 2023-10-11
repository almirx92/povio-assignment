//
//  SightImageView.swift
//  FlowrSpot
//
//  Created by AlmirGaric on 9. 10. 2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import UIKit

import UIKit

class SightImageView: UIView {
    
    private lazy var sightImage = UIImageView()
    private lazy var titleLabel = UILabel()
    private lazy var descriptionLabel = UILabel()
    
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
    
    private func setupView() {
        // Configure your view here
        guard let url = URL(string: "https://images.unsplash.com/photo-1604085572504-a392ddf0d86a") else { return }
        sightImage.setImage(with: url)
        titleLabel.text = "Ballon Flowers"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.backgroundColor = UIColor.clear
        descriptionLabel.text = "Platycodon grandiflorus"
        descriptionLabel.textColor = .gray
        descriptionLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        descriptionLabel.backgroundColor = UIColor.clear
    }
    private func addSubViews(){
        addSubview(sightImage)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
    }
    private func layout(){
        sightImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        
        titleLabel.snp.makeConstraints { make in
                        make.bottom.equalToSuperview().offset(-40)
                        make.centerX.equalToSuperview()
                        make.leading.equalToSuperview().offset(96)
                        make.trailing.equalToSuperview().offset(-30)
                        // Add any additional constraints for the titleLabel as needed
                    }
                    
                    descriptionLabel.snp.makeConstraints { make in
                        make.top.equalTo(titleLabel.snp.bottom).offset(8)
                        make.leading.equalTo(titleLabel)
                        make.trailing.equalTo(titleLabel)
                        // Add any additional constraints for the descriptionLabel as needed
                    }
        }
    }
}
