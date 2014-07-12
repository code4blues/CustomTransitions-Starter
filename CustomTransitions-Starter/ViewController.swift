//
//  ViewController.swift
//  CustomTransitions-Starter
//
//  Created by mrahmiao on 9/7/14.
//  Copyright (c) 2014 code4blues. All rights reserved.
//

import UIKit

class ViewController: UITableViewController, UIViewControllerTransitioningDelegate {
  
  var gravityCollisionAnmiator: GravityCollisionAnimator!

  init(coder aDecoder: NSCoder!) {
    super.init(coder: aDecoder)
    gravityCollisionAnmiator = GravityCollisionAnimator()
  }
  
  override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
    if (segue.identifier == "ShowRed") {
      let destinationVC = segue.destinationViewController as UIViewController
      destinationVC.transitioningDelegate = self
    }
  }
  
  func animationControllerForPresentedController(presented: UIViewController!, presentingController presenting: UIViewController!, sourceController source: UIViewController!) -> UIViewControllerAnimatedTransitioning! {
    return gravityCollisionAnmiator
  }
  
  

}

