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
    
    let contentBackgroundColor = UIColor(red: 0.19, green: 0.27, blue: 0.36, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scrollView.contentSize = CGSize(width: feed.frame.width, height: feed.frame.height)
        self.view.backgroundColor = contentBackgroundColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
