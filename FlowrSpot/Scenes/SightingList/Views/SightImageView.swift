//
//  SightImageView.swift
//  FlowrSpot
//
//  Created by AlmirGaric on 9. 10. 2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import UIKit


class SightImageView: UIView {
    
    //MARK: - Datasource
    
    //MARK: - Attributes
    private lazy var sightImage = UIImageView()
    private lazy var titleLabel = UILabel()
    private lazy var descriptionLabel = UILabel()
    
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
    }
    //MARK: - Configure
    func configure(_ sighting : SightingsAPI.Sighting) {
        guard let url = URL(string: "https:" + (sighting.picture)!) else { return }
        sightImage.setImage(with: url)
        titleLabel.text = sighting.flower?.name
        descriptionLabel.text = sighting.flower?.latinName
    }
    // MARK: - Setup views
    private func setupView() {
        sightImage.contentMode = .scaleToFill
        titleLabel.textColor = .white
        titleLabel.font = .custom(type: .regular, size: 20)
        titleLabel.backgroundColor = .clear
        descriptionLabel.textColor = .white.withAlphaComponent(0.7)
        descriptionLabel.font = .custom(type: .regular, size: 12)
        descriptionLabel.backgroundColor = .clear
    }
    // MARK: - Add sub views
    private func addSubViews(){
        addSubview(sightImage)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
    }
    // MARK: - Layout
    private func layout(){
        sightImage.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().offset(-30)
            $0.centerX.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(descriptionLabel.snp.top).offset(-7)
        }
    }
}
