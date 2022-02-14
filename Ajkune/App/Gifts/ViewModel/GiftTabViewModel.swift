//
//  GiftTabViewModel.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/13/22.
//

import Foundation
class GiftTabViewModel: GiftTabViewModelProtocol{
    var coordinatorDelegate: GiftTabViewModelCoordinatorDelegate?
    
    func showGiftScreen() {
        coordinatorDelegate?.showGiftScreen()
    }
    
    func hasGifts(completion: @escaping ((Gift?) -> Void)) {
        let gift = AuthenticationClient.hasGiftUser()
        gift.execute(onSuccess: { gift in
            completion(gift)
         }, onFailure: {error in
            completion(nil)
         })
    }

}
