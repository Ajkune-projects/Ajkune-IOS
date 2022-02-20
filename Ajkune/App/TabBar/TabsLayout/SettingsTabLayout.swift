//
//  SettingsTabLayout.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/9/22.
//

import UIKit

/**
 Class for Notifications TabLayout
 - Parameters:
     - Coorindator: DefaultCoordinator that handles routing for the Notifications Tab Bar
 */
class SettingsTabLayout<C:TDDefaultCoordinator> : TabLayout {
    
    let coordinator : C
    init(coordinator:C) {
        self.coordinator = coordinator
    }

    var tabIdentifier : String {
        return "SettingsTab"
    }
    
    func tabBarItem() -> UITabBarItem {
        return UITabBarItem(title: "AccountTab".localized, image: UIImage(named: "deselectedSettings"), selectedImage: UIImage(named: "selectedSettings"))
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
