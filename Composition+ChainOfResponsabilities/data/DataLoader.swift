//
//  DataLoader.swift
//  Composition+ChainOfResponsabilities
//
//  Created by Abuzeid Ibrahim on 11/17/18.
//  Copyright © 2018 abuzeid. All rights reserved.
//

import Foundation
protocol FeedLoader {
    var nextFeedLoader: FeedLoader? { get set }
    init(nextFeedLoader: FeedLoader?)
    func loadFeed(completion: (([String]?, Error?) -> Void)?)
    
}

enum MyCustomError: Error {
    case dummyError
}
