//
//  NSObject+FlowrSpot.swift
//  FlowrSpot
//
//  Created by AlmirGaric on 12. 10. 2023..
//  Copyright © 2023 Povio Labs. All rights reserved.
//

import Foundation

extension NSObject {
    var className: String {
        return String(describing: type(of: self))
    }
    
    class var className: String {
        return String(describing: self)
    }
}
