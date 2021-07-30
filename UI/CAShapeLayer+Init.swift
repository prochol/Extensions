//
//  CAShapeLayer+Init.swift
//  FlowwowCommon
//
//  Created by Pavel Kuzmin on 30.07.2021.
//  Copyright © 2021 Flowwow. All rights reserved.
//

import UIKit


extension CAShapeLayer
{
    public convenience init(size: CGSize,
                            roundingCorners corners: UIRectCorner, cornerRadius: CGFloat) {
        let bounds = CGRect(origin: .zero, size: size)
        let borderPath = UIBezierPath(roundedRect: bounds,
                                      byRoundingCorners: corners,
                                      cornerRadii: CGSize(all: cornerRadius))
        self.init(path: borderPath)
    }
    
    public convenience init(path: UIBezierPath) {
        self.init()
        self.path = path.cgPath
    }
}
