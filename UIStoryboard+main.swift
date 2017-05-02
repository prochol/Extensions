//
//  UIStoryboard+main.swift
//
//
//  Created by prochol on 02.05.17.
//  Copyright © 2017. All rights reserved.
//

import UIKit.UIStoryboard

private var kMainStoryboardName: String {
    let info = NSBundle.mainBundle().infoDictionary
    
    if let value = info?["UIMainStoryboardFile"] as? String {
        return value
    }
    else {
        return "Main"//default name for main storyboard
    }
}

extension UIStoryboard {
    
    class var mainStoryboard: UIStoryboard {
        struct Static {
            static let instance: UIStoryboard = UIStoryboard(name: kMainStoryboardName)
        }
        return Static.instance
    }
    /// Naming rule, to share the resources of iPad / iPhone postfix: "_iPad" / "_iPhone"
    @objc(storyboardWithName:)
    class func storyboard(name: String) -> UIStoryboard {
        
        //there is no localized universal storyboard
        if let storyboardURL = NSBundle.mainBundle().URLForResource(name, withExtension: "storyboardc") {
            if NSFileManager.defaultManager().fileExistsAtPath(storyboardURL.path!) {//there is no localized universal storyboard
                return UIStoryboard(name: name)
            }
            //there is no universal storyboard
            if UIDevice.isIpad() {//there is no localized ipad storyboard
                let iPadStoryboardName = name + "_iPad"//Specified by the naming rule, to separate resources
                return UIStoryboard(name: iPadStoryboardName)
            }
            else {//there is no localized iphone storyboard
                let iPhoneStoryboardName = name + "_iPhone"//Specified by the naming rule, to separate resources
                return UIStoryboard(name: iPhoneStoryboardName)
            }
        }
        
        return UIStoryboard(name: name)
    }
    
    convenience init(name: String) {
        self.init(name: name, bundle: NSBundle.mainBundle())
    }
}
