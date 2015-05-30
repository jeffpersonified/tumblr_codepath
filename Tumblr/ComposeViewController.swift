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
    @IBOutlet weak var dismissButton: UIButton!
    @IBOutlet weak var videoIcon: UIImageView!
    @IBOutlet weak var textIcon: UIImageView!
    @IBOutlet weak var quoteIcon: UIImageView!
    @IBOutlet weak var photoIcon: UIImageView!
    @IBOutlet weak var linkIcon: UIImageView!
    @IBOutlet weak var chatIcon: UIImageView!
    
    let backgroundColor = UIColor(red: 0.19, green: 0.26, blue: 0.34, alpha: 0.90)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        background.backgroundColor = backgroundColor
        dismissButton.frame.origin.y = background.frame.height
        videoIcon.frame.origin.y = background.frame.height + videoIcon.frame.height
        textIcon.frame.origin.y = background.frame.height + textIcon.frame.height
        quoteIcon.frame.origin.y = background.frame.height + quoteIcon.frame.height
        photoIcon.frame.origin.y = background.frame.height + photoIcon.frame.height
        linkIcon.frame.origin.y = background.frame.height + linkIcon.frame.height
        chatIcon.frame.origin.y = background.frame.height + chatIcon.frame.height
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(animated: Bool) {
        animateInDismissButton()
        animateInComposeActions()
    }
    
    override func viewWillDisappear(animated: Bool) {
        animateOutComposeActions()
    }
    
    @IBAction func didPressDismissButton(sender: AnyObject) {
        UIView.animateWithDuration(1, animations: { () -> Void in
            self.animateOutComposeActions()
        }) { (Bool) -> Void in
            self.delay(0.6, closure: { () -> () in
                self.dismissViewControllerAnimated(true, completion: nil)
            })
        }

    }
    
    func animateInDismissButton() {
        UIView.animateWithDuration(0.55, animations: { () -> Void in
            self.dismissButton.frame.origin.y = self.background.frame.height - self.dismissButton.frame.height
            }, completion: nil)
    }
    
    func animateInComposeActions() {
        animateInAction(videoIcon, destination: CGPoint(x: 66.5, y: 201.5), delayTime: 0.15)
        animateInAction(videoIcon, destination: CGPoint(x: 66.5, y: 201.5), delayTime: 0.25)
        animateInAction(textIcon, destination: CGPoint(x: 65.5, y: 327.5), delayTime: 0.35)
        animateInAction(quoteIcon, destination: CGPoint(x: 255.5, y: 200.0), delayTime: 0.1)
        animateInAction(photoIcon, destination: CGPoint(x: 160.5, y: 200.5), delayTime: 0.2)
        animateInAction(linkIcon, destination: CGPoint(x: 255.5, y: 326.5), delayTime: 0.3)
        animateInAction(chatIcon, destination: CGPoint(x: 160.5, y: 328.0), delayTime: 0.4)
    }
    
    func animateInAction(icon: UIImageView, destination: CGPoint, delayTime: Double) {
        delay(delayTime) {
            let duration = 0.35
            let delay = 0.0
            let damping = CGFloat(0.9)
            let springVelocity = CGFloat(0)
            let easing = UIViewAnimationOptions.CurveEaseInOut
            
            UIView.animateWithDuration(duration, delay: delay, usingSpringWithDamping: damping, initialSpringVelocity: springVelocity, options: easing, animations: { () -> Void in
                icon.center = destination
            }, completion: nil)
        }
    }
    
    func animateOutComposeActions() {
        animateOutAction(videoIcon, destination: CGPoint(x: 66.5, y: 201.5), delayTime: 0.5)
        animateOutAction(videoIcon, destination: CGPoint(x: 66.5, y: 201.5), delayTime: 0.15)
        animateOutAction(textIcon, destination: CGPoint(x: 65.5, y: 327.5), delayTime: 0.25)
        animateOutAction(quoteIcon, destination: CGPoint(x: 255.5, y: 200.0), delayTime: 0.05)
        animateOutAction(photoIcon, destination: CGPoint(x: 160.5, y: 200.5), delayTime: 0.1)
        animateOutAction(linkIcon, destination: CGPoint(x: 255.5, y: 326.5), delayTime: 0.2)
        animateOutAction(chatIcon, destination: CGPoint(x: 160.5, y: 328.0), delayTime: 0.3)
    }
    
    func animateOutAction(icon: UIImageView, destination: CGPoint, delayTime: Double) {
        delay(delayTime) {
            let duration = 0.35
            let delay = 0.0
            let damping = CGFloat(0.9)
            let springVelocity = CGFloat(0)
            let easing = UIViewAnimationOptions.CurveEaseInOut
            
            UIView.animateWithDuration(duration, delay: delay, usingSpringWithDamping: damping, initialSpringVelocity: springVelocity, options: easing, animations: { () -> Void in
                icon.frame.origin.y = -150
            }, completion: { (Bool) -> Void in
                icon.hidden = true
            })
        }
    }
    
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
}
