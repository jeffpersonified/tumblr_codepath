//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by Jeff Smith on 5/29/15.
//  Copyright (c) 2015 Jeff Smith. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController {

    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tabBar: UIView!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    var selectedController: UIViewController!

    let tabBackgroundColor = UIColor(red: 0.19, green: 0.26, blue: 0.34, alpha: 1)
    let contentBackgroundColor = UIColor(red: 0.19, green: 0.27, blue: 0.36, alpha: 1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        tabBar.backgroundColor = tabBackgroundColor
        contentView.backgroundColor = contentBackgroundColor
        
        homeViewController = storyboard.instantiateViewControllerWithIdentifier("homeViewController") as! UIViewController
        searchViewController = storyboard.instantiateViewControllerWithIdentifier("searchViewController") as! UIViewController
        accountViewController = storyboard.instantiateViewControllerWithIdentifier("accountViewController") as! UIViewController
        trendingViewController = storyboard.instantiateViewControllerWithIdentifier("trendingViewController") as! UIViewController
        
        setButtonSelectedImages()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func didPressHomeButton(sender: AnyObject) {
        selectedController = homeViewController
        addControllerViewToContentView(homeViewController)
        setButtonToActive(homeButton, unselectedButtons: [searchButton, trendingButton, accountButton])
    }
    
    @IBAction func didPressSearchButton(sender: AnyObject) {
        selectedController = searchViewController
        addControllerViewToContentView(searchViewController)
        setButtonToActive(searchButton, unselectedButtons: [homeButton, trendingButton, accountButton])
    }
    
    @IBAction func didPressAccountButton(sender: AnyObject) {
        selectedController = accountViewController
        addControllerViewToContentView(accountViewController)
        setButtonToActive(accountButton, unselectedButtons: [homeButton, trendingButton, searchButton])
    }
    
    @IBAction func didPressTrendingButton(sender: AnyObject) {
        selectedController = trendingViewController
        addControllerViewToContentView(trendingViewController)
        setButtonToActive(trendingButton, unselectedButtons: [homeButton, searchButton, accountButton])
    }
    
    func addControllerViewToContentView(controller: UIViewController) {
        addChildViewController(controller)
        controller.view.frame = contentView.bounds
        contentView.addSubview(controller.view)
        controller.didMoveToParentViewController(self)
    }
    
    func setButtonSelectedImages() {
        let homeSelectedIcon = UIImage(named: "home_selected_icon") as UIImage?
        let searchSelectedIcon = UIImage(named: "search_selected_icon") as UIImage?
        let accountSelectedIcon = UIImage(named: "account_selected_icon") as UIImage?
        let trendingSelectedIcon = UIImage(named: "trending_selected_icon") as UIImage?
        
        homeButton.setImage(homeSelectedIcon, forState: UIControlState.Selected)
        searchButton.setImage(searchSelectedIcon, forState: UIControlState.Selected)
        accountButton.setImage(accountSelectedIcon, forState: UIControlState.Selected)
        trendingButton.setImage(trendingSelectedIcon, forState: UIControlState.Selected)
    }
    
    func setButtonToActive(selectedButton: UIButton, unselectedButtons: Array<UIButton>) {
        for button in unselectedButtons {
            button.selected = false
        }
        selectedButton.selected = true
    }
}

