//
//  AccountViewController.swift
//  Tumblr
//
//  Created by Jeff Smith on 5/28/15.
//  Copyright (c) 2015 Jeff Smith. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var accountImageView: UIImageView!
    @IBOutlet weak var accountScrollView: UIScrollView!
    
    let contentBackgroundColor = UIColor(red: 0.19, green: 0.27, blue: 0.36, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = contentBackgroundColor
        
        accountScrollView.contentSize = CGSize(width: accountImageView.frame.width, height: accountImageView.frame.height + 1)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
