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
