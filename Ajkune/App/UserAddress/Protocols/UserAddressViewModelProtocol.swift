//
//  UserAddressViewModelProtocol.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/11/22.
//

import Foundation
protocol UserAddressViewModelProtocol: BaseViewModel {
    var coordinatorDelegate : UserAddressViewModelCoordinatorDelegate? {get set}
    
}
