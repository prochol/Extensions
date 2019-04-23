//
// ChildSegue.swift
// DaTrackerFramework
//
// Created by Pavel Kuzmin on 2019-02-26.
// Copyright © 2019 Pavel Kuzmin. All rights reserved.
//

import UIKit

class ChildSegue: UIStoryboardSegue {
    override func perform() {
        //Removing all children
        if self.source.children.count > 0 {
            self.source.children.forEach {
                $0.willMove(toParent: nil)
                $0.view.removeFromSuperview()
                $0.removeFromParent()
            }
        }
        //Added destination in children
        self.source.addChild(self.destination)

        self.destination.view.translatesAutoresizingMaskIntoConstraints = false
        self.destination.view.frame = CGRect(x: 0, y: 0, width: self.source.view.frame.size.width, height: self.source.view.frame.size.height)

        self.source.view.addSubview(self.destination.view)

        NSLayoutConstraint(item: self.destination.view, attribute: NSLayoutConstraint.Attribute.top, relatedBy: NSLayoutConstraint.Relation.equal, toItem:  self.source.view, attribute: NSLayoutConstraint.Attribute.top, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.destination.view, attribute: NSLayoutConstraint.Attribute.left, relatedBy: NSLayoutConstraint.Relation.equal, toItem:  self.source.view, attribute: NSLayoutConstraint.Attribute.left, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.destination.view, attribute: NSLayoutConstraint.Attribute.right, relatedBy: NSLayoutConstraint.Relation.equal, toItem:  self.source.view, attribute: NSLayoutConstraint.Attribute.right, multiplier: 1, constant: 0).isActive = true
        NSLayoutConstraint(item: self.destination.view, attribute: NSLayoutConstraint.Attribute.bottom, relatedBy: NSLayoutConstraint.Relation.equal, toItem:  self.source.view, attribute: NSLayoutConstraint.Attribute.bottom, multiplier: 1, constant: 0).isActive = true

        self.destination.didMove(toParent: self.source)
    }
}
