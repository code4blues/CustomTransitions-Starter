//
//  GreenViewController.swift
//  CustomTransitions-Starter
//
//  Created by mrahmiao on 10/7/14.
//  Copyright (c) 2014 code4blues. All rights reserved.
//

import UIKit

class GrennViewController: UIViewController {
  @IBAction func dismiss(sender: AnyObject) {
    presentingViewController.dismissViewControllerAnimated(true, completion: nil)
  }
}
