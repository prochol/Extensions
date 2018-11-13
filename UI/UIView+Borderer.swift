//
// UIView+Borderer.swift
// DaTracker
//
// Created by Pavel Kuzmin on 12.10.2018.
// Copyright © 2018 Prochol. All rights reserved.
//

import UIKit.UIView
import CoreGraphics

extension UIView {
    enum EdgeBorder {
        case top, right, bottom, left
    }

    func addTopBorder(withColor color: UIColor, width: CGFloat) {
        self.addBorder(.top, withColor: color, width: width)
    }

    func addRightBorder(withColor color: UIColor, width: CGFloat) {
        self.addBorder(.right, withColor: color, width: width)
    }

    func addBottomBorder(withColor color: UIColor, width: CGFloat) {
        self.addBorder(.bottom, withColor: color, width: width)
    }

    func addLeftBorder(withColor color: UIColor, width: CGFloat) {
       self.addBorder(.left, withColor: color, width: width)
    }

    func addBorder(_ edge: EdgeBorder, withColor color: UIColor, width: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        self.addSubview(border)
        border.translatesAutoresizingMaskIntoConstraints = false
        border.snp.makeConstraints { (make) -> Void in
            switch edge {
            case .top:
                make.top.equalTo(0)
                make.left.equalTo(0)
                make.right.equalTo(0)
                make.height.equalTo(width)
            case .right:
                make.bottom.equalTo(0)
                make.top.equalTo(0)
                make.right.equalTo(0)
                make.width.equalTo(width)
            case .bottom:
                make.bottom.equalTo(0)
                make.left.equalTo(0)
                make.right.equalTo(0)
                make.height.equalTo(width)
            case .left:
                make.bottom.equalTo(0)
                make.top.equalTo(0)
                make.left.equalTo(0)
                make.width.equalTo(width)
            }
        }
    }
}
