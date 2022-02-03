//
//  FirstScreenViewModelProtocol.swift
//  
//
//  Created by Djellza Rrustemi
//

import Foundation

protocol FirstScreenViewModelProtocol : BaseViewModel {
    var coordinatorDelegate : FirstScreenViewModelCoordinatorDelegate? {get set}
    
    func firstScreenShown()
}
