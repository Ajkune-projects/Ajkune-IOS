//
//  CongratsCoordinator.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/15/22.
//

import Foundation
import UIKit
class CongratsCoordinator: TDModalCoordinator {
    
    var destinationNavigationController: UINavigationController?
    var configuration: ((CongratsViewController) -> ())?
    var viewController : CongratsViewController?
    var navigationController: UINavigationController?
    var viewModel : CongratsViewModelProtocol

    
    init(viewModel: CongratsViewModelProtocol, navigationController:UINavigationController?, details :GiftListElement) {
        self.viewModel = viewModel
//        self.viewModel.coordinatorDelegate = self
        self.navigationController = navigationController
        self.viewController = CongratsViewController.instantiate(.congrats)
        self.viewController?.viewModel = viewModel
        self.destinationNavigationController = self.viewController?.navigationController
        self.viewController?.giftDetails = details
    }
}
