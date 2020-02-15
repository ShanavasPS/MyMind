//
//  ChannelDetailsViewController.swift
//  MyMind
//
//  Created by Shanavas Shaji on 13/02/20.
//  Copyright © 2020 shanavas. All rights reserved.
//

import UIKit
import Foundation

class ChannelDetailsViewController: UITableViewController {
    
    private let reuseIdentifier = "ChannelDetailCell";
    private let selectedNewsSegue = "showSelectedNews";
    private let channelPostfix = " CHANNEL";
    private let headerView = ChannelHeaderView();
    private let currentChannel = Channels.sharedInstance.currentChannel;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addNavBarImage();
        setupTableHeader()
    }
    
    func addNavBarImage() {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "Icon_navbar_Logo"))
        imageView.frame = CGRect(x: 0, y: 0, width: 40, height: 40)
        imageView.contentMode = .scaleAspectFit

        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))

        titleView.addSubview(imageView)
        titleView.backgroundColor = .clear
        self.navigationItem.titleView = titleView
    }
    
    //Setup the table view header using the current channel details
    func setupTableHeader(){
        headerView.channelImage.image = UIImage(named: currentChannel.channelImage);
        headerView.channelFollowers.text = currentChannel.followers;
        headerView.channelName.text = currentChannel.channelName + channelPostfix;
        headerView.channelButton.isSelected = currentChannel.isFollowing;
    }
}

// MARK: - UITableViewDataSource
extension ChannelDetailsViewController {
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currentChannel.news.count;
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
        performSegue(withIdentifier: selectedNewsSegue, sender: nil);
    }

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView;
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200;
    }
}