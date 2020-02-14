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
        followingButton.isSelected = true;
    }
    
    @IBAction func headerButtonClicked(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        followingButton.isSelected = (button.tag == followingButton.tag);
        popularButton.isSelected = (button.tag == popularButton.tag);
        exploreButton.isSelected = (button.tag == exploreButton.tag);
    }
}
