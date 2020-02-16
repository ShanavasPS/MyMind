//
//  Constants.swift
//  MyMind
//
//  Created by Shanavas Shaji on 16/02/20.
//  Copyright © 2020 shanavas. All rights reserved.
//

import Foundation

struct Constants {
    
    struct Channel {
        static let Postfix = " CHANNEL"
        static let LoadFailureMessage = "Could not load the channels\nPlease try again later";
        static let LoadingMessage = "Loading channels...";
        static let NoChannelsMessage = "There are no channels available";
        
        struct Cell {
            static let ReuseIdentifier = "ChannelCell"
            private static let NumberOfColumns = 2;
            static let MultiplyingFactor = 1.0/Float(NumberOfColumns);
        }
        
        struct Header {
            static let ReuseIdentifier = "HomeHeaderView";
            static let XibName = "HomeHeaderView";
        }
        
        struct Details {
            
            static let EmptyMessage = "The news will be in here.";
            static let EmptyMessageTitle = "The Channel don't have any news.";
            
            struct Cell {
                static let ReuseIdentifier = "ChannelDetailCell"
            }
        }
    }
    
    struct Segues {
        static let SelectedChannel = "showSelectedChannel";
        static let SelectedNews = "showSelectedNews";
    }
}
