//
//  CommentsTableViewCell.swift
//  FlowrSpot
//
//  Created by AlmirGaric on 26. 10. 2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import UIKit

class CommentsTableViewCell: UITableViewCell {
    // MARK: - Subviews
    private lazy var avatarView = InitialsAvatarView()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .custom(type: .regular, size: 15)
        label.textColor = .black
        return label
    }()
    
    private lazy var commentLabel: UILabel = {
        let label = UILabel()
        label.font = .custom(type: .regular, size: 15)
        label.textColor = .black
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontSizeToFitWidth = false
        return label
    }()
    
    private lazy var separator = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        layout()
        separator.backgroundColor = .separatorColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    private func addSubviews() {
        [avatarView, nameLabel, commentLabel, separator].forEach { contentView.addSubview($0) }
    }
    
    private func layout() {
        avatarView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(20)
            $0.leading.equalToSuperview().offset(26)
            $0.size.equalTo(40)
        }
        
        nameLabel.snp.makeConstraints {
            $0.leading.equalTo(avatarView.snp.trailing).offset(20)
            $0.centerY.equalTo(avatarView)
        }
        
        commentLabel.snp.makeConstraints {
            $0.top.equalTo(avatarView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview().inset(20)
        }
        
        separator.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(20)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
    public func configure(commentViewModel: CommentCellViewModel) {
        avatarView.setProfileName(commentViewModel.name)
        nameLabel.text = commentViewModel.name
        commentLabel.text = commentViewModel.comment
    }
}
