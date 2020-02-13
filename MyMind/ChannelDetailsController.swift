//
//  ChannelDetailsViewController.swift
//  MyMind
//
//  Created by Shamnad PS on 13/02/20.
//  Copyright © 2020 shanavas. All rights reserved.
//

import UIKit
import Foundation

class ChannelDetailsViewController: UITableViewController {
    
    private let reuseIdentifier = "ChannelDetailCell"
    
//    var channel = Channel.sharedInstance;
    let currentChannel = Channels.sharedInstance.currentChannel;
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - UITableViewDataSource
extension ChannelDetailsViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10;
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier,
        for: indexPath) as! ChannelDetailCell
        cell.newsTitle.text = currentChannel.news[indexPath.row].title;
        cell.newsSource.text = currentChannel.news[indexPath.row].source;
        cell.newsTime.text = currentChannel.news[indexPath.row].time;
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        currentChannel.currentNews = currentChannel.news[indexPath.row];
        performSegue(withIdentifier: "showSelectedNews", sender: nil);
    }
}
