//
//  HomeTabViewModel.swift
//
//
//  Created by Djellza Rrustemi
//

import Foundation
class HomeTabViewModel: HomeTabViewModelProtocol{
    weak var coordinatorDelegate : HomeTabViewModelCoordinatorDelegate?
    
    func HomeTabShown() {
        coordinatorDelegate?.HomeTabShown()
    }
}
