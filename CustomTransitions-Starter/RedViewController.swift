//
//  RedViewController.swift
//  CustomTransitions-Starter
//
//  Created by mrahmiao on 9/7/14.
//  Copyright (c) 2014 code4blues. All rights reserved.
//

import UIKit

class RedViewController: UIViewController {
  @IBAction func dismiss(_: AnyObject) {
    presentingViewController.dismissModalViewControllerAnimated(true)
  }
}
