//
//  SettingsTabViewModelProtocol.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/9/22.
//

import Foundation

protocol SettingsTabViewModelProtocol : BaseViewModel {
    var coordinatorDelegate : SettingsTabViewModelCoordinatorDelegate? {get set}
    func showProfile()
    func showLanguage()
}
