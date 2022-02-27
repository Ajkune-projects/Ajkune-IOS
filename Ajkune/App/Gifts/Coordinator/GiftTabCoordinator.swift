//
//  GiftCoordinator.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/13/22.
//

import UIKit

class GiftTabCoordinator: TDDefaultCoordinator{
    var viewController : GiftTabViewController?
    var viewModel : GiftTabViewModelProtocol
    var luckyWheelCoordinator: LuckyWheelCoordinator?
    var initialScreen : TDInitialScreenCoordinator?
    
    init(viewModel: GiftTabViewModelProtocol = GiftTabViewModel()) {
        self.viewModel = viewModel
        self.viewModel.coordinatorDelegate = self
    }
    
    func start() {
        self.viewController = GiftTabViewController.instantiate(.giftTab)
        self.viewController?.viewModel = self.viewModel
    }
}

extension GiftTabCoordinator: GiftTabViewModelCoordinatorDelegate{
    func showGiftScreen() {
        luckyWheelCoordinator = LuckyWheelCoordinator(viewModel: LuckyWheelViewModel(), navigationController: self.viewController?.navigationController)
        luckyWheelCoordinator?.start()
    }
    func showInitialScreen(){
        initialScreen = TDInitialScreenCoordinator(viewModel: TDInitialScreenViewModel())
        initialScreen?.start()
    }
}
