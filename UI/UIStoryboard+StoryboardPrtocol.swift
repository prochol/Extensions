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


extension UIStoryboard {
    func instantiateViewController<T: UIViewController>(with: T.Type) throws -> T {
        guard let viewController = self.instantiateViewController(withIdentifier: String(describing: T.self)) as? T else {
            throw StoryboardError.notFoundViewController(identifier: String(describing: T.self))
        }
        
        return viewController
    }
}


enum StoryboardError: Error {
    case notFoundViewController(identifier: String)
}


extension StoryboardError {
    var localizedDescription: String {
        switch self {
        case .notFoundViewController(let identifier):
            return "Could not dequeue View Controller with identifier: " + identifier
        }
    }
}
