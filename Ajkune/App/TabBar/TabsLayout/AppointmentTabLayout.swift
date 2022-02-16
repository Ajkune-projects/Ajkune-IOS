//
//  AppointmentTabLayout.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/16/22.
//

import Foundation
import UIKit

/**
 Class for Notifications TabLayout
 - Parameters:
     - Coorindator: DefaultCoordinator that handles routing for the Notifications Tab Bar
 */
class AppointmentTabLayout<C:TDDefaultCoordinator> : TabLayout {
    
    let coordinator : C
    init(coordinator:C) {
        self.coordinator = coordinator
    }

    var tabIdentifier : String {
        return "AppointmentTab"
    }
    
    func tabBarItem() -> UITabBarItem {
        return UITabBarItem(title: "Appointment", image: UIImage(named: "deselectedAppointment"), selectedImage: UIImage(named: "selectedAppointment"))
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
