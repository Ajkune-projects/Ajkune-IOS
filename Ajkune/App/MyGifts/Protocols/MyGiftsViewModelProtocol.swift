//
//  MyGiftsViewModelProtocol.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/16/22.
//

import Foundation
protocol MyGiftsViewModelProtocol: BaseViewModel {
    var coordinatorDelegate : MyGiftsViewModelCoordinatorDelegate? {get set}
    var dataSource : MyGiftsDataSource? {get}
    func getGifts(gift: [Gift1])
    //API
    func getMyGifts(completion: @escaping (([Gift1]?) -> Void))
}
