//
// UIStoryboard+StoryboardPrtocol.swift
// DaTracker
//
// Created by Pavel Kuzmin on 18.10.2018.
// Copyright © 2018 Prochol. All rights reserved.
//

import UIKit.UIStoryboard

extension UIStoryboard {
    enum Names: String {
        case main
        
        fileprivate var filename: String {
            let first = String(rawValue.substring(to: rawValue.index(rawValue.startIndex, offsetBy: 1))).capitalized//!!! rawValue.capitalized "newRecord" => "NewRecord"
            let other = String(rawValue.substring(from: rawValue.index(rawValue.startIndex, offsetBy: 1)))
            return first + other
        }
    }

    convenience init(name: Names) {
        self.init(name: name.filename)
    }
}
