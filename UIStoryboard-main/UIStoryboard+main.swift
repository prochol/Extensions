//
//  UIStoryboard+main.swift
//  UIStoryboard-main
//
//  Created by prochol on 02.05.17.
//  Copyright © 2017 Prochol. All rights reserved.
//

import UIKit.UIStoryboard

private var kMainStoryboardName: String {
    let info = Bundle.main.infoDictionary
    
    if let value = info?["UIMainStoryboardFile"] as? String {
        return value
    }
    else {
        print("Default name for main storyboard not specified in the project settings.")
        return "Main"//default name for main storyboard (usually created with that name)
    }
}

extension UIStoryboard {
    
    class var main: UIStoryboard {
        struct Static {
            static let instance: UIStoryboard = UIStoryboard(name: kMainStoryboardName)
        }
        return Static.instance
    }
    /// Naming rule, to share the resources of iPad / iPhone postfix: "_iPad" / "_iPhone"
    @objc(storyboardWithName:)
    class func storyboard(name: String) -> UIStoryboard {
        
        //there is no localized universal storyboard
        if let storyboardURL = Bundle.main.url(forResource: name, withExtension: "storyboardc") {
            if FileManager.default.fileExists(atPath: storyboardURL.path) {//there is no localized universal storyboard
                return UIStoryboard(name: name)
            }
            //there is no universal storyboard
            if UIDevice().userInterfaceIdiom == .pad {//there is no localized ipad storyboard
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
        self.init(name: name, bundle: Bundle.main)
    }
}
