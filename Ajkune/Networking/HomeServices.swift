//
//  HomeServices.swift
//  Ajkune
//
//  Created by Pajaziti Labinot on 24.10.21..
//

import Foundation

import UIKit
import Alamofire

class GetMyProducts: BaseRequest {
    override var path: String {
        return "/products"
    }
    
    override var headers: HTTPHeaders? {
        guard let accessToken = KeychainManager.shared.accessToken else {
            return []
        }
        return ["Authorization" : "Bearer " + accessToken]
    }
    
    func perform(completion: @escaping (Result<[Products], Error>) -> Void) {
        AF.request(self).validate().responseDecodable(of: [Products].self) { response in
            switch response.result {
            case .success(let booking):
                completion(.success(booking))
                print(booking)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
