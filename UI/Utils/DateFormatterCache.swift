//
// DateFormatterCache.swift
// DaTracker
//
// Created by Pavel Kuzmin on 16.10.2018.
// Copyright © 2018 Prochol. All rights reserved.
//

import Foundation

class DateFormatterCache {
    static let instance = DateFormatterCache()

    private var formatters = [String : DateFormatter]()

    func formatter(withFormat format: String) -> DateFormatter {
        if let cached = formatters[format] {
            return cached
        }

        let formatter = DateFormatter()
        formatter.dateFormat = format

        formatters[format] = formatter

        return formatter
    }
}
