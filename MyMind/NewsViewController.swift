//
//  NewsViewController.swift
//  MyMind
//
//  Created by Shamnad PS on 13/02/20.
//  Copyright © 2020 shanavas. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var closeButtonImage: UIImageView!
    
    @IBOutlet weak var channelTitle: UILabel!
    
    @IBOutlet weak var channelImage: UIImageView!
    
    @IBOutlet weak var newsTitle: UILabel!
    
    @IBOutlet weak var newsSource: UILabel!
    
    @IBOutlet weak var newsTime: UILabel!
    
    let currentChannel = Channels.sharedInstance.currentChannel;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        channelTitle.text = currentChannel.channelName + " CHANNEL";
        channelImage.image = UIImage(named: currentChannel.channelImage);
        newsTitle.text = currentChannel.currentNews.title;
        newsSource.text = currentChannel.currentNews.source;
        newsTime.text = currentChannel.currentNews.time;
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(NewsViewController.imageTapped(gesture:)))

            // add it to the image view;
            closeButtonImage.addGestureRecognizer(tapGesture)
            // make sure imageView can be interacted with by user
            closeButtonImage.isUserInteractionEnabled = true
        }

        @objc func imageTapped(gesture: UIGestureRecognizer) {
            // if the tapped view is a UIImageView then set it to imageview
            if (gesture.view as? UIImageView) != nil {
                dismiss(animated: true, completion: nil)
            }
        }
}
