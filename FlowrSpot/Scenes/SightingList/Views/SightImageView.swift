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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // Initialize and configure your view here
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // Initialize and configure your view here if it's being created from a storyboard or xib
        setupView()
    }
    
    private func setupView() {
        // Configure your view here
        backgroundImage
        backgroundColor = UIColor.blue
    }
    private func test() {
        guard let url = URL(string: "https://images.unsplash.com/photo-1604085572504-a392ddf0d86a") else { return }
        sightImage.setImage(with: url)
        titleLabel.text = "Cviješće xd"
        titleLabel.backgroundColor = UIColor.white
    }
    
}
