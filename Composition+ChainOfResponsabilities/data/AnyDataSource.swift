//
//  DataRepo.swift
//  Composition+ChainOfResponsabilities
//
//  Created by Abuzeid Ibrahim on 11/17/18.
//  Copyright © 2018 abuzeid. All rights reserved.
//

import Foundation

class FeedDataSource: FeedLoader {
    required init(nextFeedLoader: FeedLoader?) {
        self.nextFeedLoader = nextFeedLoader
    }
    
    func loadFeed(completion: (([String]?, Error?) -> Void)?) {
        if isConnected {
            remote.loadFeed(completion: completion)
        } else {
            nextFeedLoader?.loadFeed(completion: completion)
        }
    }
    
    var nextFeedLoader: FeedLoader?
    var remote: RemoteFeedLoader!
    var isConnected: Bool {
        return false
    }
    
}
