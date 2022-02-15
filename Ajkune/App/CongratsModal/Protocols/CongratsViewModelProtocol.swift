//
//  CongratsViewModelProtocol.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/15/22.
//

import Foundation
protocol CongratsViewModelProtocol: BaseViewModel {
    var coordinatorDelegate : CongratsViewModelCoordinatorDelegate? {get set}
}
