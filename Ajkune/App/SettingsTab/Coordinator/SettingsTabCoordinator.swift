//
//  SettingsTabCoordinator.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/9/22.
//
import UIKit

class SettingsTabCoordinator: TDDefaultCoordinator{
    var viewController : SettingsTabViewController?
    var viewModel : SettingsTabViewModelProtocol
    var profileCoordinator: ProfileCoordinator?
    var languageCoordinator:LanguageCoordinator?
    var myGiftsCoordinator:MyGiftsCoordinator?
    
    init(viewModel: SettingsTabViewModelProtocol = SettingsTabViewModel()) {
        self.viewModel = viewModel
        self.viewModel.coordinatorDelegate = self
    }
    
    func start() {
        self.viewController = SettingsTabViewController.instantiate(.settingsTab)
        self.viewController?.viewModel = self.viewModel
    }
}

extension SettingsTabCoordinator: SettingsTabViewModelCoordinatorDelegate{
    func showProfile() {
        profileCoordinator = ProfileCoordinator(viewModel:ProfileViewModel(), navigationController: self.viewController?.navigationController)
        profileCoordinator?.start()
    }
    func showLanguage() {
        languageCoordinator = LanguageCoordinator(viewModel:LanguageViewModel(), navigationController: self.viewController?.navigationController)
        languageCoordinator?.start()
    }
    func showMyGifts() {
        myGiftsCoordinator = MyGiftsCoordinator(viewModel:MyGiftsViewModel(), navigationController: self.viewController?.navigationController)
        myGiftsCoordinator?.start()
    }
}
