//
//  FirstScreenViewModel.swift
//  
//
//  Created by Djellza Rrustemi
//

import Foundation
class FirstScreenViewModel: FirstScreenViewModelProtocol{
    weak var coordinatorDelegate : FirstScreenViewModelCoordinatorDelegate?
    
    func firstScreenShown() {
        coordinatorDelegate?.firstScreenShown()
    }
}
