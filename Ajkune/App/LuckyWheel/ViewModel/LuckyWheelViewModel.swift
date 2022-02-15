//
//  LuckyWheelViewModel.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/13/22.
//
import Foundation

class LuckyWheelViewModel: LuckyWheelViewModelProtocol{
    weak var coordinatorDelegate : LuckyWheelViewModelCoordinatorDelegate?
    
    func showModal(gift: GiftListElement) {
        self.coordinatorDelegate?.showModal(gift: gift)
    }
    
    
    //API
    func luckyWheelGifts(completion: @escaping (([GiftListElement]?) -> Void)) {
        let gift = AuthenticationClient.luckyWheelGifts()
        gift.execute(onSuccess: { gift in
            completion(gift)
         }, onFailure: {error in
            completion(nil)
         })
    }
    func addGift(id:Int,completion: @escaping ((AddGift?) -> Void)) {
        let gift = AuthenticationClient.addGift(id: id)
        gift.execute(onSuccess: { gift in
            completion(gift)
         }, onFailure: {error in
            completion(nil)
         })

    }

}
