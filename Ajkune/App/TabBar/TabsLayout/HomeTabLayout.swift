//
//  TDHomeTabLayout.swift
//
//  Created by Djellza Rrustemi
//

import UIKit

/**
 Class for Notifications TabLayout
 - Parameters:
     - Coorindator: DefaultCoordinator that handles routing for the Notifications Tab Bar
 */
class HomeTabLayout<C:TDDefaultCoordinator> : TabLayout {
    
    let coordinator : C
    init(coordinator:C) {
        self.coordinator = coordinator
    }

    var tabIdentifier : String {
        return "HomeTab"
    }
    
    func tabBarItem() -> UITabBarItem {
        return UITabBarItem(title: "Home", image: UIImage(named: "deselectedHome"), selectedImage: UIImage(named: "selectedHome"))
    }
    
    func imageInsets() -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func tabViewController() -> UIViewController? {
        return self.coordinator.viewController
    }
    
    func tabViewCoordinator() -> TDCoordinator {
        return self.coordinator
    }
}
