//
//  ModalViewController.swift
//  Demo
//
//  Created by Andrea Mazzini on 13/05/15.
//  Copyright (c) 2015 Fancy Pixel. All rights reserved.
//

import UIKit
//import BubbleTransition

class ModalViewController: UIViewController {
  @IBOutlet weak var closeButton: UIButton!
  weak var interactiveTransition: BubbleInteractiveTransition?
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.dismiss(animated: false, completion: {
            let  mainView = UIStoryboard(name:"Main", bundle: nil)
            let controller  = mainView.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.rootViewController = controller
        })
    }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    UIApplication.shared.setStatusBarStyle(.lightContent, animated: true)
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    UIApplication.shared.setStatusBarStyle(.default, animated: true)
  }
}
