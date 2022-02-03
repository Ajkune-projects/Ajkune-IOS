//
//  TDSplashViewModel.swift
//  
//
//  Created by Djellza Rrustemi
//

import Foundation
class TDSplashViewModel: TDSplashViewModelProtocol{
    weak var coordinatorDelegate : TDSplashViewModelCoordinatorDelegate?
    
    func splashShown() {
        coordinatorDelegate?.splashShown()
    }
    func goToMain() {
        coordinatorDelegate?.goToMain()
    }
}
