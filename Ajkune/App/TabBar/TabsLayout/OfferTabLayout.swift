//
//  OfferTabLayout.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/13/22.
//

import Foundation
import UIKit

/**
 Class for Notifications TabLayout
 - Parameters:
     - Coorindator: DefaultCoordinator that handles routing for the Notifications Tab Bar
 */
class OfferTabLayout<C:TDDefaultCoordinator> : TabLayout {
    
    let coordinator : C
    init(coordinator:C) {
        self.coordinator = coordinator
    }

    var tabIdentifier : String {
        return "OfferTab"
    }
    
    func tabBarItem() -> UITabBarItem {
        return UITabBarItem(title: "OfferTab".localized, image: UIImage(named: "deselectedOffer"), selectedImage: UIImage(named: "selectedOffer"))
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
