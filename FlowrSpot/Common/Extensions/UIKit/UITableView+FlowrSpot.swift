//
//  UITableView+FlowrSpot.swift
//  FlowrSpot
//
//  Created by AlmirGaric on 12. 10. 2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    func register<T: UITableViewCell>(_ type: T.Type) {
        register(T.self, forCellReuseIdentifier: T.className)
    }
    
    func dequeueCell<T: UITableViewCell>(_ type: T.Type) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: type.className) as? T else {
            fatalError("Cell not defined")
        }
        return cell
    }
}
