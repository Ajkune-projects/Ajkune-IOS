//
//  TDInitialScreenViewModel.swift

//
//  Created by Djellza Rrustemi
//

import Foundation

class TDInitialScreenViewModel: TDInitialScreenViewModelProtocol{
    weak var coordinatorDelegate : TDInitialScreenViewModelCoordinatorDelegate?
    
    func showSignUp() {
        coordinatorDelegate?.showSignUp()
    }
    
    func initializeLogin() {
        self.coordinatorDelegate?.initializeLogin()
    }
    
    func loginSuccessful() {
        coordinatorDelegate?.loginSuccessful()
    }
    
}
