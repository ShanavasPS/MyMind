//
//  News.swift
//  MyMind
//
//  Created by Shanavas Shaji on 13/02/20.
//  Copyright © 2020 shanavas. All rights reserved.
//

import Foundation

enum ChannelType {
    case popular
    case explore
    case none
}

struct News {
   var title: String
   var source: String
   var time: String
   var news: String
    
    init(title: String, source: String, time: String, news: String) {
        self.title = title
        self.source = source
        self.time = time
        self.news = news
    }
}

class Channel {
    let channelName : String;
    let channelImage: String;
    let followers: String;
    var news: [News];
    var currentNews: News;
    var channelType: ChannelType;
    var isFollowing: Bool;
    init(name: String, image:String, followers: String, channelType: ChannelType, isFollowing: Bool) {
        self.news = []
        self.channelName = name;
        self.channelImage = image;
        self.followers = followers;
        self.currentNews = News(title: "", source: "", time: "", news: "");
        self.channelType = channelType;
        self.isFollowing = isFollowing;
    }
    
    public func add(title: String, source: String, time: String, news: String) {
        self.news.append(News(title: title, source: source, time: time, news: news))
    }
}

class Channels {
    var items:[Channel] = [];
    public static let sharedInstance = Channels()
    var currentChannel: Channel;
    var selectedChannelType: ChannelType;
    init() {
        self.items = [];
        self.selectedChannelType = .none;
        self.currentChannel = Channel(name: "", image: "", followers: "", channelType: .none, isFollowing: false);
    }
    
    public func add(name: String, image: String, followers: String, channelType: ChannelType, isFollowing: Bool) {
        self.items.append(Channel(name: name, image: image, followers: followers, channelType: channelType, isFollowing: isFollowing))
    }
}
