//
//  SettingsViewModel.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/9/22.
//

import Foundation
class SettingsTabViewModel: SettingsTabViewModelProtocol{
    var coordinatorDelegate: SettingsTabViewModelCoordinatorDelegate?
    
    func showProfile() {
        coordinatorDelegate?.showProfile()
    }
    func showLanguage() {
        coordinatorDelegate?.showLanguage()
    }
    
    func showMyGifts() {
        coordinatorDelegate?.showMyGifts()
    }
}
