//
//  UIView+LoadNib.swift
//  MyMind
//
//  Created by Shanavas Shaji on 14/02/20.
//  Copyright © 2020 shanavas. All rights reserved.
//

import UIKit
extension UIView {
    /** Loads instance from nib with the same name. */
    func loadNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nibName = type(of: self).description().components(separatedBy: ".").last!
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as! UIView
    }
}
