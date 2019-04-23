//
// Date+Components.swift
// DaTracker
//
// Created by Pavel Kuzmin on 2018-12-10.
// Copyright © 2018 Gaika Group. All rights reserved.
//

import Foundation

extension Date {

    var second: Int {
        return Calendar.current.component(.second, from: self)
    }

    var minute: Int {
        return Calendar.current.component(.minute, from: self)
    }

    var hour: Int {
        return Calendar.current.component(.hour, from: self)
    }

    var day: Int {
        return Calendar.current.component(.day, from: self)
    }

    var weekday: Int {
        return Calendar.current.component(.weekday, from: self)
    }

    var month: Int {
        return Calendar.current.component(.month, from: self)
    }

    var year: Int {
        return Calendar.current.component(.year, from: self)
    }

    func dateAtStartDay() -> Date {
        return Calendar.current.startOfDay(for: self)
    }

    func date(byAddingDays days: Int) -> Date {
        var components = DateComponents()
        components.setValue(days, for: .day)
        return Calendar.current.date(byAdding: components, to: self) ?? self
    }

    func date(bySubtractingDays days: Int) -> Date {
        return self.date(byAddingDays: -days)
    }

    func date(byAddingMonths months: Int) -> Date {
        var components = DateComponents()
        components.setValue(months, for: .month)
        return Calendar.current.date(byAdding: components, to: self) ?? self
    }

    func date(bySubtractingMonths months: Int) -> Date {
        return self.date(byAddingMonths: -months)
    }

    func dateAtStartMonth() -> Date {
        var components = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)
        components.day = 1
        return Calendar.current.date(from: components) ?? self
    }

    func dateAtEndMonth() -> Date {
        return self.dateAtStartMonth().date(byAddingMonths: 1).date(bySubtractingDays: 1)
    }
}