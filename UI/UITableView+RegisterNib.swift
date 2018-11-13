//
// UITableView+RegisterNib.swift
// DaTracker
//
// Created by Pavel Kuzmin on 10.10.2018.
// Copyright © 2018 Prochol. All rights reserved.
//

import UIKit.UITableView

extension UITableView {

    func register<T: UITableViewCell>(_: T.Type) where T: IReusable {
        register(T.self, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func register<T: UITableViewCell>(_: T.Type) where T: IReusable, T: INibView {
        register(T.nib, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(_: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(String(describing: T.self))")
        }

        return cell
    }
}
