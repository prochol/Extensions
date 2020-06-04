//
//  UINavigationController.swift
//  Flowwow
//
//  Created by prochol on 04.06.2020.
//  Copyright © 2020 Ursanotsomajor. All rights reserved.
//

import Foundation


extension UINavigationController {
    func popViewController(animated: Bool, completion: @escaping (() -> Void)) {
        popViewController(animated: animated)

        if let coordinator = transitionCoordinator, animated {
            coordinator.animate(alongsideTransition: nil) { _ in
                completion()
            }
        } else {
            completion()
        }
    }
}
