//
//  LuckyWheelViewModelProtocol.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/13/22.
//

import Foundation
protocol LuckyWheelViewModelProtocol: BaseViewModel {
    var coordinatorDelegate : LuckyWheelViewModelCoordinatorDelegate? {get set}
    func showModal(gift:GiftListElement)
    //API
    func luckyWheelGifts(completion: @escaping (([GiftListElement]?) -> Void))
    func addGift(id:Int,completion: @escaping ((AddGift?) -> Void))
}
