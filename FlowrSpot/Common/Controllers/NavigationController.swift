//
//  NavigationController.swift
//  FlowrSpot
//
//  Created by TK on 17/01/2018.
//  Copyright © 2020 Povio Labs. All rights reserved.
//

import UIKit
import SnapKit

class NavigationController: UINavigationController {
    
    var showLogo = false
    
    private lazy var logoView = UIImageView(image: UIImage(named: "logo"))
    private lazy var logoContainer = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setLogo()
    }
}

// MARK: - Private methods
private extension NavigationController {
    
    func setupViews() {
        navigationBar.barTintColor = .flowrPink
        navigationBar.titleTextAttributes = [.font: UIFont.custom(type: .bold, size: 17),
                                             .foregroundColor: UIColor.flowrPink]
        navigationBar.setBackgroundImage(UIImage(), for: .top, barMetrics: .default)
        navigationBar.shadowImage = UIImage()
        navigationBar.tintColor = .black
        navigationBar.layer.masksToBounds = false
        
        let backgroundColor = UIColor.white
        navigationBar.barTintColor = backgroundColor
        navigationBar.backgroundColor = backgroundColor
        navigationBar.isTranslucent = false
        
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = backgroundColor
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
        }
        
        
    }
    
    private func setLogo() {
        navigationBar.addSubview(logoView)
        logoView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.top.equalToSuperview().offset(11)
            $0.bottom.equalToSuperview().inset(11)
        }
    }
}
