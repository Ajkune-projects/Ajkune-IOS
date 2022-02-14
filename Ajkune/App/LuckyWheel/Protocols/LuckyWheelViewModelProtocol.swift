//
//  LuckyWheelViewModelProtocol.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/13/22.
//

import Foundation
protocol LuckyWheelViewModelProtocol: BaseViewModel {
    var coordinatorDelegate : LuckyWheelViewModelCoordinatorDelegate? {get set}
}
