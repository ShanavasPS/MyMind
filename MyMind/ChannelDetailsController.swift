//
//  ChannelDetailsViewController.swift
//  MyMind
//
//  Created by Shamnad PS on 13/02/20.
//  Copyright © 2020 shanavas. All rights reserved.
//

import UIKit

class ChannelDetailsViewController: UITableViewController {
    
    private let reuseIdentifier = "ChannelDetailCell"

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
        cell.newsTitle.text = "Sample text";
        return cell;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showSelectedNews", sender: nil);
    }
}
