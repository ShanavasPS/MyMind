//
//  News.swift
//  MyMind
//
//  Created by Shanavas Shaji on 13/02/20.
//  Copyright © 2020 shanavas. All rights reserved.
//

import Foundation

enum ChannelType: String, Codable {
    case popular = "Popular"
    case explore = "Explore"
    case none = ""
}

struct News: Decodable {
   var title: String
   var source: String
   var time: String
   var news: String
   var image: String
    
    init(title: String, source: String, time: String, image: String, news: String) {
        self.title = title
        self.source = source
        self.time = time
        self.image = image
        self.news = news
    }
}

class Channel: Decodable {
    let channelName : String;
    let channelImage: String;
    let followers: String;
    var channelType: ChannelType;
    var isFollowing: Bool;
    var news: [News];
    init(name: String, image:String, followers: String, channelType: ChannelType, isFollowing: Bool) {
        self.news = []
        self.channelName = name;
        self.channelImage = image;
        self.followers = followers;
        self.channelType = channelType;
        self.isFollowing = isFollowing;
    }
}

struct ResponseData: Decodable {
    let channels: [Channel];
}

class Channels {
    var items:[Channel] = [];
    public static let sharedInstance = Channels()
    var currentChannel: Channel;
    var selectedChannelType: ChannelType;
    var currentNews: News;

    init() {
        self.items = [];
        self.selectedChannelType = .none;
        self.currentChannel = Channel(name: "", image: "", followers: "", channelType: .none, isFollowing: false);
        self.currentNews = News(title: "", source: "", time: "", image: "", news: "");
    }
}
