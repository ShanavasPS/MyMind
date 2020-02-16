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
    func fetchChannelsFailure();
}

class WebServiceManager {
    var delegate: WebServiceManagerDelegate?
    public static let sharedInstance = WebServiceManager()
    var channelInstance = Channels.sharedInstance;

    init() {
        
    }
    
    public func fetchChannels() {
        if let path = Bundle.main.path(forResource: "channels", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(ResponseData.self, from: data)
                channelInstance.items = jsonData.channels;
                delegate?.fetchChannelsSuccess()
            } catch {
                delegate?.fetchChannelsFailure()
            }
        }
    }
    
//    func loadChannels() {
//        channels.add(name: "FASHION", image: "Thumbnail_channel_Fashion", followers: "234k Followers", channelType: .explore, isFollowing: true);
//        channels.add(name: "SCIENCE", image: "Thumbnail_channel_Science", followers: "123k Followers", channelType: .popular, isFollowing: true);
//        channels.add(name: "AUTO", image: "Thumbnail_channel_Auto", followers: "100k Followers", channelType: .explore, isFollowing: true);
//        channels.add(name: "TECHNOLOGY", image: "Thumbnail_channel_Technology", followers: "23.6k Followers", channelType: .popular, isFollowing: true);
//        channels.add(name: "ENTERTAINMENT", image: "Thumbnail_channel_Entertainment", followers: "63k Followers", channelType: .explore, isFollowing: true);
//        channels.add(name: "ENVIRONMENT", image: "Thumbnail_channel_Environment", followers: "111k Followers", channelType: .popular, isFollowing: true);
//        channels.add(name: "FINANCES", image: "Thumbnail_channel_Finance", followers: "234k Followers", channelType: .explore, isFollowing: true);
//        channels.add(name: "TRAVEL", image: "Thumbnail_channel_Travel", followers: "422k Followers", channelType: .popular, isFollowing: true);
//        var index = 0;
//        channels.items.map({_ in
//            self.loadNews(index: index);
//            index += 1;
//            })
//    }
//
//    func loadNews(index: Int) {
//        channels.items[index].add(title: "Artic sea ice extend hits record low for winter maximum", source: "CNN", time: "Apr 3, 2015", news: "The Arctic Ocean freezes every winter and much of the sea-ice then thaws every summer, and that process will continue whatever happens with climate change. Even if the Arctic continues to be one of the fastest-warming regions of the world, it will always be plunged into bitterly cold polar dark every winter. And year-by-year, for all kinds of natural reasons, there's huge variety of the state of the ice.<br/><br/> <b>So what does this new record for the lowest level of winter ice actually mean?</b><br/><br/>For a start, it does not automatically follow that a record amount of ice will melt this summer. More important for determining the size of the annual thaw is the state of the weather as the midnight sun approaches and temperatures rise. But over the more than 30 years of satellite records, scientists have observed a clear pattern of decline, decade-by-decade.");
//        channels.items[index].add(title: "Archeologists discovered lost city in Honduran jungle", source: "CNN", time: "Apr 3, 2015", news: "This is normal text <b>This text is bold</b>");
//        channels.items[index].add(title: "The balloons that could fly the tourists to the end of space", source: "CNN", time: "Apr 1, 2015", news: "This is normal text <b>This text is bold</b>");
//        channels.items[index].add(title: "In the Prawn Nebula, a Nursery for Newborn stars", source: "The New York Times", time: "March 30, 2015", news: "This is normal text <b>This text is bold</b>");
//        channels.items[index].add(title: "What will the battleship of the Future look like?", source: "Popular Science", time: "Apr 1, 2015", news: "This is normal text <b>This text is bold</b>");
//        channels.items[index].add(title: "Artic sea ice extend hits record low for winter maximum", source: "CNN", time: "Apr 3, 2015", news: "This is normal text <b>This text is bold</b>");
//        channels.items[index].add(title: "Archeologists discovered lost city in Honduran jungle", source: "CNN", time: "Apr 3, 2015", news: "This is normal text <b>This text is bold</b>");
//        channels.items[index].add(title: "The balloons that could fly the tourists to the end of space", source: "CNN", time: "Apr 1, 2015", news: "This is normal text <b>This text is bold</b>");
//        channels.items[index].add(title: "In the Prawn Nebula, a Nursery for Newborn stars", source: "The New York Times", time: "March 30, 2015", news: "This is normal text <b>This text is bold</b>");
//        channels.items[index].add(title: "What will the battleship of the Future look like?", source: "Popular Science", time: "Apr 1, 2015", news: "This is normal text <b>This text is bold</b>");
//    }
}
