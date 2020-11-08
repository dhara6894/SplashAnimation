//
//  AppDelegate.swift
//  CircularSplash
//
//  Created by Dhara Patel on 07/11/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let transition = BubbleTransition()
    let interactiveTransition = BubbleInteractiveTransition()
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      
        DispatchQueue.main.async {
            let  mainView = UIStoryboard(name:"Main", bundle: nil)
            let controller  = mainView.instantiateViewController(withIdentifier: "ModalViewController") as! ModalViewController
            controller.transitioningDelegate = self
            controller.modalPresentationStyle = .custom
            controller.modalPresentationCapturesStatusBarAppearance = true
            controller.interactiveTransition = self.interactiveTransition
            self.interactiveTransition.attach(to: controller)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController?.present(controller, animated: true, completion: nil)

        }
                return true
    }

}

extension AppDelegate: UIViewControllerTransitioningDelegate {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
      transition.transitionMode = .present
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        transition.startingPoint = CGPoint(x:  appDelegate.window?.rootViewController?.view.frame.width ?? 0, y: appDelegate.window?.rootViewController?.view.frame.height ?? 0)
      transition.bubbleColor = UIColor.black
      return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
      transition.transitionMode = .dismiss
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
      transition.startingPoint = CGPoint(x:  appDelegate.window?.rootViewController?.view.frame.width ?? 0, y: appDelegate.window?.rootViewController?.view.frame.height ?? 0)
      transition.bubbleColor = UIColor.blue
      return transition
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
      return interactiveTransition
    }
}
