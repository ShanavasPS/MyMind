//
//  ChannelHeader.swift
//  MyMind
//
//  Created by Shamnad PS on 14/02/20.
//  Copyright © 2020 shanavas. All rights reserved.
//

import Foundation
import UIKit

class ChannelHeaderView: NibView {
    let kCONTENT_XIB_NAME = "ChannelHeaderView"
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var channelName: UILabel!
    
    @IBOutlet weak var channelImage: UIImageView!
    
    @IBOutlet weak var channelFollowers: UILabel!

}
