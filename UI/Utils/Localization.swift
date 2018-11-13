//
// Localization.swift
// DaTracker
//
// Created by Pavel Kuzmin on 08.10.2018.
// Copyright © 2018 Prochol. All rights reserved.
//

import Foundation

func LS(_ key: String, table: String? = nil) -> String {
    return NSLocalizedString(key, tableName: table, comment: "")
}
