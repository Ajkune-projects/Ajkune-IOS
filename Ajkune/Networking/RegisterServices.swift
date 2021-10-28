//
//  SignUp.swift
//  PrishtinaJet
//
//  Created by Nikola Dojchinovski on 23.4.21.
//

import Foundation
import Alamofire

struct SignUpParameters: Encodable {
    let name: String
    let email: String
    let password: String
}

class SignUp: BaseRequest {
    override var path: String {
        return "/register"
    }
    
    override var method: HTTPMethod {
        return .post
    }
    
    override var headers: HTTPHeaders? {
        return [
            HTTPHeader(name: "Content-Type", value: "application/json")]
    }
    
    init(model: SignUpModel) {
        super.init()
        if let fullName = model.name,
           let email = model.email,
           let password = model.password {
            let params = SignUpParameters(name: fullName, email: email, password: password)
            parameters = params
        }
    }
    
    func perform(completion: @escaping (Result<Void, Error>) -> Void) {
        AF.request(self).validate().response { response in
            switch response.result {
            case .success:
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

