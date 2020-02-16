//
//  NewsViewController.swift
//  MyMind
//
//  Created by Shanavas Shaji on 13/02/20.
//  Copyright © 2020 shanavas. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var channelTitle: UILabel!
    @IBOutlet weak var channelImage: UIImageView!
    @IBOutlet weak var newsTitle: UILabel!
    @IBOutlet weak var newsSource: UILabel!
    @IBOutlet weak var newsTime: UILabel!
    @IBOutlet weak var newsTextView: UITextView!
    
    private let currentChannel = Channels.sharedInstance.currentChannel;
    private let currentNews = Channels.sharedInstance.currentNews;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView();
    }
    
    //Set the topbar color to white
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func updateView() {
        channelTitle.text = currentChannel.channelName + Constants.Channel.Postfix;
        channelImage.image = UIImage(named: currentNews.image);
        newsTitle.text = currentNews.title;
        newsSource.text = currentNews.source;
        newsTime.text = currentNews.time;
        newsTextView.attributedText = currentNews.news.htmlToAttributedString;
    }
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
