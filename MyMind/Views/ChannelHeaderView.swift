//
//  ChannelHeader.swift
//  MyMind
//
//  Created by Shamnad PS on 14/02/20.
//  Copyright © 2020 shanavas. All rights reserved.
//

import Foundation
import UIKit

protocol ChannelHeaderViewDelegate {
    func updateHeaderButton();
}

class ChannelHeaderView: UIView {
    var view: UIView!
    @IBOutlet weak var channelName: UILabel!
    @IBOutlet weak var channelImage: UIImageView!
    @IBOutlet weak var channelFollowers: UILabel!
    @IBOutlet weak var channelButton: UIButton!
    
    var delegate: ChannelHeaderViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Setup view from .xib file
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // Setup view from .xib file
        xibSetup()
    }
    
    @IBAction func followButtonClicked(_ sender: Any) {
        let isFollowing = Channels.sharedInstance.currentChannel.isFollowing;
        Channels.sharedInstance.currentChannel.isFollowing = !isFollowing;
        delegate?.updateHeaderButton();
    }
}

private extension ChannelHeaderView {
    
    func xibSetup() {
        backgroundColor = UIColor.clear
        view = self.loadNib()
        // use bounds not frame or it'll be offset
        view.frame = bounds
        // Adding custom subview on top of our view
        addSubview(view)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": view!]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[childView]|",
                                                      options: [],
                                                      metrics: nil,
                                                      views: ["childView": view!]))
    }
}
