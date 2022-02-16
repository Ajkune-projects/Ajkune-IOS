//
//  MyGiftsViewModel.swift
//  Ajkune
//
//  Created by Djellza- INNO on 2/16/22.
//

import Foundation
import Foundation

class MyGiftsViewModel: MyGiftsViewModelProtocol{
    weak var coordinatorDelegate : MyGiftsViewModelCoordinatorDelegate?
    var dataSource: MyGiftsDataSource?
    public init(){
        self.dataSource = MyGiftsDataSource()
        
    }
    
    func getGifts(gift: [Gift1]) {
        dataSource?.myGifts = gift
    }
    //API
    func getMyGifts(completion: @escaping (([Gift1]?) -> Void)) {
        let gift = AuthenticationClient.getMyGifts()
        gift.execute(onSuccess: { gift in
            completion(gift)
         }, onFailure: {error in
            completion(nil)
         })
    }
    
}
