//
//  TabBarViewController.swift
//  Tumblr
//
//  Created by Jeff Smith on 5/29/15.
//  Copyright (c) 2015 Jeff Smith. All rights reserved.
//

import UIKit

class TabBarViewController: UIViewController, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var tabBar: UIView!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var accountButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var trendingButton: UIButton!
    @IBOutlet weak var floatingImageView: UIImageView!
    
    var homeViewController: UIViewController!
    var searchViewController: UIViewController!
    var accountViewController: UIViewController!
    var trendingViewController: UIViewController!
    var selectedController: UIViewController!
    var isPresenting: Bool = true

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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "composeSegue" {
            var destinationViewController = segue.destinationViewController as! UIViewController
            destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
            destinationViewController.transitioningDelegate = self
        }
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
        floatingImageView.hidden = true
        
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
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresenting = false
        return self
    }       

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.35
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        var containerView = transitionContext.containerView()
        var toViewController = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        var fromViewController = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)!
        
        if (isPresenting) {
            containerView.addSubview(toViewController.view)
            toViewController.view.frame.origin.y = 568
            UIView.animateWithDuration(0.35, animations: { () -> Void in
                toViewController.view.frame.origin.y = 0
            }, completion: { (Bool) -> Void in
                transitionContext.completeTransition(true)
            })
        } else {
            UIView.animateWithDuration(0.15, animations: { () -> Void in
                fromViewController.view.frame.origin.y = 568
            }) { (finished: Bool) -> Void in
                transitionContext.completeTransition(true)
                fromViewController.view.removeFromSuperview()
            }
        }
    }
}

