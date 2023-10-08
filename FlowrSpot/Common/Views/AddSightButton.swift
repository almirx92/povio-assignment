//
//  AddSightButton.swift
//  FlowrSpot
//
//  Created by AlmirGaric on 8. 10. 2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    // Custom initialization for your button
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    private func setupButton() {
        // Customize the appearance of your button here
        backgroundColor = UIColor.blue
        setTitleColor(UIColor.white, for: .normal)
        layer.cornerRadius = 8
    }
}
