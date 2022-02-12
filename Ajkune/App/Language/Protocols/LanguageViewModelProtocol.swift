//
//  LanguageViewModelProtocol.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/12/22.
//

import Foundation
protocol LanguageViewModelProtocol: BaseViewModel {
    var coordinatorDelegate : LanguageViewModelCoordinatorDelegate? {get set}
}
