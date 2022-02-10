//
//  ProfileLayout.swift

//
//  Created by Djellza Rrustemi
//

import UIKit

// Protocol that each tab bar needs to confirm to
protocol TabLayout {
    var tabIdentifier : String {get}
    func tabBarItem() -> UITabBarItem
    func tabViewController() -> UIViewController?
    func tabViewCoordinator() -> TDCoordinator
    func imageInsets() -> UIEdgeInsets
}
