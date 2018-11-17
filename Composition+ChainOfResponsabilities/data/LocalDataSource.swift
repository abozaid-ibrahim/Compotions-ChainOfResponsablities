//
//  LocalDataSource.swift
//  Composition+ChainOfResponsabilities
//
//  Created by Abuzeid Ibrahim on 11/17/18.
//  Copyright © 2018 abuzeid. All rights reserved.
//

import Foundation

class LocalFeedLoader: FeedLoader {
    func loadFeed(completion: (([String]?, Error?) -> Void)?) {
        let feeds = ["AA", "BB", "CC"]
        
        completion?(feeds,nil)
    }
    
    required init(nextFeedLoader: FeedLoader?) {
        self.nextFeedLoader = nextFeedLoader
    }
    
    var nextFeedLoader: FeedLoader?
    
    
}
