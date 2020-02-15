//
//  NewsViewController.swift
//  MyMind
//
//  Created by Shanavas Shaji on 13/02/20.
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
    
    @IBOutlet weak var newsTextView: UITextView!
    
    let currentChannel = Channels.sharedInstance.currentChannel;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        channelTitle.text = currentChannel.channelName + " CHANNEL";
        channelImage.image = UIImage(named: currentChannel.channelImage);
        newsTitle.text = currentChannel.currentNews.title;
        newsSource.text = currentChannel.currentNews.source;
        newsTime.text = currentChannel.currentNews.time;
        newsTextView.attributedText = currentChannel.currentNews.news.htmlToAttributedString;
    }

    @IBAction func closeButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
