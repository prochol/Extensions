//
// UIStoryboard+Init.swift
// DaTracker
//
// Created by Pavel Kuzmin on 10.10.2018.
// Copyright © 2018 Prochol. All rights reserved.
//

import UIKit.UIStoryboard

extension UIStoryboard {
    convenience init(name: String) {
        self.init(name: name, bundle: Bundle.main)
    }
}
