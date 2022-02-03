//
//  NotificationsLayout.swift
//  Bayyinah
//
//  Created by Drenushe Imeraj on 4.2.20.
//  Copyright © 2020 Zombie Soup. All rights reserved.
//

import UIKit

/**
 Class for Notifications TabLayout
 - Parameters:
     - Coorindator: DefaultCoordinator that handles routing for the Notifications Tab Bar
 */
class TDHomeTabLayout<C:TDDefaultCoordinator> : TabLayout {
    
    let coordinator : C
    init(coordinator:C) {
        self.coordinator = coordinator
    }

    var tabIdentifier : String {
        return "HomeTab"
    }
    
    func tabBarItem() -> UITabBarItem {
        return UITabBarItem(title: nil, image: UIImage(named: "deselectedHome"), selectedImage: UIImage(named: "selectedHomeT"))
    }
    
    func imageInsets() -> UIEdgeInsets {
        return UIEdgeInsets(top: 5, left: 0, bottom: -5, right: 0)
    }
    
    func tabViewController() -> UIViewController? {
        return self.coordinator.viewController
    }
    
    func tabViewCoordinator() -> TDCoordinator {
        return self.coordinator
    }
}
