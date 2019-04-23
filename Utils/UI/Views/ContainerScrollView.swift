//
// ContainerScrollView.swift
// DaTrackerFramework
//
// Created by Pavel Kuzmin on 22.11.2018.
// Copyright © 2018 Pavel Kuzmin. All rights reserved.
//

import UIKit.UIView

class ContainerScrollView: UIView {
    @IBOutlet private weak var scrollView: UIScrollView!

    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        if self.scrollView.point(inside: point, with: event) && super.hitTest(point, with: event) != self {
            return super.hitTest(point, with: event)
        }
        else {
            let convertPoint = self.convert(point, to: self.scrollView)

            for subviewScroll in self.scrollView.subviews  {
                let convertPointSubview = self.scrollView.convert(convertPoint, to: subviewScroll)

                if subviewScroll is UICollectionViewCell {
                    if subviewScroll.point(inside: convertPointSubview, with: event) {
                        return subviewScroll.hitTest(convertPointSubview, with: event)
                    }
                }
                else if subviewScroll is PrepareIndentView {
                    if subviewScroll.point(inside: convertPointSubview, with: event) {
                        return subviewScroll.hitTest(convertPointSubview, with: event)
                    }
                }
                else if subviewScroll is PeopleNameView {
                    if subviewScroll.point(inside: convertPointSubview, with: event) {
                        return subviewScroll.hitTest(convertPointSubview, with: event)
                    }
                }
                else if subviewScroll is UILabel, let _ = subviewScroll.gestureRecognizers {
                    if subviewScroll.point(inside: convertPointSubview, with: event) {
                        return subviewScroll
                    }
                }
            }

            return self.scrollView
        }
    }
}
