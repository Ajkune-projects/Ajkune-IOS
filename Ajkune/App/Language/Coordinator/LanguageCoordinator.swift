//
//  LanguageCoordinator.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/12/22.
//


import Foundation
import UIKit

class LanguageCoordinator: TDPushCoordinator{

    var configuration: ((LanguageViewController) -> ())?
    var viewController : LanguageViewController?
    var navigationController: UINavigationController?
    var viewModel : LanguageViewModelProtocol
    var homeTabCoordinator: HomeTabCoordinator?

    
    init(viewModel: LanguageViewModelProtocol, navigationController:UINavigationController?) {
        self.viewModel = viewModel
        self.viewModel.coordinatorDelegate = self
        self.navigationController = navigationController
        self.viewController = LanguageViewController.instantiate(.language)
//        self.viewController?.id = id
        self.viewController?.viewModel = viewModel
    }
}

extension LanguageCoordinator:LanguageViewModelCoordinatorDelegate{
}
