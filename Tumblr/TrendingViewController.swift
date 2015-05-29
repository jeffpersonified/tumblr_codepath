//
//  TrendingViewController.swift
//  Tumblr
//
//  Created by Jeff Smith on 5/28/15.
//  Copyright (c) 2015 Jeff Smith. All rights reserved.
//

import UIKit

class TrendingViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feed: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: feed.frame.width, height: feed.frame.height)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
