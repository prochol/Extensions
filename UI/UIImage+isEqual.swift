//
// UIImage+isEqual.swift
// DaTracker
//
// Created by Pavel Kuzmin on 2019-01-10.
// Copyright © 2019 Prochol. All rights reserved.
//

import UIKit.UIImage

extension UIImage {
    func isEqual(to image: UIImage) -> Bool {
        guard let selfData: Data = self.pngData(), let imageData: Data = image.pngData() else {
            return false
        }

        return selfData == imageData
    }
}
