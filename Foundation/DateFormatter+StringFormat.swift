//
// DateFormatter+StringFormat.swift
// DaTracker
//
// Created by Pavel Kuzmin on 16.10.2018.
// Copyright © 2018 Gaika Group. All rights reserved.
//

import Foundation.NSDateFormatter

extension DateFormatter {
    static func withFormat(_ format: String) -> DateFormatter {
        return DateFormatterCache.instance.formatter(withFormat: format)
    }
}