//
// Reusable.swift
// DaTracker
//
// Created by Pavel Kuzmin on 12.10.2018.
// Copyright © 2018 Prochol. All rights reserved.
//

import Foundation

protocol IReusable: class {
    static var reuseIdentifier: String { get }
}

extension IReusable {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
