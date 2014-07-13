//
//  GravityCollisionAnimationController.swift
//  CustomTransitions-Starter
//
//  Created by mrahmiao on 11/7/14.
//  Copyright (c) 2014 code4blues. All rights reserved.
//

import UIKit

class GravityCollisionAnimator: NSObject, UIViewControllerAnimatedTransitioning {
  func transitionDuration(transitionContext: UIViewControllerContextTransitioning!) -> NSTimeInterval {
    return 1.5
  }
  
  func animateTransition(transitionContext: UIViewControllerContextTransitioning!) {
    // 1. 准备过渡动画中必要的组件
    let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
    let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
    let toView = transitionContext.viewForKey(UITransitionContextToViewKey)
    let finalFrame = transitionContext.finalFrameForViewController(toVC)
    let screenBounds = UIScreen.mainScreen().bounds

    // containerView是过渡中所有view的一个容器
    let containerView = transitionContext.containerView()
    
    /* 2. 在过渡动画中出现的view必须都在containerView中
     *    这里将需要展示的view放到了屏幕的正上方
     *    注意iOS设备坐标系的原点(0,0)位于屏幕的左上角，所以要乘以-1.0
     *    同时在过渡的时候将背景设置为半透明
     */
    fromVC.view.alpha = 0.5
    toView.frame = CGRectOffset(finalFrame, 0, -1.0 * CGRectGetHeight(screenBounds))
    containerView.addSubview(toView)
    
    // 3. 准备过渡动画中的物理动态效果
    var animator: UIDynamicAnimator? = UIDynamicAnimator(referenceView: containerView)
    let gravity = UIGravityBehavior(items: [toView])
    gravity.magnitude = 10
    let collision = UICollisionBehavior(items: [toView])
    collision.addBoundaryWithIdentifier("GravityBoundary",
      fromPoint: CGPoint(x: 0, y: screenBounds.height),
      toPoint: CGPoint(x: screenBounds.width, y: screenBounds.height))
    let animatorItem = UIDynamicItemBehavior(items: [toView])
    animatorItem.elasticity = 0.5
    
    animator!.addBehavior(gravity)
    animator!.addBehavior(collision)
    animator!.addBehavior(animatorItem)
    
    // 4. 因为没有completionHandler，
    //    所以需要手动在设定的过渡动画持续时间之后通知系统过渡动画已经完成
    //    恢复背景的透明度
    let nanoSeconds = UInt64(transitionDuration(transitionContext)) * NSEC_PER_SEC
    let delay = dispatch_time(DISPATCH_TIME_NOW, Int64(nanoSeconds))
    dispatch_after(delay, dispatch_get_main_queue()) {
      animator = nil
      fromVC.view.alpha = 1.0
      transitionContext.completeTransition(true)
    }
  }
}
