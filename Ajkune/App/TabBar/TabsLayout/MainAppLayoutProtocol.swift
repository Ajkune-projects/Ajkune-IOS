//
//  MainAppLayoutProtocol.swift

//
//  Created by Djellza Rrustemi
//

import UIKit

protocol MainAppLayoutProtocol {
    var parentCoordinator: TDCoordinatorDelegate? {get set}
    var orderedTabs:  [TabLayout] {get}
}

// Main Class that returns the supported tab bars for the Home Screen
class MainAppLayout: MainAppLayoutProtocol {
    var parentCoordinator: TDCoordinatorDelegate?
    var orderedTabs: [TabLayout] {
        get {
            return [
                HomeTabLayout(coordinator: HomeTabCoordinator(viewModel: HomeTabViewModel())), OfferTabLayout(coordinator: OfferTabCoordinator(viewModel: OfferTabViewModel())),
                HomeTabLayout(coordinator: HomeTabCoordinator(viewModel: HomeTabViewModel())), HomeTabLayout(coordinator: HomeTabCoordinator(viewModel: HomeTabViewModel())), SettingsTabLayout(coordinator: SettingsTabCoordinator(viewModel: SettingsTabViewModel())), 
            ]
        }
    }
}