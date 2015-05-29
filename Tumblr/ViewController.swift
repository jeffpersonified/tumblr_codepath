//
//  ViewController.swift
//  Tumblr
//
//  Created by Jeff Smith on 5/28/15.
//  Copyright (c) 2015 Jeff Smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tabBar: UIView!
    @IBOutlet weak var contentView: UIView!
    
    let tabBackgroundColor = UIColor(red: 0.19, green: 0.26, blue: 0.34, alpha: 1)
    let contentBackgroundColor = UIColor(red: 0.19, green: 0.27, blue: 0.36, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.backgroundColor = tabBackgroundColor
        contentView.backgroundColor = contentBackgroundColor
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
