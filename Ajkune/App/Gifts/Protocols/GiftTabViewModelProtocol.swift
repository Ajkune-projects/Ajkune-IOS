//
//  GiftTabViewModelProtocol.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/13/22.
//

protocol GiftTabViewModelProtocol : BaseViewModel {
    var coordinatorDelegate : GiftTabViewModelCoordinatorDelegate? {get set}
    func showGiftScreen()
    func showInitialScreen()
    
    //API
    func hasGifts(completion: @escaping ((Gift?) -> Void))
}
