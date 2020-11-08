//
//  ViewController.swift
//  CircularSplash
//
//  Created by Dhara Patel on 07/11/20.
//

import UIKit

class ViewController: UIViewController,UIViewControllerTransitioningDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let bubble: BubbleTransition = BubbleTransition()
        
        bubble.startingPoint = CGPoint(x: 0, y: 0)
        bubble.transitionMode = TransitionMode.Present
        bubble.bubbleColor = UIColor.black
    }

    
}

