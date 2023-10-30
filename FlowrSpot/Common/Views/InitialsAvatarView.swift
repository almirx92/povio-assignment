//
//  InitialsAvatarView.swift
//  FlowrSpot
//
//  Created by AlmirGaric on 26. 10. 2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class InitialsAvatarView: UIView {
    // MARK: - Subviews
    private let nameLabel = UILabel()
    private let backgroundView = UIView()
    
    // MARK: - Lifecycle
    init(
        backgroundColor: UIColor? = .flowrPink,
        font: UIFont? = .custom(type: .regular, size: 14),
        textColor: UIColor = .black
    ) {
        super.init(frame: .zero)
        layout()
        setupView(backgroundColor: backgroundColor, font: font, textColor: textColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        backgroundView.layer.cornerRadius = backgroundView.frame.size.width / 2
    }
    
    // MARK: - Setup view
    private func setupView(backgroundColor: UIColor?, font: UIFont?, textColor: UIColor?) {
        backgroundView.clipsToBounds = true
        nameLabel.textAlignment = .center
        if let font, let backgroundColor, let textColor {
            nameLabel.font = font
            nameLabel.textColor = textColor
            backgroundView.backgroundColor = backgroundColor
        }
    }
    
    // MARK: - Layout
    private func layout() {
        addSubview(backgroundView)
        addSubview(nameLabel)
        
        backgroundView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    // MARK: - Set profile name
    func setProfileName(_ profileName: String) {
        nameLabel.text = getInitials(from: profileName)
    }
    
    private func getInitials(from string: String) -> String {
        let words = string.components(separatedBy: " ")
        var initials = ""
        for word in words {
            if let firstChar = word.first {
                initials.append(firstChar.uppercased())
            }
        }
        return initials
    }
    
    public func setBackgroundColor(backgroundColor: UIColor) {
        backgroundView.backgroundColor = backgroundColor
    }
}


