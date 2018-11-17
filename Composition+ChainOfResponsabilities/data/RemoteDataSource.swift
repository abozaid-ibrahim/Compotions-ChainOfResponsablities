//
//  RemoteDataSource.swift
//  Composition+ChainOfResponsabilities
//
//  Created by Abuzeid Ibrahim on 11/17/18.
//  Copyright © 2018 abuzeid. All rights reserved.
//

import Foundation


class RemoteFeedLoader: FeedLoader {
    var nextFeedLoader: FeedLoader?
    
    func loadFeed(completion: (([String]?, Error?) -> Void)?) {
        let feeds = ["AA", "BB", "CC"]
        
        completion?(feeds,nil)
    }
    
    required init(nextFeedLoader: FeedLoader?) {
        self.nextFeedLoader = nextFeedLoader
    }
}



class LocalAndRemote: FeedLoader {
    func loadFeed(completion: (([String]?, Error?) -> Void)?) {
        let feeds = ["AA", "BB", "CC"]
        
        completion?(feeds,nil)
        
        if isConnected {
            remote.loadFeed(completion: completion)
        } else {
            nextFeedLoader?.loadFeed(completion: completion)
        }
    }
    
    required init(nextFeedLoader: FeedLoader?) {
        self.nextFeedLoader = nextFeedLoader
    }
    
    var nextFeedLoader: FeedLoader?
    var remote: RemoteFeedLoader!
    var isConnected: Bool {
        return false
    }
    
    
}
