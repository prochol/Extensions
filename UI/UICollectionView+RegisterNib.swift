//
// UICollectionView+RegisterNib.swift
// DaTracker
//
// Created by Pavel Kuzmin on 05.10.2018.
// Copyright © 2018 Gaika Group. All rights reserved.
//

import UIKit.UICollectionView

extension UICollectionView {

    func register<T: UICollectionViewCell>(_: T.Type) where T: IReusable {
        register(T.self, forCellWithReuseIdentifier: T.reuseIdentifier)
    }

    func register<T: UICollectionViewCell>(_: T.Type) where T: IReusable, T: INibView {
        register(T.nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(_:T.Type, for indexPath: IndexPath) -> T where T: IReusable {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(String(describing: T.self))")
        }

        return cell
    }
}