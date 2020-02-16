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
}
