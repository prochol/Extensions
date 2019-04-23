//
// TimeInterval+String.swift
// DaTracker
//
// Created by Pavel Kuzmin on 05.10.2018.
// Copyright © 2018 Gaika Group. All rights reserved.
//

import Foundation.NSDate

extension TimeInterval {
    func stringValue() -> String {
        let currentHours = self.isFinite ? Int(self / 3600) : 0
        let currentMinutes = self.isFinite ? Int(self / 60)  - currentHours * 60 : 0
        let currentSeconds = self.isFinite ? Int(self) % 60 : 0

        let currentTimeString = currentHours > 0 ? String.init(format: "%i:%02d:%02d", currentHours, currentMinutes, currentSeconds) : String.init(format: "%02d:%02d", currentMinutes, currentSeconds)

        return currentTimeString
    }

    func stringLongValue() -> String {
        let currentHours = self.isFinite ? Int(self / 3600) : 0
        let currentMinutes = self.isFinite ? Int(self / 60)  - currentHours * 60 : 0
        let currentSeconds = self.isFinite ? Int(self) % 60 : 0

        var currentTimeString = "0 sec"

        if currentHours > 0 {
            if currentMinutes > 0 {
                currentTimeString = currentSeconds > 0 ? String.init(format: "%i hours %02d min %02d sec", currentHours, currentMinutes, currentSeconds) : String.init(format: "%i hours %02d min ", currentHours, currentMinutes)
            }
            else {
                currentTimeString = currentSeconds > 0 ? String.init(format: "%i hours %02d sec", currentHours, currentSeconds) : String.init(format: "%i hours", currentHours)
            }
        }
        else {
            if currentMinutes > 0 {
                currentTimeString = currentSeconds > 0 ? String.init(format: "%02d min %02d sec", currentMinutes, currentSeconds) : String.init(format: "%02d min ", currentMinutes)
            }
            else {
                currentTimeString = String.init(format: "%02d sec", currentSeconds)
            }
        }

        return currentTimeString
    }
}