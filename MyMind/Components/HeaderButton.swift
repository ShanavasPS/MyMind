//
//  HeaderButton.swift
//  MyMind
//
//  Created by Shamnad PS on 14/02/20.
//  Copyright © 2020 shanavas. All rights reserved.
//

import Foundation

import UIKit

class HeaderButton : UIButton {

    override var isSelected: Bool {
        willSet {
            print("changing from \(isSelected) to \(newValue)")
        }

        didSet {
            print("changed from \(oldValue) to \(isSelected)")
        }
    }
    
    override open var isHighlighted: Bool {
        willSet {
            print("changing from \(isSelected) to \(newValue)")
        }
        didSet {
            print("changed from \(oldValue) to \(isSelected)")
            backgroundColor = isHighlighted ? UIColor.black : UIColor.white
        }
    }
    
    
}
