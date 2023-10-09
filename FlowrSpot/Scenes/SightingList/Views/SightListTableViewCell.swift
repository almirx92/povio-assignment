//
//  SightListTableViewCell.swift
//  FlowrSpot
//
//  Created by AlmirGaric on 9. 10. 2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import UIKit
import SnapKit

final class SightingTableViewCell: UITableViewCell {
    // MARK: - Subviews
    private lazy var sightImage = UIImageView()
    private lazy var titleLabel = UILabel()
    
    // MARK: - Lifecycle
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        layout()
        test()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// temporary
    private func test() {
        guard let url = URL(string: "https://images.unsplash.com/photo-1604085572504-a392ddf0d86a") else { return }
        sightImage.setImage(with: url)
        titleLabel.text = "Cviješće xd"
        titleLabel.backgroundColor = UIColor.white
    }
    
    
    // MARK: - Layout
    private func addSubviews() {
        contentView.addSubview(sightImage)
        sightImage.addSubview(titleLabel)
    }
    
    private func layout() {
        sightImage.snp.makeConstraints {
            $0.leading.top.trailing.equalToSuperview()
            $0.height.equalTo(100)
        }
        
        titleLabel.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-16)
        }
    }
}
