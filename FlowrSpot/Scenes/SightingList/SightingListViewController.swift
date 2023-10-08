//
//  SightingListViewController.swift
//  FlowrSpot
//
//  Created by AlmirGaric on 7. 10. 2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import UIKit

class SightingListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white

        // Create a UILabel
        let label = UILabel()

        // Configure label properties
        label.text = "Hello, World!"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.black
        label.textAlignment = .center

        // Add the label as a subview
        view.addSubview(label)

        // Set the label's frame or layout constraints
        label.translatesAutoresizingMaskIntoConstraints = false

        // Using Auto Layout constraints
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        // Alternatively, you can set the frame manually
        // label.frame = CGRect(x: 50, y: 100, width: 200, height: 30)
    }

}

