//
//  LoginServices.swift
//  Ajkune
//
//  Created by Pajaziti Labinot on 24.10.21..
//

import Foundation
import Alamofire
import UIKit


private struct LoginParameters: Encodable {
    let email: String
    let password: String
}

class Login: BaseRequest {
    override var path: String {
        return "/login"
    }
    
    override var method: HTTPMethod {
        return .post
    }
    
    override var headers: HTTPHeaders? {
        return [
            HTTPHeader(name: "Authorization", value: "Basic cHJqZXRfY2xpZW50X2lkOnByamV0X3NlY3JldA=="),
            HTTPHeader(name: "Content-Type", value: "application/x-www-form-urlencoded")
        ]
    }
    
    init(email: String, password: String) {
        super.init()
//        usesCleanBaseUrl = true
        parameters = LoginParameters(email: email, password: password)
    }
    
    
    func perform(completion: @escaping (Result<LoginResponse, Error>) -> Void) {
        guard let encodedURLRequest = try? URLEncoding.default.encode(self, with: parameters?.dictionary) else {
            return
        }
        AF.request(encodedURLRequest).validate().responseDecodable(of: LoginResponse.self) { respone in
            switch respone.result {
                case .success(let response):
                    KeychainManager.shared.store(token: response.token)
                    print(response)
                    completion(.success(response))
                        
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
