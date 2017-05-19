//
//  ViewController.swift
//  UIStoryboard-main
//
//  Created by Kuzmin on 19.05.17.
//  Copyright © 2017 Kuzmin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func openMainInitial() {
        if let rootWindow = UIApplication.shared.delegate?.window {
            let storyboard = UIStoryboard.main
            if let viewController = storyboard.instantiateInitialViewController() {
                UIView.transition(with: rootWindow!, duration: 0.5, options: .transitionCrossDissolve, animations: {
                    rootWindow?.rootViewController = viewController
                }, completion: nil)
            }
        }
    }
    
    @IBAction func openMainIDVC() {
        if let rootWindow = UIApplication.shared.delegate?.window {
            let storyboard = UIStoryboard.main
            let viewController = storyboard.instantiateViewController(withIdentifier: "IDVC")
            UIView.transition(with: rootWindow!, duration: 0.5, options: .transitionCrossDissolve, animations: {
                rootWindow?.rootViewController = viewController
            }, completion: nil)
        }
    }

    @IBAction func openFirstInitial() {
        if let rootWindow = UIApplication.shared.delegate?.window {
            let storyboard = UIStoryboard(name: "FirstStoryboard")
            if let viewController = storyboard.instantiateInitialViewController() {
                UIView.transition(with: rootWindow!, duration: 0.5, options: .transitionCrossDissolve, animations: {
                    rootWindow?.rootViewController = viewController
                }, completion: nil)
            }
        }
    }
    
    @IBAction func openFirstIDVC() {
        if let rootWindow = UIApplication.shared.delegate?.window {
            let storyboard = UIStoryboard.storyboard(name: "FirstStoryboard")
            let viewController = storyboard.instantiateViewController(withIdentifier: "IDVC")
            UIView.transition(with: rootWindow!, duration: 0.5, options: .transitionCrossDissolve, animations: {
                rootWindow?.rootViewController = viewController
            }, completion: nil)
        }
    }
}

