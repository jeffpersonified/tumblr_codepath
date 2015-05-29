//
//  ComposeViewController.swift
//  Tumblr
//
//  Created by Jeff Smith on 5/28/15.
//  Copyright (c) 2015 Jeff Smith. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

    @IBOutlet weak var background: UIView!
    
    let backgroundColor = UIColor(red: 0.19, green: 0.26, blue: 0.34, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        background.backgroundColor = backgroundColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
