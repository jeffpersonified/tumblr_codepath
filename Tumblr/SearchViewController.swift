//
//  SearchViewController.swift
//  Tumblr
//
//  Created by Jeff Smith on 5/28/15.
//  Copyright (c) 2015 Jeff Smith. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    let contentBackgroundColor = UIColor(red: 0.19, green: 0.27, blue: 0.36, alpha: 1)
    
    @IBOutlet weak var feedScrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                self.view.backgroundColor = contentBackgroundColor
        
        feedScrollView.contentSize = CGSize(width: 320, height: 1217)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
