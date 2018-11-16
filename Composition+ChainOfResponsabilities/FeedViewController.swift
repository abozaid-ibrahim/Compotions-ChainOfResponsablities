//
//  ViewController.swift
//  Composition+ChainOfResponsabilities
//
//  Created by Abuzeid Ibrahim on 11/16/18.
//  Copyright © 2018 abuzeid. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    
    private var loader:FeedLoader!
    convenience init(loader:FeedLoader){
        self.init()
        self.loader = loader
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loader.loadFeed(data: {[weak self]data in
            
        })
    }
    
    
}




class LocalFeedLoader:FeedLoader{
    var nextFeedLoader: FeedLoader?
    
    
    
    func loadFeed(data: (([String]) -> Void)) {
        let feeds = ["A","B","C"]
        data(feeds)
    }
    
    
}
class RemoteFeedLoader:FeedLoader{
    var nextFeedLoader: FeedLoader?
    
    func loadFeed(data: (([String]) -> Void)) {
        let feeds = ["AA","BB","CC"]
        data(feeds)
        
    }
    
    
}

class LocalAndRemote:FeedLoader{
    var nextFeedLoader: FeedLoader?
    var remote: RemoteFeedLoader!
    var isConnected:Bool{
        return false
    }
    func loadFeed(data: (([String]) -> Void)) {
        if isConnected{
            remote.loadFeed(data: data)
        }else{
            nextFeedLoader?.loadFeed(data: data)
        }
    }
}

protocol FeedLoader {
    var nextFeedLoader:FeedLoader?{get set}
    func loadFeed(data:(([String])->Void))
}

class FeedDataSource:FeedLoader{
    var nextFeedLoader: FeedLoader?
    var remote: RemoteFeedLoader!
    var isConnected:Bool{
        return false
    }
    func loadFeed(data: (([String]) -> Void)) {
        if isConnected{
            remote.loadFeed(data: data)
        }else{
            nextFeedLoader?.loadFeed(data: data)
        }
    }
}










class User{
    func main(){
        let local = LocalFeedLoader()
        let vc  = FeedViewController(loader: local)
        
    }
}
