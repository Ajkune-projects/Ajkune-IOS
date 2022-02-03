//
//  SplashViewModelProtocol.swift

//
//  Created by Djellza Rrustemi
//

import Foundation

protocol TDSplashViewModelProtocol : BaseViewModel {
    var coordinatorDelegate : TDSplashViewModelCoordinatorDelegate? {get set}
    
    func splashShown()
    func goToMain()
}
