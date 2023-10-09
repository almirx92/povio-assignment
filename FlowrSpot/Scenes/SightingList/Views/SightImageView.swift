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
        backgroundColor = UIColor.blue
    }
}
