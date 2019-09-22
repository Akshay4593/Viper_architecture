//
//  UIButton+Ext.swift
//  MultimediaApp
//
//  Created by Akshay Shedge on 25/08/19.
//  Copyright © 2019 Akshay Shedge. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    
      func setTitleForAllStates(_ title: String?) {
        setTitle(title, for: .normal)
        setTitle(title, for: .selected)
        setTitle(title, for: .disabled)
        setTitle(title, for: .focused)
        setTitle(title, for: .highlighted)
    }
    
}

