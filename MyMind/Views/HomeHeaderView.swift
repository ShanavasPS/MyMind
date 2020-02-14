//
//  HomeHeaderView.swift
//  MyMind
//
//  Created by Shamnad PS on 14/02/20.
//  Copyright © 2020 shanavas. All rights reserved.
//

import UIKit

class HomeHeaderView: UICollectionReusableView {
    @IBOutlet weak var followingButton: HeaderButton!
    
    @IBOutlet weak var popularButton: HeaderButton!
    
    @IBOutlet weak var exploreButton: HeaderButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        followingButton.setTitleColor(UIColor.lightGray, for: .normal)
        followingButton.setTitleColor(UIColor.white, for: .selected)
        popularButton.setTitleColor(UIColor.lightGray, for: .normal)
        popularButton.setTitleColor(UIColor.white, for: .selected)
        exploreButton.setTitleColor(UIColor.lightGray, for: .normal)
        exploreButton.setTitleColor(UIColor.white, for: .selected)
        followingButton.setBackgroundImage(UIImage(named:"button_outline_stretchable_38px"), for: .selected)
        popularButton.setBackgroundImage(UIImage(named:"button_outline_stretchable_38px"), for: .selected)
        
        exploreButton.setBackgroundImage(UIImage(named:"button_outline_stretchable_38px"), for: .selected)
        
    }
    
    @IBAction func followingButtonClicked(_ sender: Any) {
        followingButton.isSelected = true;
        popularButton.isSelected = false;
        exploreButton.isSelected = false;
    }
    
    @IBAction func popularButtonClicked(_ sender: Any) {
        followingButton.isSelected = false;
        popularButton.isSelected = true;
        exploreButton.isSelected = false;
    }
    
    @IBAction func exploreButtonClicked(_ sender: Any) {
        followingButton.isSelected = false;
        popularButton.isSelected = false;
        exploreButton.isSelected = true;
    }
    
}
