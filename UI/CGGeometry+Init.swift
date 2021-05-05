//
//  CGGeometry+Init.swift
//  FlowwowCommon
//
//  Created by Pavel Kuzmin on 05.05.2021.
//  Copyright © 2021 Flowwow. All rights reserved.
//

import CoreGraphics


extension CGPoint
{
    public init(all: CGFloat) {
        self.init(x: all, y: all)
    }
}


extension CGSize
{
    public init(all: CGFloat) {
        self.init(width: all, height: all)
    }
}
