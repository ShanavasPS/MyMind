//
//  WebServiceManager.swift
//  MyMind
//
//  Created by Shanavas Shaji on 15/02/20.
//  Copyright © 2020 shanavas. All rights reserved.
//

import Foundation

protocol WebServiceManagerDelegate {
    func fetchChannelsSuccess();
}

class WebServiceManager {
    var delegate: WebServiceManagerDelegate?
    public static let sharedInstance = WebServiceManager()
    var channels = Channels.sharedInstance;

    init() {
        
    }
    
    public func fetchChannels() {
        loadChannels();
        delegate?.fetchChannelsSuccess();
    }
    
    func loadChannels() {
        channels.add(name: "FASHION", image: "Thumbnail_channel_Fashion", followers: "234k Followers", channelType: .explore, isFollowing: true);
        channels.add(name: "SCIENCE", image: "Thumbnail_channel_Science", followers: "123k Followers", channelType: .popular, isFollowing: true);
        channels.add(name: "AUTO", image: "Thumbnail_channel_Auto", followers: "100k Followers", channelType: .explore, isFollowing: true);
        channels.add(name: "TECHNOLOGY", image: "Thumbnail_channel_Technology", followers: "23.6k Followers", channelType: .popular, isFollowing: true);
        channels.add(name: "ENTERTAINMENT", image: "Thumbnail_channel_Entertainment", followers: "63k Followers", channelType: .explore, isFollowing: true);
        channels.add(name: "ENVIRONMENT", image: "Thumbnail_channel_Environment", followers: "111k Followers", channelType: .popular, isFollowing: true);
        channels.add(name: "FINANCES", image: "Thumbnail_channel_Finance", followers: "234k Followers", channelType: .explore, isFollowing: true);
        channels.add(name: "TRAVEL", image: "Thumbnail_channel_Travel", followers: "422k Followers", channelType: .popular, isFollowing: true);
        var index = 0;
        channels.items.map({_ in
            self.loadNews(index: index);
            index += 1;
            })
    }
    
    func loadNews(index: Int) {
        channels.items[index].add(title: "Artic sea ice extend hits record low for winter maximum", source: "CNN", time: "Apr 3, 2015", news: "This is normal text <b>This text is bold</b>");
        channels.items[index].add(title: "Archeologists discovered lost city in Honduran jungle", source: "CNN", time: "Apr 3, 2015", news: "This is normal text <b>This text is bold</b>");
        channels.items[index].add(title: "The balloons that could fly the tourists to the end of space", source: "CNN", time: "Apr 1, 2015", news: "This is normal text <b>This text is bold</b>");
        channels.items[index].add(title: "In the Prawn Nebula, a Nursery for Newborn stars", source: "The New York Times", time: "March 30, 2015", news: "This is normal text <b>This text is bold</b>");
        channels.items[index].add(title: "What will the battleship of the Future look like?", source: "Popular Science", time: "Apr 1, 2015", news: "This is normal text <b>This text is bold</b>");
        channels.items[index].add(title: "Artic sea ice extend hits record low for winter maximum", source: "CNN", time: "Apr 3, 2015", news: "This is normal text <b>This text is bold</b>");
        channels.items[index].add(title: "Archeologists discovered lost city in Honduran jungle", source: "CNN", time: "Apr 3, 2015", news: "This is normal text <b>This text is bold</b>");
        channels.items[index].add(title: "The balloons that could fly the tourists to the end of space", source: "CNN", time: "Apr 1, 2015", news: "This is normal text <b>This text is bold</b>");
        channels.items[index].add(title: "In the Prawn Nebula, a Nursery for Newborn stars", source: "The New York Times", time: "March 30, 2015", news: "This is normal text <b>This text is bold</b>");
        channels.items[index].add(title: "What will the battleship of the Future look like?", source: "Popular Science", time: "Apr 1, 2015", news: "This is normal text <b>This text is bold</b>");
    }
}
