//
//  AllCategory.swift
//  Ajkune
//
//  Created by Pajaziti Labinot on 27.10.21..
//

import Foundation

import UIKit
import Alamofire

class GetCategory: BaseRequest {
    override var path: String {
        return "/categories"
    }
    
    override var headers: HTTPHeaders? {
        guard let accessToken = KeychainManager.shared.accessToken else {
            return []
        }
        return ["Authorization" : "Bearer " + accessToken]
    }
    
    func perform(completion: @escaping (Result<[Categories], Error>) -> Void) {
        AF.request(self).validate().responseDecodable(of: [Categories].self) { response in
            switch response.result {
            case .success(let categories):
                completion(.success(categories))
                print(categories)
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
