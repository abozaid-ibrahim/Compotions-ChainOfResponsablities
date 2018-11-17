//
//  ViewController.swift
//  Composition+ChainOfResponsabilities
//
//  Created by Abuzeid Ibrahim on 11/16/18.
//  Copyright © 2018 abuzeid. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController {
    private var loader: FeedLoader!
    convenience init(loader: FeedLoader) {
        self.init()
        self.loader = loader
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loader.loadFeed(completion: { [weak self] (_,_) in
            
        })
    }
}
class User {
    func main() {
        let local = LocalFeedLoader(nextFeedLoader: nil)
        let vc = FeedViewController(loader: local)
    }
}
