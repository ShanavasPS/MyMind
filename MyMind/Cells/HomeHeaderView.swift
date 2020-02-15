//
//  HomeHeaderView.swift
//  MyMind
//
//  Created by Shanavas Shaji on 14/02/20.
//  Copyright © 2020 shanavas. All rights reserved.
//

import UIKit

protocol HomeHeaderViewDelegate {
    func updateTableBasedonHeader(_ type: ChannelType);
}

class HomeHeaderView: UICollectionReusableView {
    @IBOutlet weak var followingButton: UIButton!
    @IBOutlet weak var popularButton: UIButton!
    @IBOutlet weak var exploreButton: UIButton!
    
    var delegate: HomeHeaderViewDelegate?
    
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
        
        var channelType: ChannelType = .none;
        switch(button.tag) {
            case 0:
                channelType = .none
                break
            case 1:
                channelType = .popular
                break
            case 2:
                channelType = .explore
            break
            default:
                break
        }
        delegate?.updateTableBasedonHeader(channelType);
    }
}
